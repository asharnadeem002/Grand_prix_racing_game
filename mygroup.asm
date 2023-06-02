[org 0x0100] 
	jmp start
seconds: dw 0
timerflag: dw 0
oldkb: dd 0
back_speed: dw 1,0 	; background and speed	
lap_time : dw 0,0
msg: db 'AUTODROMO NAZIONALE DI MONZA',0
msg2: db 'Pos.',0
msg3: db 'Name',0
msg4: db 'No.',0
msg5: db 'Time',0
msg6: db '1        Don Matrelli          #01            01m 14s',0
msg7: db '2        Travis Daye           #88            01m 15s',0
msg8: db '3        Cal Tyrone            #66            01m 16s',0
msg9: db '4        Peter Kurtz           #2             01m 17s',0
msg10: db '5        Tse Sakamoto          #05            01m 18s',0
msg11: db '6        ABC                   #34            01m 19s',0
msg12: db '7        Bruno Gourdo          #27            01m 21s',0
msg13: db '8        Toni Borlini          #12            01m 23s',0
msg14: db '9        Vito Giuffre          #4             01m 24s',0
msg15: db '10       Nigel Levins          #09            01m 30s',0
msg16: db'Qualifying  Results  Sheet',0
;...............................clear the screen...................................
clear:
	mov ax,0xb800
	mov es,ax
	mov di,0
nextchar:
	mov word[es:di],0x00db      
	add di,2
	cmp di,4000
	jne nextchar
	ret
;...............................Sky printing...................................

back:
	mov di,0
	mov cx, 320
lb1:
	mov al,32
	mov ah,0x34       ;....blue 
	mov[es:di],ax     ;.....di=index
	add di,2
	sub cx,1
	cmp cx,0
	jne lb1         ;.....cx times repeat
	ret 
;...............................Road...................................

road1:			;......left road         
	mov word[es:di],0x0fdb
	add di,2
	loop road1
incr:
	mov cx,2
	sub di,160       ;.....next position
	sub si,1          ;..no of times
	cmp si,0
	jne road1
	ret
;..............................road 1
roadl1:
	mov word[es:di],0x0fdb
	add di,2
	loop roadl1
decr:
	mov cx,2
	sub di,168            ;.......next position for pattern
	sub si,1
	cmp si,0
	jne roadl1
	ret
	;..............................................................road
;...............................Grass...................................

grass:
	mov ah,0xaa
	mov al,32
	mov [es:di],ax
	add di,2
	loop grass
	ret
grass1:
	mov ah,0xaa
	mov al,32
	mov [es:di],ax
	add di,2
	loop grass1
	ret
grass2:
	mov ah,0xaa
	mov al,32
	mov [es:di],ax
	add di,2
	loop grass2
	ret
grass3:
	mov ah,0xaa
	mov al,32
	mov [es:di],ax
	add di,2
	loop grass3
	ret
grass4:
	mov ah,0xaa
	mov al,32
	mov [es:di],ax
	add di,2
	loop grass4
	ret
grass5:
	mov ah,0xaa
	mov al,32
	mov [es:di],ax
	add di,2
	loop grass5
	ret
grass6:
	mov ah,0xaa
	mov al,32
	mov [es:di],ax
	add di,2
	loop grass6
	ret
grass7:
	mov ah,0xaa
	mov al,32
	mov [es:di],ax
	add di,2
	loop grass7
	ret
grass8:
	mov ah,0xaa
	mov al,32
	mov [es:di],ax
	add di,2
	loop grass8
	ret
;....................................left grass
grassr1:
	mov ah,0xaa
	mov al,32
	mov [es:di],ax
	sub di,2
	loop grassr1
	ret
grassr2:
	mov ah,0xaa
	mov al,32
	mov [es:di],ax
	sub di,2
	loop grassr2
	ret
grassr3:
	mov ah,0xaa
	mov al,32
	mov [es:di],ax
	sub di,2
	loop grassr3
	ret
grassr4:
	mov ah,0xaa
	mov al,32
	mov [es:di],ax
	sub di,2
	loop grassr4
	ret
grassr5:
	mov ah,0xaa
	mov al,32
	mov [es:di],ax
	sub di,2
	loop grassr5
	ret
grassr6:
	mov ah,0xaa
	mov al,32
	mov [es:di],ax
	sub di,2
	loop grassr6
	ret
