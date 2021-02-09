;---
; using 8-bit bit-vectors as characters
; check membership of .Net regex
; regexA = (([2-9]{1})([0-9]{2})([0-9]{3})([0-9]{4}))$
;---
(set-info :status sat)
(set-option :print-success true)
(set-logic QF_BVRE)

(declare-const regexA (RegEx String))
(declare-const x String)

;witness1: "\u00809868853509"
(define-fun Witness1 () String (seq.++ "\x80" (seq.++ "9" (seq.++ "8" (seq.++ "6" (seq.++ "8" (seq.++ "8" (seq.++ "5" (seq.++ "3" (seq.++ "5" (seq.++ "0" (seq.++ "9" ""))))))))))))
;witness2: "8556489999"
(define-fun Witness2 () String (seq.++ "8" (seq.++ "5" (seq.++ "5" (seq.++ "6" (seq.++ "4" (seq.++ "8" (seq.++ "9" (seq.++ "9" (seq.++ "9" (seq.++ "9" "")))))))))))

(assert (= regexA (re.++ (re.++ (re.range "2" "9")(re.++ ((_ re.loop 2 2) (re.range "0" "9"))(re.++ ((_ re.loop 3 3) (re.range "0" "9")) ((_ re.loop 4 4) (re.range "0" "9"))))) (str.to_re ""))))

;check that the regex contains some x
(assert (str.in_re x regexA))
;check also the concrete witnesses
(assert (str.in_re Witness1 regexA))
(assert (str.in_re Witness2 regexA))
(check-sat)
