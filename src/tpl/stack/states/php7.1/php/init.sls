apt_https:
  pkg.installed:
    - name: software-properties-common

php_repo_list:
  cmd.run:
    - name: echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list
    - unless: test -f /etc/apt/sources.list.d/php.list

php_repo_key:
  cmd.run:
    - name: wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
    - unless: test -f /etc/apt/trusted.gpg.d/php.gpg

php7.1:
  pkg.installed:
    - refresh: true
    - pkgs:
      - libapache2-mod-php7.1
      - php7.1-curl
      - php7.1-gd
      - php7.1-json
      - php7.1-mysql
      - php7.1-readline
      - php7.1-xsl
      - php7.1-cli
      - php7.1-zip
      - php7.1-mbstring

a2_disable_php73:
  module.run:
    - name: apache.a2dismod
    - mod: php7.3

a2_disable_php74:
  module.run:
    - name: apache.a2dismod
    - mod: php7.4

a2_enable_php:
  module.run:
    - name: apache.a2enmod
    - mod: php7.1
