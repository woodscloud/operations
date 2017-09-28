#   -------------------------------------------------------------
#   Salt — Staging directory for ops
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#   Project:        Woods Cloud
#   Created:        2017-09-25
#   License:        Trivial work, not eligible to copyright
#   -------------------------------------------------------------

staging_git_configuration:
  git.config_set:
    - user: deploy
    - global: True
    - name: core.sharedRepository
    - value: group

staging_repo:
  file.directory:
    - name: /opt/woodscloud-operations
    - user: deploy
    - group: deploy
    - dir_mode: 775
  git.latest:
    - name: https://github.com/woodscloud/ops.git
    - branch: master
    - target: /opt/woodscloud-operations
    - user: deploy
    - unless: test -f /opt/woodscloud-operations/LOCKED
    - require:
      - git: staging_git_configuration
