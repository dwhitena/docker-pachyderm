#!/bin/bash

/bridge.sh
wrapdocker
cd /go/src/github.com/pachyderm/pachyderm && make launch-kube
cd /go/src/github.com/pachyderm/pachyderm && make docker-build
cd /go/src/github.com/pachyderm/pachyderm && make launch
