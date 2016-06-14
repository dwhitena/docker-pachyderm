# Pachyderm in Docker
[Pachyderm](https://www.pachyderm.io/) in Docker.  Assuming, the image is built and tagged `pachtest,` run with:

```
docker run -d --privileged --net=host -p 8080:8080 -p 30650:650 --name pachyderm pachtest
```

If you have `pachctl` installed on the host running the above container, you should be able to interact with pachyderm in all the normal ways (`list-commit`, `list-job`, etc.).

# Warning

(from [here](https://github.com/jpetazzo/dind/blob/master/README.md)) *"Since AUFS cannot use an AUFS mount as a branch, it means that we have to use a volume. Therefore, all inner Docker data (images, containers, etc.) will be in the volume. Remember: volumes are not cleaned up when you docker rm, so if you wonder where did your disk space go after nesting 10 Dockers within each other, look no further :-)"*

Usually you can clean up volumnes with:

```
sudo docker run -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/docker:/var/lib/docker --rm martin/docker-cleanup-volumes
```
