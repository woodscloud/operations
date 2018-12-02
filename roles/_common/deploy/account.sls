#   -------------------------------------------------------------
#   Salt — Salt master configuration
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#   Project:        Woods Cloud
#   Created:        2017-04-28
#   License:        Trivial work, not eligible to copyright
#   -------------------------------------------------------------

{% from "map.jinja" import dirs with context %}

#   -------------------------------------------------------------
#   Deployment account
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

deploy_account:
  user.present:
    - name: deploy
    - fullname: Deployment and management of the Salt staging area
    - uid: 9002
    - gid: 9002
    - home: /var/run/deploy

#   -------------------------------------------------------------
#   Sudo capabilities
#
#   Deployers should be able to sudo -u deploy <anything>
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

{{ dirs.etc }}/sudoers.d/deploy:
  file.managed:
    - source: salt://roles/_common/deploy/files/deploy.sudoers
