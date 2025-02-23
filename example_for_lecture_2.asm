.model small
.stack 100h

.data
msg db "Let's start assembly!", '$'
newline db 13, 10, '$'        ; Add carriage return and line feed
num db '0', '$'              ; Variable to store digit to print

.code
main proc
    mov ax, @data            ; Initialize data segment
    mov ds, ax

    mov cl, 9                ; Counter starting from 9

print_loop:
    mov al, cl               ; Move current number to AL
    add al, 30h              ; Convert to ASCII
    mov num, al              ; Store in num variable

    ; Print the number
    mov dx, offset num
    mov ah, 9
    int 21h

    ; Print newline
    mov dx, offset newline
    mov ah, 9
    int 21h

    dec cl                   ; Decrease counter
    cmp cl, 0                ; Compare with 0
    jnz print_loop           ; If not zero, continue loop

    ; Print Hello message
    mov dx, offset msg
    mov ah, 9
    int 21h

    mov ax, 4c00h            ; Exit program
    int 21h
main endp
end main
