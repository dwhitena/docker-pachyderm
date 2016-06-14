FROM jpetazzo/dind

# go 1.6
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install make curl gcc bridge-utils
RUN curl -O https://storage.googleapis.com/golang/go1.6.linux-amd64.tar.gz
RUN tar -xvf go1.6.linux-amd64.tar.gz
RUN mv go /usr/local

# go environment
ENV GOROOT /usr/local/go
ENV PATH /usr/local/go/bin:$PATH
ENV GOPATH /go
ENV PATH /go/bin:$PATH

# pachyderm and kubernetes
RUN wget https://storage.googleapis.com/kubernetes-release/release/v1.2.2/bin/linux/amd64/kubectl
RUN chmod +x kubectl
RUN mv kubectl /usr/bin
RUN go get github.com/pachyderm/pachyderm

# run the pach cluster
ADD runpach.sh /
ADD bridge.sh /
#ADD pachyderm.json /go/src/github.com/pachyderm/pachyderm/etc/kube/
ADD start-kube-docker.sh /go/src/github.com/pachyderm/pachyderm/etc/kube/
RUN chmod +x /go/src/github.com/pachyderm/pachyderm/etc/kube/start-kube-docker.sh
RUN chmod +x /runpach.sh
RUN chmod +x /bridge.sh
EXPOSE 650
EXPOSE 30650
EXPOSE 8080
CMD ["/runpach.sh"]
