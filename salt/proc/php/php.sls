php-install
  pkg.installed:
    - pkgs:
      - php
      - php-pdo
      - php-mysql

php.conf:
  file.managed:
    - name: /etc/php.ini
    - source: salt:/php/files/php.ini
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: php-install
