from django.conf.urls import patterns, url

from registration.views import Login, Logout, Register, login_status

urlpatterns = patterns('',
	url(r'^login/$',    Login.as_view(),    name = 'login'),
	url(r'^logout/$',   Logout.as_view(),   name = 'logout'),
	url(r'^register/$', Register.as_view(), name = 'register'),
	url(r'^status/$',   login_status),
)

