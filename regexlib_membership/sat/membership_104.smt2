;---
; using 8-bit bit-vectors as characters
; check membership of .Net regex
; regexA = :(6553[0-5]|655[0-2][0-9]\d|65[0-4](\d){2}|6[0-4](\d){3}|[1-5](\d){4}|[1-9](\d){0,3})
;---
(set-info :status sat)
(set-option :print-success true)
(set-logic QF_BVRE)

(declare-const regexA (RegEx String))
(declare-const x String)

;witness1: ":655091"
(define-fun Witness1 () String (seq.++ ":" (seq.++ "6" (seq.++ "5" (seq.++ "5" (seq.++ "0" (seq.++ "9" (seq.++ "1" ""))))))))
;witness2: ":655089"
(define-fun Witness2 () String (seq.++ ":" (seq.++ "6" (seq.++ "5" (seq.++ "5" (seq.++ "0" (seq.++ "8" (seq.++ "9" ""))))))))

(assert (= regexA (re.++ (re.range ":" ":") (re.union (re.++ (str.to_re (seq.++ "6" (seq.++ "5" (seq.++ "5" (seq.++ "3" ""))))) (re.range "0" "5"))(re.union (re.++ (str.to_re (seq.++ "6" (seq.++ "5" (seq.++ "5" ""))))(re.++ (re.range "0" "2")(re.++ (re.range "0" "9") (re.range "0" "9"))))(re.union (re.++ (str.to_re (seq.++ "6" (seq.++ "5" "")))(re.++ (re.range "0" "4") ((_ re.loop 2 2) (re.range "0" "9"))))(re.union (re.++ (re.range "6" "6")(re.++ (re.range "0" "4") ((_ re.loop 3 3) (re.range "0" "9"))))(re.union (re.++ (re.range "1" "5") ((_ re.loop 4 4) (re.range "0" "9"))) (re.++ (re.range "1" "9") ((_ re.loop 0 3) (re.range "0" "9")))))))))))

;check that the regex contains some x
(assert (str.in_re x regexA))
;check also the concrete witnesses
(assert (str.in_re Witness1 regexA))
(assert (str.in_re Witness2 regexA))
(check-sat)
