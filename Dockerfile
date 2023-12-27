ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

LABEL Description="pview"

COPY run.sh /
RUN chmod a+x /run.sh
CMD [ "/run.sh" ]