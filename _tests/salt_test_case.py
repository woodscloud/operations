import imp
from mock import patch


class SaltTestCase:

    pillars = {}

    def mock_dunden(self):
        return imp.load_source('__pillar__', "mocks/dunden.py")

    def mock_pillars(self, target=None):
        if not target:
            target = self.instance

        target.__pillar__ = self.mock_dunden()

    def get_pillar_get_mock(self, target=None):
        if not target:
            target = self.instance

        return patch.object(
            target.__pillar__,
            'get',
            return_value=self.get_mocked_pillar_value('forests')
        )

    def get_mocked_pillar_value(self, pillar_name):
        return self.pillars[pillar_name]
