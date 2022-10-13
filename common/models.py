from django.db import models

class UnsignedBigAutoField(models.BigAutoField):
    
    def db_type(self, connection):
        return 'bigint(20) UNSIGNED AUTO_INCREMENT'
        
    def rel_db_type(self, connection):
        return 'bigint(20) UNSIGNED'