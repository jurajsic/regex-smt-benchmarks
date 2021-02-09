;---
; using 8-bit bit-vectors as characters
; check membership of .Net regex
; regexA = ^(\(\d{3}\)[- ]?|\d{3}[- ])?\d{3}[- ]\d{4}$
;---
(set-info :status sat)
(set-option :print-success true)
(set-logic QF_BVRE)

(declare-const regexA (RegEx String))
(declare-const x String)

;witness1: "129-8968"
(define-fun Witness1 () String (seq.++ "1" (seq.++ "2" (seq.++ "9" (seq.++ "-" (seq.++ "8" (seq.++ "9" (seq.++ "6" (seq.++ "8" "")))))))))
;witness2: "786 2289"
(define-fun Witness2 () String (seq.++ "7" (seq.++ "8" (seq.++ "6" (seq.++ " " (seq.++ "2" (seq.++ "2" (seq.++ "8" (seq.++ "9" "")))))))))

(assert (= regexA (re.++ (str.to_re "")(re.++ (re.opt (re.union (re.++ (re.range "(" "(")(re.++ ((_ re.loop 3 3) (re.range "0" "9"))(re.++ (re.range ")" ")") (re.opt (re.union (re.range " " " ") (re.range "-" "-")))))) (re.++ ((_ re.loop 3 3) (re.range "0" "9")) (re.union (re.range " " " ") (re.range "-" "-")))))(re.++ ((_ re.loop 3 3) (re.range "0" "9"))(re.++ (re.union (re.range " " " ") (re.range "-" "-"))(re.++ ((_ re.loop 4 4) (re.range "0" "9")) (str.to_re ""))))))))

;check that the regex contains some x
(assert (str.in_re x regexA))
;check also the concrete witnesses
(assert (str.in_re Witness1 regexA))
(assert (str.in_re Witness2 regexA))
(check-sat)
