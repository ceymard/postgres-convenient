FROM postgres:15.10-alpine

COPY ./root /
RUN ash /install.sh
ENTRYPOINT ["sw-entrypoint.sh"]
