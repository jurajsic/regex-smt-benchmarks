;---
; using 8-bit bit-vectors as characters
; check membership of .Net regex
; regexA = [\+]?[1]?[-. ]?(\(\d{3}\)|\d{3})(|[-. ])?\d{3}(|[-. ])\d{4}|\d{3}(|[-. ])\d{4}
;---
(set-info :status sat)
(set-option :print-success true)
(set-logic QF_BVRE)

(declare-const regexA (RegEx String))
(declare-const x String)

;witness1: "+1(488).283 1997"
(define-fun Witness1 () String (seq.++ "+" (seq.++ "1" (seq.++ "(" (seq.++ "4" (seq.++ "8" (seq.++ "8" (seq.++ ")" (seq.++ "." (seq.++ "2" (seq.++ "8" (seq.++ "3" (seq.++ " " (seq.++ "1" (seq.++ "9" (seq.++ "9" (seq.++ "7" "")))))))))))))))))
;witness2: "9648003"
(define-fun Witness2 () String (seq.++ "9" (seq.++ "6" (seq.++ "4" (seq.++ "8" (seq.++ "0" (seq.++ "0" (seq.++ "3" ""))))))))

(assert (= regexA (re.union (re.++ (re.opt (re.range "+" "+"))(re.++ (re.opt (re.range "1" "1"))(re.++ (re.opt (re.union (re.range " " " ") (re.range "-" ".")))(re.++ (re.union (re.++ (re.range "(" "(")(re.++ ((_ re.loop 3 3) (re.range "0" "9")) (re.range ")" ")"))) ((_ re.loop 3 3) (re.range "0" "9")))(re.++ (re.opt (re.union (str.to_re "") (re.union (re.range " " " ") (re.range "-" "."))))(re.++ ((_ re.loop 3 3) (re.range "0" "9"))(re.++ (re.union (str.to_re "") (re.union (re.range " " " ") (re.range "-" "."))) ((_ re.loop 4 4) (re.range "0" "9"))))))))) (re.++ ((_ re.loop 3 3) (re.range "0" "9"))(re.++ (re.union (str.to_re "") (re.union (re.range " " " ") (re.range "-" "."))) ((_ re.loop 4 4) (re.range "0" "9")))))))

;check that the regex contains some x
(assert (str.in_re x regexA))
;check also the concrete witnesses
(assert (str.in_re Witness1 regexA))
(assert (str.in_re Witness2 regexA))
(check-sat)
