;---
; using 8-bit bit-vectors as characters
; check membership of .Net regex
; regexA = ^\d*[0-9](\.\d?[0-9])?$
;---
(set-info :status sat)
(set-option :print-success true)
(set-logic QF_BVRE)

(declare-const regexA (RegEx String))
(declare-const x String)

;witness1: "0"
(define-fun Witness1 () String (seq.++ "0" ""))
;witness2: "4.65"
(define-fun Witness2 () String (seq.++ "4" (seq.++ "." (seq.++ "6" (seq.++ "5" "")))))

(assert (= regexA (re.++ (str.to_re "")(re.++ (re.* (re.range "0" "9"))(re.++ (re.range "0" "9")(re.++ (re.opt (re.++ (re.range "." ".")(re.++ (re.opt (re.range "0" "9")) (re.range "0" "9")))) (str.to_re "")))))))

;check that the regex contains some x
(assert (str.in_re x regexA))
;check also the concrete witnesses
(assert (str.in_re Witness1 regexA))
(assert (str.in_re Witness2 regexA))
(check-sat)
