;---
; using 8-bit bit-vectors as characters
; check membership of .Net regex
; regexA = ^[a-zA-Z_]{1}[a-zA-Z0-9_]+$
;---
(set-info :status sat)
(set-option :print-success true)
(set-logic QF_BVRE)

(declare-const regexA (RegEx String))
(declare-const x String)

;witness1: "__"
(define-fun Witness1 () String (seq.++ "_" (seq.++ "_" "")))
;witness2: "gA"
(define-fun Witness2 () String (seq.++ "g" (seq.++ "A" "")))

(assert (= regexA (re.++ (str.to_re "")(re.++ (re.union (re.range "A" "Z")(re.union (re.range "_" "_") (re.range "a" "z")))(re.++ (re.+ (re.union (re.range "0" "9")(re.union (re.range "A" "Z")(re.union (re.range "_" "_") (re.range "a" "z"))))) (str.to_re ""))))))

;check that the regex contains some x
(assert (str.in_re x regexA))
;check also the concrete witnesses
(assert (str.in_re Witness1 regexA))
(assert (str.in_re Witness2 regexA))
(check-sat)
