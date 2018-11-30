#   -------------------------------------------------------------
#   Salt — Web server configuration
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#   Project:        Woods Cloud
#   Created:        2018-11-30
#   License:        Trivial work, not eligible to copyright
#   -------------------------------------------------------------

#   -------------------------------------------------------------
#   Required softwares
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

webserver_base_nginx_software:
  pkg.installed:
    - pkgs:
      - nginx
