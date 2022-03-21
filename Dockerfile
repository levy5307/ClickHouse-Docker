# 指定基础镜像
FROM centos:7.3.1611

# 指定镜像的工作目录
WORKDIR /root

# 运行指定的命令
RUN yum update -y \
 && yum install -y git wget vim perl rpm-build

# 获取ldb-toolchain
RUN mkdir env && cd env \
 && wget https://github.com/amosbird/ldb_toolchain_gen/releases/download/v0.9.1/ldb_toolchain_gen.sh \
 && sh ldb_toolchain_gen.sh /root/env/ldb_toolchain

# 设置环境变量
ENV PATH=$PATH:/root/env/ldb_toolchain/bin CC=clang CXX=clang++

# 安装ccache
RUN cd /root/env/ldb_toolchain/bin \
 && wget https://github.com/levy5307/ldb_toolchain_gen/raw/main/ccache \
 && chmod +x ccache \
 && ccache -M 10G

# 配置Python3
RUN cd /usr/bin \
 && rm python \
 && ln -s /root/env/ldb_toolchain/bin/ldb-python3 python 

# 配置yum
RUN sed -i 's/python/python2.7/g' /usr/bin/yum

# 指定标签
LABEL name="centos:7.3.1611" version="1.0" 

# 暴露镜像端口
EXPOSE 8080
