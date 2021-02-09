;---
; using 8-bit bit-vectors as characters
; check membership of .Net regex
; regexA = ^[A-CEGHJ-PR-TW-Z]{1}[A-CEGHJ-NPR-TW-Z]{1}[0-9]{6}[A-DFM]{0,1}$
;---
(set-info :status sat)
(set-option :print-success true)
(set-logic QF_BVRE)

(declare-const regexA (RegEx String))
(declare-const x String)

;witness1: "WG827939"
(define-fun Witness1 () String (seq.++ "W" (seq.++ "G" (seq.++ "8" (seq.++ "2" (seq.++ "7" (seq.++ "9" (seq.++ "3" (seq.++ "9" "")))))))))
;witness2: "HY999828"
(define-fun Witness2 () String (seq.++ "H" (seq.++ "Y" (seq.++ "9" (seq.++ "9" (seq.++ "9" (seq.++ "8" (seq.++ "2" (seq.++ "8" "")))))))))

(assert (= regexA (re.++ (str.to_re "")(re.++ (re.union (re.range "A" "C")(re.union (re.range "E" "E")(re.union (re.range "G" "H")(re.union (re.range "J" "P")(re.union (re.range "R" "T") (re.range "W" "Z"))))))(re.++ (re.union (re.range "A" "C")(re.union (re.range "E" "E")(re.union (re.range "G" "H")(re.union (re.range "J" "N")(re.union (re.range "P" "P")(re.union (re.range "R" "T") (re.range "W" "Z")))))))(re.++ ((_ re.loop 6 6) (re.range "0" "9"))(re.++ (re.opt (re.union (re.range "A" "D")(re.union (re.range "F" "F") (re.range "M" "M")))) (str.to_re ""))))))))

;check that the regex contains some x
(assert (str.in_re x regexA))
;check also the concrete witnesses
(assert (str.in_re Witness1 regexA))
(assert (str.in_re Witness2 regexA))
(check-sat)
