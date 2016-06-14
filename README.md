# docker-pachyderm
Pachyderm in Docker.  Assuming, the image is built and tagged `pachtest,` run with:

```
docker run -d --privileged --net=host -p 8080:8080 -p 30650:650 --name pachtest pachtest
```
