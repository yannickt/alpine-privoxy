FROM alpine:edge

LABEL maintainer="Yannick Tailliez"
LABEL creator="Daniel Guerra, Leonardo Amaral"
LABEL original-repo="https://github.com/danielguerra69/alpine-privoxy"

RUN apk add --update --no-cache curl privoxy
ADD bin /bin
RUN /bin/rename.sh \
    && rm -rf /bin/rename.sh
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["start.sh"]
