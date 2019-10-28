FROM golang:1.13-stretch

RUN git config --global url."https://9d0c27e923db5b2aca7b8604703e5d6e6f6940ac:@github.com/".insteadOf "https://github.com/"

WORKDIR /go/src/github.com/tomekwlod/tes 

COPY . .

RUN go get github.com/cespare/reflex

RUN go mod init

ENTRYPOINT ["reflex", "-c", "reflex.conf"]