;---
; using 8-bit bit-vectors as characters
; check membership of .Net regex
; regexA = ^(s-|S-){0,1}[0-9]{3}\s?[0-9]{2}$
;---
;(set-info :status sat)
;(set-option :print-success true)
(set-logic QF_S)

(declare-const regexA RegLan)
(declare-const x String)

;witness1: "097\u008501"
(define-fun Witness1 () String (str.++ "0" (str.++ "9" (str.++ "7" (str.++ "\u{85}" (str.++ "0" (str.++ "1" "")))))))
;witness2: "s-01789"
(define-fun Witness2 () String (str.++ "s" (str.++ "-" (str.++ "0" (str.++ "1" (str.++ "7" (str.++ "8" (str.++ "9" ""))))))))

(assert (= regexA (re.++ (str.to_re "")(re.++ (re.opt (re.union (str.to_re (str.++ "s" (str.++ "-" ""))) (str.to_re (str.++ "S" (str.++ "-" "")))))(re.++ ((_ re.loop 3 3) (re.range "0" "9"))(re.++ (re.opt (re.union (re.range "\u{09}" "\u{0d}")(re.union (re.range " " " ")(re.union (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")))))(re.++ ((_ re.loop 2 2) (re.range "0" "9")) (str.to_re ""))))))))

;check that the regex contains some x
(assert (str.in_re x regexA))
;check also the concrete witnesses
(assert (str.in_re Witness1 regexA))
(assert (str.in_re Witness2 regexA))
(check-sat)
