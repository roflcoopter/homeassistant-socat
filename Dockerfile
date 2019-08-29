FROM homeassistant/home-assistant:latest
LABEL maintainer="Jesper Nilsson"

RUN mkdir /runwatch
COPY runwatch/run.sh /runwatch/run.sh

# Monitor HomeAssistant
COPY runwatch/200.home-assistant.enabled.sh /runwatch/200.home-assistant.enabled.sh

# Install socat
RUN apk update
RUN apk install socat

# Monitor socat
COPY runwatch/100.socat-zwave.enabled.sh /runwatch/100.socat-zwave.enabled.sh

# clear apt stuff


CMD [ "bash","/runwatch/run.sh" ]
