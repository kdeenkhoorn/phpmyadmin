FROM kdedesign/debian-stable:latest

ARG ADMINVER=5.0.2

# Upgrade base OS image
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update \
    && apt-get dist-upgrade -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update \
    && apt-get install -y unzip wget apache2 php php-json php-mbstring php-zip php-gd php-xml php-curl php-mysql \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && wget -q -O /opt/phpMyAdmin-${ADMINVER}-all-languages.zip https://files.phpmyadmin.net/phpMyAdmin/${ADMINVER}/phpMyAdmin-${ADMINVER}-all-languages.zip \
    && cd /opt \
    && unzip /opt/phpMyAdmin-${ADMINVER}-all-languages.zip \
    && rm /opt/phpMyAdmin-${ADMINVER}-all-languages.zip \
    && mv /opt/phpMyAdmin-${ADMINVER}-all-languages /opt/phpMyAdmin \
    && chown -Rfv www-data:www-data /opt/phpMyAdmin 

COPY phpMyAdmin.conf /etc/apache2/sites-enabled/000-default.conf

EXPOSE 80
CMD apachectl -D FOREGROUND
