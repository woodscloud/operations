import imp
import unittest


salt_test_case = imp.load_source('salt_test_case', "salt_test_case.py")
forest = imp.load_source('forest', "../_modules/forest.py")


class Testinstance(unittest.TestCase, salt_test_case.SaltTestCase):

    def setUp(self):
        self.instance = forest
        self.mock_pillars()

    def test_exists(self):
        self.pillars['forests'] = ['evuaf', 'woodscloud']

        with self.get_pillar_get_mock():
            self.assertTrue(forest.exists('evuaf'))
            self.assertFalse(forest.exists('notexisting'))


if __name__ == '__main__':
    unittest.main()
