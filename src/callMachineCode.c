#include <unistd.h>
#include <stdio.h>
#include <malloc.h>
#include <stdlib.h>
#include <errno.h>
#include <sys/mman.h>
#include <memory.h>

/*
push 5
pop rax
ret
*/
unsigned char machine_code[] = {0x6a, 0x05, 0x58, 0xc3};

typedef int (*MachineCodeFunction)();

int push_demo(){
    
    long pagesize = sysconf(_SC_PAGE_SIZE);
    int code_size = sizeof(machine_code);
    MachineCodeFunction code_start = memalign(pagesize, 4 * pagesize);

    memcpy(code_start, machine_code, code_size);
    
    size_t page_no = ((size_t)code_start)/pagesize;
    int res = mprotect(code_start, pagesize*4, PROT_EXEC|PROT_READ);
    if(res)
    {
        perror("mprotect error");
        return 1;
    }else{
        printf("mprotect success\n");
    }
    
   int bbb = code_start();


    printf("eax is %d\n", bbb);

    free(code_start);
    printf("finished\n");
    return 0;
}

int main(){
    push_demo();
    return 0;
}