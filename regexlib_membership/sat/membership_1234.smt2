;---
; using 8-bit bit-vectors as characters
; check membership of .Net regex
; regexA = (^[a-zA-Z][a-zA-Z0-9_]*)|(^[_][a-zA-Z0-9_]+)
;---
(set-info :status sat)
(set-option :print-success true)
(set-logic QF_BVRE)

(declare-const regexA (RegEx String))
(declare-const x String)

;witness1: "T\u0086"
(define-fun Witness1 () String (seq.++ "T" (seq.++ "\x86" "")))
;witness2: "g01Q"
(define-fun Witness2 () String (seq.++ "g" (seq.++ "0" (seq.++ "1" (seq.++ "Q" "")))))

(assert (= regexA (re.union (re.++ (str.to_re "")(re.++ (re.union (re.range "A" "Z") (re.range "a" "z")) (re.* (re.union (re.range "0" "9")(re.union (re.range "A" "Z")(re.union (re.range "_" "_") (re.range "a" "z"))))))) (re.++ (str.to_re "")(re.++ (re.range "_" "_") (re.+ (re.union (re.range "0" "9")(re.union (re.range "A" "Z")(re.union (re.range "_" "_") (re.range "a" "z"))))))))))

;check that the regex contains some x
(assert (str.in_re x regexA))
;check also the concrete witnesses
(assert (str.in_re Witness1 regexA))
(assert (str.in_re Witness2 regexA))
(check-sat)
