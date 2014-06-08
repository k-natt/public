from django.db import models

from django.contrib.auth.models import User

from django.contrib import admin

class Tweet(models.Model):
	author = models.ForeignKey(User)
	created = models.DateTimeField(auto_now_add = True)
	approved = models.DateTimeField(null = True)
	sent = models.DateTimeField(null = True)
	text = models.TextField(140)

	def __unicode__(self):
		return "{0}: {1}".format(self.author, self.text)

