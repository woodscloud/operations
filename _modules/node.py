# -*- coding: utf-8 -*-

#   -------------------------------------------------------------
#   Salt — Node execution module
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#   Project:        Woods Clouds
#   Created:        2017-10-11
#   Description:    Functions related to a node
#   License:        BSD-2-Clause
#   -------------------------------------------------------------


from salt.exceptions import CommandExecutionError, SaltCloudConfigError
from six import iteritems


def _get_all_nodes():
    return __pillar__.get('nodes', {})


def get_all_properties(nodename=None):
    """
    A function to get a node pillar configuration.

    CLI Example:

        salt * node.get_all_properties
    """
    if nodename is None:
        nodename = __grains__['id']

    all_nodes = _get_all_nodes()

    if nodename not in all_nodes:
        raise CommandExecutionError(
            SaltCloudConfigError(
                "Node {0} not declared in pillar.".format(nodename)
            )
        )

    return all_nodes[nodename]


def _explode_key(k):
    return k.split(':')


def _get_first_key(k):
    return _explode_key(k)[0]


def _strip_first_key(k):
    return ':'.join(_explode_key(k)[1:])


def _get_property(key, nodename, default_value, parent=None):
    if parent is None:
        parent = get_all_properties(nodename)

    if ':' in key:
        first_key = _get_first_key(key)
        if first_key in parent:
            return _get_property(
                _strip_first_key(key), nodename,
                default_value, parent[first_key]
            )
    elif key in parent:
        return parent[key]

    return default_value


def get_list(key, nodename=None):
    """
    A function to get a node pillar configuration.

    Returns a list if found, or an empty list if not found.

    CLI Example:

        salt * node.list network:ipv4_aliases
    """
    return _get_property(key, nodename, [])


def filter_by_role(pillar_key, nodename=None):
    """
    A function to filter a dictionary by roles.

    The dictionary must respect the following structure:
      - keys are role to check the current node against
      - values are list of items

    If a key '*' is also present, it will be included
    for every role.

    Returns a list, extending all the filtered lists.

    CLI Example:

        salt * node.filter_by_role web_content_sls
    """
    roles = get_list('roles', nodename)
    dictionary = __salt__['pillar.get'](pillar_key, {})
    filtered_list = []

    for role, items in iteritems(dictionary):
        if role == '*' or role in roles:
            filtered_list.extend(items)

    return filtered_list


def filter_by_forest_and_role(pillar_key, nodename=None):
    if nodename is None:
        nodename = __grains__['id']

    forest = __pillar__['nodes'][nodename]['forest']

    return filter_by_role(pillar_key + ":" + forest, nodename)


def has_web_content(content, nodename=None):
    return content in filter_by_forest_and_role('web_content_sls', nodename)


def get_cloud_property(node, cloud_property):
    """
    A function to get a cloud property from a node dictionary.
    """
    try:
        cloud = __pillar__['nodes'][node]['cloud']
    except KeyError:
        return None

    for item in cloud:
        for key, value in iteritems(item):
            if key == cloud_property:
                return value

    return None


def get_network_interface():
    """
    A function to guess the main network interface of the server.
    """
    for interface, address in iteritems(__grains__['hwaddr_interfaces']):
        # Skips loopback
        if interface == 'lo' or address == '00:00:00:00:00:00':
            continue

        return interface

    return None
