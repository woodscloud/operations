#   -------------------------------------------------------------
#   Salt — Salt configuration
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#   Project:        Woods Cloud
#   License:        Trivial work, not eligible to copyright
#   -------------------------------------------------------------

{% from "map.jinja" import services with context %}

#   -------------------------------------------------------------
#   Grains
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

salt_grain_forest:
  grains.present:
    - name: forest
    - value: {{ pillar['nodes'][grains['id']]['forest'] }}

#   -------------------------------------------------------------
#   systemd configuration
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

{% if services['manager'] == 'systemd' %}

/etc/systemd/system/salt-minion.service.d:
  file.directory:
    - mode: 755

/etc/systemd/system/salt-minion.service.d/override.conf:
  file.managed:
    - source: salt://roles/core/salt/files/systemd-override.conf

{% endif %}
