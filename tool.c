#include <stdio.h>

#include "tool.h"

int page_gen(struct evbuffer * ret_buf)
{
    if(ret_buf == NULL){
        return -1;
    }

    evbuffer_add_printf(ret_buf, "Thanks for the request!");

    return 0;
}