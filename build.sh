#! /bin/bash
echo Building main:build
# 开始构建构建镜像
docker build -t main:build -f Dockerfile.build .
# 创建构建容器，但是不运行，不能用run，run是包含了create和start两个命令
docker container create --name extract main:build
# 复制容器中的两个文件
docker container cp extract:/go/src/test/multi-stage-demo/main ./main
docker container cp extract:/go/src/test/multi-stage-demo/config.json ./config-run.json
# 删除创建的容器
docker container rm -f extract
# 删除构建镜像
docker rmi main:build
echo Building main:latest
# 开始构建运行时镜像
docker build --no-cache -t main:latest .
# 删除拷贝到本地的文件
rm ./main ./config-run.json
echo Building Success.