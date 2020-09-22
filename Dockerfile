FROM alpine:3.12

# VNC Server password
ARG PW=a

RUN apk --no-cache add sudo bash supervisor x11vnc shadow firefox-esr xvfb \
	exo xfce4-whiskermenu-plugin thunar numix-themes-xfwm4 xfce4-panel xfce4-session xfce4-settings xfce4-terminal xfconf xfdesktop xfwm4 xsetroot \
	ttf-dejavu numix-themes-gtk2 adwaita-icon-theme

RUN x11vnc -storepasswd ${PW} /etc/vncpw \
	&& chmod 400 /etc/vncpw \
	&& sed -i 's|root:x:0:0:root:/root:/bin/ash|root:x:0:0:root:/root:/bin/bash|g' /etc/passwd

# RUN sed -i 's/^#force_color_prompt=yes/force_color_prompt=yes/' /etc/skel/.bashrc

#RUN rm -rf /apk /tmp/* /var/cache/apk/*

COPY supervisord.conf /etc/supervisor/conf.d/
#COPY .bashrc /root/
# COPY x11vnc.desktop /usr/share/applications/

ENV TERM=xterm-256color

EXPOSE 5900
WORKDIR /root

CMD ["/usr/bin/supervisord","-c","/etc/supervisor/conf.d/supervisord.conf"]
