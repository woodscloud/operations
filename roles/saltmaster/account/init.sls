#   -------------------------------------------------------------
#   Salt — Salt master configuration
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#   Project:        Woods Cloud
#   Created:        2017-04-28
#   License:        Trivial work, not eligible to copyright
#   -------------------------------------------------------------

{% from "map.jinja" import dirs with context %}

#   -------------------------------------------------------------
#   Account
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
