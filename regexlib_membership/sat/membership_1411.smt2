;---
; using 8-bit bit-vectors as characters
; check membership of .Net regex
; regexA = ^[1-9]{1}[0-9]{3}\s?[A-Z]{2}$
;---
;(set-info :status sat)
;(set-option :print-success true)
(set-logic QF_S)

(declare-const regexA RegLan)
(declare-const x String)

;witness1: "9329OX"
(define-fun Witness1 () String (str.++ "9" (str.++ "3" (str.++ "2" (str.++ "9" (str.++ "O" (str.++ "X" "")))))))
;witness2: "3828\u00A0KD"
(define-fun Witness2 () String (str.++ "3" (str.++ "8" (str.++ "2" (str.++ "8" (str.++ "\u{a0}" (str.++ "K" (str.++ "D" ""))))))))

(assert (= regexA (re.++ (str.to_re "")(re.++ (re.range "1" "9")(re.++ ((_ re.loop 3 3) (re.range "0" "9"))(re.++ (re.opt (re.union (re.range "\u{09}" "\u{0d}")(re.union (re.range " " " ")(re.union (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}")))))(re.++ ((_ re.loop 2 2) (re.range "A" "Z")) (str.to_re ""))))))))

;check that the regex contains some x
(assert (str.in_re x regexA))
;check also the concrete witnesses
(assert (str.in_re Witness1 regexA))
(assert (str.in_re Witness2 regexA))
(check-sat)
