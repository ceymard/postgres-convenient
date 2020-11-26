FROM postgres:12.4-alpine
LABEL Christophe Eymard <christophe.eymard@sales-way.com>

COPY ./root /
RUN ash /install.sh
