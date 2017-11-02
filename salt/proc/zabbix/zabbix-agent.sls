zabbix-repo:
  cmd.run:
    - name: rpm -ivh http://repo.zabbix.com/zabbix/3.0/rhel/7/x86_64/zabbix-release-3.0-1.el7.noarch.rpm
    - unless: test -f /etc/yum.repos.d/zabbix.repo

zabbix-agent-install:
  pkg.installed:
    - name: zabbix-agent

zabbix-agent-service:
  service.running:
    - name: zabbix-agent
    - enable: True
    - watch:
      - file: zabbix-agent-conf

zabbix-agent-conf:
  file.managed:
    - name: /etc/zabbix/zabbix_agentd.conf
    - source: salt://zabbix/files/zabbix_agentd.conf
    - user: root
    - group: root
    - mode: 644 
    - template: jinja
    - default:
      Server: 192.168.56.11
    - require:
      - pkg: zabbix-agent-install
