;---
; using 8-bit bit-vectors as characters
; check membership of .Net regex
; regexA = ^([GB])*(([1-9]\d{8})|([1-9]\d{11}))$
;---
(set-info :status sat)
(set-option :print-success true)
(set-logic QF_BVRE)

(declare-const regexA (RegEx String))
(declare-const x String)

;witness1: "537897788"
(define-fun Witness1 () String (seq.++ "5" (seq.++ "3" (seq.++ "7" (seq.++ "8" (seq.++ "9" (seq.++ "7" (seq.++ "7" (seq.++ "8" (seq.++ "8" ""))))))))))
;witness2: "899092876854"
(define-fun Witness2 () String (seq.++ "8" (seq.++ "9" (seq.++ "9" (seq.++ "0" (seq.++ "9" (seq.++ "2" (seq.++ "8" (seq.++ "7" (seq.++ "6" (seq.++ "8" (seq.++ "5" (seq.++ "4" "")))))))))))))

(assert (= regexA (re.++ (str.to_re "")(re.++ (re.* (re.union (re.range "B" "B") (re.range "G" "G")))(re.++ (re.union (re.++ (re.range "1" "9") ((_ re.loop 8 8) (re.range "0" "9"))) (re.++ (re.range "1" "9") ((_ re.loop 11 11) (re.range "0" "9")))) (str.to_re ""))))))

;check that the regex contains some x
(assert (str.in_re x regexA))
;check also the concrete witnesses
(assert (str.in_re Witness1 regexA))
(assert (str.in_re Witness2 regexA))
(check-sat)