grassr7:
	mov ah,0xaa
	mov al,32
	mov [es:di],ax
	sub di,2
	loop grassr7
	ret
grassr8:
	mov ah,0xaa
	mov al,32
	mov [es:di],ax
	sub di,2
	loop grassr8
	ret
grassr9:
	mov ah,0xaa
	mov al,32
	mov [es:di],ax
	sub di,2
	loop grassr9
	ret
	;................................................................right grass 
line1:
	mov word[es:di],0x0fdb
	loop line1
Mid:
	mov cx,2
	add di,160
	sub si,1
	cmp si,0
	jne line1
	ret
;........................line 1 middle
line2:
	mov word[es:di],0x0fdb
	loop line2
Mid2:
	mov cx,2
	add di,160             ;......add row
	sub si,1               ;.....printig times
	cmp si,0
	jne line2
	ret
;........................line 2 middle

line3:
	mov word[es:di],0x0fdb
	loop line3
Mid3:
	mov cx,2
	add di,160
	sub si,1
	cmp si,0
	jne line3
	ret
	;......................................................................mid line
;................................speed meter at top right....................................
speed:
	mov si,3
	mov di,128
	mov bx,160
speed2:
	mov word[es:di],0x6620         ;.......66=orange
	add di,2
	cmp di,bx                       ;.....bx times
	jne speed2

	add di,128
	add bx,160
	sub si,1
	cmp si,0
	jne speed2
	ret
Alpha:

	mov di,128
	mov bx,160
	mov word[es:di],0x6f50
	add di,4
	mov word[es:di],0x603a
	add di,4
	mov word[es:di],0x6030
	add di,4
	mov word[es:di],0x6031
	add di,4
	mov word[es:di],0x6f4c
	add di,4
	mov word[es:di],0x603a
	add di,4
	mov word[es:di],0x6030
	add di,4
	mov word[es:di],0x6031
	mov cx,2
N:
	dec cx
	add di,132
	mov word[es:di],0x6030
	add di,4
	mov word[es:di],0x6030
	add di,4
	mov word[es:di],0x604d
	add di,4
	mov word[es:di],0x6030
	add di,4
	mov word[es:di],0x6030
	add di,4
	mov word[es:di],0x6073
	add di,4
	mov word[es:di],0x6065
	add di,4
	mov word[es:di],0x6063
	cmp cx,0
	jne N
	ret
;..........................2nd and 3rd line of speedometer

	;..............................................................speed box
;...............................staring...................................

staring:
   mov bx,0
	mov word[es:di],0x0fdb
	add di,2
	loop staring
	add di,158          
	mov word[es:di],0x0fdb

colu:
	add di,160
	add bx,1           ;.....count
	mov word[es:di],0x0fdb
	cmp bx,7
	jne colu
	mov bx,0
;...................right column
row:
	sub di,2
	mov word[es:di],0x0fdb
	add bx,1
	cmp bx,43
	jne row
	sub di,160
	mov word[es:di],0x0fdb
	mov bx,0
;.................bottom row
colu2:
	sub di,160
	add bx,1
	mov word[es:di],0x0fdb
	cmp bx,7
	jne colu2
	mov bx,0
	mov di,3576       ;.........ind


mov word[es:3404],0x0f4F
mov word[es:3406],0x0f49
mov word[es:3408],0x0f4C
mov word[es:3412],0x0f2D
mov word[es:3572],0x0f5C
mov word[es:3560],0x0f2F
mov word[es:3400],0x0f2D
mov word[es:3566],0x0f7C
mov word[es:3246],0x0f7C
mov word[es:3250],0x0f2F
mov word[es:3242],0x0f5C



mov word[es:3470],0x0f54
mov word[es:3472],0x0f45
mov word[es:3474],0x0f4D
mov word[es:3476],0x0f50
mov word[es:3478],0x0f2D
mov word[es:3638],0x0f5C
mov word[es:3628],0x0f2F
mov word[es:3466],0x0f2D
mov word[es:3632],0x0f7C
mov word[es:3312],0x0f7C
mov word[es:3318],0x0f2F
mov word[es:3308],0x0f5C

ret
inside:
	mov bx,0
	mov word[es:di],0x04db
	add di,2
	loop inside
	add di,158          
	mov word[es:di],0x04db

colui:
	add di,160
	add bx,1           ;.....count
	mov word[es:di],0x04db
	cmp bx,2
	jne colui
	mov bx,0
