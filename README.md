# Preparing my very first normalized Debian Docker image

🚧 This is thinking and experimenting. Please contribute and help me make decisions! 🚧

So many Debian images are so complex and far away from safety and security of `debootstrap`-generated files.

1. Created with `debootstrap` command - So clean 🤩 so lovely 🤩
2. Normalized - even Debian base system has problems
3. All features from my [`debian-setup.sh`](https://github.com/szepeviktor/debian-server-tools/blob/master/debian-setup/debian-setup.sh) in an image


- Official Debian images: https://github.com/debuerreotype/debuerreotype
- `apt-get install --no-install-recommends --no-install-suggests`
- Keep no data in the container!

### Parts of the base image

```
+Docker daemon logs: /var/log/syslog
?debconf configuration?
+image normalization apt-mark auto, blacklist: init (sysv, systemd) <features from debian-image-normalize.sh
+boot/halt docker run --restart=always
+timezone tzdata, /etc/timezone
+hostname docker run --hostname
+DNS docker run --dns, embedded DNS server?, /etc/resolv.conf?
+nscd time getent ahosts intel.com
+tini docker run --init; docker exec -it CONTAINER-NAME ps -fA
+user serices:root, applications:normal user
    addgroup --gid 1000 app
    adduser --uid 1000 --gid 1000 --gecos '' --disabled-password app
-sshd
-dbus
-acpid
-rsyslog,logrotate STDOUT, STDERR -> Docker logging
-cron in host/container?
+queue in container
-mail SMTP & disable mail() or msmtp-mta
-chrony from host
-haveged from host
-irqbalance from host
?monit ?
+cli tools from another image
-delete unnecessary files
-dpkg-query --showformat='${Installed-size}\t${Package}\n' --show | sort --numeric-sort
```

### Apps

configuration, data files, logs

```
+Apache 2.4 with HTTP/2 and event MPM
+PHP-FPM 7.4
+Redis in-memory cache
+MariaDB 10 or Percona Server 5.7
+WordPress
+Laravel
```

### Delete unnecessary files

```bash
apt-get clean
rm -r /var/lib/apt/lists/*
rm -r /usr/share/locale/[a-z][a-z]*
rm -r /usr/share/man/[a-z][a-z]*
rm /var/log/dpkg.log /var/log/bootstrap.log /var/log/alternatives.log /var/cache/ldconfig/aux-cache
```
