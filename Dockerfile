FROM node:16-buster

RUN yarn global add @axetroy/dvm
RUN groupadd -r deno && \
    useradd --no-log-init -r -g deno deno

USER deno
WORKDIR /home/deno
RUN dvm upgrade && \
    dvm install $(dvm ls-remote | tail -1 | awk '{print $1}')

ENV PATH "/home/deno/.deno/bin:$PATH"
ENTRYPOINT ["deno"]
