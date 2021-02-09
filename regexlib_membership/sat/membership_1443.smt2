;---
; using 8-bit bit-vectors as characters
; check membership of .Net regex
; regexA = ^0{0,1}[1-9]{1}[0-9]{2}[\s]{0,1}[\-]{0,1}[\s]{0,1}[1-9]{1}[0-9]{6}$
;---
(set-info :status sat)
(set-option :print-success true)
(set-logic QF_BVRE)

(declare-const regexA (RegEx String))
(declare-const x String)

;witness1: "9687883457"
(define-fun Witness1 () String (seq.++ "9" (seq.++ "6" (seq.++ "8" (seq.++ "7" (seq.++ "8" (seq.++ "8" (seq.++ "3" (seq.++ "4" (seq.++ "5" (seq.++ "7" "")))))))))))
;witness2: "4991890811"
(define-fun Witness2 () String (seq.++ "4" (seq.++ "9" (seq.++ "9" (seq.++ "1" (seq.++ "8" (seq.++ "9" (seq.++ "0" (seq.++ "8" (seq.++ "1" (seq.++ "1" "")))))))))))

(assert (= regexA (re.++ (str.to_re "")(re.++ (re.opt (re.range "0" "0"))(re.++ (re.range "1" "9")(re.++ ((_ re.loop 2 2) (re.range "0" "9"))(re.++ (re.opt (re.union (re.range "\x09" "\x0d")(re.union (re.range " " " ")(re.union (re.range "\x85" "\x85") (re.range "\xa0" "\xa0")))))(re.++ (re.opt (re.range "-" "-"))(re.++ (re.opt (re.union (re.range "\x09" "\x0d")(re.union (re.range " " " ")(re.union (re.range "\x85" "\x85") (re.range "\xa0" "\xa0")))))(re.++ (re.range "1" "9")(re.++ ((_ re.loop 6 6) (re.range "0" "9")) (str.to_re ""))))))))))))

;check that the regex contains some x
(assert (str.in_re x regexA))
;check also the concrete witnesses
(assert (str.in_re Witness1 regexA))
(assert (str.in_re Witness2 regexA))
(check-sat)
