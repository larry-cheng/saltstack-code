keepalived-install:
  pkg.installed:
    - name: keepalived

keepalived-service:
  service.running:
    - name: keepalived