;...................right column
rowi:
	sub di,2
	mov word[es:di],0x04db
	add bx,1
	cmp bx,11
	jne rowi
	sub di,160
	mov word[es:di],0x04db
	mov bx,0
;.................bottom row
colu2i:
	sub di,160
	add bx,1
	mov word[es:di],0x04db
	cmp bx,2
	jne colu2i
	mov bx,0
	mov di,3576 

mov word[es:3440],0x0E30
mov word[es:3442],0x0E31
mov word[es:3282],0x0E30
mov word[es:3280],0x0E30
ret
backscreen:
	mov word[es:di],0x04c4
	add di,2
	loop backscreen
	mov cx,3
	add di,160

l1:
	mov word[es:di],0x04b3   ;.......|
	add di,160
	loop l1
	mov cx,15
l2:
	sub di,2
	mov word[es:di],0x04c4 ;............._
	loop l2
	ret
backroad:				;.....small tilt lines
	mov word[es:di],0xf2f
	sub di,156
	loop backroad
	ret
space:
	mov word[es:di],0x7f20
	ret
;...........left dashroard
backscreen1:
	mov word[es:di],0x04c4
	add di,2
	loop backscreen1
	mov cx,3
	add di,160
	mov di,3040
	mov cx,15
l4:				;.........|
	sub di,2
	mov word[es:di],0x04c4
	loop l4
	ret 
l5:				;........._	
	mov word[es:di],0x04b3
	add di,160
	loop l5
	ret
backroad2:
	mov word[es:di],0x0f5c
	sub di,164
	loop backroad2
	ret
space1:
	mov word[es:di],0x7f20
	ret
;...........left dashroard
dashline:
	mov word[es:di],0x0fc4 ;
	add di,2
	loop dashline
	ret
;................middle dashboard
dashcolor:
	mov word[es:di],0x08db
	add di,2
	loop dashcolor
	add di,76
	mov cx,42
	dec si
	cmp si,0
	jne dashcolor
	ret
;...................middle color of middle dashboard
;...........................................dashboard
;....................................................stadium background.......................................
stad:
	call back
	mov di,510
	mov cx,25
ls1:
	mov word[es:di],0x01db
	add di,2
	mov word[es:di],0x04db
	add di,2
	sub cx,1
	cmp cx,0
	jne ls1
	mov di,356
	mov cx,22
stadpr:
	sub cx,1
	mov word[es:di],0x01db
	add di,2
	mov word[es:di],0x04db
	add di,2
	cmp cx,0
	jne stadpr
	
	mov di,210
	mov cx,15
stadpr2:
	sub cx,1
	mov word[es:di],0x01db
	add di,2
	mov word[es:di],0x04db
	add di,2
	cmp cx,0
	jne stadpr2
	ret
;...............................Mountains background.....................................

mount:
	mov word[es:di],0x06db
	add di,2
	loop mount
	ret
mount2:
	mov word[es:di],0x0fdb
	add di,2
	loop mount2
	ret
;.............................mountains

callmount:
	call back
	mov di,506
	mov cx,10
	call mount
	
	mov di,348
	mov cx,8
	call mount

	mov di,192
	mov cx,4
	call mount

	mov di,34
	mov cx,2
	call mount
;...........................
	mov di,532
	mov cx,6
	call mount2
	
	mov di,374
	mov cx,4
	call mount2

	mov di,216
	mov cx,2
	call mount2
;.................................
	mov di,550
	mov cx,10
	call mount
	
	mov di,392
	mov cx,8
	call mount

	mov di,236
	mov cx,4
	call mount

	mov di,78
	mov cx,2
	call mount
;....................................
	mov di,576
	mov cx,6
	call mount2
	
	mov di,418
	mov cx,4
	call mount2

	mov di,260
	mov cx,2
	call mount2
	
	;...................

	mov di,594
	mov cx,10
	call mount
	
	mov di,436
	mov cx,8
	call mount

	mov di,280
	mov cx,4
	call mount

	mov di,122
	mov cx,2
	call mount
;...........................callling of mountains
	ret
;...............................house background...................................

hou:
	mov word[es:di],0x01db
	add di,2
	loop hou
	ret
hou2:
	mov word[es:di],0x04db
	add di,2
	loop hou2
	ret
mounth2:
	mov word[es:di],0x06db
	add di,2
	loop mounth2
	ret
callhouse:
	
