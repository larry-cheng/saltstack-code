haproxy-install:
  pkg.installed:
    - name: haproxy

haproxy-conf:
  file.managed:
    - name: /etc/haproxy.cfg
    - source: salt://haproxy/files/haproxy.cfg
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: haproxy-install

haproxy-running:
  service.running:
    - name: haproxy
    - reload: True
    - watch:
      - file: haproxy-conf
