FROM openjdk:8-alpine

ENV REVIEWDOG_VERSION=v0.10.0
ENV CHECKSTYLE_VERSION=${CHECKSTYLE_VERSION}
RUN echo ${CHECKSTYLE_VERSION}
RUN wget -O - -q https://github.com/checkstyle/checkstyle/releases/download/checkstyle-${CHECKSTYLE_VERSION}/checkstyle-${CHECKSTYLE_VERSION}-all.jar > /checkstyle.jar
RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}
RUN apk add --no-cache git
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
