.PHONY: clean download build run all

# latest Linux releases can be found here:
# http://forum.unity3d.com/threads/unity-on-linux-release-notes-and-known-issues.350256/#post-2429209
SHELL := /bin/bash
TAG := 5.3.3f1+20160223
PKG := unity-editor-$(TAG)_amd64.deb
URL := http://download.unity3d.com/download_unity/linux/$(PKG)

# compatible tag for Docker
DOCKER_TAG := $(shell echo $(TAG) | sed 's/\+//g')

# video GID on host
VIDEO_GID := $(shell grep video /etc/group | cut -d':' -f3)

clean:
	([[ -e $(PKG) ]] && rm -i $(PKG)) || true

download:
	@([[ -e $(PKG) ]] && echo "Already downloaded: $(PKG)") || \
		(curl -O $(URL) && echo "Downloaded: $(PKG)")

build:
	docker build -t unity3d:$(DOCKER_TAG) \
		--build-arg PACKAGE=$(PKG) \
		--build-arg VIDEO_GID=$(VIDEO_GID) \
		.
	# delete the license file, since the authorised machine's signature
	#+ changed (if this is a re-build).
	@rm -rf gamedevhome/.local/share/unity3d/Unity/Unity_v5.x.ulf

run:
	@mkdir -p gamedevhome/.local/share/unity3d/Unity
	@mkdir -p gamedevhome/.cache/unity3d
	@mkdir -p gamedevhome/.config/unity3d/Preferences
	docker run --rm -it --privileged --net host \
		--device=/dev/dri:/dev/dri \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-v $(PWD)/gamedevhome:/home/gamedev \
		--name unity3d \
		unity3d:$(DOCKER_TAG) \
		-logFile /proc/1/fd/0

all: clean download build run
