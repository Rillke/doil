php7.3:
  pkg.installed:
    - refresh: true
    - pkgs:
      - libapache2-mod-php7.3
      - php7.3-curl
      - php7.3-gd
      - php7.3-json
      - php7.3-mysql
      - php7.3-readline
      - php7.3-xsl
      - php7.3-cli
      - php7.3-zip
      - php7.3-mbstring

a2_disable_php74:
  module.run:
    - name: apache.a2dismod
    - mod: php7.4

a2_enable_php:
  module.run:
    - name: apache.a2enmod
    - mod: php7.3
