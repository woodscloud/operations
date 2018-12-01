#   -------------------------------------------------------------
#   Salt — Let's encrypt certificates
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#   Project:        Woods Cloud
#   Created:        2017-04-27
#   License:        Trivial work, not eligible to copyright
#   -------------------------------------------------------------

{% from "map.jinja" import dirs with context %}

#   -------------------------------------------------------------
#   Software
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

letsencrypt_software:
  pkg.installed:
    - name: certbot

    {% if grains['os'] == 'Debian' %}
    - fromrepo: {{ grains['oscodename'] }}-backports
    {% endif %}

#   -------------------------------------------------------------
#   Working directory
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

/var/letsencrypt-auto:
  file.directory:
    - user: root
    - dir_mode: 711
