;---
; using 8-bit bit-vectors as characters
; check membership of .Net regex
; regexA = (^0.*[1-9]*)|(^860+)|(^8613)|(\D)|([0-9])
;---
(set-info :status sat)
(set-option :print-success true)
(set-logic QF_BVRE)

(declare-const regexA (RegEx String))
(declare-const x String)

;witness1: "0"
(define-fun Witness1 () String (seq.++ "0" ""))
;witness2: "}2"
(define-fun Witness2 () String (seq.++ "}" (seq.++ "2" "")))

(assert (= regexA (re.union (re.++ (str.to_re "")(re.++ (re.range "0" "0")(re.++ (re.* (re.union (re.range "\x00" "\x09") (re.range "\x0b" "\xff"))) (re.* (re.range "1" "9")))))(re.union (re.++ (str.to_re "")(re.++ (str.to_re (seq.++ "8" (seq.++ "6" ""))) (re.+ (re.range "0" "0"))))(re.union (re.++ (str.to_re "") (str.to_re (seq.++ "8" (seq.++ "6" (seq.++ "1" (seq.++ "3" ""))))))(re.union (re.union (re.range "\x00" "/") (re.range ":" "\xff")) (re.range "0" "9")))))))

;check that the regex contains some x
(assert (str.in_re x regexA))
;check also the concrete witnesses
(assert (str.in_re Witness1 regexA))
(assert (str.in_re Witness2 regexA))
(check-sat)
