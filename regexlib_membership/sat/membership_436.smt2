;---
; using 8-bit bit-vectors as characters
; check membership of .Net regex
; regexA = ^([a-zA-Z]{5})([a-zA-Z0-9-]{3,12})
;---
(set-info :status sat)
(set-option :print-success true)
(set-logic QF_BVRE)

(declare-const regexA (RegEx String))
(declare-const x String)

;witness1: "vfvzxSb-u"
(define-fun Witness1 () String (seq.++ "v" (seq.++ "f" (seq.++ "v" (seq.++ "z" (seq.++ "x" (seq.++ "S" (seq.++ "b" (seq.++ "-" (seq.++ "u" ""))))))))))
;witness2: "CErQZy7-\u00FE"
(define-fun Witness2 () String (seq.++ "C" (seq.++ "E" (seq.++ "r" (seq.++ "Q" (seq.++ "Z" (seq.++ "y" (seq.++ "7" (seq.++ "-" (seq.++ "\xfe" ""))))))))))

(assert (= regexA (re.++ (str.to_re "")(re.++ ((_ re.loop 5 5) (re.union (re.range "A" "Z") (re.range "a" "z"))) ((_ re.loop 3 12) (re.union (re.range "-" "-")(re.union (re.range "0" "9")(re.union (re.range "A" "Z") (re.range "a" "z")))))))))

;check that the regex contains some x
(assert (str.in_re x regexA))
;check also the concrete witnesses
(assert (str.in_re Witness1 regexA))
(assert (str.in_re Witness2 regexA))
(check-sat)
