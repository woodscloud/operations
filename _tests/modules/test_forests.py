import imp
import unittest


salt_test_case = imp.load_source('salt_test_case', "salt_test_case.py")
forests = imp.load_source('forests', "../_modules/forests.py")


class Testinstance(unittest.TestCase, salt_test_case.SaltTestCase):

    def setUp(self):
        self.instance = forests
        self.mock_pillars()

    def test_exists(self):
        self.pillars['forests'] = ['evuaf', 'woodscloud']

        with self.get_pillar_get_mock():
            self.assertTrue(forests.exists('evuaf'))
            self.assertFalse(forests.exists('notexisting'))


if __name__ == '__main__':
    unittest.main()
