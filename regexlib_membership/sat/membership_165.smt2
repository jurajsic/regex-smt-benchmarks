;---
; using 8-bit bit-vectors as characters
; check membership of .Net regex
; regexA = ^([A-Za-z]|[A-Za-z][0-9]*|[0-9]*[A-Za-z])+$
;---
(set-info :status sat)
(set-option :print-success true)
(set-logic QF_BVRE)

(declare-const regexA (RegEx String))
(declare-const x String)

;witness1: "z"
(define-fun Witness1 () String (seq.++ "z" ""))
;witness2: "25KI"
(define-fun Witness2 () String (seq.++ "2" (seq.++ "5" (seq.++ "K" (seq.++ "I" "")))))

(assert (= regexA (re.++ (str.to_re "")(re.++ (re.+ (re.union (re.union (re.range "A" "Z") (re.range "a" "z"))(re.union (re.++ (re.union (re.range "A" "Z") (re.range "a" "z")) (re.* (re.range "0" "9"))) (re.++ (re.* (re.range "0" "9")) (re.union (re.range "A" "Z") (re.range "a" "z")))))) (str.to_re "")))))

;check that the regex contains some x
(assert (str.in_re x regexA))
;check also the concrete witnesses
(assert (str.in_re Witness1 regexA))
(assert (str.in_re Witness2 regexA))
(check-sat)
