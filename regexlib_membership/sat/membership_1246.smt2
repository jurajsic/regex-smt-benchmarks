;---
; using 8-bit bit-vectors as characters
; check membership of .Net regex
; regexA = ^([34|37]{2})([0-9]{13})$
;---
(set-info :status sat)
(set-option :print-success true)
(set-logic QF_BVRE)

(declare-const regexA (RegEx String))
(declare-const x String)

;witness1: "3|4896944989889"
(define-fun Witness1 () String (seq.++ "3" (seq.++ "|" (seq.++ "4" (seq.++ "8" (seq.++ "9" (seq.++ "6" (seq.++ "9" (seq.++ "4" (seq.++ "4" (seq.++ "9" (seq.++ "8" (seq.++ "9" (seq.++ "8" (seq.++ "8" (seq.++ "9" ""))))))))))))))))
;witness2: "336398988988911"
(define-fun Witness2 () String (seq.++ "3" (seq.++ "3" (seq.++ "6" (seq.++ "3" (seq.++ "9" (seq.++ "8" (seq.++ "9" (seq.++ "8" (seq.++ "8" (seq.++ "9" (seq.++ "8" (seq.++ "8" (seq.++ "9" (seq.++ "1" (seq.++ "1" ""))))))))))))))))

(assert (= regexA (re.++ (str.to_re "")(re.++ ((_ re.loop 2 2) (re.union (re.range "3" "4")(re.union (re.range "7" "7") (re.range "|" "|"))))(re.++ ((_ re.loop 13 13) (re.range "0" "9")) (str.to_re ""))))))

;check that the regex contains some x
(assert (str.in_re x regexA))
;check also the concrete witnesses
(assert (str.in_re Witness1 regexA))
(assert (str.in_re Witness2 regexA))
(check-sat)
