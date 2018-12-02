#   -------------------------------------------------------------
#   Salt — Nodes
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#   Project:        Woods Cloud
#   Created:        2017-10-07
#   License:        Trivial work, not eligible to copyright
#   -------------------------------------------------------------

nodes:

  ##
  ## Forest:         Evuaf
  ##
  ## Semantic field: Legendary swords
  ##

  hauteclaire:
    forest: evuaf
    hostname: hauteclaire.evuaf.com
    cloud:
      profile: scaleway-debian-stretch
    enabled: False

  almace:
    forest: evuaf
    hostname: git.evuaf.com
    cloud:
      profile: scaleway-gitlab

  ##
  ## Forest:         Woods Cloud
  ##
  ## Semantic field: Fictional forests
  ##

  brethil:
    forest: woodscloud
    hostname: brethil.woodscloud.com
    cloud:
      config:
        - cloud_provider: scaleway-woodscloud-config
        # Debian stretch / 2018-08-31 armv7l 4.9.93
        - image: a1a09ae3-f3f3-4576-b3be-793de77c0512
        - key_filename: /opt/salt/security/id_ed25519
        - make_master: true

  ##
  ## Forest:         Woods Cloud Web
  ##                 [ php-fpm and static sites ]
  ##
  ## Semantic field: Fictional forests
  ##

  druadan:
    forest: woodscloud-web
    hostname: druadan.woodscloud.com
    roles:
      - webserver-classic
    cloud:
      profile: scaleway-debian-stretch-arm64
