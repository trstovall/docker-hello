


section .text

global _start

_start:
  ; write our string to stdout

  mov eax, 4    ; system call number (sys_write).
  mov ebx, 1    ; first argument file handle (stdout).
  mov ecx, msg  ; second argument: pointer to message to write
  mov edx, len  ; third argument: message length
  int 0x80      ; call kernel.

  ; and exit.

  mov eax, 1    ; system call number (sys_exit).
  mov ebx, 0    ; first syscall argument: exit code
  int 0x80      ; call kernel.

section .data

msg db "Hello, world!", 0xa  ; the string to print.
len equ $ - msg              ; length of the string.


