;---
; using 8-bit bit-vectors as characters
; check membership of .Net regex
; regexA = (?<STag><)[/\?\s]*(?<Prefix>\w*:)*(?<TagName>\w*)\s*(?<Attributes>(?<Attribute>((?<AttributePrefix>\w*)\s*:\s*)*(?<AttributeName>\w*)\s*=\s*(?<AttributeValue>"[^"]*"|'[^']*'|[^>\s]*)\s*)*)\s*/?(?<ETag>>)
;---
(set-info :status sat)
(set-option :print-success true)
(set-logic QF_BVRE)

(declare-const regexA (RegEx String))
(declare-const x String)

;witness1: "\u00A7\u00BB<\u00A0?:\u00FD\u00D1lAY:U:\u00BA\u00EFB\u00A0=\xC \'\u00D2\u00F3\u00B9\u00FE\u00D2\u00AE\'\xA\u00EE\u00AA\u00B5\u0085\u00A0 :\u00C2\x9=\u00A0}|\x1Bd/>c"
(define-fun Witness1 () String (seq.++ "\xa7" (seq.++ "\xbb" (seq.++ "<" (seq.++ "\xa0" (seq.++ "?" (seq.++ ":" (seq.++ "\xfd" (seq.++ "\xd1" (seq.++ "l" (seq.++ "A" (seq.++ "Y" (seq.++ ":" (seq.++ "U" (seq.++ ":" (seq.++ "\xba" (seq.++ "\xef" (seq.++ "B" (seq.++ "\xa0" (seq.++ "=" (seq.++ "\x0c" (seq.++ " " (seq.++ "'" (seq.++ "\xd2" (seq.++ "\xf3" (seq.++ "\xb9" (seq.++ "\xfe" (seq.++ "\xd2" (seq.++ "\xae" (seq.++ "'" (seq.++ "\x0a" (seq.++ "\xee" (seq.++ "\xaa" (seq.++ "\xb5" (seq.++ "\x85" (seq.++ "\xa0" (seq.++ " " (seq.++ ":" (seq.++ "\xc2" (seq.++ "\x09" (seq.++ "=" (seq.++ "\xa0" (seq.++ "}" (seq.++ "|" (seq.++ "\x1b" (seq.++ "d" (seq.++ "/" (seq.++ ">" (seq.++ "c" "")))))))))))))))))))))))))))))))))))))))))))))))))
;witness2: "t</?\u0085?8:\u00F584::\u00FF\u00FE= />"
(define-fun Witness2 () String (seq.++ "t" (seq.++ "<" (seq.++ "/" (seq.++ "?" (seq.++ "\x85" (seq.++ "?" (seq.++ "8" (seq.++ ":" (seq.++ "\xf5" (seq.++ "8" (seq.++ "4" (seq.++ ":" (seq.++ ":" (seq.++ "\xff" (seq.++ "\xfe" (seq.++ "=" (seq.++ " " (seq.++ "/" (seq.++ ">" ""))))))))))))))))))))

(assert (= regexA (re.++ (re.range "<" "<")(re.++ (re.* (re.union (re.range "\x09" "\x0d")(re.union (re.range " " " ")(re.union (re.range "/" "/")(re.union (re.range "?" "?")(re.union (re.range "\x85" "\x85") (re.range "\xa0" "\xa0")))))))(re.++ (re.* (re.++ (re.* (re.union (re.range "0" "9")(re.union (re.range "A" "Z")(re.union (re.range "_" "_")(re.union (re.range "a" "z")(re.union (re.range "\xaa" "\xaa")(re.union (re.range "\xb5" "\xb5")(re.union (re.range "\xba" "\xba")(re.union (re.range "\xc0" "\xd6")(re.union (re.range "\xd8" "\xf6") (re.range "\xf8" "\xff"))))))))))) (re.range ":" ":")))(re.++ (re.* (re.union (re.range "0" "9")(re.union (re.range "A" "Z")(re.union (re.range "_" "_")(re.union (re.range "a" "z")(re.union (re.range "\xaa" "\xaa")(re.union (re.range "\xb5" "\xb5")(re.union (re.range "\xba" "\xba")(re.union (re.range "\xc0" "\xd6")(re.union (re.range "\xd8" "\xf6") (re.range "\xf8" "\xff")))))))))))(re.++ (re.* (re.union (re.range "\x09" "\x0d")(re.union (re.range " " " ")(re.union (re.range "\x85" "\x85") (re.range "\xa0" "\xa0")))))(re.++ (re.* (re.++ (re.* (re.++ (re.* (re.union (re.range "0" "9")(re.union (re.range "A" "Z")(re.union (re.range "_" "_")(re.union (re.range "a" "z")(re.union (re.range "\xaa" "\xaa")(re.union (re.range "\xb5" "\xb5")(re.union (re.range "\xba" "\xba")(re.union (re.range "\xc0" "\xd6")(re.union (re.range "\xd8" "\xf6") (re.range "\xf8" "\xff")))))))))))(re.++ (re.* (re.union (re.range "\x09" "\x0d")(re.union (re.range " " " ")(re.union (re.range "\x85" "\x85") (re.range "\xa0" "\xa0")))))(re.++ (re.range ":" ":") (re.* (re.union (re.range "\x09" "\x0d")(re.union (re.range " " " ")(re.union (re.range "\x85" "\x85") (re.range "\xa0" "\xa0")))))))))(re.++ (re.* (re.union (re.range "0" "9")(re.union (re.range "A" "Z")(re.union (re.range "_" "_")(re.union (re.range "a" "z")(re.union (re.range "\xaa" "\xaa")(re.union (re.range "\xb5" "\xb5")(re.union (re.range "\xba" "\xba")(re.union (re.range "\xc0" "\xd6")(re.union (re.range "\xd8" "\xf6") (re.range "\xf8" "\xff")))))))))))(re.++ (re.* (re.union (re.range "\x09" "\x0d")(re.union (re.range " " " ")(re.union (re.range "\x85" "\x85") (re.range "\xa0" "\xa0")))))(re.++ (re.range "=" "=")(re.++ (re.* (re.union (re.range "\x09" "\x0d")(re.union (re.range " " " ")(re.union (re.range "\x85" "\x85") (re.range "\xa0" "\xa0")))))(re.++ (re.union (re.++ (re.range "\x22" "\x22")(re.++ (re.* (re.union (re.range "\x00" "!") (re.range "#" "\xff"))) (re.range "\x22" "\x22")))(re.union (re.++ (re.range "'" "'")(re.++ (re.* (re.union (re.range "\x00" "&") (re.range "(" "\xff"))) (re.range "'" "'"))) (re.* (re.union (re.range "\x00" "\x08")(re.union (re.range "\x0e" "\x1f")(re.union (re.range "!" "=")(re.union (re.range "?" "\x84")(re.union (re.range "\x86" "\x9f") (re.range "\xa1" "\xff"))))))))) (re.* (re.union (re.range "\x09" "\x0d")(re.union (re.range " " " ")(re.union (re.range "\x85" "\x85") (re.range "\xa0" "\xa0"))))))))))))(re.++ (re.* (re.union (re.range "\x09" "\x0d")(re.union (re.range " " " ")(re.union (re.range "\x85" "\x85") (re.range "\xa0" "\xa0")))))(re.++ (re.opt (re.range "/" "/")) (re.range ">" ">")))))))))))

;check that the regex contains some x
(assert (str.in_re x regexA))
;check also the concrete witnesses
(assert (str.in_re Witness1 regexA))
(assert (str.in_re Witness2 regexA))
(check-sat)