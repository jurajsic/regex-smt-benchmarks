;---
; using 8-bit bit-vectors as characters
; check membership of .Net regex
; regexA = sdsd
;---
(set-info :status sat)
(set-option :print-success true)
(set-logic QF_BVRE)

(declare-const regexA (RegEx String))
(declare-const x String)

;witness1: "sdsd"
(define-fun Witness1 () String (seq.++ "s" (seq.++ "d" (seq.++ "s" (seq.++ "d" "")))))
;witness2: "sdsd"
(define-fun Witness2 () String (seq.++ "s" (seq.++ "d" (seq.++ "s" (seq.++ "d" "")))))

(assert (= regexA (str.to_re (seq.++ "s" (seq.++ "d" (seq.++ "s" (seq.++ "d" "")))))))

;check that the regex contains some x
(assert (str.in_re x regexA))
;check also the concrete witnesses
(assert (str.in_re Witness1 regexA))
(assert (str.in_re Witness2 regexA))
(check-sat)
