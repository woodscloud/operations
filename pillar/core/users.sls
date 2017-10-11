#   -------------------------------------------------------------
#   Salt — Users accounts list
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#   Project:        Woods Cloud
#   Created:        2017-10-10
#   License:        Trivial work, not eligible to copyright
#   -------------------------------------------------------------

#   -------------------------------------------------------------
#   Users accounts
#
#   shellusers:
#     When an account isn't included in a group, this is a no-op.
#     As such, users hereby listed don't have access to any server.
#
#     UIDs are kept in sync with Nasqueron. As such, users receive
#     their Nasqueron uid if they've an account on this infra, or
#     is not, an uid in the range 2201-2499.
#
#   revokedusers:
#     Users in this list will be removed from the servers.
#
#   To rename an user:
#     Edit the username in the shellusers section,
#     add the former username to the revokedusers list.
#
#   Sort the accounts by their username alphabetic order.
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

revokedusers: []

shellusers:
  dereckson:
    fullname: Sébastien Santoro
    shell: tcsh
    uid: 5001
    ssh_keys:
      - ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBzD5VzetMFTUHLWrLyBsnZ6bdwDa4Ip9WWAh5nLxKyR dereckson@ysul.nasqueron.org

  fauve:
    fullname: Idriss al Idrissi
    shell: zsh
    uid: 2030
    ssh_keys:
      - ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILQAhf4Du37UglM/hh9ZW2HCq3VtMfj+bgnbjvcIEwo0 fove48@OperateurNoir

  sandlayth:
    fullname: Yassine Hadj Messaoud
    uid: 5002
    ssh_keys:
      - ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL4H4SF3NZ0/o5uTYhIUKUEzP7hlZ0mGqMxs6wt/dhQs kalix@arch-laptop
