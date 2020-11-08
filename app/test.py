from django.test import TestCase
from app.calc import add, subtract


class CalcTests(TestCase):
    def test_add_numbers(self):
        """Test that two numbers are add together"""
        self.assertEqual(add(3, 8), 11)

    def test_subtract_numbers(self):
        """test  that values are subtracted and returend"""
        self.assertEqual(subtract(5, 11), 6)
