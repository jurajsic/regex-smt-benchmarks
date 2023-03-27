;---
; using 8-bit bit-vectors as characters
; check membership of .Net regex
; regexA = ((?<strElement>(^[A-Z0-9-;=]*:))(?<strValue>(.*)))
;---
;(set-info :status sat)
;(set-option :print-success true)
(set-logic QF_S)

(declare-const regexA RegLan)
(declare-const x String)

;witness1: "8E:"
(define-fun Witness1 () String (str.++ "8" (str.++ "E" (str.++ ":" ""))))
;witness2: ":\u00BCc"
(define-fun Witness2 () String (str.++ ":" (str.++ "\u{bc}" (str.++ "c" ""))))

(assert (= regexA (re.++ (re.++ (str.to_re "")(re.++ (re.* (re.union (re.range "-" "-")(re.union (re.range "0" "9")(re.union (re.range ";" ";")(re.union (re.range "=" "=") (re.range "A" "Z")))))) (re.range ":" ":"))) (re.* (re.union (re.range "\u{00}" "\u{09}") (re.range "\u{0b}" "\u{ff}"))))))

;check that the regex contains some x
(assert (str.in_re x regexA))
;check also the concrete witnesses
(assert (str.in_re Witness1 regexA))
(assert (str.in_re Witness2 regexA))
(check-sat)
