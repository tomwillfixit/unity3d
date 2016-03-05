<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-generate-toc again -->
**Table of Contents**

- [Unity3D in Docker](#unity3d-in-docker)
    - [Download](#download)
    - [Build](#build)
    - [Run](#run)

<!-- markdown-toc end -->

# Unity3D in Docker

_TL;DR if this is your first time running this, simply run_

    make all

Otherwise, the steps can be run individually.

## Download

Download the experimental Unity3D Linux build (as [introduced here](http://blogs.unity3d.com/2015/08/26/unity-comes-to-linux-experimental-build-now-available/)) with

    make download

## Build

Build the Docker image with

    make build

## Run

Run Unity3D with Docker with

    make run
