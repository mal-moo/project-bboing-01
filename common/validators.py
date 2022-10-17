from django.core.validators import URLValidator, DecimalValidator, RegexValidator, validate_slug


class CustomValidator:
    def korean(self):
        return RegexValidator(r"^[-ㄱ-힣_]+\Z")
    
    def korean_digit(self):
        return RegexValidator(r"^[-ㄱ-힣0-9_]+\Z")

    def korean_unicode(self):
        return RegexValidator(r"^[-ㄱ-힣a-zA-Z_]+\Z")

    def korean_unicode_digit(self):
        return RegexValidator(r"^[-ㄱ-힣a-zA-Z0-9_]+\Z")

    def unicode_digit(self):
        return validate_slug
    
    def decimal(self, max, place):
        return DecimalValidator(max, place)

    def url(self):
        return URLValidator()
    
    def phone(self):
        return ''
    
    def sns(self):
        return ''

    def hours(self):
        return ''
