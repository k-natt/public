
from django.contrib.auth.models import User
from django.db import models
from datetime import datetime

from cm3.settings import TWITTER

import re
import twitter


class Pattern(models.Model):
	pattern = models.CharField(max_length = 255)
	raw_regex = models.BooleanField()

	def regex(self):
		#rexpr = self.pattern
		rexpr = re.sub(r'[ _]', r'[\s_]*', self.pattern)
		if not self.raw_regex:
			rexpr = r"(?<!#)\b{}\b".format(rexpr)
		return rexpr

	def __unicode__(self):
		return self.pattern


class DirtyWord(Pattern):
	def matches(self, string):
		regex = self.regex()
		return re.compile(regex).search(string) is not None


class Replacement(Pattern):
	substitution = models.CharField(max_length = 255)

	def replace(self, string):
		return re.sub(self.regex(), self.substitution, string, flags = re.IGNORECASE)

	def __unicode__(self):
		return "{0} -> {1}".format(pattern, replacement)


class Tweet(models.Model):
	author  = models.ForeignKey(User, related_name = 'tweets_written')
	created = models.DateTimeField(auto_now_add = True)
	text    = models.CharField(max_length = 140)
	approved = models.DateTimeField(null = True)
	# If approver is null and approved isn't, it was automatic, i.e. passed the filters.
	approver = models.ForeignKey(User, null = True, related_name = 'tweets_authorized')

	class Meta:
		permissions = (('Can approve tweets', 'approve_tweets'))

	def authorize(self, authority = None):
		self.approved = datetime.now()
		self.approver = authority
		self.save()
		self.send()

	def send(self):
		cs  = TWITTER['consumer_secret']
		ck  = TWITTER['consumer_key']
		atk = TWITTER['access_token']
		ats = TWITTER['access_token_secret']
		api = twitter.Api(consumer_key = ck, 
				consumer_secret = cs, 
				access_token_key = atk, 
				access_token_secret = ats)
		api.PostUpdate(self.text)

	def __unicode__(self):
		return self.text
		#return "{0}: {1}".format(self.author, self.text)


