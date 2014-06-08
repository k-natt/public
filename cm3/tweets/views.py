
from django.views.generic import View
from django.shortcuts import render, redirect, get_object_or_404
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

from core.views import LoginRequired, PermissionRequired
from tweets.models import Tweet, Replacement, DirtyWord


def validate_tweet(info):
	errors = {}
	text = info.get('text', None)
	print 'Text: %s' % text
	if not text or 0 >= len(text) or len(text) > 140:
		errors['text'] = 'Tweet must be between 1 and 140 characters'
	return len(errors) == 0, errors


def rebrand_tweet(text):
	newtext = text
	for word in Replacement.objects.all():
		newtext = word.replace(text)
	return text != newtext, newtext


def is_dirty(text):
	print "Checking if {} is dirty".format(text)
	for word in DirtyWord.objects.all():
		print "Checking " + word.regex()
		if word.matches(text):
			print "Match"
			return True
	return False


class SendTweet(LoginRequired):
	def get(self, request, *args, **kwargs):
		old_info = kwargs.get('old_info', None)
		errors   = kwargs.get('errors',   None)
		return render(request, 'tweets/create.html', {'old_info' : old_info, 'errors' : errors})

	def post(self, request, *args, **kwargs):
		text = request.POST.get('text', None).strip()

		changed, newtext = rebrand_tweet(text)
		info = {'text' : newtext, 'author' : request.user}

		good, errors = validate_tweet(info)
		if changed:
			errors['rebranded'] = text

		if good and not changed:
			twt = Tweet.objects.create(**info)
			if is_dirty(text):
				return redirect('dirty_tweet')
			else:
				twt.authorize()
				return redirect('view_tweet', id = twt.pk)
		else:
			return self.get(request, old_info = info, errors = errors)


class ViewTweet(View):
	def get(self, request, *args, **kwargs):
		tweet = get_object_or_404(Tweet, id = int(kwargs.get('id', None)))
		return render(request, 'tweets/view.html', {'tweet': tweet})

def tweet_page(page, approved):
	all_tweets = Tweet.objects.filter(approved__isnull = not approved)
	paginator = Paginator(all_tweets, 10)
	try:
		tweets = paginator.page(page)
	except PageNotAnInteger:
		tweets = paginator.page(1)
	except EmptyPage:
		tweets = paginator.page(paginator.num_pages)
	return tweets


class ListPending(PermissionRequired):
	permission = 'tweets.approve_tweet'

	def get(self, request, *args, **kwargs):
		page = request.GET.get('page')
		tweets = tweet_page(page, False)
		return render(request, 'tweets/pending.html', {'tweets' : tweets})

	def post(self, request, *args, **kwargs):
		approve = request.POST.get('approve', None)
		page    = request.POST.get('page', None)
		if approve:
			tweet = Tweet.objects.get(pk = int(approve))
			tweet.authorize(request.user)
		tweets = tweet_page(page, False)
		return render(request, 'tweets/pending.html', {'tweets' : tweets})


class ListApproved(LoginRequired):
	def get(self, request, *args, **kwargs):
		page = request.GET.get('page')
		tweets = tweet_page(page, True)
		return render(request, 'tweets/approved.html', {'tweets' : tweets})

