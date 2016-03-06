<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-generate-toc again -->
**Table of Contents**

- [Unity3D in Docker](#unity3d-in-docker)
    - [Download](#download)
    - [Build](#build)
    - [Run](#run)
- [Importing assets](#importing-assets)

<!-- markdown-toc end -->

# Unity3D in Docker
This is [Unity3D for Linux](http://blogs.unity3d.com/2015/08/26/unity-comes-to-linux-experimental-build-now-available/) run with [Docker](https://www.docker.com/).

_TL;DR if this is your first time running this, simply run_

    make all

Otherwise, the steps can be run individually.

## Download

Download the latest Unity3D Linux build from the [release notes](http://forum.unity3d.com/threads/unity-on-linux-release-notes-and-known-issues.350256/#post-2429209) with

    make download

## Build

Build the Docker image with

    make build

## Run

Run Unity3D with Docker with

    make run

# Importing assets

Create an asset directory in `gamedev`'s home directory, if you haven't already done so:

    mkdir gamedevhome/assets

Copy the downloaded asset there:

    cp ~/Downloads/LeapMotion_CoreAsset_Orion_Beta_4.0.1.unitypackage gamedevhome/assets

Now, in Unity3D, import the asset from `/home/gamedev/assets`
