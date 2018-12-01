#   -------------------------------------------------------------
#   Salt — Webserver core units for all webservers roles
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#   Project:        Woods Cloud
#   License:        Trivial work, not eligible to copyright
#   -------------------------------------------------------------

{% from "map.jinja" import dirs with context %}

#   -------------------------------------------------------------
#   vhost folder
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

{{ dirs.etc }}/nginx/vhosts:
  file.recurse:
    - source: salt://roles/webserver-classic/nginx/files_by_forest/{{ grains['forest'] }}/vhosts
    - dir_mode: 755
    - file_mode: 644
