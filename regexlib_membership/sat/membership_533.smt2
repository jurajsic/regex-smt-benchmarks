;---
; using 8-bit bit-vectors as characters
; check membership of .Net regex
; regexA = /*d(9,15)
;---
(set-info :status sat)
(set-option :print-success true)
(set-logic QF_BVRE)

(declare-const regexA (RegEx String))
(declare-const x String)

;witness1: "d9,15#"
(define-fun Witness1 () String (seq.++ "d" (seq.++ "9" (seq.++ "," (seq.++ "1" (seq.++ "5" (seq.++ "#" "")))))))
;witness2: "fd9,15w"
(define-fun Witness2 () String (seq.++ "f" (seq.++ "d" (seq.++ "9" (seq.++ "," (seq.++ "1" (seq.++ "5" (seq.++ "w" ""))))))))

(assert (= regexA (re.++ (re.* (re.range "/" "/"))(re.++ (re.range "d" "d") (str.to_re (seq.++ "9" (seq.++ "," (seq.++ "1" (seq.++ "5" "")))))))))

;check that the regex contains some x
(assert (str.in_re x regexA))
;check also the concrete witnesses
(assert (str.in_re Witness1 regexA))
(assert (str.in_re Witness2 regexA))
(check-sat)
