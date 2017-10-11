#   -------------------------------------------------------------
#   Salt — Users and groups
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#   Project:        Woods Clouds
#   Created:        2017-10-11
#   License:        Trivial work, not eligible to copyright
#   -------------------------------------------------------------

#   -------------------------------------------------------------
#   Table of contents
#   -------------------------------------------------------------
#
#   :: Shell groups
#   :: Shell groups mapping by forest
#
#   -------------------------------------------------------------

#   -------------------------------------------------------------
#   Users groups
#
#   As for users, the mere fact to add a group here is a no-op.
#
#   The groups will be deployed on each servers if included in
#   shellgroups_ubiquity or in some servers forests if included
#   in the state shellgroups_by_forest.
#
#   These mapping are defined in the forests.sls pillar.
#
#   Sort the groups by GIDs.
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

shellgroups:
  ops:
    gid: 3001
    description: >
        Maintain the servers infrastructure. As such, members of this
        group have a root access everywhere.
    members:
      - dereckson
      - sandlayth

  evuaf-ops:
    gid: 3002
    description: Maintain the Evuaf servers, with root access there.
    members:
      - fauve

  deploy:
    gid: 9002
    description: Build softwares to be installed on the servers.
    members:
      - dereckson

#   -------------------------------------------------------------
#   Shell groups mapping by forest
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

shellgroups_ubiquity:
  - ops

shellgroups_by_forest:
  evuaf:
    - evuaf-ops

  woodscloud:
    - deploy
