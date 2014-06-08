
#from django.shortcuts import render, get_object_or_404
from django.views import generic
from django.core.urlresolvers import reverse

from tweets.models import Tweet

class ListView(generic.ListView):
	template_name = 'tweets/list.html'
	context_object_name = 'tweet_list'

	def get_queryset(self):
		return Tweet.objects.order_by('-created')

class DetailView(generic.DetailView):
	template_name = 'tweets/tweet.html'
	model = Tweet

class ComposeView(generic.CreateView):
	template_name = 'tweets/create.html'
	model = Tweet

	def get_success_url(self):
		return reverse('list_tweets')

#def list_tweets(request):
#	tweets = Tweet.objects.all()
#	ctx = {'tweet_list' : tweets}
#	return render(request, 'tweets/list.html', ctx)
#
#def show_tweet(request, tweet_id):
#	tweet = get_object_or_404(Tweet, pk = tweet_id)
#	return render(request, 'tweets/tweet.html', {'tweet':tweet})

