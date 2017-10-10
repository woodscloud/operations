#   -------------------------------------------------------------
#   Salt — MOTD
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#   Project:        Woods Cloud
#   Created:        2017-10-10
#   License:        Trivial work, not eligible to copyright
#   -------------------------------------------------------------

motd:
  file.managed:
    {% if grains['os_family'] == 'Debian' %}
    - name: /etc/motd.tail
    {% else %}
    - name: /etc/motd
    {% endif %}
    - source: salt://roles/core/motd/files/{{ grains['id'] }}

# See https://devcentral.nasqueron.org/T858
get_rid_of_scaleway_motd:
  file.absent:
    - name: /etc/update-motd.d/50-scw

/usr/local/bin/motd:
  file.managed:
    - source: salt://roles/core/motd/files/motd.sh
    - mode: 755

{% if grains['os'] == 'Debian' %}
after_motd_change_debian:
  cmd.run:
    - name: cat /etc/motd.tail > /var/run/motd
    - onchanges:
      - file: motd
{% endif %}
