
from django.contrib import admin
from tweets.models import DirtyWord, Replacement, Tweet

admin.site.register(Tweet)
admin.site.register(DirtyWord)
admin.site.register(Replacement)

