FROM "homeassistant/raspberrypi3-homeassistant:latest"
LABEL maintainer="Jesper Nilsson"

COPY runwatch/run.sh /runwatch/run.sh

# Monitor HomeAssistant
COPY runwatch/200.home-assistant.enabled.sh /runwatch/200.home-assistant.enabled.sh

# Install socat
RUN apt-get update
RUN apt-get install socat

# Monitor socat
COPY runwatch/100.socat-zwave.enabled.sh /runwatch/100.socat-zwave.enabled.sh

# clear apt stuff


CMD [ "bash","/runwatch/run.sh" ]
