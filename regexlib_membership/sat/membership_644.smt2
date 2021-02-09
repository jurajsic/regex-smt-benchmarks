;---
; using 8-bit bit-vectors as characters
; check membership of .Net regex
; regexA = ^([0-1][0-9]|2[0-3]):([0-5][0-9]):([0-5][0-9])([Z]|\.[0-9]{4}|[-|\+]([0-1][0-9]|2[0-3]):([0-5][0-9]))?$
;---
(set-info :status sat)
(set-option :print-success true)
(set-logic QF_BVRE)

(declare-const regexA (RegEx String))
(declare-const x String)

;witness1: "03:53:49Z"
(define-fun Witness1 () String (seq.++ "0" (seq.++ "3" (seq.++ ":" (seq.++ "5" (seq.++ "3" (seq.++ ":" (seq.++ "4" (seq.++ "9" (seq.++ "Z" ""))))))))))
;witness2: "23:39:19"
(define-fun Witness2 () String (seq.++ "2" (seq.++ "3" (seq.++ ":" (seq.++ "3" (seq.++ "9" (seq.++ ":" (seq.++ "1" (seq.++ "9" "")))))))))

(assert (= regexA (re.++ (str.to_re "")(re.++ (re.union (re.++ (re.range "0" "1") (re.range "0" "9")) (re.++ (re.range "2" "2") (re.range "0" "3")))(re.++ (re.range ":" ":")(re.++ (re.++ (re.range "0" "5") (re.range "0" "9"))(re.++ (re.range ":" ":")(re.++ (re.++ (re.range "0" "5") (re.range "0" "9"))(re.++ (re.opt (re.union (re.range "Z" "Z")(re.union (re.++ (re.range "." ".") ((_ re.loop 4 4) (re.range "0" "9"))) (re.++ (re.union (re.range "+" "+")(re.union (re.range "-" "-") (re.range "|" "|")))(re.++ (re.union (re.++ (re.range "0" "1") (re.range "0" "9")) (re.++ (re.range "2" "2") (re.range "0" "3")))(re.++ (re.range ":" ":") (re.++ (re.range "0" "5") (re.range "0" "9")))))))) (str.to_re ""))))))))))

;check that the regex contains some x
(assert (str.in_re x regexA))
;check also the concrete witnesses
(assert (str.in_re Witness1 regexA))
(assert (str.in_re Witness2 regexA))
(check-sat)
