#   -------------------------------------------------------------
#   Salt — Salt master configuration
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#   Project:        Woods Cloud
#   Created:        2017-04-28
#   License:        Trivial work, not eligible to copyright
#   -------------------------------------------------------------

#   -------------------------------------------------------------
#   SSH key for deployment account
#
#   This key should be added to:
#
#  - Woods Cloud account on Scaleway [Salt master only]
#    Used to provision Salt on new instances created through nodes/
#
#  - Software to deploy on Git hosting facilities [master + minions]
#    Deployment key, with read-only access
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

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
