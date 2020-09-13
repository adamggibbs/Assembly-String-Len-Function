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
	;; have pointer to beginning of string
	;; loop through each char in the string
	;; if char equals zero-valued byte (/0) jump (je) to end
	;; have counter that gets incremented for each loop iteration
	;; return counter
	mov 	ecx, 0			; create counter
top:
	cmp 	string, "0"		; see if char equals zero-valued byte
	je 	end			; jump to end if char equals zero-valued byte
	inc	ecx			; increment counter if we haven't reached end of string
	jmp 	top			; jump to top to check next char
end:
	ret				; return counter

;;; ----------------------------------------------------------------------------------------
