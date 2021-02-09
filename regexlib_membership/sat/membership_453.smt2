;---
; using 8-bit bit-vectors as characters
; check membership of .Net regex
; regexA = ^(((\\\\([^\\/:\*\?"\|<>\. ]+))|([a-zA-Z]:\\))(([^\\/:\*\?"\|<>\. ]*)([\\]*))*)$
;---
(set-info :status sat)
(set-option :print-success true)
(set-logic QF_BVRE)

(declare-const regexA (RegEx String))
(declare-const x String)

;witness1: "Z:\\u00DE\u00AA\u00F2\x12"
(define-fun Witness1 () String (seq.++ "Z" (seq.++ ":" (seq.++ "\x5c" (seq.++ "\xde" (seq.++ "\xaa" (seq.++ "\xf2" (seq.++ "\x12" ""))))))))
;witness2: "\\\u00C1"
(define-fun Witness2 () String (seq.++ "\x5c" (seq.++ "\x5c" (seq.++ "\xc1" ""))))

(assert (= regexA (re.++ (str.to_re "")(re.++ (re.++ (re.union (re.++ (str.to_re (seq.++ "\x5c" (seq.++ "\x5c" ""))) (re.+ (re.union (re.range "\x00" "\x1f")(re.union (re.range "!" "!")(re.union (re.range "#" ")")(re.union (re.range "+" "-")(re.union (re.range "0" "9")(re.union (re.range ";" ";")(re.union (re.range "=" "=")(re.union (re.range "@" "[")(re.union (re.range "]" "{") (re.range "}" "\xff")))))))))))) (re.++ (re.union (re.range "A" "Z") (re.range "a" "z")) (str.to_re (seq.++ ":" (seq.++ "\x5c" ""))))) (re.* (re.++ (re.* (re.union (re.range "\x00" "\x1f")(re.union (re.range "!" "!")(re.union (re.range "#" ")")(re.union (re.range "+" "-")(re.union (re.range "0" "9")(re.union (re.range ";" ";")(re.union (re.range "=" "=")(re.union (re.range "@" "[")(re.union (re.range "]" "{") (re.range "}" "\xff"))))))))))) (re.* (re.range "\x5c" "\x5c"))))) (str.to_re "")))))

;check that the regex contains some x
(assert (str.in_re x regexA))
;check also the concrete witnesses
(assert (str.in_re Witness1 regexA))
(assert (str.in_re Witness2 regexA))
(check-sat)
