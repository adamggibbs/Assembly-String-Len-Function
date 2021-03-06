;;; ----------------------------------------------------------------------------------------
;;; Given a string to print (see data section), determine its length, write it to
;;; the console, and then exit.
;;;
;;; To assemble and run:
;;;
;;;     $ make neo-hello
;;;     $ ./neo-hello
;;; ----------------------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------------------
	global  main
	extern  string_length
;;; ----------------------------------------------------------------------------------------


	
;;; ----------------------------------------------------------------------------------------
        section	.text	              ; The start of the code portion of the program.
	
main:                                 ; Called by the C library stub code.

	;; CALL string_length () TO GET THE LENGTH OF THE MESSAGE TO PRINT.
	mov	rdi, greetings	; move greetings into first arg register 
	sub	rsp, 8		; pad the stack to align the stack pointer on a double word boundary
	call   	string_length	; call the function string_length
	add	rsp, 8		; un pad the stack
	
	;; Use the length provided to print the message.
	mov	rdx, rax	; rdx gets the number of bytes to write.
	mov     rax, 1          ; rax gets the system call code for "write:
        mov     rdi, 1         	; rdi gets the file handle for stdout (console).
        mov     rsi, greetings 	; rsi gets the address of the string below.
        syscall	                ; Call kernel, triggering the write.  The registers carry the arguments.

	;; Print a second message to ensure that the \newline char is properly printed
	mov 	rdi, greetings2	; move greetings2 into first arg register (rdi)
	sub 	rsp, 8		; pad the stack as we did above
	call 	string_length	; call the function string_length
	add 	rsp,8		; un pad

	mov 	rdx, rax	; follow same process as above, but to print greetings2 this time 
	mov 	rax, 1
	mov 	rdi, 1
	mov 	rsi, greetings2
	syscall
	
	ret		   	; End of main().  Stub code will exit the process.
;;; ----------------------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------------------
        section   .data		         			; The start of the data portion of the program.

greetings:			         			; Labels the string of bytes to be written.
	db        "Hello, World!", 10, "~Next Line~", 10, 0 	; The message, with the byte values for "newline"
                        					; and the null terminator appended.

greetings2:				 			; Another string to test program
	db	  "Hello again, World!",10,0

;;; ----------------------------------------------------------------------------------------
