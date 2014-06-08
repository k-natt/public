
from django.conf.urls import patterns, url

from users import login

urlpatterns = patterns('',
	url(r'^$', views.ListView.as_view(), name='list_tweets'),
)

