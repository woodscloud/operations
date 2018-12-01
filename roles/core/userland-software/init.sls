#   -------------------------------------------------------------
#   Salt — Provision software needed by other core roles
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#   Project:        Woods Cloud
#   Created:        2016-04-09
#   License:        Trivial work, not eligible to copyright
#   -------------------------------------------------------------

{% from "map.jinja" import packages, packages_dirs with context %}

#   -------------------------------------------------------------
#   Software sources
#   -------------------------------------------------------------

{% if grains['os'] == 'CentOS' %}

epel-release:
  pkg.installed

{% endif %}

{% if grains['os'] == 'Debian' %}

backports_repository:
  pkgrepo.managed:
    - name: deb http://ftp.debian.org/debian {{ grains['oscodename'] }}-backports main

{% endif %}

#   -------------------------------------------------------------
#   Shells
#   -------------------------------------------------------------

shells:
  pkg.installed:
    - pkgs:
      - bash
      - zsh
      {% if grains['os'] != 'FreeBSD' %}
      - tcsh
      {% endif %}

{{ packages_dirs.zfsfunctions }}/_pm:
  file.managed:
    # At commit 683d331 - 2017-11-05
    - source: https://raw.githubusercontent.com/Angelmmiguel/pm/master/zsh/_pm
    - source_hash: deea33968be713cdbd8385d3a72df2dd09c444e42499531893133f009f0ce0ea

#   -------------------------------------------------------------
#   tmux
#   -------------------------------------------------------------

tmux:
  pkg.installed

/root/.tmux.conf:
  file.managed:
    - source: salt://roles/core/userland-software/files/tmux.conf

#   -------------------------------------------------------------
#   System administration utilities
#   -------------------------------------------------------------

sysadmin_utilities:
  pkg.installed:
    - pkgs:
      - tree
      - wget
      {% if grains['os'] != 'FreeBSD' %}
      - {{ packages.nc }}
      - whois
      {% endif %}
