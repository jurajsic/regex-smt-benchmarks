;---
; using 8-bit bit-vectors as characters
; check membership of .Net regex
; regexA = (?<Protocol>\w+):\/\/(?<Domain>[\w@][\w.:\-@]+)\/(?<Container>[\w= ,@-]+)*
;---
(set-info :status sat)
(set-option :print-success true)
(set-logic QF_BVRE)

(declare-const regexA (RegEx String))
(declare-const x String)

;witness1: "\x10\x4,\u0080]9://2:/\x8\x8\x13\u00E5"
(define-fun Witness1 () String (seq.++ "\x10" (seq.++ "\x04" (seq.++ "," (seq.++ "\x80" (seq.++ "]" (seq.++ "9" (seq.++ ":" (seq.++ "/" (seq.++ "/" (seq.++ "2" (seq.++ ":" (seq.++ "/" (seq.++ "\x08" (seq.++ "\x08" (seq.++ "\x13" (seq.++ "\xe5" "")))))))))))))))))
;witness2: "i://H\u00AA/\u00AA"
(define-fun Witness2 () String (seq.++ "i" (seq.++ ":" (seq.++ "/" (seq.++ "/" (seq.++ "H" (seq.++ "\xaa" (seq.++ "/" (seq.++ "\xaa" "")))))))))

(assert (= regexA (re.++ (re.+ (re.union (re.range "0" "9")(re.union (re.range "A" "Z")(re.union (re.range "_" "_")(re.union (re.range "a" "z")(re.union (re.range "\xaa" "\xaa")(re.union (re.range "\xb5" "\xb5")(re.union (re.range "\xba" "\xba")(re.union (re.range "\xc0" "\xd6")(re.union (re.range "\xd8" "\xf6") (re.range "\xf8" "\xff")))))))))))(re.++ (str.to_re (seq.++ ":" (seq.++ "/" (seq.++ "/" ""))))(re.++ (re.++ (re.union (re.range "0" "9")(re.union (re.range "@" "Z")(re.union (re.range "_" "_")(re.union (re.range "a" "z")(re.union (re.range "\xaa" "\xaa")(re.union (re.range "\xb5" "\xb5")(re.union (re.range "\xba" "\xba")(re.union (re.range "\xc0" "\xd6")(re.union (re.range "\xd8" "\xf6") (re.range "\xf8" "\xff")))))))))) (re.+ (re.union (re.range "-" ".")(re.union (re.range "0" ":")(re.union (re.range "@" "Z")(re.union (re.range "_" "_")(re.union (re.range "a" "z")(re.union (re.range "\xaa" "\xaa")(re.union (re.range "\xb5" "\xb5")(re.union (re.range "\xba" "\xba")(re.union (re.range "\xc0" "\xd6")(re.union (re.range "\xd8" "\xf6") (re.range "\xf8" "\xff")))))))))))))(re.++ (re.range "/" "/") (re.* (re.+ (re.union (re.range " " " ")(re.union (re.range "," "-")(re.union (re.range "0" "9")(re.union (re.range "=" "=")(re.union (re.range "@" "Z")(re.union (re.range "_" "_")(re.union (re.range "a" "z")(re.union (re.range "\xaa" "\xaa")(re.union (re.range "\xb5" "\xb5")(re.union (re.range "\xba" "\xba")(re.union (re.range "\xc0" "\xd6")(re.union (re.range "\xd8" "\xf6") (re.range "\xf8" "\xff")))))))))))))))))))))

;check that the regex contains some x
(assert (str.in_re x regexA))
;check also the concrete witnesses
(assert (str.in_re Witness1 regexA))
(assert (str.in_re Witness2 regexA))
(check-sat)
