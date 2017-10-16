## 默认创建的虚拟机内存不够需要重新自定义创建

- 创建docker-machine


```
docker create 
--driver virtualbox #驱动类型
--virtualbox-cpu-count 2  #cpu数
--virtualbox-memory 4096 #内存
--engine-registry-mirror https://1v2bpeti.mirror.aliyuncs.com #镜像地址 dev

```

- 设置当前虚拟机


```
docker-machine env dev

//会出现以下输出复制粘贴到控制台执行一遍

SET DOCKER_TLS_VERIFY=1
SET DOCKER_HOST=tcp://192.168.99.100:2376
SET DOCKER_CERT_PATH=C:\Users\Administrator\.docker\machine\machines\default
SET DOCKER_MACHINE_NAME=default
SET COMPOSE_CONVERT_WINDOWS_PATHS=true
REM Run this command to configure your shell:
REM     @FOR /f "tokens=*" %i IN ('docker-machine env default') DO @%i

//再执行命令

docker-machine restart dev

docker run -p 8762:8762 -p 2181:2181 -p 9092:9092 -p 8000:8000 -p 8001:8001 -p 8002:8002 -p 8003:8003 -p 8004:8004 -p 8005:8005 -dit registry.cn-hangzhou.aliyuncs.com/scvzerng/cloud-example:v2
```
