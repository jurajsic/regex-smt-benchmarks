;---
; using 8-bit bit-vectors as characters
; check membership of .Net regex
; regexA = ^[0-9]+[NnSs] [0-9]+[WwEe]$
;---
(set-info :status sat)
(set-option :print-success true)
(set-logic QF_BVRE)

(declare-const regexA (RegEx String))
(declare-const x String)

;witness1: "8s 8W"
(define-fun Witness1 () String (seq.++ "8" (seq.++ "s" (seq.++ " " (seq.++ "8" (seq.++ "W" ""))))))
;witness2: "916n 8w"
(define-fun Witness2 () String (seq.++ "9" (seq.++ "1" (seq.++ "6" (seq.++ "n" (seq.++ " " (seq.++ "8" (seq.++ "w" ""))))))))

(assert (= regexA (re.++ (str.to_re "")(re.++ (re.+ (re.range "0" "9"))(re.++ (re.union (re.range "N" "N")(re.union (re.range "S" "S")(re.union (re.range "n" "n") (re.range "s" "s"))))(re.++ (re.range " " " ")(re.++ (re.+ (re.range "0" "9"))(re.++ (re.union (re.range "E" "E")(re.union (re.range "W" "W")(re.union (re.range "e" "e") (re.range "w" "w")))) (str.to_re "")))))))))

;check that the regex contains some x
(assert (str.in_re x regexA))
;check also the concrete witnesses
(assert (str.in_re Witness1 regexA))
(assert (str.in_re Witness2 regexA))
(check-sat)
