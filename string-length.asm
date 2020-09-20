;;; ----------------------------------------------------------------------------------------
;;; Given a string to print (see data section), determine its length, write it to
;;; the console, and then exit.
;;; ----------------------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------------------
	global  string_length
;;; ----------------------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------------------
        section	.text	              ; The start of the code portion of the program.

;;; COMPLETE THE string_length FUNCTION.
string_length:
	mov 	eax, 0			; create counter
top:
	cmp 	byte [rdi], 0		; see if char equals zero-valued byte
	je 	end			; jump to end if char equals zero-valued byte
        inc	eax			; increment counter if we haven't reached end of string
	inc	rdi			; move pointer down one byte to next char
	jmp 	top			; jump to top to check next char
end:
	ret				; return counter (eax)

;;; ----------------------------------------------------------------------------------------
