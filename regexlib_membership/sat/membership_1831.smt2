;---
; using 8-bit bit-vectors as characters
; check membership of .Net regex
; regexA = ^\d{3}\s?\d{3}$
;---
(set-info :status sat)
(set-option :print-success true)
(set-logic QF_BVRE)

(declare-const regexA (RegEx String))
(declare-const x String)

;witness1: "405375"
(define-fun Witness1 () String (seq.++ "4" (seq.++ "0" (seq.++ "5" (seq.++ "3" (seq.++ "7" (seq.++ "5" "")))))))
;witness2: "399\xA499"
(define-fun Witness2 () String (seq.++ "3" (seq.++ "9" (seq.++ "9" (seq.++ "\x0a" (seq.++ "4" (seq.++ "9" (seq.++ "9" ""))))))))

(assert (= regexA (re.++ (str.to_re "")(re.++ ((_ re.loop 3 3) (re.range "0" "9"))(re.++ (re.opt (re.union (re.range "\x09" "\x0d")(re.union (re.range " " " ")(re.union (re.range "\x85" "\x85") (re.range "\xa0" "\xa0")))))(re.++ ((_ re.loop 3 3) (re.range "0" "9")) (str.to_re "")))))))

;check that the regex contains some x
(assert (str.in_re x regexA))
;check also the concrete witnesses
(assert (str.in_re Witness1 regexA))
(assert (str.in_re Witness2 regexA))
(check-sat)
