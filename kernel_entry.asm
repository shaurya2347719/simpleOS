; Ensures that we jump straight into the kernel ’s entry function.
[ bits 32]
[ extern main ]
call main
jmp $
