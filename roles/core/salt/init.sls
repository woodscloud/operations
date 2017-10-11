#   -------------------------------------------------------------
#   Salt — Salt configuration
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#   Project:        Woods Cloud
#   License:        Trivial work, not eligible to copyright
#   -------------------------------------------------------------

#   -------------------------------------------------------------
#   Grains
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

salt_grain_forest:
  grains.present:
    - name: forest
    - value: {{ pillar['nodes'][grains['id']]['forest'] }}

salt_grain_cloud_provider:
  grains.present:
    - name: cloud_provider
    - value: {{ pillar['nodes'][grains['id']]['cloud']['cloud_provider'] }}
