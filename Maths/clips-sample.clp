; *******************************************************************
; * CSCI 442                                            advise0.clp *
; *                                                                 *
; * This file shows a CLIPS program that implements a simple set of *
; * advising rules, with appropriate deftemplates for two kinds of  *
; * facts. One kind of fact represents courses a student has taken; *
; * the other represents courses the student is eligible to take.   *
; * The program contains two sets of rules: one set determines what *
; * courses a student can take, the other reports on those          *
; * selections.                                                     *
; *******************************************************************

; This deftemplate describes facts that represent courses a student
; has taken.
(deftemplate has-taken "Represents a course taken"
   (slot course))

; This deftemplate describes facts that represent courses a student
; is eligible to take.
(deftemplate can-take "Represents a course the student can take"
   (slot course))

; *******************************************************************
; * The following rules determine the courses for which a student   *
; * has taken the prerequisites.                                    *
; *******************************************************************
(defrule can-take-201 "Eligible for 201?"
   (has-taken (course MATH221))
   =>
   (assert (can-take (course CSCI201))))

(defrule can-take-301 "Eligible for 301?"
   (has-taken (course CSCI201))
   (has-taken (course MATH271))
   =>
   (assert (can-take (course CSCI301))))

(defrule can-take-273 "Eligible for 271?"
   (has-taken (course MATH221))
   =>
   (assert (can-take (course CSCI273))))

(defrule can-take-220 "Eligible for 220?"
   (has-taken (course CSCI271))
   (has-taken (course CSCI201))
   =>
   (assert (can-take (course CSCI220))))

(defrule can-take-320 "Eligible for 320?"
   (has-taken (course CSCI220))
   =>
   (assert (can-take (course CSCI320))))

;  ETC. Similar rules for the remaining courses.

; *******************************************************************
; * The following rules report on the courses whose prerequisites   *
; * a student has taken.                                            *
; *******************************************************************
(defrule report-201 "Report that the student can take 201."
   (can-take (course CSCI201))
   =>
   (printout t "Eligible for CSCI 201." crlf))

(defrule report-301 "Report that the student can take 301."
   (can-take (course CSCI301))
   =>
   (printout t "Eligible for CSCI 301." crlf))

(defrule report-271 "Report that the student can take 271."
   (can-take (course CSCI271))
   =>
   (printout t "Eligible for CSCI 271." crlf))

(defrule report-220 "Report that the student can take 220."
   (can-take (course CSCI220))
   =>
   (printout t "Eligible for CSCI 220." crlf))

(defrule report-320 "Report that the student can take 320."
   (can-take (course CSCI320))
   =>
   (printout t "Eligible for CSCI 320." crlf))

;    ETC. Again, more rules for more courses.

Note that the printing actions in the second set of rules could be incorporated into the right-hand sides of the rules that determine course eligibility.

The following two files contain information about individual students. By loading one of them after the rules above (and more rules to complete the system), we can use the system to find the courses the student can take.

; *****************************************************************
; * CSCI 442                                         student1.clp *
; *                                                               *
; * This deffacts lists the courses in the CSCI program that a    *
; * student has taken. Recall the corresponding deftemplate:      *
; *   (deftemplate has-taken "Represents a course taken"          *
; *      (slot course))                                           *
; *****************************************************************

(deffacts A.-Student "Courses taken"
   (has-taken (course MATH221))
   (has-taken (course CSCI201))
   (has-taken (course MATH271)))

; *****************************************************************
; * CSCI 442                                         student2.clp *
; *                                                               *
; * This deffacts lists the courses in the CSCI program that a    *
; * student has taken. Recall the corresponding deftemplate:      *
; *   (deftemplate has-taken "Represents a course taken"          *
; *      (slot course))                                           *
; *****************************************************************

(deffacts Another-Student "Courses taken"
   (has-taken (course MATH221))
   (has-taken (course CSCI201))
   (has-taken (course MATH271))
   (has-taken (course CSCI301))

