;---
; using 8-bit bit-vectors as characters
; check membership of .Net regex
; regexA = (\S*)+(\u007C)+(\S*)
;---
(set-info :status sat)
(set-option :print-success true)
(set-logic QF_BVRE)

(declare-const regexA (RegEx String))
(declare-const x String)

;witness1: "\u00D3\x4}\u0091|||||||"
(define-fun Witness1 () String (seq.++ "\xd3" (seq.++ "\x04" (seq.++ "}" (seq.++ "\x91" (seq.++ "|" (seq.++ "|" (seq.++ "|" (seq.++ "|" (seq.++ "|" (seq.++ "|" (seq.++ "|" ""))))))))))))
;witness2: "%\x1B\u00D3|\u0098c\x4"
(define-fun Witness2 () String (seq.++ "%" (seq.++ "\x1b" (seq.++ "\xd3" (seq.++ "|" (seq.++ "\x98" (seq.++ "c" (seq.++ "\x04" ""))))))))

(assert (= regexA (re.++ (re.+ (re.* (re.union (re.range "\x00" "\x08")(re.union (re.range "\x0e" "\x1f")(re.union (re.range "!" "\x84")(re.union (re.range "\x86" "\x9f") (re.range "\xa1" "\xff")))))))(re.++ (re.+ (re.range "|" "|")) (re.* (re.union (re.range "\x00" "\x08")(re.union (re.range "\x0e" "\x1f")(re.union (re.range "!" "\x84")(re.union (re.range "\x86" "\x9f") (re.range "\xa1" "\xff"))))))))))

;check that the regex contains some x
(assert (str.in_re x regexA))
;check also the concrete witnesses
(assert (str.in_re Witness1 regexA))
(assert (str.in_re Witness2 regexA))
(check-sat)
