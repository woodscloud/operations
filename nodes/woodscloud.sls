#   -------------------------------------------------------------
#   Salt — Nodes
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#   Project:        Woods Cloud
#   User:           Woods Cloud
#   Semantic field: Fictional forests
#   Created:        2017-10-10
#   License:        Trivial work, not eligible to copyright
#   -------------------------------------------------------------

brethil:
  cloud.present:
    - cloud_provider: scaleway-woodscloud-config
    # Debian stretch / 2017-06-29 armv7l 4.3.5
    - image: 121566c2-4d06-44fc-8f56-8faa658839e5
    - make_master: true
