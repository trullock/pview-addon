ARG BUILD_FROM
FROM $BUILD_FROM

FROM ghcr.io/wez/pview-no-tls:latest as pview
COPY --from=pview /app/pview /app/pview

ENV LANG C.UTF-8

LABEL Description="pview"

COPY run.sh /
RUN chmod a+x /run.sh
CMD [ "/run.sh" ]