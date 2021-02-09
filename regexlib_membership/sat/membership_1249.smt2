;---
; using 8-bit bit-vectors as characters
; check membership of .Net regex
; regexA = ^([0-9]{5})([\-]{1}[0-9]{4})?$
;---
(set-info :status sat)
(set-option :print-success true)
(set-logic QF_BVRE)

(declare-const regexA (RegEx String))
(declare-const x String)

;witness1: "72838"
(define-fun Witness1 () String (seq.++ "7" (seq.++ "2" (seq.++ "8" (seq.++ "3" (seq.++ "8" ""))))))
;witness2: "88886-8811"
(define-fun Witness2 () String (seq.++ "8" (seq.++ "8" (seq.++ "8" (seq.++ "8" (seq.++ "6" (seq.++ "-" (seq.++ "8" (seq.++ "8" (seq.++ "1" (seq.++ "1" "")))))))))))

(assert (= regexA (re.++ (str.to_re "")(re.++ ((_ re.loop 5 5) (re.range "0" "9"))(re.++ (re.opt (re.++ (re.range "-" "-") ((_ re.loop 4 4) (re.range "0" "9")))) (str.to_re ""))))))

;check that the regex contains some x
(assert (str.in_re x regexA))
;check also the concrete witnesses
(assert (str.in_re Witness1 regexA))
(assert (str.in_re Witness2 regexA))
(check-sat)