;...................................................................................tree call
	call back
	mov di,530
	mov cx,20
	call hou

	sub di,200
	mov cx,20
	call hou

	sub di,204
	mov cx,24
	call hou2

	sub di,204
	mov cx,20
	call hou2

	mov di,562
	mov word[es:di],0x06db
	sub di,2
	mov word[es:di],0x06db

	mov di,576
	mov cx,6
	call mounth2
	
	mov di,418
	mov cx,4
	call mounth2

	mov di,260
	mov cx,2
	call mounth2
;.....................................................................................house	

ret
;...............................Map...................................

map:	
	
	mov bx,0
	mov ax,0x7020
	mov dx,11
	mov cx,4
	cld
	ll1:
		push cx
		mov di,bx
		mov cx,dx
		rep stosw
		pop cx
		add bx,160
	loop ll1

	mov di,0
	mov word[es:di+2],0x70c9	; top left corner
	mov cx,3
	mov ax,0x70cd
	add di,4

	rep stosw
	mov word[es:di],0x70cd
	mov cx,3
	add di,2

	rep stosw
	mov word[es:di],0x70bb 		; top right corner

	mov word[es:di+160],0x70ba 	;right line
	mov word[es:di+320],0x70ba
	
	mov di,162
	mov word[es:di],0x70ba 		;left line
	mov word[es:di+160],0x70ba
	
	mov di,482
	mov word[es:di],0x70c8		; bottom left corner
	mov cx,2
	mov ax,0x70cd
	add di,2
	rep stosw
	mov word[es:di],0x70cd
	
	mov cx,4
	add di,2
	rep stosw
	mov word[es:di],0x70bc		; bottom right corner
	
	

	ret
back1:
call back
mov di,800
sub di,480
l3:
mov word[es:di],0x1120      ;water
add di,2
cmp di,640
jne l3
 
add di,8

mov di,700
sub di,480
lu4:
mov word[es:di],0x6620      ;upper line of boat
add di,2
cmp di,250
jne lu4

mov di,864
sub di,480
ll5:
mov word[es:di],0x6620      ;lower line of boat
add di,2
cmp di,406
jne ll5

mov di,544
sub di,480
l6:
mov word[es:di],0x7720      ;flag of boat
add di,2
cmp di,86
jne l6
ret

;...............................dot on map...................................

dot:
	mov word[es:di],0x7FFE
	ret
;..................................Result displaying.............................

strlen: push bp
 mov bp,sp
 push es
 push cx
 push di
 les di, [bp+4] ; point es:di to string
 mov cx, 0xffff ; load maximum number in cx
 xor al, al ; load a zero in al
 repne scasb ; find zero in the string
 mov ax, 0xffff ; load maximum number in ax
 sub ax, cx ; find change in cx
 dec ax ; exclude null from length
 pop di
 pop cx
 pop es
 pop bp
 ret 4

printstr: push bp
 mov bp, sp
 push es
 push ax
 push cx
 push si
 push di
 push ds ; push segment of string
 mov ax, [bp+4]
 push ax ; push offset of string
 call strlen ; calculate string length
 cmp ax, 0 ; is the string empty
 jz exitr ; no printing if string is empty
 mov cx, ax ; save length in cx
 mov ax, 0xb800
 mov es, ax ; point es to video base
 mov al, 80 ; load al with columns per row
 mul byte [bp+8] ; multiply with y position
 add ax, [bp+10] ; add x position
 shl ax, 1 ; turn into byte offset
 mov di,ax ; point di to required location
 mov si, [bp+4] ; point si to string
 mov ah, [bp+6] ; load attribute in ah
 cld ; auto increment mode

nextcharp: lodsb ; load next char in al
 stosw ; print char/attribute pair
 loop nextcharp ; repeat for the whole string

exitr: pop di
 pop si
 pop cx
 pop ax
 pop es
 pop bp
 ret 8

redline: push es
 push ax
 push cx
 push di
 mov ax, 0xb800
 mov es, ax ; point es to video base
 xor di, di ; point di to top left column
 mov ax, 0xCC20 ; space char in normal attribute
 mov cx, 160 ; number of screen locations
 cld ; auto increment mode
 rep stosw ; clear the whole screen
 pop di
 pop cx
 pop ax
 pop es
 ret 

result: 
call clear ; call the clrscr subroutine

