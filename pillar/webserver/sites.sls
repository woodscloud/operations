#   -------------------------------------------------------------
#   Salt — Web server configuration
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#   Project:        Woods Clouds
#   Created:        2018-12-01
#   License:        Trivial work, not eligible to copyright
#   -------------------------------------------------------------

#   -------------------------------------------------------------
#   Table of contents
#   -------------------------------------------------------------
#
#   :: Domains by forest
#   :: Sites by forest
#   :: Content by forest and role
#
#   -------------------------------------------------------------

#   -------------------------------------------------------------
#   Domains by forest
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

webserver_domains:
  woodscloud-web:
    - woodscloud.com

#   -------------------------------------------------------------
#   Sites by forest
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

webserver_sites:
  woodscloud-web:
    www.woodscloud.com: {}

#   -------------------------------------------------------------
#   Content by forest and role
#
#   The sites listed here has associated states documenting
#   how to build them.
#
#   As they are sorted by forest and role, they are only deployed
#   on the relevant servers.
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

web_content_sls:

  ###
  ### Woods Cloud - web
  ###

  woodscloud-web:

    webserver-classic:
      # Fauve services
      - .co/idrissi
