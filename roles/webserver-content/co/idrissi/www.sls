#   -------------------------------------------------------------
#   Salt — Provision *.idrissi.co sites
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#   Project:        Idriss al Idrissi professional site
#   License:        Trivial work, not eligible to copyright
#   -------------------------------------------------------------

{% if salt['node.has_web_content'](".co/idrissi") %}

/var/wwwroot/idrissi.co/www:
  file.directory:
    - makedirs: True

  git.latest:
    - name: git@git.evuaf.com:fauve/ihi-static.git
    - target: /var/wwwroot/idrissi.co/www
    - identity: /opt/salt/security/id_ed25519
    - require:
      - file: /var/wwwroot/idrissi.co/www

{% endif %}
