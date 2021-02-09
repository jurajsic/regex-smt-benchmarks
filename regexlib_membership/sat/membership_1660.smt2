;---
; using 8-bit bit-vectors as characters
; check membership of .Net regex
; regexA = ^(([+]\d{2}[ ][1-9]\d{0,2}[ ])|([0]\d{1,3}[-]))((\d{2}([ ]\d{2}){2})|(\d{3}([ ]\d{3})*([ ]\d{2})+))$
;---
(set-info :status sat)
(set-option :print-success true)
(set-logic QF_BVRE)

(declare-const regexA (RegEx String))
(declare-const x String)

;witness1: "+69 1 098 990 23"
(define-fun Witness1 () String (seq.++ "+" (seq.++ "6" (seq.++ "9" (seq.++ " " (seq.++ "1" (seq.++ " " (seq.++ "0" (seq.++ "9" (seq.++ "8" (seq.++ " " (seq.++ "9" (seq.++ "9" (seq.++ "0" (seq.++ " " (seq.++ "2" (seq.++ "3" "")))))))))))))))))
;witness2: "0049-588 997 83"
(define-fun Witness2 () String (seq.++ "0" (seq.++ "0" (seq.++ "4" (seq.++ "9" (seq.++ "-" (seq.++ "5" (seq.++ "8" (seq.++ "8" (seq.++ " " (seq.++ "9" (seq.++ "9" (seq.++ "7" (seq.++ " " (seq.++ "8" (seq.++ "3" ""))))))))))))))))

(assert (= regexA (re.++ (str.to_re "")(re.++ (re.union (re.++ (re.range "+" "+")(re.++ ((_ re.loop 2 2) (re.range "0" "9"))(re.++ (re.range " " " ")(re.++ (re.range "1" "9")(re.++ ((_ re.loop 0 2) (re.range "0" "9")) (re.range " " " ")))))) (re.++ (re.range "0" "0")(re.++ ((_ re.loop 1 3) (re.range "0" "9")) (re.range "-" "-"))))(re.++ (re.union (re.++ ((_ re.loop 2 2) (re.range "0" "9")) ((_ re.loop 2 2) (re.++ (re.range " " " ") ((_ re.loop 2 2) (re.range "0" "9"))))) (re.++ ((_ re.loop 3 3) (re.range "0" "9"))(re.++ (re.* (re.++ (re.range " " " ") ((_ re.loop 3 3) (re.range "0" "9")))) (re.+ (re.++ (re.range " " " ") ((_ re.loop 2 2) (re.range "0" "9"))))))) (str.to_re ""))))))

;check that the regex contains some x
(assert (str.in_re x regexA))
;check also the concrete witnesses
(assert (str.in_re Witness1 regexA))
(assert (str.in_re Witness2 regexA))
(check-sat)
