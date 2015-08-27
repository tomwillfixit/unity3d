# unity3d in Docker

*** Work in progress ***

Download experimental Unity3d Linux build. Link can be found here :

http://blogs.unity3d.com/2015/08/26/unity-comes-to-linux-experimental-build-now-available/

Build :

docker build -t unity3d:experimental .

Run :

docker run -it --privileged --net host -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY --entrypoint /bin/bash --name unity3d unity3d:experimental

The command above will log you into the container and you can start unity manually with this command : sudo /opt/Unity/Editor/Unity

Caveat :

This first time you start Unity it will probably hang as it tries to connect to the license server.  You can ctrl+c and rerun sudo /opt/Unity/Editor/Unity

I was able to walk through the project creation but hit an error when the new project directory was being created.  Will need to debug this some more.
 
 


