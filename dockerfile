FROM python:3.6-alpine3.10

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories \
    && apk add --update --no-cache mariadb-connector-c-dev \
    && apk add --no-cache --virtual .build-deps gcc musl-dev linux-headers libffi-dev python-dev mariadb-dev build-base py-mysqldb \
    && pip install -i https://pypi.doubanio.com/simple -r requirements.txt \
    && apk del .build-deps \
    && rm -rf .git
