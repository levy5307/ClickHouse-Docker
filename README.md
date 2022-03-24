# ClickHouse-Docker

Build/Pack env Dockerfile for ClickHouse in CentOS. 

## Usage

You can use the following command to build the Docker image:

```
docker build -t clickhouse-buildenv .
```

### Build

You can compile the code with the following command:

```
cd ClickHouse
mkdir build
cmake ..
ninja
```

### Pack

You can package the compiled code with the following command:

```
cd build
cpack -G TGZ
```

OR

```
cd build
cpack -G RPM
```
