FROM openjdk:8-jre-alpine
LABEL maintainer="nakat-t <armaiti.wizard@gmail.com>" \
      description="Docker image for PlantUML"

ENV GRAPHVIZ_VERSION=2.40.1-r1
ENV PLANTUML_VERSION=1.2019.12

RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/main/ >> /etc/apk/repositories
RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/testing/ >> /etc/apk/repositories

RUN apk add --no-cache graphviz=${GRAPHVIZ_VERSION} fontconfig ttf-dejavu font-ipa curl \
	&& mkdir -p /opt/plantuml \
	&& curl -L "https://sourceforge.net/projects/plantuml/files/plantuml.${PLANTUML_VERSION}.jar/download" -o /opt/plantuml/plantuml.jar \
	&& apk del curl

WORKDIR /data

ENTRYPOINT ["java", "-Djava.awt.headless=true", "-jar", "/opt/plantuml/plantuml.jar"]
