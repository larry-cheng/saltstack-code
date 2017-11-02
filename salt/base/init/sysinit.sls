hosts-conf:
  file.managed:
    - name: /etc/hosts
    - source: salt://init/files/hosts
    - user: root
    - group: root
    - mode: 644

ssh-conf:
  file.managed:
    - name: /etc/ssh/sshd_config
    - source: salt://init/files/sshd_config
    - user: root
    - group: root
    - mode: 644

selinux-conf:
  file.managed:
    - name: /etc/selinux/config
    - source: salt://init/files/selinux_config
    - user: root
    - group: root
    - mode: 644


