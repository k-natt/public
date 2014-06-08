from django.db import models
from django.contrib.auth.models import User

class Tweet(models.Model):
	text     = models.CharField(max_length   = 140)
	created  = models.DateField(auto_now_add = True)
	approved = models.DateField(null         = True)
	sent     = models.DateField(null         = True)
	author   = models.ForeignKey(User)

	def __unicode__(self):
		return "{0}: {1}".format(self.author, self.text)

