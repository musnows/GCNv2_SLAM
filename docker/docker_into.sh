#!/usr/bin/env bash

xhost +local:root 1>/dev/null 2>&1
docker exec \
    -u root \
    -it gcnv2 \
    /bin/bash
xhost -local:root 1>/dev/null 2>&1
