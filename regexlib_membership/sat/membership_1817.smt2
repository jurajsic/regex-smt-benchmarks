;---
; using 8-bit bit-vectors as characters
; check membership of .Net regex
; regexA = ^\$?\d+(\.(\d{2}))?$
;---
(set-info :status sat)
(set-option :print-success true)
(set-logic QF_BVRE)

(declare-const regexA (RegEx String))
(declare-const x String)

;witness1: "3.72"
(define-fun Witness1 () String (seq.++ "3" (seq.++ "." (seq.++ "7" (seq.++ "2" "")))))
;witness2: "$442"
(define-fun Witness2 () String (seq.++ "$" (seq.++ "4" (seq.++ "4" (seq.++ "2" "")))))

(assert (= regexA (re.++ (str.to_re "")(re.++ (re.opt (re.range "$" "$"))(re.++ (re.+ (re.range "0" "9"))(re.++ (re.opt (re.++ (re.range "." ".") ((_ re.loop 2 2) (re.range "0" "9")))) (str.to_re "")))))))

;check that the regex contains some x
(assert (str.in_re x regexA))
;check also the concrete witnesses
(assert (str.in_re Witness1 regexA))
(assert (str.in_re Witness2 regexA))
(check-sat)
