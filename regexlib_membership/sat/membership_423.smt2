;---
; using 8-bit bit-vectors as characters
; check membership of .Net regex
; regexA = ^[+-]? *100(\.0{0,2})? *%?$|^[+-]? *\d{1,2}(\.\d{1,2})? *%?$
;---
;(set-info :status sat)
;(set-option :print-success true)
(set-logic QF_S)

(declare-const regexA RegLan)
(declare-const x String)

;witness1: "  100."
(define-fun Witness1 () String (str.++ " " (str.++ " " (str.++ "1" (str.++ "0" (str.++ "0" (str.++ "." "")))))))
;witness2: "100"
(define-fun Witness2 () String (str.++ "1" (str.++ "0" (str.++ "0" ""))))

(assert (= regexA (re.union (re.++ (str.to_re "")(re.++ (re.opt (re.union (re.range "+" "+") (re.range "-" "-")))(re.++ (re.* (re.range " " " "))(re.++ (str.to_re (str.++ "1" (str.++ "0" (str.++ "0" ""))))(re.++ (re.opt (re.++ (re.range "." ".") ((_ re.loop 0 2) (re.range "0" "0"))))(re.++ (re.* (re.range " " " "))(re.++ (re.opt (re.range "%" "%")) (str.to_re "")))))))) (re.++ (str.to_re "")(re.++ (re.opt (re.union (re.range "+" "+") (re.range "-" "-")))(re.++ (re.* (re.range " " " "))(re.++ ((_ re.loop 1 2) (re.range "0" "9"))(re.++ (re.opt (re.++ (re.range "." ".") ((_ re.loop 1 2) (re.range "0" "9"))))(re.++ (re.* (re.range " " " "))(re.++ (re.opt (re.range "%" "%")) (str.to_re "")))))))))))

;check that the regex contains some x
(assert (str.in_re x regexA))
;check also the concrete witnesses
(assert (str.in_re Witness1 regexA))
(assert (str.in_re Witness2 regexA))
(check-sat)
