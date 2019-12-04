#   -------------------------------------------------------------
#   Salt — Provision *.riadlesdeuxcitronniers.com sites
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#   Project:        STE DAMAPRO SARL / Riad Les deux citronniers
#   License:        Trivial work, not eligible to copyright
#   -------------------------------------------------------------

{% if salt['node.has_web_content'](".com/riadlesdeuxcitronniers") %}

#   -------------------------------------------------------------
#   Main content
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

/var/wwwroot/riadlesdeuxcitronniers.com/www:
  file.directory:
    - makedirs: True

  git.latest:
    - name: git@bitbucket.org:ihidev/r2c-landing.git
    - target: /var/wwwroot/riadlesdeuxcitronniers.com/www
    - identity: /opt/salt/security/id_ed25519
    - require:
      - file: /var/wwwroot/riadlesdeuxcitronniers.com/www

{% endif %}
