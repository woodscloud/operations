#   -------------------------------------------------------------
#   Salt — TLS certificates
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#   Project:        Woods Clouds
#   Created:        2018-12-01
#   License:        Trivial work, not eligible to copyright
#   -------------------------------------------------------------

#   -------------------------------------------------------------
#   Let's Encrypt certificates
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

letsencrypt_certificates:
  woodscloud-web:

    # Woods Clouds

    www.woodscloud.com:
      aliases:
        - woodscloud.com

    # Idriss al Idrissi professional services

    www.idrissi.co:
      aliases:
        - idrissi.co

    qa.idrissi.co: {}