call redline
 mov ax, 6
 push ax ; push x position
 mov ax, 1
 push ax ; push y position
 mov ax, 0x40 ; blue on white attribute
 push ax ; push attribute
 mov ax, msg
 push ax ; push address of message
 call printstr ; call the printstr subroutine

 mov ax, 4
 push ax ; push x position
 mov ax, 5
 push ax ; push y position
 mov ax, 0x07 ; blue on white attribute
 push ax ; push attribute
 mov ax, msg2
 push ax ; push address of message
 call printstr ; call the printstr subroutine

 mov ax, 15
 push ax ; push x position
 mov ax, 5
 push ax ; push y position
 mov ax, 0x07 ; blue on white attribute
 push ax ; push attribute
 mov ax, msg3
 push ax ; push address of message 
call printstr ; call the printstr subroutine
 
 mov ax, 37
 push ax ; push x position
 mov ax, 5
 push ax ; push y position
 mov ax, 0x07 ; blue on white attribute
 push ax ; push attribute
 mov ax, msg4
 push ax ; push address of message
 call printstr ; call the printstr subroutine
 
mov ax, 52
 push ax ; push x position
 mov ax, 5
 push ax ; push y position
 mov ax, 0x07 ; blue on white attribute
 push ax ; push attribute
 mov ax, msg5
 push ax ; push address of message
 call printstr ; call the printstr subroutine

 mov ax, 6
 push ax ; push x position
 mov ax, 7
 push ax ; push y position
 mov ax, 0x0f ; blue on white attribute
 push ax ; push attribute
 mov ax, msg6
 push ax ; push address of message
 call printstr ; call the printstr subroutine
 
 mov ax, 6
 push ax ; push x position
 mov ax, 8
 push ax ; push y position
 mov ax, 0x0f ; blue on white attribute
 push ax ; push attribute
 mov ax, msg7
 push ax ; push address of message
 call printstr ; call the printstr subroutine

 mov ax, 6
 push ax ; push x position
 mov ax, 9
 push ax ; push y position
 mov ax, 0x0f; blue on white attribute
 push ax ; push attribute
 mov ax, msg8
 push ax ; push address of message
 call printstr ; call the printstr subroutine

 mov ax, 6
 push ax ; push x position
 mov ax, 10
 push ax ; push y position
 mov ax, 0x0f ; blue on white attribute
 push ax ; push attribute
 mov ax, msg9
 push ax ; push address of message
 call printstr ; call the printstr subroutine

 mov ax, 6
 push ax ; push x position
 mov ax, 11
 push ax ; push y position
 mov ax, 0x0f ; blue on white attribute
 push ax ; push attribute
 mov ax, msg10
 push ax ; push address of message
 call printstr ; call the printstr subroutine

 mov ax,6
 push ax ; push x position
 mov ax, 12
 push ax ; push y position
 mov ax, 0x04 ; blue on white attribute
 push ax ; push attribute
 mov ax, msg11
 push ax ; push address of message
 call printstr ; call the printstr subroutine

 mov ax,6
 push ax ; push x position
 mov ax, 13
 push ax ; push y position
 mov ax, 0x0f ; blue on white attribute
 push ax ; push attribute
 mov ax, msg12
 push ax ; push address of message
 call printstr ; call the printstr subroutine

 mov ax,6
 push ax ; push x position
 mov ax, 14
 push ax ; push y position
 mov ax, 0x0f ; blue on white attribute
 push ax ; push attribute
 mov ax, msg13
 push ax ; push address of message
 call printstr ; call the printstr subroutine

 mov ax,6
 push ax ; push x position
 mov ax, 15
 push ax ; push y position
 mov ax, 0x0f ; blue on white attribute
 push ax ; push attribute
 mov ax, msg14
 push ax ; push address of message
 call printstr ; call the printstr subroutine

 mov ax,6
 push ax ; push x position
 mov ax, 16
 push ax ; push y position
 mov ax, 0x0f ; blue on white attribute
 push ax ; push attribute
 mov ax, msg15
 push ax ; push address of message
 call printstr ; call the printstr subroutine

 mov ax,20
 push ax ; push x position
 mov ax, 3
 push ax ; push y position
 mov ax, 0x0f ; blue on white attribute
 push ax ; push attribute
 mov ax, msg16
 push ax ; push address of message
 call printstr 
 ret
 ;...............................Moving the road...................................

