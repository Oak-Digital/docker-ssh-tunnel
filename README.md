# docker-ssh-tunnel
A docker image that provides a simple ssh tunnel, made for tunneling to databases on remote systems

## How to use

Build using:

`docker build -t ssh-tunnel .`

To forward a remote port:

`docker run ssh-tunnel -v [path to privatekey]:/var/ssh/privatekey -p [host port]:[forwarded port] -e REMOTE_HOST=[remote host] -e REMOTE_PORT=[remote port] REMOTE_USER=[remote_user]`

Example:

`docker run --rm ssh-tunnel -v ~/.ssh/privatekey:/var/ssh/privatekey -p 3306:3306 -e REMOTE_HOST=***.***.***.*** -e REMOTE_PORT=22 -e REMOTE_USER=user`


## Environment Variables
| Env name           | Description                                            | Default Value         |
|--------------------|--------------------------------------------------------|-----------------------|
| KEYFILE_LOCATION   | Location in container where the private key is located | `/var/ssh/privatekey` |
| ALIVE_INTERVAL     | See ssh ServerAliveInterval                            | `60`                  |
| REMOTE_HOST        | The hostname or IP of the remote                       |                       |
| REMOTE_PORT        | The port on remote to connect to ssh                   | `22`                  |
| REMOTE_USER        | Remote ssh user                                        |                       |
| REMOTE_TARGET_PORT | The target port on the remote to tunnel to             | `3306`                |
| LOCAL_PORT         | The local port the remote port should be tunneled to   | `3306`                |

## WIP
This is a work in progress

### TODO
 - ~~At the moment the ssh keys are added at build time, however a better alternative would be to be able to pass them to the container at runtime~~
 - Other modes of connection instead of only keyfile, for example username/password
