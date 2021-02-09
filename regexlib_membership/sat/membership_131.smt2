;---
; using 8-bit bit-vectors as characters
; check membership of .Net regex
; regexA = ^[a-zA-Z]{4}[a-zA-Z]{2}[a-zA-Z0-9]{2}[XXX0-9]{0,3}
;---
(set-info :status sat)
(set-option :print-success true)
(set-logic QF_BVRE)

(declare-const regexA (RegEx String))
(declare-const x String)

;witness1: "eYtZAA0I"
(define-fun Witness1 () String (seq.++ "e" (seq.++ "Y" (seq.++ "t" (seq.++ "Z" (seq.++ "A" (seq.++ "A" (seq.++ "0" (seq.++ "I" "")))))))))
;witness2: "oILEkB2d"
(define-fun Witness2 () String (seq.++ "o" (seq.++ "I" (seq.++ "L" (seq.++ "E" (seq.++ "k" (seq.++ "B" (seq.++ "2" (seq.++ "d" "")))))))))

(assert (= regexA (re.++ (str.to_re "")(re.++ ((_ re.loop 4 4) (re.union (re.range "A" "Z") (re.range "a" "z")))(re.++ ((_ re.loop 2 2) (re.union (re.range "A" "Z") (re.range "a" "z")))(re.++ ((_ re.loop 2 2) (re.union (re.range "0" "9")(re.union (re.range "A" "Z") (re.range "a" "z")))) ((_ re.loop 0 3) (re.union (re.range "0" "9") (re.range "X" "X")))))))))

;check that the regex contains some x
(assert (str.in_re x regexA))
;check also the concrete witnesses
(assert (str.in_re Witness1 regexA))
(assert (str.in_re Witness2 regexA))
(check-sat)
