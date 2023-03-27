;---
; using 8-bit bit-vectors as characters
; check membership of .Net regex
; regexA = ^[A-Z]{3}\d{8}$
;---
;(set-info :status sat)
;(set-option :print-success true)
(set-logic QF_S)

(declare-const regexA RegLan)
(declare-const x String)

;witness1: "YAJ27507588"
(define-fun Witness1 () String (str.++ "Y" (str.++ "A" (str.++ "J" (str.++ "2" (str.++ "7" (str.++ "5" (str.++ "0" (str.++ "7" (str.++ "5" (str.++ "8" (str.++ "8" ""))))))))))))
;witness2: "ZAZ80889718"
(define-fun Witness2 () String (str.++ "Z" (str.++ "A" (str.++ "Z" (str.++ "8" (str.++ "0" (str.++ "8" (str.++ "8" (str.++ "9" (str.++ "7" (str.++ "1" (str.++ "8" ""))))))))))))

(assert (= regexA (re.++ (str.to_re "")(re.++ ((_ re.loop 3 3) (re.range "A" "Z"))(re.++ ((_ re.loop 8 8) (re.range "0" "9")) (str.to_re ""))))))

;check that the regex contains some x
(assert (str.in_re x regexA))
;check also the concrete witnesses
(assert (str.in_re Witness1 regexA))
(assert (str.in_re Witness2 regexA))
(check-sat)
