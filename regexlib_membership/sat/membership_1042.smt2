;---
; using 8-bit bit-vectors as characters
; check membership of .Net regex
; regexA = ^(([A-Za-z]+[^0-9]*)([0-9]+[^\W]*)([\W]+[\W0-9A-Za-z]*))|(([A-Za-z]+[^\W]*)([\W]+[^0-9]*)([0-9]+[\W0-9A-Za-z]*))|(([\W]+[^A-Za-z]*)([A-Za-z]+[^0-9]*)([0-9]+[\W0-9A-Za-z]*))|(([\W]+[^0-9]*)([0-9]+[^A-Za-z]*)([A-Za-z]+[\W0-9A-Za-z]*))|(([0-9]+[^A-Za-z]*)([A-Za-z]+[^\W]*)([\W]+[\W0-9A-Za-z]*))|(([0-9]+[^\W]*)([\W]+[^A-Za-z]*)([A-Za-z]+[\W0-9A-Za-z]*))$
;---
(set-info :status sat)
(set-option :print-success true)
(set-logic QF_BVRE)

(declare-const regexA (RegEx String))
(declare-const x String)

;witness1: "\u00BBDzNkztKsHs\u00B1199"
(define-fun Witness1 () String (seq.++ "\xbb" (seq.++ "D" (seq.++ "z" (seq.++ "N" (seq.++ "k" (seq.++ "z" (seq.++ "t" (seq.++ "K" (seq.++ "s" (seq.++ "H" (seq.++ "s" (seq.++ "\xb1" (seq.++ "1" (seq.++ "9" (seq.++ "9" ""))))))))))))))))
;witness2: "6:\u00A8\u00A4W\u00F7\u00A7"
(define-fun Witness2 () String (seq.++ "6" (seq.++ ":" (seq.++ "\xa8" (seq.++ "\xa4" (seq.++ "W" (seq.++ "\xf7" (seq.++ "\xa7" ""))))))))

