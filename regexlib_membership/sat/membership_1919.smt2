;---
; using 8-bit bit-vectors as characters
; check membership of .Net regex
; regexA = ^\d{5}$
;---
;(set-info :status sat)
;(set-option :print-success true)
(set-logic QF_S)

(declare-const regexA RegLan)
(declare-const x String)

;witness1: "15998"
(define-fun Witness1 () String (str.++ "1" (str.++ "5" (str.++ "9" (str.++ "9" (str.++ "8" ""))))))
;witness2: "94779"
(define-fun Witness2 () String (str.++ "9" (str.++ "4" (str.++ "7" (str.++ "7" (str.++ "9" ""))))))

(assert (= regexA (re.++ (str.to_re "")(re.++ ((_ re.loop 5 5) (re.range "0" "9")) (str.to_re "")))))

;check that the regex contains some x
(assert (str.in_re x regexA))
;check also the concrete witnesses
(assert (str.in_re Witness1 regexA))
(assert (str.in_re Witness2 regexA))
(check-sat)
