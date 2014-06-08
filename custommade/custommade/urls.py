from django.conf.urls import patterns, include, url

from tweets.views import List as TweetList

# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
	url(r'^registration/', include('registration.urls')),
	url(r'^$', TweetList.as_view(), name = 'root'),

    # Uncomment the next line to enable the admin:
    url(r'^admin/', include(admin.site.urls)),
)
