#   -------------------------------------------------------------
#   Salt — Salt master configuration
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#   Project:        Woods Cloud
#   Created:        2017-10-05
#   License:        Trivial work, not eligible to copyright
#   -------------------------------------------------------------

include:
  - .account
  - roles/_common/deploy
  - .salt-cloud
  - .staging
