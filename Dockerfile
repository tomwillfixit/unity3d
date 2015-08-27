#Links : 
#http://download.unity3d.com/download_unity/unity-editor-installer-5.1.0f3+2015082501.sh
#http://blogs.unity3d.com/2015/08/26/unity-comes-to-linux-experimental-build-now-available/

FROM ubuntu:14.04 

MAINTAINER thshaw

ENV PACKAGE=unity-editor-5.1.0f3+2015082501_amd64.deb 

RUN apt-get update

WORKDIR unity3d 
ADD ${PACKAGE} ${PACKAGE}

#Resolve missing dependencies
RUN dpkg -i ${PACKAGE} || apt-get -f install -y

#Install unity3d
RUN dpkg -i ${PACKAGE}

RUN chown root /opt/Unity/Editor/chrome-sandbox 
RUN chmod 4755 /opt/Unity/Editor/chrome-sandbox

RUN apt-get clean
RUN rm ${PACKAGE}

ADD  https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb /src/google-chrome-stable_current_amd64.deb

# Install Chromium
RUN mkdir -p /usr/share/icons/hicolor && \
	apt-get update && apt-get install -y \
	ca-certificates \
	gconf-service \
	hicolor-icon-theme \
	libappindicator1 \
	libasound2 \
	libcanberra-gtk-module \
	libcurl3 \
	libexif-dev \
	libgconf-2-4 \
	libgl1-mesa-dri \
	libgl1-mesa-glx \
	libnspr4 \
	libnss3 \
	libpango1.0-0 \
	libv4l-0 \
	libxss1 \
	libxtst6 \
	wget \
	xdg-utils \
	--no-install-recommends && \
	dpkg -i '/src/google-chrome-stable_current_amd64.deb' && \
	rm -rf /var/lib/apt/lists/*

RUN mkdir -p /root/.local/share/unity3d/Unity
RUN chmod 777 /root/.local/share/unity3d/Unity

ENTRYPOINT sudo /opt/Unity/Editor/Unity
