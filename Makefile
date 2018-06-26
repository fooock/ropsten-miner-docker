#  __     __         _       _     _
#  \ \   / /_ _ _ __(_) __ _| |__ | | ___ ___
#   \ \ / / _` | '__| |/ _` | '_ \| |/ _ \ __|
#    \ V / (_| | |  | | (_| | |_) | |  __\__ \
#     \_/ \__,_|_|  |_|\__,_|_.__/|_|\___|___/
#

ETHER_ADDR = 0x33C425D7E08aa105a4520f78b750b30AC6FF85CD

# Docker container resource limits
MEMORY = "4g"
SWAP_MEMORY = "6g"
CPUS = 2

#   _____                    _
#  |_   _|_ _ _ __ __ _  ___| |_ ___
#    | |/ _` | '__/ _` |/ _ \ __/ __|
#    | | (_| | | | (_| |  __/ |_\__ \
#    |_|\__,_|_|  \__, |\___|\__|___/
#                 |___/

build:
	-mkdir -p $$HOME/ropsten-miner/data
	docker pull ethereum/client-go

start: build
	docker run -it --name ropsten-miner \
	-p 127.0.0.1:8545:8545 -p 30303:30303 \
	--memory=$(MEMORY) --memory-swap=$(SWAP_MEMORY) --memory-swappiness=80 --oom-kill-disable \
	--cpus=$(CPUS) \
	-v $$HOME/ropsten-miner/data:/root/.ethereum ethereum/client-go \
	--syncmode "fast" --networkid 3 --testnet --rpc --rpcaddr "0.0.0.0" --mine --etherbase $(ETHER_ADDR)

shell:
	docker exec -it ropsten-miner geth --datadir=/root/.ethereum/testnet attach
