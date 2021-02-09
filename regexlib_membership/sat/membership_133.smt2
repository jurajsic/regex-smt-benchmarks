;---
; using 8-bit bit-vectors as characters
; check membership of .Net regex
; regexA = (?<protocol>(http|ftp|https|ftps):\/\/)?(?<site>[\w\-_\.]+\.(?<tld>([0-9]{1,3})|([a-zA-Z]{2,3})|(aero|coop|info|museum|name))+(?<port>:[0-9]+)?\/?)((?<resource>[\w\-\.,@^%:/~\+#]*[\w\-\@^%/~\+#])(?<queryString>(\?[a-zA-Z0-9\[\]\-\._+%\$#\~',]*=[a-zA-Z0-9\[\]\-\._+%\$#\~',]*)+(&[a-zA-Z0-9\[\]\-\._+%\$#\~',]*=[a-zA-Z0-9\[\]\-\._+%\$#\~',]*)*)?)?
;---
(set-info :status sat)
(set-option :print-success true)
(set-logic QF_BVRE)

(declare-const regexA (RegEx String))
(declare-const x String)

;witness1: "+\x19\u00BA.aeroaeroo\u00B5?=+&=&=2"
(define-fun Witness1 () String (seq.++ "+" (seq.++ "\x19" (seq.++ "\xba" (seq.++ "." (seq.++ "a" (seq.++ "e" (seq.++ "r" (seq.++ "o" (seq.++ "a" (seq.++ "e" (seq.++ "r" (seq.++ "o" (seq.++ "o" (seq.++ "\xb5" (seq.++ "?" (seq.++ "=" (seq.++ "+" (seq.++ "&" (seq.++ "=" (seq.++ "&" (seq.++ "=" (seq.++ "2" "")))))))))))))))))))))))
;witness2: "\u009Fhttp://k\u00B5..infocoopaero:2\x12\u00BF7c\u0095"
(define-fun Witness2 () String (seq.++ "\x9f" (seq.++ "h" (seq.++ "t" (seq.++ "t" (seq.++ "p" (seq.++ ":" (seq.++ "/" (seq.++ "/" (seq.++ "k" (seq.++ "\xb5" (seq.++ "." (seq.++ "." (seq.++ "i" (seq.++ "n" (seq.++ "f" (seq.++ "o" (seq.++ "c" (seq.++ "o" (seq.++ "o" (seq.++ "p" (seq.++ "a" (seq.++ "e" (seq.++ "r" (seq.++ "o" (seq.++ ":" (seq.++ "2" (seq.++ "\x12" (seq.++ "\xbf" (seq.++ "7" (seq.++ "c" (seq.++ "\x95" ""))))))))))))))))))))))))))))))))

(assert (= regexA (re.++ (re.opt (re.++ (re.union (str.to_re (seq.++ "h" (seq.++ "t" (seq.++ "t" (seq.++ "p" "")))))(re.union (str.to_re (seq.++ "f" (seq.++ "t" (seq.++ "p" ""))))(re.union (str.to_re (seq.++ "h" (seq.++ "t" (seq.++ "t" (seq.++ "p" (seq.++ "s" "")))))) (str.to_re (seq.++ "f" (seq.++ "t" (seq.++ "p" (seq.++ "s" "")))))))) (str.to_re (seq.++ ":" (seq.++ "/" (seq.++ "/" ""))))))(re.++ (re.++ (re.+ (re.union (re.range "-" ".")(re.union (re.range "0" "9")(re.union (re.range "A" "Z")(re.union (re.range "_" "_")(re.union (re.range "a" "z")(re.union (re.range "\xaa" "\xaa")(re.union (re.range "\xb5" "\xb5")(re.union (re.range "\xba" "\xba")(re.union (re.range "\xc0" "\xd6")(re.union (re.range "\xd8" "\xf6") (re.range "\xf8" "\xff"))))))))))))(re.++ (re.range "." ".")(re.++ (re.+ (re.union ((_ re.loop 1 3) (re.range "0" "9"))(re.union ((_ re.loop 2 3) (re.union (re.range "A" "Z") (re.range "a" "z"))) (re.union (str.to_re (seq.++ "a" (seq.++ "e" (seq.++ "r" (seq.++ "o" "")))))(re.union (str.to_re (seq.++ "c" (seq.++ "o" (seq.++ "o" (seq.++ "p" "")))))(re.union (str.to_re (seq.++ "i" (seq.++ "n" (seq.++ "f" (seq.++ "o" "")))))(re.union (str.to_re (seq.++ "m" (seq.++ "u" (seq.++ "s" (seq.++ "e" (seq.++ "u" (seq.++ "m" ""))))))) (str.to_re (seq.++ "n" (seq.++ "a" (seq.++ "m" (seq.++ "e" ""))))))))))))(re.++ (re.opt (re.++ (re.range ":" ":") (re.+ (re.range "0" "9")))) (re.opt (re.range "/" "/")))))) (re.opt (re.++ (re.++ (re.* (re.union (re.range "#" "#")(re.union (re.range "%" "%")(re.union (re.range "+" ":")(re.union (re.range "@" "Z")(re.union (re.range "^" "_")(re.union (re.range "a" "z")(re.union (re.range "~" "~")(re.union (re.range "\xaa" "\xaa")(re.union (re.range "\xb5" "\xb5")(re.union (re.range "\xba" "\xba")(re.union (re.range "\xc0" "\xd6")(re.union (re.range "\xd8" "\xf6") (re.range "\xf8" "\xff")))))))))))))) (re.union (re.range "#" "#")(re.union (re.range "%" "%")(re.union (re.range "+" "+")(re.union (re.range "-" "-")(re.union (re.range "/" "9")(re.union (re.range "@" "Z")(re.union (re.range "^" "_")(re.union (re.range "a" "z")(re.union (re.range "~" "~")(re.union (re.range "\xaa" "\xaa")(re.union (re.range "\xb5" "\xb5")(re.union (re.range "\xba" "\xba")(re.union (re.range "\xc0" "\xd6")(re.union (re.range "\xd8" "\xf6") (re.range "\xf8" "\xff")))))))))))))))) (re.opt (re.++ (re.+ (re.++ (re.range "?" "?")(re.++ (re.* (re.union (re.range "#" "%")(re.union (re.range "'" "'")(re.union (re.range "+" ".")(re.union (re.range "0" "9")(re.union (re.range "A" "[")(re.union (re.range "]" "]")(re.union (re.range "_" "_")(re.union (re.range "a" "z") (re.range "~" "~"))))))))))(re.++ (re.range "=" "=") (re.* (re.union (re.range "#" "%")(re.union (re.range "'" "'")(re.union (re.range "+" ".")(re.union (re.range "0" "9")(re.union (re.range "A" "[")(re.union (re.range "]" "]")(re.union (re.range "_" "_")(re.union (re.range "a" "z") (re.range "~" "~")))))))))))))) (re.* (re.++ (re.range "&" "&")(re.++ (re.* (re.union (re.range "#" "%")(re.union (re.range "'" "'")(re.union (re.range "+" ".")(re.union (re.range "0" "9")(re.union (re.range "A" "[")(re.union (re.range "]" "]")(re.union (re.range "_" "_")(re.union (re.range "a" "z") (re.range "~" "~"))))))))))(re.++ (re.range "=" "=") (re.* (re.union (re.range "#" "%")(re.union (re.range "'" "'")(re.union (re.range "+" ".")(re.union (re.range "0" "9")(re.union (re.range "A" "[")(re.union (re.range "]" "]")(re.union (re.range "_" "_")(re.union (re.range "a" "z") (re.range "~" "~"))))))))))))))))))))))

;check that the regex contains some x
(assert (str.in_re x regexA))
;check also the concrete witnesses
(assert (str.in_re Witness1 regexA))
(assert (str.in_re Witness2 regexA))
(check-sat)