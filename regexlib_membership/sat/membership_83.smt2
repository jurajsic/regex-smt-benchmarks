;---
; using 8-bit bit-vectors as characters
; check membership of .Net regex
; regexA = ^[-\w\s"'=/!@#%&,;:`~\.\$\^\{\[\(\|\)\]\}\*\+\?\\]*$
;---
;(set-info :status sat)
;(set-option :print-success true)
(set-logic QF_S)

(declare-const regexA RegLan)
(declare-const x String)

;witness1: "\xB\xB"
(define-fun Witness1 () String (str.++ "\u{0b}" (str.++ "\u{0b}" "")))
;witness2: "\u0085"
(define-fun Witness2 () String (str.++ "\u{85}" ""))

(assert (= regexA (re.++ (str.to_re "")(re.++ (re.* (re.union (re.range "\u{09}" "\u{0d}")(re.union (re.range " " ";")(re.union (re.range "=" "=")(re.union (re.range "?" "~")(re.union (re.range "\u{85}" "\u{85}")(re.union (re.range "\u{a0}" "\u{a0}")(re.union (re.range "\u{aa}" "\u{aa}")(re.union (re.range "\u{b5}" "\u{b5}")(re.union (re.range "\u{ba}" "\u{ba}")(re.union (re.range "\u{c0}" "\u{d6}")(re.union (re.range "\u{d8}" "\u{f6}") (re.range "\u{f8}" "\u{ff}"))))))))))))) (str.to_re "")))))

;check that the regex contains some x
(assert (str.in_re x regexA))
;check also the concrete witnesses
(assert (str.in_re Witness1 regexA))
(assert (str.in_re Witness2 regexA))
(check-sat)
