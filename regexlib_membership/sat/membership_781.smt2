;---
; using 8-bit bit-vectors as characters
; check membership of .Net regex
; regexA = (((\d{0,2})\(\d{3}\))|(\d{3}-))\d{3}-\d{4}\s{0,}((([Ee][xX][Tt])|([Pp][Oo][Ss][Tt][Ee])):\d{1,5}){0,1}
;---
;(set-info :status sat)
;(set-option :print-success true)
(set-logic QF_S)

(declare-const regexA RegLan)
(declare-const x String)

;witness1: "R\xC291-748-8590eXT:1#I\x1A\u0090cRV"
(define-fun Witness1 () String (str.++ "R" (str.++ "\u{0c}" (str.++ "2" (str.++ "9" (str.++ "1" (str.++ "-" (str.++ "7" (str.++ "4" (str.++ "8" (str.++ "-" (str.++ "8" (str.++ "5" (str.++ "9" (str.++ "0" (str.++ "e" (str.++ "X" (str.++ "T" (str.++ ":" (str.++ "1" (str.++ "#" (str.++ "I" (str.++ "\u{1a}" (str.++ "\u{90}" (str.++ "c" (str.++ "R" (str.++ "V" "")))))))))))))))))))))))))))
;witness2: "380-680-8399\u0085\u00F2"
(define-fun Witness2 () String (str.++ "3" (str.++ "8" (str.++ "0" (str.++ "-" (str.++ "6" (str.++ "8" (str.++ "0" (str.++ "-" (str.++ "8" (str.++ "3" (str.++ "9" (str.++ "9" (str.++ "\u{85}" (str.++ "\u{f2}" "")))))))))))))))

(assert (= regexA (re.++ (re.union (re.++ ((_ re.loop 0 2) (re.range "0" "9"))(re.++ (re.range "(" "(")(re.++ ((_ re.loop 3 3) (re.range "0" "9")) (re.range ")" ")")))) (re.++ ((_ re.loop 3 3) (re.range "0" "9")) (re.range "-" "-")))(re.++ ((_ re.loop 3 3) (re.range "0" "9"))(re.++ (re.range "-" "-")(re.++ ((_ re.loop 4 4) (re.range "0" "9"))(re.++ (re.* (re.union (re.range "\u{09}" "\u{0d}")(re.union (re.range " " " ")(re.union (re.range "\u{85}" "\u{85}") (re.range "\u{a0}" "\u{a0}"))))) (re.opt (re.++ (re.union (re.++ (re.union (re.range "E" "E") (re.range "e" "e"))(re.++ (re.union (re.range "X" "X") (re.range "x" "x")) (re.union (re.range "T" "T") (re.range "t" "t")))) (re.++ (re.union (re.range "P" "P") (re.range "p" "p"))(re.++ (re.union (re.range "O" "O") (re.range "o" "o"))(re.++ (re.union (re.range "S" "S") (re.range "s" "s"))(re.++ (re.union (re.range "T" "T") (re.range "t" "t")) (re.union (re.range "E" "E") (re.range "e" "e")))))))(re.++ (re.range ":" ":") ((_ re.loop 1 5) (re.range "0" "9"))))))))))))

;check that the regex contains some x
(assert (str.in_re x regexA))
;check also the concrete witnesses
(assert (str.in_re Witness1 regexA))
(assert (str.in_re Witness2 regexA))
(check-sat)
