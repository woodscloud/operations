#   -------------------------------------------------------------
#   Salt — Provision PHP websites
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#   Project:        Woods Cloud
#   License:        Trivial work, not eligible to copyright
#   -------------------------------------------------------------

{% set forest = grains['forest'] %}

#   -------------------------------------------------------------
#   Sites user accounts
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

{% for fqdn, site in pillar['webserver_php_sites'][forest].iteritems() %}
{% if 'skipCreateAccount' not in site or not site['skipCreateAccount'] %}

web_account_{{ site['user'] }}:
  user.present:
    - name: {{ site['user' ]}}
    - fullname: {{ fqdn }}
    - gid: web
    - system: True
    - home: /var/run/web/{{ fqdn }}

{% endif %}
{% endfor %}
