[bits 16]
print_string:
   mov ah, 0Eh
   mov si, bx
   print:
   lodsb
   cmp al,0
   je done
   int 10h
   jmp print
   done:
   ret
