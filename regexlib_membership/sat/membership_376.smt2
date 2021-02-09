;---
; using 8-bit bit-vectors as characters
; check membership of .Net regex
; regexA = ^((0[1-9]|1[0-9]|2[0-4])([0-5]\d){2})$
;---
(set-info :status sat)
(set-option :print-success true)
(set-logic QF_BVRE)

(declare-const regexA (RegEx String))
(declare-const x String)

;witness1: "165753"
(define-fun Witness1 () String (seq.++ "1" (seq.++ "6" (seq.++ "5" (seq.++ "7" (seq.++ "5" (seq.++ "3" "")))))))
;witness2: "171113"
(define-fun Witness2 () String (seq.++ "1" (seq.++ "7" (seq.++ "1" (seq.++ "1" (seq.++ "1" (seq.++ "3" "")))))))

(assert (= regexA (re.++ (str.to_re "")(re.++ (re.++ (re.union (re.++ (re.range "0" "0") (re.range "1" "9"))(re.union (re.++ (re.range "1" "1") (re.range "0" "9")) (re.++ (re.range "2" "2") (re.range "0" "4")))) ((_ re.loop 2 2) (re.++ (re.range "0" "5") (re.range "0" "9")))) (str.to_re "")))))

;check that the regex contains some x
(assert (str.in_re x regexA))
;check also the concrete witnesses
(assert (str.in_re Witness1 regexA))
(assert (str.in_re Witness2 regexA))
(check-sat)
