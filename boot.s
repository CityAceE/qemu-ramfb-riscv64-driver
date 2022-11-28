.global _start
_start:
    lla sp, _stack_top
    jal kernel_main
    j .
