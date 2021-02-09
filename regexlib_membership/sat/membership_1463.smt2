;---
; using 8-bit bit-vectors as characters
; check membership of .Net regex
; regexA = ^((\d{1,2})?([.][\d]{1,2})?){1}[%]{1}$
;---
(set-info :status sat)
(set-option :print-success true)
(set-logic QF_BVRE)

(declare-const regexA (RegEx String))
(declare-const x String)

;witness1: ".8%"
(define-fun Witness1 () String (seq.++ "." (seq.++ "8" (seq.++ "%" ""))))
;witness2: "83.98%"
(define-fun Witness2 () String (seq.++ "8" (seq.++ "3" (seq.++ "." (seq.++ "9" (seq.++ "8" (seq.++ "%" "")))))))

(assert (= regexA (re.++ (str.to_re "")(re.++ (re.++ (re.opt ((_ re.loop 1 2) (re.range "0" "9"))) (re.opt (re.++ (re.range "." ".") ((_ re.loop 1 2) (re.range "0" "9")))))(re.++ (re.range "%" "%") (str.to_re ""))))))

;check that the regex contains some x
(assert (str.in_re x regexA))
;check also the concrete witnesses
(assert (str.in_re Witness1 regexA))
(assert (str.in_re Witness2 regexA))
(check-sat)
