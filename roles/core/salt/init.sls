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
