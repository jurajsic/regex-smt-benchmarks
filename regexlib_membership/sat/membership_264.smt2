;---
; using 8-bit bit-vectors as characters
; check membership of .Net regex
; regexA = ^([(][1-9]{2}[)] )?[0-9]{4}[-]?[0-9]{4}$
;---
;(set-info :status sat)
;(set-option :print-success true)
(set-logic QF_S)

(declare-const regexA RegLan)
(declare-const x String)

;witness1: "9138-8997"
(define-fun Witness1 () String (str.++ "9" (str.++ "1" (str.++ "3" (str.++ "8" (str.++ "-" (str.++ "8" (str.++ "9" (str.++ "9" (str.++ "7" ""))))))))))
;witness2: "98107868"
(define-fun Witness2 () String (str.++ "9" (str.++ "8" (str.++ "1" (str.++ "0" (str.++ "7" (str.++ "8" (str.++ "6" (str.++ "8" "")))))))))

(assert (= regexA (re.++ (str.to_re "")(re.++ (re.opt (re.++ (re.range "(" "(")(re.++ ((_ re.loop 2 2) (re.range "1" "9")) (str.to_re (str.++ ")" (str.++ " " ""))))))(re.++ ((_ re.loop 4 4) (re.range "0" "9"))(re.++ (re.opt (re.range "-" "-"))(re.++ ((_ re.loop 4 4) (re.range "0" "9")) (str.to_re ""))))))))

;check that the regex contains some x
(assert (str.in_re x regexA))
;check also the concrete witnesses
(assert (str.in_re Witness1 regexA))
(assert (str.in_re Witness2 regexA))
(check-sat)
