FROM telegraf:1.35.3-alpine

RUN apk update && apk add --no-cache \
    smartmontools \ 
    lm-sensors \
    nvme-cli \
    sudo

RUN echo -e '\
\n\
Cmnd_Alias SMARTCTL = /usr/sbin/smartctl\n\
telegraf  ALL=(ALL) NOPASSWD: SMARTCTL\n\
Defaults!SMARTCTL !logfile, !syslog, !pam_session\n\
\n\
Cmnd_Alias NVME = /usr/sbin/nvme\n\
telegraf  ALL=(ALL) NOPASSWD: NVME\n\
Defaults!NVME !logfile, !syslog, !pam_session'\
>> /etc/sudoers
