# -*- coding: utf-8 -*-

#   -------------------------------------------------------------
#   Salt — Node execution module
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#   Project:        Woods Clouds
#   Created:        2017-10-11
#   Description:    Functions related to a node
#   License:        BSD-2-Clause
#   -------------------------------------------------------------


from salt.exceptions import SaltInvocationError
from six import iteritems

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

