.PHONY: clean download build run all

PKG := unity-editor-5.1.0f3+2015082501_amd64.deb
URL := http://download.unity3d.com/download_unity/$(PKG)

clean:
	rm -i $(PKG)

download:
	@([[ -e $(PKG) ]] && echo "Already downloaded: $(PKG)") || \
		(curl -O $(URL) && echo "Downloaded: $(PKG)")

build:
	docker build -t unity3d:experimental .

run:
	@mkdir -p gamedevhome/.local/share/unity3d/Unity
	@mkdir -p gamedevhome/.cache/unity3d
	docker run --rm -it --privileged --net host \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-v $(PWD)/gamedevhome:/home/gamedev \
		--name unity3d \
		unity3d:experimental \
		-logFile /proc/1/fd/0

all: clean download build run
