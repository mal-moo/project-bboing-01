from django.test import TestCase

# Create your tests here.
class YourTestClass(TestCase):
    def test_false_is_false(self):
        print("Method: test_false_is_false.")
        self.assertFalse(False)
 