
from itertools import groupby
from tweets.models import Tweet
from django.shortcuts import render_to_response
from django.template import RequestContext
from registration.views import LoginRequired

class List(LoginRequired):
	def update(postinfo):
		# Returns (post result, message)
		 pass

	def content(self, request, post = False):
		post_result = None
		post_message = None
		if post:
			if request.user.has_permission('edit_tweet'):
				post_result, post_message = self.update(request.POST)
			else:
				return HttpResponseNotAllowed(['GET'])

		tweets = Tweet.objects
		if not request.user.has_perm('edit_tweet'):
			tweets = tweets.filter(author = request.user)
		tweets = tweets.order_by('-created')

		pending  = [t for t in tweets if not t.approved]
		approved = [t for t in tweets if     t.approved]

		context = {
			'post_result'  : post_result,
			'post_message' : post_message,
			'pending'      : pending,
			'approved'     : approved,
			'total'        : len(pending) + len(approved)
		}
		return render_to_response('tweets/list.html',
					context,
					context_instance = RequestContext(request))

