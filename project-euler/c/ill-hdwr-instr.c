#include <stdio.h>
#include <errno.h>
#include <assert.h>
#include <string.h>
#include <stdlib.h>

enum {
	HAND_SIZE = 5,
	N_PLAYERS = 2
};

enum rank {
	// 2-9
	T = 10,
	J,
	Q,
	K,
	A,
	NRANKS = 13
};
enum suit { S,C,H,D };

enum hand {
	HIGH_CARD,
	ONE_PAIR,
	TWO_PAIR,
	THREE_OF_A_KIND,
	STRAIGHT,
	FLUSH,
	FULL_HOUSE,
	FOUR_OF_A_KIND,
	STRAIGHT_FLUSH,
	NHANDS
};

struct card {
	enum rank rank;
	enum suit suit;
};

enum result { WIN, LOSS, DRAW };
struct results { int win, loss, draw; };

struct card parse_card(const char *c)
{
	assert(strlen(c) == 2);
	struct card card = {};
	switch(*c) {
		case '2':
		case '3':
		case '4':
		case '5':
		case '6':
		case '7':
		case '8':
		case '9':
			card.rank = *c - '0';
			break;

		case 'T':
			card.rank = T;
			break;

		case 'J':
			card.rank = J;
			break;

		case 'Q':
			card.rank = Q;
			break;

		case 'K':
			card.rank = K;
			break;

		default:
			fprintf(stderr, "Bad rank: %c", *c);
		break;
	}

	switch(*++c) {
		case 'C': card.suit = C; break;
		case 'S': card.suit = S; break;
		case 'H': card.suit = H; break;
		case 'D': card.suit = D; break;
		default:  fprintf(stderr, "Bad suit: %c", *c);
	}
	return card;
}

void parse_line(char *line, struct card(*hands)[N_PLAYERS][HAND_SIZE])
{
	char *save;
	char *tok = strtok_r(line, " ", &save);
	if(!tok) {
		fprintf(stderr, "Empty line");
		return;
	}
	int cardno = 0;
	do {
		(*hands)[cardno/HAND_SIZE][cardno%HAND_SIZE] = parse_card(tok);
	} while((tok = strtok_r(NULL, " ", &save)));
}

void sort_hand(struct card *hand, enum rank *highs)
{
	for(int i = 0; i < HAND_SIZE; i++) {
		enum rank r = hand[i].rank;
		for(int j = 0; j < i-1; j++) {
			if(highs[j] < r) {
				enum rank p = highs[j];
				highs[j] = r; 
				r = p;
			}
		}
		highs[i] = r;
	}
}

int check_straight(enum rank *cards)
{
	for(int i = 1; i < HAND_SIZE; i++) {
		if(cards[i-1] - 1 != cards[i]) return 0;
	}
	return 1;
}

int check_flush(struct card *hand)
{
	for(int i = 1; i < HAND_SIZE; i++) {
		if(hand[i].suit != hand[0].suit) return 0;
	}
	return 1;
}

enum hand check_multis(enum rank *highs)
{
	enum rank counts[A+1] = {};
	for(int i = 0; i < HAND_SIZE; i++) {
		counts[highs[i]]++;
	}
	int cc[HAND_SIZE];
	for(int i = 0; i < A+1; i++) {
		cc[counts[i]]++;
	}
	if(cc[4]) return FOUR_OF_A_KIND;
	if(cc[3] && cc[2]) return FULL_HOUSE;
	if(cc[3]) return THREE_OF_A_KIND;
	if(cc[2] == 2) return TWO_PAIR;
	if(cc[2]) return ONE_PAIR;
	return HIGH_CARD;
}

enum hand eval(struct card *hand, enum rank *highs)
{
	sort_hand(hand, highs);
	int straight = check_straight(highs);
	int flush = check_flush(hand);
	if(straight && flush) return STRAIGHT_FLUSH;
	enum hand multi = check_multis(highs);
	if(multi > FLUSH) return multi;
	if(flush) return FLUSH;
	if(straight) return STRAIGHT;
	return multi;
}

enum result check_hands(struct card(*hands)[N_PLAYERS][HAND_SIZE])
{
	enum rank p1_high[HAND_SIZE] = {}, p2_high[HAND_SIZE] = {};
	enum hand p1, p2;
	p1 = eval((*hands)[0], p1_high);
	p2 = eval((*hands)[1], p2_high);

	enum result result = DRAW;
	if(p1 > p2) result = WIN;
	if(p1 > p2) result = LOSS;
	if(p1 == p2) {
		for(int i = 0; i < HAND_SIZE; i++) {
			if(p1_high[i] > p2_high[i]) {
				result = WIN;
				break;
			}
			if(p1_high[i] < p2_high[i]) {
				result = LOSS;
				break;
			}
		}
	}
	return result;
}

struct results check_file(FILE *file)
{
	char *line = malloc(31);
	size_t bsz = 0;
	ssize_t llen;

	struct results results = {};

	while((llen = getline(&line, &bsz, file)) > 0) {
		line[llen-1] = '\0';
		struct card cards[N_PLAYERS][HAND_SIZE];
		parse_line(line, &cards);
		int result = check_hands(&cards);
		switch(result) {
			case WIN:
				results.win++;
				break;
			case LOSS:
				results.loss++;
				break;
			case DRAW:
				results.draw++;
				break;
		}
	}
	free(line);
	return results;
}

struct results check(const char *filename)
{
	struct results result = {};
	errno = 0;
	FILE *file = fopen(filename, "r");
	if(file) {
		result = check_file(file);
		fclose(file);
	} else {
		perror("Oops");
	}
	return result;
}

void show_result(const char *filename, const struct results result)
{
	if(filename) {
		printf("%s: ", filename);
	} 
	printf("%d\t%d\t%d\n", result.win, result.loss, result.draw);
}

int main(int argc, char **argv)
{
	if(argc > 1) {
		for(argv++; *argv; argv++) {
			show_result(*argv, check(*argv));
		}
	} else {
		show_result(NULL, check_file(stdin));
	}
}
