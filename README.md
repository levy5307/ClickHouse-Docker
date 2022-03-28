# ClickHouse-Docker

Build/Pack env Dockerfile for ClickHouse in CentOS. 

## Usage

Use the following command to build a Docker image:

```
docker build -t clickhouse-buildenv .
```

### Build

Compile the code with the following commands:

```
cd ClickHouse
mkdir build
cmake ..
ninja
```

### Pack

Package the compiled code with the following commands:

```
cd build
cpack -G TGZ
```

OR

```
cd build
cpack -G RPM
```
