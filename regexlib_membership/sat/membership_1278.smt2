;---
; using 8-bit bit-vectors as characters
; check membership of .Net regex
; regexA = ^([a-zA-z\s]{2,})$
;---
(set-info :status sat)
(set-option :print-success true)
(set-logic QF_BVRE)

(declare-const regexA (RegEx String))
(declare-const x String)

;witness1: "\u0085R"
(define-fun Witness1 () String (seq.++ "\x85" (seq.++ "R" "")))
;witness2: "\u00A0\u0085\u0085 \u00A0"
(define-fun Witness2 () String (seq.++ "\xa0" (seq.++ "\x85" (seq.++ "\x85" (seq.++ " " (seq.++ "\xa0" ""))))))

(assert (= regexA (re.++ (str.to_re "")(re.++ (re.++ ((_ re.loop 2 2) (re.union (re.range "\x09" "\x0d")(re.union (re.range " " " ")(re.union (re.range "A" "z")(re.union (re.range "\x85" "\x85") (re.range "\xa0" "\xa0")))))) (re.* (re.union (re.range "\x09" "\x0d")(re.union (re.range " " " ")(re.union (re.range "A" "z")(re.union (re.range "\x85" "\x85") (re.range "\xa0" "\xa0"))))))) (str.to_re "")))))

;check that the regex contains some x
(assert (str.in_re x regexA))
;check also the concrete witnesses
(assert (str.in_re Witness1 regexA))
(assert (str.in_re Witness2 regexA))
(check-sat)
