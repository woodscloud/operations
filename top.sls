#   -------------------------------------------------------------
#   Salt configuration for Woods Cloud servers
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#   Project:        Woods Cloud
#   Created:        2017-09-25
#   License:        Trivial work, not eligible to copyright
#   -------------------------------------------------------------

base:
  '*':
    - roles/core
  'local':
    - nodes
    - roles/saltmaster
  druadan:
    - roles/webserver-base
    - roles/webserver-classic
    - roles/webserver-content
