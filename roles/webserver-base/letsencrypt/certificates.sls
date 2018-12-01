#   -------------------------------------------------------------
#   Salt — TLS certificates
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#   Project:        Woods Clouds
#   Created:        2018-12-01
#   License:        Trivial work, not eligible to copyright
#   -------------------------------------------------------------

{% from "map.jinja" import dirs with context %}
{% set forest = grains['forest'] %}

#   -------------------------------------------------------------
#   Let's Encrypt certificates
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

{% for certificate in pillar['letsencrypt_certificates'][forest] %}

letsencrypt_issue_{{ certificate }}:
  cmd.run:
    - name: {{ salt['letsencrypt.build_issue_command'](certificate) }}
    - creates: {{ dirs.etc }}/letsencrypt/live/{{ certificate }}

{% endfor %}
