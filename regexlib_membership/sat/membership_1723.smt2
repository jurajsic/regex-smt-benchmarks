;---
; using 8-bit bit-vectors as characters
; check membership of .Net regex
; regexA = (([0-1][0-9])|([2][0-3])):([0-5][0-9]):([0-5][0-9])
;---
(set-info :status sat)
(set-option :print-success true)
(set-logic QF_BVRE)

(declare-const regexA (RegEx String))
(declare-const x String)

;witness1: "21:23:28\u0091"
(define-fun Witness1 () String (seq.++ "2" (seq.++ "1" (seq.++ ":" (seq.++ "2" (seq.++ "3" (seq.++ ":" (seq.++ "2" (seq.++ "8" (seq.++ "\x91" ""))))))))))
;witness2: "22:16:48\u008C"
(define-fun Witness2 () String (seq.++ "2" (seq.++ "2" (seq.++ ":" (seq.++ "1" (seq.++ "6" (seq.++ ":" (seq.++ "4" (seq.++ "8" (seq.++ "\x8c" ""))))))))))

(assert (= regexA (re.++ (re.union (re.++ (re.range "0" "1") (re.range "0" "9")) (re.++ (re.range "2" "2") (re.range "0" "3")))(re.++ (re.range ":" ":")(re.++ (re.++ (re.range "0" "5") (re.range "0" "9"))(re.++ (re.range ":" ":") (re.++ (re.range "0" "5") (re.range "0" "9"))))))))

;check that the regex contains some x
(assert (str.in_re x regexA))
;check also the concrete witnesses
(assert (str.in_re Witness1 regexA))
(assert (str.in_re Witness2 regexA))
(check-sat)
