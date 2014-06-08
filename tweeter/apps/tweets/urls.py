from django.conf.urls import patterns, url

from tweets import views

urlpatterns = patterns('',
	url(r'^$', views.ListView.as_view(), name='list_tweets'),
	url(r'^(?P<pk>\d+)/$', views.DetailView.as_view(), name='view_tweet'),
	url(r'^compose$', views.ComposeView.as_view(), name='compose_tweet'),
	#url(r'^$', 'tweet.views.list_tweets'),
	#url(r'^(?P<tweet_id>\d+)/$', 'tweet.views.show_tweet', name='view_tweet'),
	#url(r'^compose/?$', Compose.as_view()),
)
