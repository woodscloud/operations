#   -------------------------------------------------------------
#   Salt — Provision *.idrissi.co sites
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#   Project:        Idriss al Idrissi professional site
#   License:        Trivial work, not eligible to copyright
#   -------------------------------------------------------------

{% if salt['node.has_web_content'](".co/idrissi") %}

#   -------------------------------------------------------------
#   Main content
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

/var/wwwroot/idrissi.co/www:
  file.directory:
    - makedirs: True

  git.latest:
    - name: git@git.evuaf.com:fauve/ihi-static.git
    - target: /var/wwwroot/idrissi.co/www
    - identity: /opt/salt/security/id_ed25519
    - require:
      - file: /var/wwwroot/idrissi.co/www

#   -------------------------------------------------------------
#   Work content
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

/var/dataroot/idrissi.co/work/ryad-les-deux-citronniers:
  file.directory:
    - makedirs: True

  git.latest:
    - name: git@git.evuaf.com:fauve/r2c-cdc.git
    - target: /var/dataroot/idrissi.co/work/ryad-les-deux-citronniers
    - identity: /opt/salt/security/id_ed25519
    - require:
      - file: /var/dataroot/idrissi.co/work/ryad-les-deux-citronniers

/var/wwwroot/idrissi.co/www/work/ryad-les-deux-citronniers:
  file.directory:
    - makedirs: True

/var/wwwroot/idrissi.co/www/work/ryad-les-deux-citronniers/specifications.pdf:
  file.symlink:
    - target: /var/dataroot/idrissi.co/work/ryad-les-deux-citronniers/spec-fonc-Riad_les_Deux_Citronniers.pdf

{% endif %}
