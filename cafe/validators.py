from django.core.validators import URLValidator, DecimalValidator, RegexValidator, validate_slug

def validate_korean():
    return RegexValidator(r"^[-ㄱ-힣_]+\Z")

def validate_korean_digit():
    return RegexValidator(r"^[-ㄱ-힣0-9_]+\Z")

def validate_korean_unicode():
    return RegexValidator(r"^[-ㄱ-힣a-zA-Z_]+\Z")

def validate_korean_unicode_digit():
    return RegexValidator(r"^[-ㄱ-힣a-zA-Z0-9_]+\Z")

def validate_URL():
    return URLValidator()

def validate_decimal(max, places):
    return DecimalValidator(max, places)

