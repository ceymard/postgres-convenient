FROM clkao/postgres-plv8:11-2
LABEL Christophe Eymard <christophe.eymard@sales-way.com>

COPY ./root /
RUN bash /install.sh
