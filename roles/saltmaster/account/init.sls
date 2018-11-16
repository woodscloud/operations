#   -------------------------------------------------------------
#   Salt — Salt master configuration
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#   Project:        Woods Cloud
#   Created:        2017-04-28
#   License:        Trivial work, not eligible to copyright
#   -------------------------------------------------------------

{% from "map.jinja" import dirs with context %}

#   -------------------------------------------------------------
#   Accounts
#   -------------------------------------------------------------

# Salt account
salt_account:
  group.present:
    - name: salt
    - gid: 9001
  user.present:
    - name: salt
    - fullname: SaltStack master account
    - uid: 9001
    - gid: 9001
    - home: /var/run/salt

salt_account_ownership:
    cmd.run:
      - name: chown -R salt {{ dirs.etc }}/salt /var/cache/salt /var/log/salt /var/run/salt
      - onchanges:
        - user: salt_account

# Deployment account
deploy_account:
  group.present:
    - name: deploy
    - gid: 9002
  user.present:
    - name: deploy
    - fullname: Deployment and management of the Salt staging area
    - uid: 9002
    - gid: 9002
    - home: /var/run/deploy

#   -------------------------------------------------------------
#   SSH key for deployment account
#
#   This key should be added to:
#
#  - Woods Cloud account on Scaleway
#    Used to provision Salt on new instances created through nodes/
#
#  - Software to deploy on Git hosting facilities
#    Deployment key, with read-only access
#   -------------------------------------------------------------

/opt/salt/security:
  file.directory:
    - user: deploy
    - group: deploy
    - chmod: 770
    - makedirs: True

deploy_account_ssh_key:
  cmd.run:
    - name: ssh-keygen -t ed25519 -N "" -f /opt/salt/security/id_ed25519
    - runas: deploy
    - creates: /opt/salt/security/id_ed25519

#   -------------------------------------------------------------
#   Sudo capabilities
#
#   Deployers should be able to sudo -u deploy <anything>
#   -------------------------------------------------------------

{{ dirs.etc }}/sudoers.d/deploy:
  file.managed:
    - source: salt://roles/saltmaster/account/files/deploy
