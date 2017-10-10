#   -------------------------------------------------------------
#   Salt configuration for Woods Cloud servers
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#   Project:        Woods Cloud
#   Created:        2017-09-25
#   License:        Trivial work, not eligible to copyright
#   -------------------------------------------------------------

base:
  '*':
    - roles/core/hostname
    - roles/core/motd
    - roles/core/rsyslog
    - roles/core/sshd
  'local':
    - nodes
    - roles/saltmaster
