.model tiny
.286
.code

org     100h

start:

        mov     si, offset _dat-1

l2:

        inc     si
        mov     dx, 00378h
        mov     al, cs:[si]
        out     dx, al

        mov     cx, 00BFEh
l1:

        push    cx
l0:
        loop    l0
        pop     cx
        loop    l1

        cmp     si, offset _end
        jne     l2
        mov     ah, 011h
        int     016h
        je      start
        xor     ax, ax
        out     dx, al

        retn

.data

_dat    db      80h, 40h, 20h, 10h, 08h, 10h, 20h
_end    db      40h

ends
end start