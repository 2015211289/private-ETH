# bootstrap node
geth --datadir /root --networkid 991188 --nat extip:10.112.173.242 --http --http.api personal,eth,net,web3 --http.addr "0.0.0.0" --http.corsdomain '*' --metrics --metrics.influxdb --metrics.influxdb --metrics.influxdb.endpoint "http://10.112.173.242:8086" --metrics.influxdb.username "geth" --metrics.influxdb.password "123456" --netrestrict 10.0.0.0/8
# miner node
geth --datadir /root --networkid 991188 --nat extip:10.128.192.230  --miner.etherbase=0x8E78d2e79169AAdA7ED7C68C75efbb11b18a5778 --http --http.api personal,eth,net,web3 --http.addr "0.0.0.0" --http.corsdomain '*' --allow-insecure-unlock --netrestrict 10.0.0.0/8

# 设置bootnode节点，当前用static node代替：--bootnodes "enr:-KO4QP8E6cwyoI2yb59HFtklodFY36_e75WidaOjT1l168W0G-ouzrLt6mFg0Pe_5y78VUkB2x3lLhQZEDSNFL4A5xGGAX_o6RTTg2V0aMfGhMGBRa2AgmlkgnY0gmlwhApwrfKJc2VjcDI1NmsxoQJV-8ev6tdbVLVUfy-R4FJ-W-pFtqNVnFnU8NJVRlCLiYRzbmFwwIN0Y3CCdl-DdWRwgnZf"