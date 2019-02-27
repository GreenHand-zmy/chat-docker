#! /bin/bash

# 删除所有停止状态的容器
docker-compose rm -fs;
# 尝试自动完成一系列操作
docker-compose up -d
