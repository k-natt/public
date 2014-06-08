
#include <sys/resource.h>
#include <assert.h>
#include <stdlib.h>
#include <ctype.h>
#include <stdio.h>
#include <stdbool.h>

#define LETTERS 26

struct node {
	char c;
	bool terminal;
	struct node *next[LETTERS];
};

struct node *new_node(char c)
{
	struct node *n = calloc(1, sizeof(*n));
	if(!n) {
		fprintf(stderr, "OOM\n");
		abort();
	} else {
		n->c = c;
	}
	return n;
}

void add(struct node *node, const char *word)
{
	if(!word) return;
	if(!*word || *word == '\n') {
		node->terminal = 1;
		return;
	}
	assert(isalpha(*word));
	int idx = tolower(*word) - 'a';
	struct node *next = node->next[idx];
	if(!next) {
		node->next[idx] = next = new_node(tolower(*word));
	}
	add(next, word+1);
}

bool find(struct node *node, const char *word)
{
	if(!word) return 0;
	if(!*word) return node->terminal;
	int idx = tolower(*word) - 'a';
	struct node *next = node->next[idx];
	if(next) return find(next, word+1);
	else return 0;
}

int main(int argc, char **argv)
{
	struct rusage pre;
	int rv = getrusage(RUSAGE_SELF, &pre);
	long premx = pre.ru_maxrss;
	struct node *root = malloc(sizeof(*root));
	char *line = NULL;
	size_t sz = 0;
	while(getline(&line, &sz, stdin) != EOF) {
		add(root, line);
	}
	rv = getrusage(RUSAGE_SELF, &pre);
	long postmx = pre.ru_maxrss;
	printf("%ld\n", postmx - premx);
}
