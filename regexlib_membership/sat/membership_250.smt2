;---
; using 8-bit bit-vectors as characters
; check membership of .Net regex
; regexA = ^(([0]{0,1})([1-9]{1})([0-9]{2})){1}([\ ]{0,1})((([0-9]{3})([\ ]{0,1})([0-9]{3}))|(([0-9]{2})([\ ]{0,1})([0-9]{2})([\ ]{0,1})([0-9]{2})))$
;---
(set-info :status sat)
(set-option :print-success true)
(set-logic QF_BVRE)

(declare-const regexA (RegEx String))
(declare-const x String)

;witness1: "0899 878090"
(define-fun Witness1 () String (seq.++ "0" (seq.++ "8" (seq.++ "9" (seq.++ "9" (seq.++ " " (seq.++ "8" (seq.++ "7" (seq.++ "8" (seq.++ "0" (seq.++ "9" (seq.++ "0" ""))))))))))))
;witness2: "289 089589"
(define-fun Witness2 () String (seq.++ "2" (seq.++ "8" (seq.++ "9" (seq.++ " " (seq.++ "0" (seq.++ "8" (seq.++ "9" (seq.++ "5" (seq.++ "8" (seq.++ "9" "")))))))))))

(assert (= regexA (re.++ (str.to_re "")(re.++ (re.++ (re.opt (re.range "0" "0"))(re.++ (re.range "1" "9") ((_ re.loop 2 2) (re.range "0" "9"))))(re.++ (re.opt (re.range " " " "))(re.++ (re.union (re.++ ((_ re.loop 3 3) (re.range "0" "9"))(re.++ (re.opt (re.range " " " ")) ((_ re.loop 3 3) (re.range "0" "9")))) (re.++ ((_ re.loop 2 2) (re.range "0" "9"))(re.++ (re.opt (re.range " " " "))(re.++ ((_ re.loop 2 2) (re.range "0" "9"))(re.++ (re.opt (re.range " " " ")) ((_ re.loop 2 2) (re.range "0" "9"))))))) (str.to_re "")))))))

;check that the regex contains some x
(assert (str.in_re x regexA))
;check also the concrete witnesses
(assert (str.in_re Witness1 regexA))
(assert (str.in_re Witness2 regexA))
(check-sat)
