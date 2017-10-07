#   -------------------------------------------------------------
#   Salt — Salt master configuration
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#   Project:        Woods Cloud
#   Created:        2017-10-05
#   License:        Trivial work, not eligible to copyright
#   -------------------------------------------------------------

{% from "map.jinja" import dirs with context %}

#   -------------------------------------------------------------
#   Cloud profiles
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

saltmaster_cloud_scaleway_profiles:
  file.managed:
    - name: {{ dirs.etc }}/salt-woodscloud/cloud.profiles.d/scaleway.conf
    - source: salt://roles/saltmaster/salt-cloud/files/scaleway.profiles
    - file_mode: 644
