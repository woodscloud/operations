# -*- coding: utf-8 -*-

#   -------------------------------------------------------------
#   Salt — Forest execution module
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#   Project:        Woods Clouds
#   Created:        2017-10-11
#   Description:    Functions related to forests
#   License:        BSD-2-Clause
#   -------------------------------------------------------------


from salt.exceptions import SaltInvocationError
from six import iteritems


def exists(forest):
    '''
    A function to check if a forest exists.

    CLI Example::

        salt '*' forest.exists evuaf
    '''
    return forest in __pillar__.get('forests', [])


def _all_nodes():
    return iteritems(__pillar__.get('nodes', {}))


def nodes(forest):
    '''
    A function to list nodes in a forest.

    CLI Example::

        salt-call --local forest.nodes evuaf
    '''
    if not exists(forest):
        raise SaltInvocationError("The forest doesn't exist.")

    return [name for name, node in _all_nodes()
            if node['forest'] == forest]


def nodes_property(forest, property):
    '''
    A function to list nodes in a forest.

    CLI Example::

        salt-call --local forest.nodes_property evuaf hostname
    '''
    if not exists(forest):
        raise SaltInvocationError("The forest doesn't exist.")

    return [node[property] for name, node in _all_nodes()
            if node['forest'] == forest]
