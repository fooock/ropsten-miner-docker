# Ethereum Ropsten Docker miner
Setup Ethereum Ropster miner using Docker. You can customize the resources used by the container.

## Requirements
You only need:
* [Docker](https://docs.docker.com/)
* Make

If you have `Ubuntu`, to install make simply use:

```bash
$ sudo apt-get install make
```

## Build params
You can customize multiple params. See next table.

| Param         	| Description                                                         	| Default value                                	|
|---------------	|---------------------------------------------------------------------	|----------------------------------------------	|
| `ETHER_BASE`  	| Public address for block mining rewards                             	| `0x33C425D7E08aa105a4520f78b750b30AC6FF85CD` 	|
| `MEMORY`      	| The maximum amount of memory the container can use                  	| `4g`                                         	|
| `SWAP_MEMORY` 	| The amount of memory this container is allowed to swap to disk      	| `6gb`                                        	|
| `CPUS`        	| Specify how much of the available CPU resources a container can use 	| `2`                                          	|

>Note: Swap memory is equal to $SWAP_MEMORY - $MEMORY. Using the default values, the swap memory is 2g.


## Start miner
You can start the miner with the default values

```bash
$ make start
```

This command downloads the image `client-go` and start it to mine in the `Ropsten network`. For more detail see the [Makefile](Makefile). If you want to 
customize the container resources, you just have to overwrite the variables. For example, if you want to limit the cpu to 4, then:

```bash
$ CPUS=4 make start
```
