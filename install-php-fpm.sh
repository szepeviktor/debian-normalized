#/bin/bash
#
# DEB.SURY.ORG (is in CZ)
#
# https://packages.sury.org/php/README.txt

set -e

echo 'deb https://packages.sury.org/php/ bullseye main' >/etc/apt/sources.list.d/sury-php.list
wget -O /etc/apt/trusted.gpg.d/sury-php.gpg 'https://packages.sury.org/php/apt.gpg'
printf 'Package: openssl libssl-dev libssl-doc libssl1.1\nPin: origin "packages.sury.org"\nPin-Priority: -1\n' >/etc/apt/preferences.d/sury-openssl.pref

apt-get update
apt-get install --no-install-recommends --no-install-suggests \
    systemd-standalone-tmpfiles/bullseye-backports \
    libpcre3 php7.4-{fpm,curl,gd,intl,mysql,sqlite3,mbstring,xml}
