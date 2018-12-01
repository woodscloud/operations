#   -------------------------------------------------------------
#   Salt — Web server configuration
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#   Project:        Woods Cloud
#   Created:        2018-11-30
#   License:        Trivial work, not eligible to copyright
#   -------------------------------------------------------------

{% from "map.jinja" import packages with context %}

#   -------------------------------------------------------------
#   Required softwares
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

webserver_base_nginx_software:
  pkg.installed:
    - pkgs:
      - {{ packages['nginx'] }}
    {% if grains['os'] == 'Debian' %}
    - fromrepo: {{ grains['oscodename'] }}-backports
    {% endif %}
