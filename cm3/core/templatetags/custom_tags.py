
from django import template

register = template.Library()

@register.inclusion_tag('tags/date.html')
def shortdate(date):
	return {'date' : date}

@register.inclusion_tag('tags/truncate.html')
def shorttext(text, length):
	return {'text' : text, 'length' : length}

