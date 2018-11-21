#   -------------------------------------------------------------
#   Salt — Network
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#   Project:        Woods Cloud
#   License:        Trivial work, not eligible to copyright
#   -------------------------------------------------------------

{% set instance = pillar['cloud_instances'][grains['id']] %}
{% set interface = salt['node.get_network_interface']() %}

# Scaleway API returns IPv6 information like this:
#
#    ipv6:
#        ----------
#        address:
#            2001:bc8:4400:2700::124b
#        gateway:
#            2001:bc8:4400:2700::124a
#        netmask:
#            127

{% if instance['ipv6'] %}

{% if grains['os_family'] == 'Debian' %}
/etc/network/interfaces.d/60-ipv6.cfg:
  file.managed:
    - contents: |
        iface {{ interface }} inet6 static
            address {{ instance['ipv6']['address'] }}
            netmask {{ instance['ipv6']['netmask'] }}
            gateway {{ instance['ipv6']['gateway'] }}

reload_network_for_ipv6:
  cmd.run:
    - name: |
        ifdown {{ interface }}
        ifup {{ interface }}
    - onchanges:
        - file: /etc/network/interfaces.d/60-ipv6.cfg
{% endif %}

{% endif %}
