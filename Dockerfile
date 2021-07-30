FROM postgres:13.3-alpine
LABEL Christophe Eymard <christophe.eymard@sales-way.com>

COPY ./root /
RUN ash /install.sh
