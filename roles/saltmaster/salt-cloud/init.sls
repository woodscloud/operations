#   -------------------------------------------------------------
#   Salt — Salt master configuration
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#   Project:        Woods Cloud
#   Created:        2017-10-05
#   License:        Trivial work, not eligible to copyright
#   -------------------------------------------------------------

{% from "map.jinja" import dirs with context %}

#   -------------------------------------------------------------
#   Software
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

{% if grains['os_family'] == 'Debian' %}

salt-cloud:
  pkg.installed

{% endif %}

#   -------------------------------------------------------------
#   Cloud profiles
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

saltmaster_cloud_scaleway_profiles:
  file.managed:
    - name: {{ dirs.etc }}/salt/cloud.profiles.d/scaleway.conf
    - source: salt://roles/saltmaster/salt-cloud/files/scaleway.profiles
    - file_mode: 644
    - makedirs: True
