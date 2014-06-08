
from django.views.generic import View
from django.shortcuts import redirect, render
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages

class LoginRequired(View):
	def dispatch(self, request, *args, **kwargs):
		print "Dispatching login required. anon? {}".format(request.user.is_anonymous())
		if request.user.is_anonymous():
			return redirect('login')
		else:
			print "Logged in as {}".format(request.user.username)
			return super(LoginRequired, self).dispatch(request, *args, **kwargs)

class PermissionRequired(LoginRequired):
	permission = None

	def dispatch(self, request, *args, **kwargs):
		print "Checking perm {0} for user {1}".format(self.permission, request.user)
		if not request.user.has_perm(self.permission):
			return redirect('bad_perms')
		else:
			return super(PermissionRequired, self).dispatch(request, *args, **kwargs)

class Login(View):
	def get(self, request, *args, **kwargs):
		return_url = request.GET.get('return_url', None)
		if not return_url:
			return_url = request.POST.get('return_url', None)
		if not return_url:
			return_url = kwargs.get('return_url', 'home')
		if request.user.is_anonymous():
			context = {
				'return_url' : return_url, 
				'bad_username' : kwargs.get('bad_username', None),
			}
			return render(request, 'login.html', context)
		else:
			return redirect('home')

	def post(self, request, *args, **kwargs):
		username = request.POST.get('username', None)
		password = request.POST.get('password', None)
		redirurl = request.POST.get('redirect', 'home')
		user = authenticate(username = username, password = password)
		if user is not None:
			login(request, user)
			return redirect(redirurl)
		else:
			return self.get(request, bad_username = username, return_url = redirurl)

class Logout(View):
	def get(self, request, *args, **kwargs):
		logout(request)
		return redirect('home')

