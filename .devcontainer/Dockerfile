FROM golang:1.13-stretch

WORKDIR /go/src/github.com/tomekwlod/tes
COPY . .

# Configure to reduce warnings and limitations as instruction from official VSCode Remote-Containers.
# See https://code.visualstudio.com/docs/remote/containers-advanced#_reducing-dockerfile-build-warnings.
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get -y install --no-install-recommends apt-utils 2>&1 \
    && apt-get -y install git iproute2 procps lsb-release


# Install Go tools.
RUN apt-get update \
    # Install gocode-gomod.
    # && git config --global url."https://9d0c27e923db5b2aca7b8604703e5d6e6f6940ac:@github.com/".insteadOf "https://github.com/" \
    && go get -x -d github.com/stamblerre/gocode 2>&1 \
    && go build -o gocode-gomod github.com/stamblerre/gocode \
    && mv gocode-gomod $GOPATH/bin/ \
    # Install other tools.
    && go get -u -v \
        golang.org/x/tools/cmd/gopls \
        github.com/mdempsky/gocode \
        github.com/uudashr/gopkgs/cmd/gopkgs \
        github.com/ramya-rao-a/go-outline \
        github.com/acroca/go-symbols \
        golang.org/x/tools/cmd/guru \
        golang.org/x/tools/cmd/gorename \
        github.com/go-delve/delve/cmd/dlv \
        github.com/stamblerre/gocode \
        github.com/rogpeppe/godef \
        golang.org/x/tools/cmd/goimports \
        golang.org/x/lint/golint 2>&1 \
        github.com/cespare/reflex \
    # Clean up.
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

RUN go mod init

# Revert workaround at top layer.
ENV DEBIAN_FRONTEND=dialog


ENTRYPOINT ["reflex", "-c", ".devcontainer/reflex.conf"]