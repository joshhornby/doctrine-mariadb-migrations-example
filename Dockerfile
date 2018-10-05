FROM ubuntu:18.04

RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install -y tzdata \
    && ln -fs /usr/share/zoneinfo/Europe/London /etc/localtime \
    && dpkg-reconfigure --frontend noninteractive tzdata \
    && apt-get install -y apache2 wget php php-mysql mysql-client libapache2-mod-php7.2 vim curl php-curl php-intl php-mbstring php-xml php-soap git zip php-zip php-redis php-xdebug libjpeg62 libxext6 libfontconfig1 libxrender1 zlib1g-dev \
    && apt-get clean \
    && wget -q -O /tmp/libpng12.deb http://mirrors.kernel.org/ubuntu/pool/main/libp/libpng/libpng12-0_1.2.54-1ubuntu1_amd64.deb \
    && dpkg -i /tmp/libpng12.deb && rm /tmp/libpng12.deb \
    && a2enmod php7.2 && a2enmod rewrite \
    && curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/bin/composer

RUN service apache2 restart

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid

COPY . /var/www/www



# By default start up apache in the foreground, override with /bin/bash for interative.
CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]
