;---
; using 8-bit bit-vectors as characters
; check membership of .Net regex
; regexA = (^[0-9]{1,8}|(^[0-9]{1,8}\.{0,1}[0-9]{1,2}))$
;---
(set-info :status sat)
(set-option :print-success true)
(set-logic QF_BVRE)

(declare-const regexA (RegEx String))
(declare-const x String)

;witness1: "690"
(define-fun Witness1 () String (seq.++ "6" (seq.++ "9" (seq.++ "0" ""))))
;witness2: "98389"
(define-fun Witness2 () String (seq.++ "9" (seq.++ "8" (seq.++ "3" (seq.++ "8" (seq.++ "9" ""))))))

(assert (= regexA (re.++ (re.union (re.++ (str.to_re "") ((_ re.loop 1 8) (re.range "0" "9"))) (re.++ (str.to_re "")(re.++ ((_ re.loop 1 8) (re.range "0" "9"))(re.++ (re.opt (re.range "." ".")) ((_ re.loop 1 2) (re.range "0" "9")))))) (str.to_re ""))))

;check that the regex contains some x
(assert (str.in_re x regexA))
;check also the concrete witnesses
(assert (str.in_re Witness1 regexA))
(assert (str.in_re Witness2 regexA))
(check-sat)
