#   -------------------------------------------------------------
#   Salt configuration for Woods Cloud servers
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#   Project:        Woods Cloud
#   Created:        2017-09-25
#   License:        Trivial work, not eligible to copyright
#   -------------------------------------------------------------

base:
  '*':
    - roles/core/rsyslog
  'local':
    - nodes
    - roles/saltmaster
