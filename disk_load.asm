; load DH sectors to ES : BX from drive DL
mov cx, 3
reset:
disk_load :
xor ah, ah
mov dl, 0
int 0x13
jc disk_load
push dx
mov bx, 0x1000
mov es, bx
mov bx, 0x00
mov dl, [BOOT_DRIVE]
mov ah, 0x02
mov al, 15
mov ch, 0x00
mov dh, 0x00
mov cl, 0x02
int 0x13
jc disk_error
pop dx
ret ; Restore DX from the stack
; if AL ( sectors read ) != DH ( sectors expected )
;display error message
disk_error :
mov bx, DISK_ERROR_MSG
call print_string
jmp disk_load
; Variables
DISK_ERROR_MSG :
db "Disk read error !",0
