;---
; using 8-bit bit-vectors as characters
; check membership of .Net regex
; regexA = ^[A-Za-zÀ-ÖØ-öø-ÿ '\-\.]{1,22}$
;---
(set-info :status sat)
(set-option :print-success true)
(set-logic QF_BVRE)

(declare-const regexA (RegEx String))
(declare-const x String)

;witness1: "\u00F6\u00C9 \u00D6O"
(define-fun Witness1 () String (seq.++ "\xf6" (seq.++ "\xc9" (seq.++ " " (seq.++ "\xd6" (seq.++ "O" ""))))))
;witness2: "\u00D6k"
(define-fun Witness2 () String (seq.++ "\xd6" (seq.++ "k" "")))

(assert (= regexA (re.++ (str.to_re "")(re.++ ((_ re.loop 1 22) (re.union (re.range " " " ")(re.union (re.range "'" "'")(re.union (re.range "-" ".")(re.union (re.range "A" "Z")(re.union (re.range "a" "z")(re.union (re.range "\xc0" "\xd6")(re.union (re.range "\xd8" "\xf6") (re.range "\xf8" "\xff"))))))))) (str.to_re "")))))

;check that the regex contains some x
(assert (str.in_re x regexA))
;check also the concrete witnesses
(assert (str.in_re Witness1 regexA))
(assert (str.in_re Witness2 regexA))
(check-sat)