moveroad:
	push es
	push ds

	mov ax,0xb800
	mov es,ax
	mov ds,ax
	mov si,2160
	mov ax,[ds:si]
	push ax
	mov cx,9
	sub si,160
	mov di,2160
move:
	mov ax,[ds:si]
	mov [es:di],ax
	sub si,160
	sub di,160
	loop move

	pop ax
	mov [es:di],ax

	pop ds
	pop es
	ret
;...............................speed display...................................

display_speed:
	push es
	push ds
	push ax
	push bx
	push dx
	
	mov ax,0xb800
	mov es,ax
	
	mov ax,[back_speed+2]
	cmp ax,250
	ja stop
	mov bx,10
	mov dx,0
	div bx
	add dl,0x30
	mov dh,0x0e
	mov [es:3442],dx
	
	mov dx,0
	div bx
	add dl,0x30
	mov dh,0x0e
	mov [es:3440],dx
	
	mov dx,0
	div bx
	add dl,0x30
	mov dh,0x0e
	mov [es:3282],dx

stop:
	mov ax,[back_speed+2]
	inc ax
	mov [back_speed+2],ax
	pop dx
	pop bx
	pop ax
	pop ds
	pop es
	ret

exit12:
	pop dx
	pop cx
	pop bx
	pop ax
	pop ds
	pop es
ret
;...............................Timer display...................................

display_timer:
	push es
	push ds
	push ax
	push bx
	push dx
	
	mov ax,0xb800
	mov es,ax

	mov ax,[lap_time+2]
	cmp ax,600
	jne prints
	mov ax,0
	mov [lap_time+2],ax

	mov ax,[lap_time]
	inc ax
	mov [lap_time],ax

prints:
	mov ax,[lap_time+2]   ;............printing seconds
	mov bx,10
	mov dx,0
	div bx
	mov dx,0
	div bx
	add dl,0x30
	mov dh,0x6e
	mov [es:304],dx
	
	mov dx,0
	div bx
	add dl,0x30
	mov dh,0x6e
	mov [es:300],dx
	
	mov ax,[cs:lap_time];........................printing minutes
	mov bx,10
	mov dx,0
	div bx
	add dl,0x30
	mov dh,0x6e
	mov [es:292],dx
	

	mov dx,0
	div bx
	add dl,0x30
	mov dh,0x6e
	mov [es:288],dx

	mov ax,[cs:lap_time+2]
	inc ax
	mov [cs:lap_time+2],ax

	pop dx
	pop bx
	pop ax
	pop ds
	pop es
	ret
;...............................stop the timer and call result display...................................

stopt:
	mov ax,[lap_time]
	inc ax
	mov [lap_time],ax
	mov word [cs:timerflag], 0
	mov al, 0x20
	 out 0x20, al 
	 pop ax
	call result
	getexit:
	in al,0x60
	cmp al,0x50
	jne getexit
;...............................changing backrounds...................................
	
back_change:
	push es
	push ds
	push ax
	push bx
	push cx
	push dx
	
	mov ax,0xb800
	mov es,ax
	


	mov ax,[back_speed+2]
	mov dx,0
	mov bx,160
	div bx
	cmp dx,0
	jne exit12
	mov bx,[back_speed]
	cmp bx,0
	je stopt
	inc bx
	
	cmp bx,5
	je frst
	cmp bx,4
	je frth
	cmp bx,3
	je thrd
	cmp bx,2
	je scnd

	scnd:
		mov word[back_speed],2
		call callhouse
		call speed
		call Alpha
		call map
		mov di,6
		call dot
		mov di,640
		mov cx,16
		call grass1
		mov di,800
		mov cx,14
		call grass2
		mov di,798
		mov cx,16
		call grassr2
		jmp exit	
	
	frth:
		mov word[back_speed],4
		call back1
		call map
		mov di,484
		call dot
		call speed
		call Alpha
		jmp exit

	thrd:
		mov word[back_speed],3
		call callmount
		call map
		mov di,338
		call dot
		call speed
		call Alpha
		jmp exit

	frst:
		mov word[back_speed],0
		call stad
		call map
		mov di,162
		call dot
		call speed
		call Alpha
		jmp exit


	exit:
	pop dx
	pop cx
	pop bx
	pop ax
	pop ds
	pop es
ret
;...............................Moving through keys...................................

kbisr: 
push ax

 in al, 0x60 
 cmp al, 0x48
jne nextcmp
 mov word [cs:timerflag], 1
 jmp exit2

