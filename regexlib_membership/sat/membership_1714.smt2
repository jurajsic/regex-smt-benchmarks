;---
; using 8-bit bit-vectors as characters
; check membership of .Net regex
; regexA = ^[0-9A-Za-z_ ]+(.[jJ][pP][gG]|.[gG][iI][fF])$
;---
(set-info :status sat)
(set-option :print-success true)
(set-logic QF_BVRE)

(declare-const regexA (RegEx String))
(declare-const x String)

;witness1: "  e\u00BBjPg"
(define-fun Witness1 () String (seq.++ " " (seq.++ " " (seq.++ "e" (seq.++ "\xbb" (seq.++ "j" (seq.++ "P" (seq.++ "g" ""))))))))
;witness2: "A\x7giF"
(define-fun Witness2 () String (seq.++ "A" (seq.++ "\x07" (seq.++ "g" (seq.++ "i" (seq.++ "F" ""))))))

(assert (= regexA (re.++ (str.to_re "")(re.++ (re.+ (re.union (re.range " " " ")(re.union (re.range "0" "9")(re.union (re.range "A" "Z")(re.union (re.range "_" "_") (re.range "a" "z"))))))(re.++ (re.union (re.++ (re.union (re.range "\x00" "\x09") (re.range "\x0b" "\xff"))(re.++ (re.union (re.range "J" "J") (re.range "j" "j"))(re.++ (re.union (re.range "P" "P") (re.range "p" "p")) (re.union (re.range "G" "G") (re.range "g" "g"))))) (re.++ (re.union (re.range "\x00" "\x09") (re.range "\x0b" "\xff"))(re.++ (re.union (re.range "G" "G") (re.range "g" "g"))(re.++ (re.union (re.range "I" "I") (re.range "i" "i")) (re.union (re.range "F" "F") (re.range "f" "f")))))) (str.to_re ""))))))

;check that the regex contains some x
(assert (str.in_re x regexA))
;check also the concrete witnesses
(assert (str.in_re Witness1 regexA))
(assert (str.in_re Witness2 regexA))
(check-sat)
