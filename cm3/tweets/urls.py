
from django.views.generic.base import TemplateView
from django.conf.urls import patterns, include, url

from tweets.views import SendTweet, ViewTweet, ListPending, ListApproved

urlpatterns = patterns('',
	url(r'^compose$', SendTweet.as_view(), name = 'create_tweet'),
	url(r'^dirty$', TemplateView.as_view(template_name = 'tweets/dirty.html'), name = 'dirty_tweet'),
	url(r'^(?P<id>\d+)/$', ViewTweet.as_view(), name = 'view_tweet'),
	url(r'^pending$', ListPending.as_view(), name = 'pending_tweets'),
	url(r'^approved$', ListApproved.as_view(), name = 'approved_tweets'),
)

