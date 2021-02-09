;---
; using 8-bit bit-vectors as characters
; check membership of .Net regex
; regexA = ^07([\d]{3})[(\D\s)]?[\d]{3}[(\D\s)]?[\d]{3}$
;---
(set-info :status sat)
(set-option :print-success true)
(set-logic QF_BVRE)

(declare-const regexA (RegEx String))
(declare-const x String)

;witness1: "07081893748"
(define-fun Witness1 () String (seq.++ "0" (seq.++ "7" (seq.++ "0" (seq.++ "8" (seq.++ "1" (seq.++ "8" (seq.++ "9" (seq.++ "3" (seq.++ "7" (seq.++ "4" (seq.++ "8" ""))))))))))))
;witness2: "07088\u00CC895\xD502"
(define-fun Witness2 () String (seq.++ "0" (seq.++ "7" (seq.++ "0" (seq.++ "8" (seq.++ "8" (seq.++ "\xcc" (seq.++ "8" (seq.++ "9" (seq.++ "5" (seq.++ "\x0d" (seq.++ "5" (seq.++ "0" (seq.++ "2" ""))))))))))))))

(assert (= regexA (re.++ (str.to_re "")(re.++ (str.to_re (seq.++ "0" (seq.++ "7" "")))(re.++ ((_ re.loop 3 3) (re.range "0" "9"))(re.++ (re.opt (re.union (re.range "\x00" "/") (re.range ":" "\xff")))(re.++ ((_ re.loop 3 3) (re.range "0" "9"))(re.++ (re.opt (re.union (re.range "\x00" "/") (re.range ":" "\xff")))(re.++ ((_ re.loop 3 3) (re.range "0" "9")) (str.to_re ""))))))))))

;check that the regex contains some x
(assert (str.in_re x regexA))
;check also the concrete witnesses
(assert (str.in_re Witness1 regexA))
(assert (str.in_re Witness2 regexA))
(check-sat)
