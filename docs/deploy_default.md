## 使用ChainBridge默认部署
### 1.部署合约
relayer地址需要用ChainBridge命令行生成。
```
cb-sol-cli deploy \
--url {RPC地址} \
--privateKey {私钥} \
--bridge \
--erc20 \
--erc20Handler \
--relayers="{relayer1地址},{relayer2地址}, ..." \
--relayerThreshold {relayer数量} \
--chainId {chain_id}
```
### 2.注册合约
```
cb-sol-cli bridge register-resource \
--url {RPC地址} \
--privateKey {私钥} \
--bridge {桥地址} \
--handler {Erc20Handler地址} \
--targetContract {ERC20地址} \
--resourceId 0x000000000000000000000000000000e389d61c11e5fe32ec1735b3cd38c69500
```
### 3.设置ERC20Handler可以销毁ERC20
```
cb-sol-cli bridge \
set-burn \
--url {RPC地址}  \
--privateKey {私钥} \
--bridge {桥地址} \
--handler {Erc20Handler地址} \
--tokenContract {ERC20地址}
```
### 4.设置ERC20Handler可以铸造ERC20
```
cb-sol-cli erc20 \
add-minter \
--url {RPC地址}  \
--privateKey {私钥} \
--erc20Address {ERC20地址} \
--minter {minter地址}
```
### 5.Mint币
```
cb-sol-cli erc20 \
mint \
--url {RPC地址} \
--privateKey {私钥} \
--amount {数量} \
--erc20Address {ERC20地址}
```
### 6.给ERC20Handler授权
```
cb-sol-cli erc20 \
approve \
--url {RPC地址} \
--privateKey {私钥} \
--erc20Address {ERC20地址} \
--amount {数量} \
--recipient {ERC20Handler地址} 
```
### 7.调用bridge的deposit方法跨链
```
cb-sol-cli erc20 \
deposit \
--url {RPC地址}  \
--privateKey {私钥} \
--bridge {桥地址} \
--recipient {目标链上的接收地址} \
--amount {数量} \
--dest {目标链ID} \
--resourceId 0x000000000000000000000000000000e389d61c11e5fe32ec1735b3cd38c69500
```