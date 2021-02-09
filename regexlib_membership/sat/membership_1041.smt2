;---
; using 8-bit bit-vectors as characters
; check membership of .Net regex
; regexA = (^(\d+)$)|(^(\d{1,3}[ ,\.](\d{3}[ ,\.])*\d{3}|\d{1,3})$)
;---
(set-info :status sat)
(set-option :print-success true)
(set-logic QF_BVRE)

(declare-const regexA (RegEx String))
(declare-const x String)

;witness1: "4"
(define-fun Witness1 () String (seq.++ "4" ""))
;witness2: "4"
(define-fun Witness2 () String (seq.++ "4" ""))

(assert (= regexA (re.union (re.++ (str.to_re "")(re.++ (re.+ (re.range "0" "9")) (str.to_re ""))) (re.++ (str.to_re "")(re.++ (re.union (re.++ ((_ re.loop 1 3) (re.range "0" "9"))(re.++ (re.union (re.range " " " ")(re.union (re.range "," ",") (re.range "." ".")))(re.++ (re.* (re.++ ((_ re.loop 3 3) (re.range "0" "9")) (re.union (re.range " " " ")(re.union (re.range "," ",") (re.range "." "."))))) ((_ re.loop 3 3) (re.range "0" "9"))))) ((_ re.loop 1 3) (re.range "0" "9"))) (str.to_re ""))))))

;check that the regex contains some x
(assert (str.in_re x regexA))
;check also the concrete witnesses
(assert (str.in_re Witness1 regexA))
(assert (str.in_re Witness2 regexA))
(check-sat)
