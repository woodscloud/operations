#   -------------------------------------------------------------
#   Salt — Webserver core units for all webservers roles
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#   Project:        Woods Cloud
#   License:        Trivial work, not eligible to copyright
#   -------------------------------------------------------------

{% from "map.jinja" import dirs, services with context %}
{% set forest = grains['forest'] %}

#   -------------------------------------------------------------
#   includes folder
#
#    :: general configuration
#    :: application-specific code
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

webserver_core_nginx_includes:
  file.recurse:
    - name: {{ dirs.etc }}/nginx/includes
    - source: salt://roles/webserver-base/nginx/files/includes
    - dir_mode: 755
    - file_mode: 644

#   -------------------------------------------------------------
#   Logs
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

/var/log/www:
  file.directory:
    - mode: 711

{% for domain in pillar['webserver_domains'][forest] %}
/var/log/www/{{ domain }}:
  file.directory:
    - mode: 711
{% endfor %}

#   -------------------------------------------------------------
#   systemd configuration
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

{% if services['manager'] == 'systemd' %}

/etc/systemd/system/nginx.service.d:
  file.directory:
    - mode: 755

/etc/systemd/system/nginx.service.d/override.conf:
  file.managed:
    - source: salt://roles/webserver-base/nginx/files/systemd-override.conf

{% endif %}
