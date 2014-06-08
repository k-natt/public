from django.conf.urls import patterns, include, url
from django.views.generic.base import TemplateView

from django.contrib import admin
admin.autodiscover()

from core.views import Login, Logout

urlpatterns = patterns('',
	url(r'^/?$', TemplateView.as_view(template_name = 'home.html'), name = 'home'),
	url(r'^tweets/', include('tweets.urls')),
	url(r'^login/$', Login.as_view(), name = 'login'),
	url(r'^logout/$', Logout.as_view(), name = 'logout'),
	url(r'^noperm/$', TemplateView.as_view(template_name = 'noperm.html'), name = 'bad_perms'),

	url(r'^admin/', include(admin.site.urls)),
)

