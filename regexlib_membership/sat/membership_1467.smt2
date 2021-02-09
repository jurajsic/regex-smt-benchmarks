;---
; using 8-bit bit-vectors as characters
; check membership of .Net regex
; regexA =        |10485[0-6]\d
;---
(set-info :status sat)
(set-option :print-success true)
(set-logic QF_BVRE)

(declare-const regexA (RegEx String))
(declare-const x String)

;witness1: "\u00FC\u00F41048549"
(define-fun Witness1 () String (seq.++ "\xfc" (seq.++ "\xf4" (seq.++ "1" (seq.++ "0" (seq.++ "4" (seq.++ "8" (seq.++ "5" (seq.++ "4" (seq.++ "9" ""))))))))))
;witness2: "1048560"
(define-fun Witness2 () String (seq.++ "1" (seq.++ "0" (seq.++ "4" (seq.++ "8" (seq.++ "5" (seq.++ "6" (seq.++ "0" ""))))))))

(assert (= regexA (re.union (str.to_re (seq.++ " " (seq.++ " " (seq.++ " " (seq.++ " " (seq.++ " " (seq.++ " " (seq.++ " " "")))))))) (re.++ (str.to_re (seq.++ "1" (seq.++ "0" (seq.++ "4" (seq.++ "8" (seq.++ "5" ""))))))(re.++ (re.range "0" "6") (re.range "0" "9"))))))

;check that the regex contains some x
(assert (str.in_re x regexA))
;check also the concrete witnesses
(assert (str.in_re Witness1 regexA))
(assert (str.in_re Witness2 regexA))
(check-sat)
