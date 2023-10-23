FROM telegraf:1.28.2-alpine

RUN apk update && apk add --no-cache \
    smartmontools \ 
    lm-sensors \
    nvme-cli 
