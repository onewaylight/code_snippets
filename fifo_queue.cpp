/*
Portable array-based cyclic FIFO queue.
*/

#include <stdbool.h>
#include <stdio.h>
#include <string.h>

#define MESSAGE_SIZE 64
#define QUEUE_SIZE 3

typedef struct {
	char data[MESSAGE_SIZE];
} MESSAGE;

typedef struct {
    MESSAGE messages[QUEUE_SIZE];
    int begin;
    int end;
    int current_load;
} QUEUE;

void init_queue(QUEUE *queue) {
    queue->begin = 0;
    queue->end = 0;
    queue->current_load = 0;
    memset(&queue->messages[0], 0, QUEUE_SIZE * sizeof(MESSAGE_SIZE));
}

bool enque(QUEUE *queue, MESSAGE *message) {
    if (queue->current_load < QUEUE_SIZE) {
        if (queue->end == QUEUE_SIZE) {
            queue->end = 0;
        }
        queue->messages[queue->end] = *message;
        queue->end++;
        queue->current_load++;
        return true;
    } else {
        return false;
    }
}

bool deque(QUEUE *queue, MESSAGE *message) {
    if (queue->current_load > 0) {
        *message = queue->messages[queue->begin];
        memset(&queue->messages[queue->begin], 0, sizeof(MESSAGE));
        queue->begin = (queue->begin + 1) % QUEUE_SIZE;
        queue->current_load--;
        return true;
    } else {
        return false;
    }
}

int main(int argc, char** argv) {
    QUEUE queue;
    init_queue(&queue);

    MESSAGE message1 = {"This is"};
    MESSAGE message2 = {"a simple"};
    MESSAGE message3 = {"queue!"};

    enque(&queue, &message1);
    enque(&queue, &message2);
    enque(&queue, &message3);

    MESSAGE rec;

    while (deque(&queue, &rec)) {
        printf("%s\n", &rec.data[0]);
    }
}
