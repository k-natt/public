
from django.core.urlresolvers import reverse_lazy
from django.http import HttpResponseRedirect, HttpResponse
from django.views.generic.base import View
from django.shortcuts import render
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.models import User
#from registration.models import User

login_template = 'registration/login.html'

def home():
	return HttpResponseRedirect('/registration/status')

class Register(View):
	pass

class Login(View):
	def get(self, request, *args, **kwargs):
		if request.user.is_authenticated():
			return home()
		else:
			return render(request, login_template)

	def post(self, request, *args, **kwargs):
		username = request.POST.get('username', None)
		password = request.POST.get('password', None)
		user = authenticate(username = username, password = password)
		response = None
		if user is not None:
			login(request, user)
			response = home()
		else:
			context = {'error' : True}
			response = render(request, login_template, context)
		return response

class Logout(View):
	def get(self, request, *args, **kwargs):
		logout(request)
		return home()

def login_status(request):
	if request.user.is_authenticated():
		status = "Logged in"
	else:
		status = "Not logged in"
	return HttpResponse(status)

# For views elsewhere that require login.
# subclass should implement content() method
# If desired, subclass may override 'redirect_url'
class LoginRequired(View):
	redirect_url = reverse_lazy('login')

	def process(self, request, post = False):
		response = None
		if request.user.is_authenticated():
			response = self.content(request, post = post)
		else:
			response = HttpResponseRedirect(self.redirect_url)
		return response

	def get(self, request, *args, **kwargs):
		self.process(request)

	def post(self, request, *args, **kwargs):
		self.process(request, post = True)

