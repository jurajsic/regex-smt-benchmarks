;---
; using 8-bit bit-vectors as characters
; check membership of .Net regex
; regexA = ^[1-9]+[0-9]*$
;---
(set-info :status sat)
(set-option :print-success true)
(set-logic QF_BVRE)

(declare-const regexA (RegEx String))
(declare-const x String)

;witness1: "89"
(define-fun Witness1 () String (seq.++ "8" (seq.++ "9" "")))
;witness2: "19349833"
(define-fun Witness2 () String (seq.++ "1" (seq.++ "9" (seq.++ "3" (seq.++ "4" (seq.++ "9" (seq.++ "8" (seq.++ "3" (seq.++ "3" "")))))))))

(assert (= regexA (re.++ (str.to_re "")(re.++ (re.+ (re.range "1" "9"))(re.++ (re.* (re.range "0" "9")) (str.to_re ""))))))

;check that the regex contains some x
(assert (str.in_re x regexA))
;check also the concrete witnesses
(assert (str.in_re Witness1 regexA))
(assert (str.in_re Witness2 regexA))
(check-sat)
