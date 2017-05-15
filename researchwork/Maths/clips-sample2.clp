; ********************************************************
; * CSCI 442/542                               palin.clp *
; *                                                      *
; * This CLIPS program determines if ordered facts of    *
; * the form                                             *
; *           (candidate x x x x x x x x ... x)          *
; * where the x's represent characters or other symbols, *
; * are strict palindromes. For example,                 *
; *           (candidate i f i h a d a h i f i)          *
; * is such a palindrome.                                *
; *                                                      *
; * The program illustrates the use of multifield        *
; * variables and wild cards as well as, in the last     *
; * rule, a field constraint. There, the variable        *
; * ?symbol2 cannot be bound to the same value as is     *
; * ?symbol1.                                            *
; ********************************************************

(defrule report "report the candidate string of symbols"
   (candidate $?all)
   ?inf <- (initial-fact)
   =>
   (retract ?inf)
   (printout t "Candidate string of symbols:" crlf
               "    " $?all crlf))

(defrule empty "candidate string is empty => palindrome"
   ?c <- (candidate)
   =>
   (retract ?c)
   (printout t "The symbols form a palindrome." crlf))

(defrule singleton "candidate string has one symbol =>
                                            palindrome"
   ?c <- (candidate ?)
   =>
   (retract ?c)
   (printout t "The symbols form a palindrome." crlf))

(defrule continue "first and last symbols match"
   ?c <- (candidate ?symbol $?middle ?symbol)
   =>
   (retract ?c)
   (assert (candidate $?middle)))

(defrule fails "first and last symbols do not match"
   ?c <- (candidate ?symbol1 $? ?symbol2&~?symbol1)
   =>
   (retract ?c)
   (printout t "The symbols do NOT form a palindrome." crlf))

