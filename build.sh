#!/bin/bash

ver="latest"
tag="chuanxiang/jupyternote:$ver"

echo "build: $tag"

docker build -t $tag . && docker push $tag

