# 基于Geth的以太坊私链搭建
> 教程来自于Geth官网https://geth.ethereum.org/

利用Docker容器搭建一个PoW的以太坊私链，具有bootstrap节点和miner节点，并提供http服务来开发Dapp
## 软件要求
任意平台的Docker
## 节点类型
### bootstrap节点
该节点作为连接p2p网络的核心，提供peer发现能力。同时该节点可以是网络的miner节点。
### miner节点
该节点是矿工，将挖矿的收益放入账户中。
## 搭建流程
### 创建Docker容器
1. 下载镜像：`docker pull ethereum/client-go:latest`
2. 在本地创建挂载文件夹`root`，来保存容器数据
3. 运行`setup.sh`的内容创建容器，其中挂载文件夹路径需要修改到第2步的路径，同时检查端口是否可用
### 创建区块链账号
1. 进入容器：`docker exec -it xxxx /bin/sh`，其中xxx为容器ID
2. 进入`/root`目录
3. 运行`account.sh`内容创建账号，获得公钥
### 创建创世纪区块
1. 将`genesis.json`文件复制到`/root`目录下
2. 运行`initBlock.sh`内容创建创世纪区块，注意所有节点的`genesis.json`内容要求完全一致
### 运行bootstrap节点
1. 修改`geth.sh`文件内容，其中`--network`必须和`genesis.json`中的chainId一致
2. `--nat extip:`之后为部署主机的ip
3. 执行修改后的命令，开始运行bootstrap节点
4. 重启开启一个终端，执行`geth attach /root/geth.ipc --exec admin.nodeInfo.enr`获取enr，记录该字符串
### 运行miner节点
1. 与bootstrap节点一致，首先容器，区块链账户和创世纪块。注意创世纪块必须一致。
2. `--bootnodes `后改为bootstrap节点的enr
3. `--miner.etherbase=`后改为第一步的区块链账户
4. 执行修改后的命令，开始运行miner节点
5. 通过`geth attach /root/geth.ipc`进入console，可以运行各种命令
6. 可以通过该节点主机的8545端口访问http服务