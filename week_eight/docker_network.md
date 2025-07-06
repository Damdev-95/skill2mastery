# Create a Docker Network
```bash
docker network create --driver=bridge --subnet=192.168.0.0/16 prod-network

docker run -itd --network=prod-network busybox
docker run -d --network=prod-network nginx
```