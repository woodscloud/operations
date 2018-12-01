#   -------------------------------------------------------------
#   Salt — Let's encrypt certificates
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#   Project:        Woods Cloud
#   Created:        2018-12-01
#   License:        Trivial work, not eligible to copyright
#   -------------------------------------------------------------

{% from "map.jinja" import dirs with context %}

#   -------------------------------------------------------------
#   Configuration
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

{{ dirs.etc }}/letsencrypt/cli.ini:
  file.managed:
    - source: salt://roles/webserver-base/letsencrypt/files/cli.ini