(assert (= regexA (re.union (re.++ (str.to_re "") (re.++ (re.++ (re.+ (re.union (re.range "A" "Z") (re.range "a" "z"))) (re.* (re.union (re.range "\x00" "/") (re.range ":" "\xff"))))(re.++ (re.++ (re.+ (re.range "0" "9")) (re.* (re.union (re.range "0" "9")(re.union (re.range "A" "Z")(re.union (re.range "_" "_")(re.union (re.range "a" "z")(re.union (re.range "\xaa" "\xaa")(re.union (re.range "\xb5" "\xb5")(re.union (re.range "\xba" "\xba")(re.union (re.range "\xc0" "\xd6")(re.union (re.range "\xd8" "\xf6") (re.range "\xf8" "\xff")))))))))))) (re.++ (re.+ (re.union (re.range "\x00" "/")(re.union (re.range ":" "@")(re.union (re.range "[" "^")(re.union (re.range "`" "`")(re.union (re.range "{" "\xa9")(re.union (re.range "\xab" "\xb4")(re.union (re.range "\xb6" "\xb9")(re.union (re.range "\xbb" "\xbf")(re.union (re.range "\xd7" "\xd7") (re.range "\xf7" "\xf7"))))))))))) (re.* (re.union (re.range "\x00" "^")(re.union (re.range "`" "\xa9")(re.union (re.range "\xab" "\xb4")(re.union (re.range "\xb6" "\xb9")(re.union (re.range "\xbb" "\xbf")(re.union (re.range "\xd7" "\xd7") (re.range "\xf7" "\xf7"))))))))))))(re.union (re.++ (re.++ (re.+ (re.union (re.range "A" "Z") (re.range "a" "z"))) (re.* (re.union (re.range "0" "9")(re.union (re.range "A" "Z")(re.union (re.range "_" "_")(re.union (re.range "a" "z")(re.union (re.range "\xaa" "\xaa")(re.union (re.range "\xb5" "\xb5")(re.union (re.range "\xba" "\xba")(re.union (re.range "\xc0" "\xd6")(re.union (re.range "\xd8" "\xf6") (re.range "\xf8" "\xff"))))))))))))(re.++ (re.++ (re.+ (re.union (re.range "\x00" "/")(re.union (re.range ":" "@")(re.union (re.range "[" "^")(re.union (re.range "`" "`")(re.union (re.range "{" "\xa9")(re.union (re.range "\xab" "\xb4")(re.union (re.range "\xb6" "\xb9")(re.union (re.range "\xbb" "\xbf")(re.union (re.range "\xd7" "\xd7") (re.range "\xf7" "\xf7"))))))))))) (re.* (re.union (re.range "\x00" "/") (re.range ":" "\xff")))) (re.++ (re.+ (re.range "0" "9")) (re.* (re.union (re.range "\x00" "^")(re.union (re.range "`" "\xa9")(re.union (re.range "\xab" "\xb4")(re.union (re.range "\xb6" "\xb9")(re.union (re.range "\xbb" "\xbf")(re.union (re.range "\xd7" "\xd7") (re.range "\xf7" "\xf7")))))))))))(re.union (re.++ (re.++ (re.+ (re.union (re.range "\x00" "/")(re.union (re.range ":" "@")(re.union (re.range "[" "^")(re.union (re.range "`" "`")(re.union (re.range "{" "\xa9")(re.union (re.range "\xab" "\xb4")(re.union (re.range "\xb6" "\xb9")(re.union (re.range "\xbb" "\xbf")(re.union (re.range "\xd7" "\xd7") (re.range "\xf7" "\xf7"))))))))))) (re.* (re.union (re.range "\x00" "@")(re.union (re.range "[" "`") (re.range "{" "\xff")))))(re.++ (re.++ (re.+ (re.union (re.range "A" "Z") (re.range "a" "z"))) (re.* (re.union (re.range "\x00" "/") (re.range ":" "\xff")))) (re.++ (re.+ (re.range "0" "9")) (re.* (re.union (re.range "\x00" "^")(re.union (re.range "`" "\xa9")(re.union (re.range "\xab" "\xb4")(re.union (re.range "\xb6" "\xb9")(re.union (re.range "\xbb" "\xbf")(re.union (re.range "\xd7" "\xd7") (re.range "\xf7" "\xf7")))))))))))(re.union (re.++ (re.++ (re.+ (re.union (re.range "\x00" "/")(re.union (re.range ":" "@")(re.union (re.range "[" "^")(re.union (re.range "`" "`")(re.union (re.range "{" "\xa9")(re.union (re.range "\xab" "\xb4")(re.union (re.range "\xb6" "\xb9")(re.union (re.range "\xbb" "\xbf")(re.union (re.range "\xd7" "\xd7") (re.range "\xf7" "\xf7"))))))))))) (re.* (re.union (re.range "\x00" "/") (re.range ":" "\xff"))))(re.++ (re.++ (re.+ (re.range "0" "9")) (re.* (re.union (re.range "\x00" "@")(re.union (re.range "[" "`") (re.range "{" "\xff"))))) (re.++ (re.+ (re.union (re.range "A" "Z") (re.range "a" "z"))) (re.* (re.union (re.range "\x00" "^")(re.union (re.range "`" "\xa9")(re.union (re.range "\xab" "\xb4")(re.union (re.range "\xb6" "\xb9")(re.union (re.range "\xbb" "\xbf")(re.union (re.range "\xd7" "\xd7") (re.range "\xf7" "\xf7")))))))))))(re.union (re.++ (re.++ (re.+ (re.range "0" "9")) (re.* (re.union (re.range "\x00" "@")(re.union (re.range "[" "`") (re.range "{" "\xff")))))(re.++ (re.++ (re.+ (re.union (re.range "A" "Z") (re.range "a" "z"))) (re.* (re.union (re.range "0" "9")(re.union (re.range "A" "Z")(re.union (re.range "_" "_")(re.union (re.range "a" "z")(re.union (re.range "\xaa" "\xaa")(re.union (re.range "\xb5" "\xb5")(re.union (re.range "\xba" "\xba")(re.union (re.range "\xc0" "\xd6")(re.union (re.range "\xd8" "\xf6") (re.range "\xf8" "\xff")))))))))))) (re.++ (re.+ (re.union (re.range "\x00" "/")(re.union (re.range ":" "@")(re.union (re.range "[" "^")(re.union (re.range "`" "`")(re.union (re.range "{" "\xa9")(re.union (re.range "\xab" "\xb4")(re.union (re.range "\xb6" "\xb9")(re.union (re.range "\xbb" "\xbf")(re.union (re.range "\xd7" "\xd7") (re.range "\xf7" "\xf7"))))))))))) (re.* (re.union (re.range "\x00" "^")(re.union (re.range "`" "\xa9")(re.union (re.range "\xab" "\xb4")(re.union (re.range "\xb6" "\xb9")(re.union (re.range "\xbb" "\xbf")(re.union (re.range "\xd7" "\xd7") (re.range "\xf7" "\xf7"))))))))))) (re.++ (re.++ (re.++ (re.+ (re.range "0" "9")) (re.* (re.union (re.range "0" "9")(re.union (re.range "A" "Z")(re.union (re.range "_" "_")(re.union (re.range "a" "z")(re.union (re.range "\xaa" "\xaa")(re.union (re.range "\xb5" "\xb5")(re.union (re.range "\xba" "\xba")(re.union (re.range "\xc0" "\xd6")(re.union (re.range "\xd8" "\xf6") (re.range "\xf8" "\xff"))))))))))))(re.++ (re.++ (re.+ (re.union (re.range "\x00" "/")(re.union (re.range ":" "@")(re.union (re.range "[" "^")(re.union (re.range "`" "`")(re.union (re.range "{" "\xa9")(re.union (re.range "\xab" "\xb4")(re.union (re.range "\xb6" "\xb9")(re.union (re.range "\xbb" "\xbf")(re.union (re.range "\xd7" "\xd7") (re.range "\xf7" "\xf7"))))))))))) (re.* (re.union (re.range "\x00" "@")(re.union (re.range "[" "`") (re.range "{" "\xff"))))) (re.++ (re.+ (re.union (re.range "A" "Z") (re.range "a" "z"))) (re.* (re.union (re.range "\x00" "^")(re.union (re.range "`" "\xa9")(re.union (re.range "\xab" "\xb4")(re.union (re.range "\xb6" "\xb9")(re.union (re.range "\xbb" "\xbf")(re.union (re.range "\xd7" "\xd7") (re.range "\xf7" "\xf7"))))))))))) (str.to_re "")))))))))

;check that the regex contains some x
(assert (str.in_re x regexA))
;check also the concrete witnesses
(assert (str.in_re Witness1 regexA))
(assert (str.in_re Witness2 regexA))
(check-sat)