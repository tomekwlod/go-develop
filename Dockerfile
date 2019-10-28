FROM golang:1.13-stretch

RUN git config --global url."https://9d0c27e923db5b2aca7b8604703e5d6e6f6940ac:@github.com/".insteadOf "https://github.com/"

COPY . /go/src/github.com/tomekwlod/tes/

# RUN ls -alh /go

RUN go get github.com/cespare/reflex

# RUN cd quote && ls -alh && go mod init github.com/tomekwlod/tes/quote
# RUN go mod init github.com/tomekwlod/tes
# RUN pwd -LP && ls -alh && cd /go/src/github.com/tomekwlod/tes && ls -alh
RUN cd /go/src/github.com/tomekwlod/tes && go mod init

ENTRYPOINT ["reflex", "-c", "reflex.conf"]