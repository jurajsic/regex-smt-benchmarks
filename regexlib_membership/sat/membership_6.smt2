;---
; using 8-bit bit-vectors as characters
; check membership of .Net regex
; regexA = ^(20|23|27|30|33)-[0-9]{8}-[0-9]$
;---
(set-info :status sat)
(set-option :print-success true)
(set-logic QF_BVRE)

(declare-const regexA (RegEx String))
(declare-const x String)

;witness1: "20-08888765-8"
(define-fun Witness1 () String (seq.++ "2" (seq.++ "0" (seq.++ "-" (seq.++ "0" (seq.++ "8" (seq.++ "8" (seq.++ "8" (seq.++ "8" (seq.++ "7" (seq.++ "6" (seq.++ "5" (seq.++ "-" (seq.++ "8" ""))))))))))))))
;witness2: "20-88898879-4"
(define-fun Witness2 () String (seq.++ "2" (seq.++ "0" (seq.++ "-" (seq.++ "8" (seq.++ "8" (seq.++ "8" (seq.++ "9" (seq.++ "8" (seq.++ "8" (seq.++ "7" (seq.++ "9" (seq.++ "-" (seq.++ "4" ""))))))))))))))

(assert (= regexA (re.++ (str.to_re "")(re.++ (re.union (str.to_re (seq.++ "2" (seq.++ "0" "")))(re.union (str.to_re (seq.++ "2" (seq.++ "3" "")))(re.union (str.to_re (seq.++ "2" (seq.++ "7" "")))(re.union (str.to_re (seq.++ "3" (seq.++ "0" ""))) (str.to_re (seq.++ "3" (seq.++ "3" "")))))))(re.++ (re.range "-" "-")(re.++ ((_ re.loop 8 8) (re.range "0" "9"))(re.++ (re.range "-" "-")(re.++ (re.range "0" "9") (str.to_re "")))))))))

;check that the regex contains some x
(assert (str.in_re x regexA))
;check also the concrete witnesses
(assert (str.in_re Witness1 regexA))
(assert (str.in_re Witness2 regexA))
(check-sat)
