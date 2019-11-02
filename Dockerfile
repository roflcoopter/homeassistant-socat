FROM homeassistant/home-assistant:latest
LABEL maintainer="Jesper Nilsson"

RUN mkdir /runwatch
COPY runwatch/run.sh /runwatch/run.sh

# Monitor HomeAssistant
COPY runwatch/200.home-assistant.enabled.sh /runwatch/200.home-assistant.enabled.sh

# Install socat
RUN apk update && apk add --no-cache socat
# Install adb
RUN apk add \
    android-tools \
    --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing

# Monitor socat
COPY runwatch/100.socat-zwave.enabled.sh /runwatch/100.socat-zwave.enabled.sh

CMD [ "bash","/runwatch/run.sh" ]
