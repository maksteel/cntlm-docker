# cntlm-docker
- cntlm in a docker container
- [cntlm v0.92.3 source code](https://sourceforge.net/projects/cntlm/files/cntlm/cntlm%200.92.3/)

## Build the container
```
docker build -t cntlm-docker:0.92.3 .
```

## Create cntlm configuration file

Sample contents of `cntlm.conf`

```
Username    username
Domain      DOMAIN.EXAMPLE.ORG
Password
Proxy       parent.proxy.example.org:8080
NoProxy     localhost, 127.0.0.*, 10.*, 192.168.*
Listen      0.0.0.0:3128
Auth            NTLMv2
PassNTLMv2      hashed-ntlm-passwrd
```

## Run the container
```
docker run -d --rm -it -v ${PWD}/cntlm.conf:/etc/cntlm.conf -p 53128:3128 --name cntlm cntlm-docker:0.92.3
```

Once the container is running, use `http://localhost:53128` as your proxy on your host.