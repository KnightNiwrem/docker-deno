FROM golang:1-buster

RUN groupadd -r deno && \
    useradd --no-log-init -r -g deno deno

USER deno
WORKDIR /home/deno
RUN go get github.com/axetroy/dvm && \
    dvm upgrade && \
    dvm install v1.10.1

ENV PATH "/home/deno/.deno/bin:$PATH"

ENTRYPOINT ["deno"]
