;;;;;;;;;;;;;headers;;;;;;;;;;;;;;;
include asimlib.lib
.model small
.stack 100h
.data
.386
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;variable;;;;;;;;;;;;;;;
menu1 db 0Ah,0Dh,"----------------------------------","$"
menu2 db 0Ah,0Dh,"1-ADD Data in Encryted file","$"
menu3 db 0Ah,0Dh,"2-Read decryted data","$"
menu4 db 0Ah,0Dh,"3-show Data from Encryted file","$"
menu5 db 0Ah,0Dh,"4-Delete Data from Encryted file","$"
menu6 db 0Ah,0Dh,"5-Exit Program","$"
menu7 db 0Ah,0Dh,"----------------------------------","$"
inStr1 db 0Ah,0Dh,"Enter String 1: ","$"
choStr1 db 0Ah,0Dh,"Enter Option : ","$"
outStr1 db 0Ah,0Dh,"Your data has been encrypted! ","$"
outStr2 db 0Ah,0Dh,"decryption: ","$"
outStr3 db 0Ah,0Dh,"encrypted Data: ","$"
outStr4 db 0Ah,0Dh,"Your file has been created! ","$"
mybuf1 db 100 dup("$")
handle dw 0
fname1 db  'MICHU.txt',0 
userfile db 0,0
buffer db  50 dup('$')
choice db 0
.code

;;;data fetching;;;
mov ax,@data
mov ds,ax
mov es,ax
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;Calling macro;;;;;;;;;;;;;;;
call clear_register
graphic
menu
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;main funtion;;;;;;;;;;;;;;;
mainmenu:

call cho_str;;;;;;print choice
mov ah,01h
int 21h
sub al,48
mov choice,al
cmp choice,5
.IF(choice==1);;;;;condition
call input_str;;;;input string
call encryption;;;;;to do encryption
call file_write;;;;;;to write encryption in file
call output_str;;;;;;run after success
.ENDIF
.IF(choice==2);;;;;condition
call file_read;;;;;;read from file
call dec_str;;;;;;output string
call decryption;;;;;decode from file
.ENDIF
.IF(choice==3)
call file_get;;;;;;read from file

.ENDIF
.IF(choice==4)
call user_file
call file_str
.ENDIF
.IF(choice==5)
je exit
.ENDIF
call hold_pro
call clear_register
jmp mainmenu
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
exit:
mov ah,04ch
int 21h

;;;;;to read from file;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
file_read proc 
mov ah,3dh 							
mov dx,offset fname1
mov al,0							
int 21h

mov handle,ax 
mov ah, 3Fh    
mov bx, handle               
lea dx, buffer  
mov cx, 10 		               
int 21h
	
mov ah,3eh		
mov dx,handle	
int 21h
ret
file_read endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;to make a file;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
file_make proc 
mov ah ,3ch
mov dx, offset (fname1)
mov cl,1
int 21h
mov handle ,ax
mov ah,3eh
mov dx, handle
int 21h
ret
file_make endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;to write in a file;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
file_write proc 
mov ah,3dh 							
mov dx,offset fname1
mov al,1							
int 21h

mov handle,ax 
mov ah,40h
mov bx, handle
mov cx,15
mov dx, offset (mybuf1)
int 21h

mov mybuf1,0

mov ah,3eh
mov dx, handle
int 21h
ret
file_write endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;to clear screen;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
clrscr proc near
   mov ax,0b800h
   mov es,ax
   mov di,0
   mov al,' '
   mov ah,07d
   loop_clear_12:
        mov word ptr es:[di],ax
        inc di
        inc di
        cmp di,4000
        jle loop_clear_12
        ret
clrscr endp 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;to take input;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
input_str proc near
        mov ah,09h
        mov dx,offset inStr1
        int 21h
        xor dx,dx 
        xor ax,ax
        ret
input_str endp 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;output;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
file_str proc near
        mov ah,09h
        lea dx, outStr4
        int 21h

        ret
file_str endp 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;output;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
cho_str proc near
        mov ah,09h
        mov dx,offset choStr1
        int 21h
        xor dx,dx
        xor ax,ax
        ret
cho_str endp 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;output;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
output_str proc near
        mov ah,09h
        mov dx,offset outStr1
        int 21h
        xor dx,dx
        xor ax,ax
        ret
output_str endp 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;output;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
dec_str proc near
        mov ah,09h
        mov dx,offset outStr2
        int 21h
        xor dx,dx
        xor ax,ax
        ret
dec_str endp 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;encryption;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
encryption proc near
        mov dx,offset mybuf1
        mov ah, 3Fh
        int 21h
        mov cx,lengthof mybuf1
        mov bx,0
        l1:
        xor mybuf1[bx],1
        inc bx
        loop l1
        xor dx,dx
        xor ax,ax
        ret
encryption endp 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;decryption;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
decryption proc near
        mov cx,10
        mov bx,0
        l2:
        xor buffer[bx],1
        inc bx
        loop l2
        xor dx,dx
        xor ax,ax

        mov dx,offset buffer
        mov ah,9
        int 21h
        ret
decryption endp 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;make a file;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
file_get proc 
mov ah,3dh 							
mov dx,offset fname1
mov al,0							
int 21h

mov handle,ax 
mov ah, 3Fh    
mov bx, handle               
lea dx, buffer  
mov cx, 10 		               
int 21h

mov dx,offset outStr3
mov ah,9
int 21h

mov dx,offset buffer
mov ah,9
int 21h
	
mov ah,3eh		
mov dx,handle	
int 21h
ret
file_get endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;user file;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
user_file proc
mov ah,01h
int 21h
mov userfile,al
mov ah,3Ch
mov dx,offset [userfile]
mov cl,0
int 21h
ret
user_file endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;make pasue;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
hold_pro proc near
        mov ah,00
        int 16h
        ret
hold_pro endp 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;clear register;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
clear_register proc near
        xor ax,ax
        xor bx,bx
        xor cx,cx
        xor dx,dx
        xor si,si
        xor di,si
        mov choice,0
        ret
clear_register endp 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
end