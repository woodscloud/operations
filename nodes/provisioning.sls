#   -------------------------------------------------------------
#   Salt — Nodes
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#   Project:        Woods Cloud
#   Created:        2017-10-07
#   License:        Trivial work, not eligible to copyright
#   -------------------------------------------------------------

{% for node_name, node in pillar['nodes'].iteritems() %}
{% if salt['pillar.get']('nodes:' + node_name + ':enabled', default=True) %}

{% if 'profile' in node['cloud'] %}

{{ node_name }}:
  cloud.profile:
    - profile: {{ node['cloud']['profile'] }}

{% else %}

{{ node_name }}:
  cloud.present: {{ node['cloud']['config'] }}

{% endif %}

{% endif %}
{% endfor %}
