# docker-ssh-tunnel
A docker image that provides a simple ssh tunnel, made for tunneling to databases on remote systems

## WIP
This is a work in progress

### TODO
 - At the moment the ssh keys are added at build time, however a better alternative would be to be able to pass them to the container at runtime
 - Other modes of connection instead of only keyfile, for example username/password