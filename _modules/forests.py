# -*- coding: utf-8 -*-

#   -------------------------------------------------------------
#   Salt — Forests execution module
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#   Project:        Woods Clouds
#   Created:        2017-10-11
#   Description:    Functions related to forests
#   License:        BSD-2-Clause
#   -------------------------------------------------------------


def exists(forest):
    '''
    A function to check if a forest exists.

    CLI Example::

        salt '*' forests.exists evuaf
    '''
    return forest in __pillar__.get('forests', [])
