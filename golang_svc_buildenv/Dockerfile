FROM docker:18.09-dind

COPY requirements.txt .

RUN apk update
RUN apk add \
    libc-dev=0.7.1-r0 \
    git=2.18.1-r0 \
    go=1.10.7-r0 \
    py-pip=10.0.1-r0

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

WORKDIR /src

CMD ["/bin/ash"]