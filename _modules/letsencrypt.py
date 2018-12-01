# -*- coding: utf-8 -*-

#   -------------------------------------------------------------
#   Salt — Let's Encrypt execution module
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#   Project:        Woods Clouds
#   Created:        2018-12-01
#   Description:    Functions related to forests
#   License:        BSD-2-Clause
#   -------------------------------------------------------------


from salt.exceptions import SaltInvocationError
from six import iteritems


def get_domains(fqdn):
    for forest, certificates in iteritems(__pillar__['letsencrypt_certificates']):
        if fqdn in certificates:
            domains = [fqdn]

            if 'aliases' in certificates[fqdn]:
                domains.extend(certificates[fqdn]['aliases'])

            return domains

    raise SaltInvocationError("The certificate isn't defined in pillar letsencrypt_certificates entry.")


def get_domains_arguments(fqdn):
    return ' '.join(['-d ' + domain for domain in get_domains(fqdn)])


def build_issue_command(fqdn):
    return "certbot certonly " + get_domains_arguments(fqdn)
