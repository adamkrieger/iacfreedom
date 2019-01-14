FROM alpine:3.8

RUN apk update

EXPOSE 8089

COPY ./bin/orderservice /bin/orderservice

CMD ["orderservice"]