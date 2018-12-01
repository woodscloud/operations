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
    www.woodscloud.com:
      aliases:
        - woodscloud.com