nextcmp: 
 cmp al,0x50
 jne nextcmp2
 mov word [cs:timerflag], 0 
jmp exit2
nextcmp2:
 cmp al,0x4b
 jne nextcmp3
 mov word [cs:timerflag], 0
 jmp exit2
nextcmp3:
 cmp al,0x4d
 jne exit2
 mov word [cs:timerflag], 0
 



exit2:
 mov al, 0x20
 out 0x20, al 
 pop ax
 iret 
 ;...............................timer...................................

timer: 
push ax
 cmp word [cs:timerflag], 1 
 jne skipall
 call moveroad 
 call display_speed
 call display_timer
 call back_change
 

skipall:
 mov al, 0x20
 out 0x20, al 
 pop ax
 iret 
;...............................Start ...................................
	
start:
	call clear
	mov di,0
	mov cx, 320    ;....4 rows
	call back
;..............................................................sky call
	mov cx,2
	mov si,9
	mov di,1920
	call road1

	
	mov cx,2
	mov si,9
	mov di,2076
	call roadl1




;.....................................................................road calls
	
	
	mov di,640
	mov cx,16
	call grass1

	mov di,800
	mov cx,14
	call grass2

	mov di,960
	mov cx,12
	call grass3

	mov di,1120
	mov cx,10
	call grass4

	mov di,1280
	mov cx,8
	call grass5

	mov di,1440
	mov cx,6
	call grass6

	mov di,1600
	mov cx,4
	call grass7

	mov di,1760
	mov cx,2
	call grass8

	mov di,798
	mov cx,16
	call grassr2

	mov di,958
	mov cx,14
	call grassr3

	mov di,1118
	mov cx,12
	call grassr4

	mov di,1278
	mov cx,10
	call grassr5

	mov di,1438
	mov cx,8
	call grassr6

	mov di,1598
	mov cx,6
	call grassr7

	mov di,1758
	mov cx,4
	call grassr8

	mov di,1918
	mov cx,2
	call grassr9
;..........................................................................grass calls
	mov di,720
	mov cx,4
	mov si,1
	call line1

	mov di,1040
	mov cx,4
	mov si,3
	call line2

	mov di,1680
	mov cx,4
	mov si,4
	call line3
;...................................................................mid line calls
	
	mov di,2240
	mov cx,15
	call backscreen
;..................call for left dashboard
	mov di,2400
	mov cx,15
	call back
;.......................call for left dash sky
	mov di,2720
	mov cx,2
	call backroad

	mov di,2734
	call space

	mov di,2370
	mov cx,15
	call backscreen1

	mov di,2528
	mov cx,16
	call back

;.......................call for right dash sky
	mov di,2878
	mov cx,2
	call backroad2

	mov di,2864
	call space1

	mov di,2528
	mov cx,3
	call l5
;................................................................................backscreen
	mov di,2436
	mov cx,3
	call l5

	mov di,2434
	mov cx,3
	call l5

	mov di,2432
	mov cx,3
	call l5

	mov di,2522
	mov cx,3
	call l5

	mov di,2524
	mov cx,3
	call l5

	mov di,2526
	mov cx,3
	call l5              ;......|
;......................3 column lines of right and left dashboard
	mov di,2278
	mov cx,42
	call dashline

;......................................................dashline calls
	mov di,2438
	mov cx,42
	mov si,3                   ;.........3 columns of middle
	call dashcolor

	mov di,3078           ;......start index for light silver
	mov bx,0

	mov di,2596
	mov cx,44
	call staring
;.........................................................staring
	mov di,3110
	mov cx,12
	call inside
;...............................................
	mov di,140
	mov bx,160
	mov si,3
	call speed

	mov di,120
	mov bx,160
	call Alpha
;.........................................................................speed meter calls
	call map
	mov di,162
	call dot
;.......................for keyboard...............................
	xor ax, ax
 mov es, ax 
 mov ax, [es:9*4]
 mov [oldkb], ax 
 mov ax, [es:9*4+2]
 mov [oldkb+2], ax 
 cli ; disable interrupts
 mov word [es:9*4], kbisr 
 mov [es:9*4+2], cs 
 mov word [es:8*4], timer 
 mov [es:8*4+2], cs 
 sti 
 mov dx, start 
 add dx, 15 
 mov cl, 4
 shr dx, cl 



	
mov ah,0x1
int 0x21
mov ax, 0x4c00
int 0x21