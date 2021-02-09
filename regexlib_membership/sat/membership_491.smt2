;---
; using 8-bit bit-vectors as characters
; check membership of .Net regex
; regexA = ^((([1]\d{2})|(22[0-3])|([1-9]\d)|(2[01]\d)|[1-9]).(([1]\d{2})|(2[0-4]\d)|(25[0-5])|([1-9]\d)|\d).(([1]\d{2})|(2[0-4]\d)|(25[0-5])|([1-9]\d)|\d).(([1]\d{2})|(2[0-4]\d)|(25[0-5])|([1-9]\d)|\d))$
;---
(set-info :status sat)
(set-option :print-success true)
(set-logic QF_BVRE)

(declare-const regexA (RegEx String))
(declare-const x String)

;witness1: "193E98c3[1"
(define-fun Witness1 () String (seq.++ "1" (seq.++ "9" (seq.++ "3" (seq.++ "E" (seq.++ "9" (seq.++ "8" (seq.++ "c" (seq.++ "3" (seq.++ "[" (seq.++ "1" "")))))))))))
;witness2: "209V231\u00D4183\u00BE85"
(define-fun Witness2 () String (seq.++ "2" (seq.++ "0" (seq.++ "9" (seq.++ "V" (seq.++ "2" (seq.++ "3" (seq.++ "1" (seq.++ "\xd4" (seq.++ "1" (seq.++ "8" (seq.++ "3" (seq.++ "\xbe" (seq.++ "8" (seq.++ "5" "")))))))))))))))

(assert (= regexA (re.++ (str.to_re "")(re.++ (re.++ (re.union (re.++ (re.range "1" "1") ((_ re.loop 2 2) (re.range "0" "9")))(re.union (re.++ (str.to_re (seq.++ "2" (seq.++ "2" ""))) (re.range "0" "3"))(re.union (re.++ (re.range "1" "9") (re.range "0" "9"))(re.union (re.++ (re.range "2" "2")(re.++ (re.range "0" "1") (re.range "0" "9"))) (re.range "1" "9")))))(re.++ (re.union (re.range "\x00" "\x09") (re.range "\x0b" "\xff"))(re.++ (re.union (re.++ (re.range "1" "1") ((_ re.loop 2 2) (re.range "0" "9")))(re.union (re.++ (re.range "2" "2")(re.++ (re.range "0" "4") (re.range "0" "9")))(re.union (re.++ (str.to_re (seq.++ "2" (seq.++ "5" ""))) (re.range "0" "5"))(re.union (re.++ (re.range "1" "9") (re.range "0" "9")) (re.range "0" "9")))))(re.++ (re.union (re.range "\x00" "\x09") (re.range "\x0b" "\xff"))(re.++ (re.union (re.++ (re.range "1" "1") ((_ re.loop 2 2) (re.range "0" "9")))(re.union (re.++ (re.range "2" "2")(re.++ (re.range "0" "4") (re.range "0" "9")))(re.union (re.++ (str.to_re (seq.++ "2" (seq.++ "5" ""))) (re.range "0" "5"))(re.union (re.++ (re.range "1" "9") (re.range "0" "9")) (re.range "0" "9")))))(re.++ (re.union (re.range "\x00" "\x09") (re.range "\x0b" "\xff")) (re.union (re.++ (re.range "1" "1") ((_ re.loop 2 2) (re.range "0" "9")))(re.union (re.++ (re.range "2" "2")(re.++ (re.range "0" "4") (re.range "0" "9")))(re.union (re.++ (str.to_re (seq.++ "2" (seq.++ "5" ""))) (re.range "0" "5"))(re.union (re.++ (re.range "1" "9") (re.range "0" "9")) (re.range "0" "9"))))))))))) (str.to_re "")))))

;check that the regex contains some x
(assert (str.in_re x regexA))
;check also the concrete witnesses
(assert (str.in_re Witness1 regexA))
(assert (str.in_re Witness2 regexA))
(check-sat)
