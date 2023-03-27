;---
; using 8-bit bit-vectors as characters
; check membership of .Net regex
; regexA = href=[\"\'](http:\/\/|\.\/|\/)?\w+(\.\w+)*(\/\w+(\.\w+)?)*(\/|\?\w*=\w*(&\w*=\w*)*)?[\"\']
;---
;(set-info :status sat)
;(set-option :print-success true)
(set-logic QF_S)

(declare-const regexA RegLan)
(declare-const x String)

;witness1: "]href=\"./E.s2\u00CD9/H/\'"
(define-fun Witness1 () String (str.++ "]" (str.++ "h" (str.++ "r" (str.++ "e" (str.++ "f" (str.++ "=" (str.++ "\u{22}" (str.++ "." (str.++ "/" (str.++ "E" (str.++ "." (str.++ "s" (str.++ "2" (str.++ "\u{cd}" (str.++ "9" (str.++ "/" (str.++ "H" (str.++ "/" (str.++ "'" ""))))))))))))))))))))
;witness2: "\u00AE\x1Fvhref=\"http://1\u00AA\u00FB\u00AA\u00FD.v.8.6s/\u00D6\u00AA/_\u00AA\u00B5/\u00AA/\"\u0083\u00B9\u0096\u00FBr"
(define-fun Witness2 () String (str.++ "\u{ae}" (str.++ "\u{1f}" (str.++ "v" (str.++ "h" (str.++ "r" (str.++ "e" (str.++ "f" (str.++ "=" (str.++ "\u{22}" (str.++ "h" (str.++ "t" (str.++ "t" (str.++ "p" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "1" (str.++ "\u{aa}" (str.++ "\u{fb}" (str.++ "\u{aa}" (str.++ "\u{fd}" (str.++ "." (str.++ "v" (str.++ "." (str.++ "8" (str.++ "." (str.++ "6" (str.++ "s" (str.++ "/" (str.++ "\u{d6}" (str.++ "\u{aa}" (str.++ "/" (str.++ "_" (str.++ "\u{aa}" (str.++ "\u{b5}" (str.++ "/" (str.++ "\u{aa}" (str.++ "/" (str.++ "\u{22}" (str.++ "\u{83}" (str.++ "\u{b9}" (str.++ "\u{96}" (str.++ "\u{fb}" (str.++ "r" "")))))))))))))))))))))))))))))))))))))))))))))

(assert (= regexA (re.++ (str.to_re (str.++ "h" (str.++ "r" (str.++ "e" (str.++ "f" (str.++ "=" ""))))))(re.++ (re.union (re.range "\u{22}" "\u{22}") (re.range "'" "'"))(re.++ (re.opt (re.union (str.to_re (str.++ "h" (str.++ "t" (str.++ "t" (str.++ "p" (str.++ ":" (str.++ "/" (str.++ "/" ""))))))))(re.union (str.to_re (str.++ "." (str.++ "/" ""))) (re.range "/" "/"))))(re.++ (re.+ (re.union (re.range "0" "9")(re.union (re.range "A" "Z")(re.union (re.range "_" "_")(re.union (re.range "a" "z")(re.union (re.range "\u{aa}" "\u{aa}")(re.union (re.range "\u{b5}" "\u{b5}")(re.union (re.range "\u{ba}" "\u{ba}")(re.union (re.range "\u{c0}" "\u{d6}")(re.union (re.range "\u{d8}" "\u{f6}") (re.range "\u{f8}" "\u{ff}")))))))))))(re.++ (re.* (re.++ (re.range "." ".") (re.+ (re.union (re.range "0" "9")(re.union (re.range "A" "Z")(re.union (re.range "_" "_")(re.union (re.range "a" "z")(re.union (re.range "\u{aa}" "\u{aa}")(re.union (re.range "\u{b5}" "\u{b5}")(re.union (re.range "\u{ba}" "\u{ba}")(re.union (re.range "\u{c0}" "\u{d6}")(re.union (re.range "\u{d8}" "\u{f6}") (re.range "\u{f8}" "\u{ff}")))))))))))))(re.++ (re.* (re.++ (re.range "/" "/")(re.++ (re.+ (re.union (re.range "0" "9")(re.union (re.range "A" "Z")(re.union (re.range "_" "_")(re.union (re.range "a" "z")(re.union (re.range "\u{aa}" "\u{aa}")(re.union (re.range "\u{b5}" "\u{b5}")(re.union (re.range "\u{ba}" "\u{ba}")(re.union (re.range "\u{c0}" "\u{d6}")(re.union (re.range "\u{d8}" "\u{f6}") (re.range "\u{f8}" "\u{ff}"))))))))))) (re.opt (re.++ (re.range "." ".") (re.+ (re.union (re.range "0" "9")(re.union (re.range "A" "Z")(re.union (re.range "_" "_")(re.union (re.range "a" "z")(re.union (re.range "\u{aa}" "\u{aa}")(re.union (re.range "\u{b5}" "\u{b5}")(re.union (re.range "\u{ba}" "\u{ba}")(re.union (re.range "\u{c0}" "\u{d6}")(re.union (re.range "\u{d8}" "\u{f6}") (re.range "\u{f8}" "\u{ff}"))))))))))))))))(re.++ (re.opt (re.union (re.range "/" "/") (re.++ (re.range "?" "?")(re.++ (re.* (re.union (re.range "0" "9")(re.union (re.range "A" "Z")(re.union (re.range "_" "_")(re.union (re.range "a" "z")(re.union (re.range "\u{aa}" "\u{aa}")(re.union (re.range "\u{b5}" "\u{b5}")(re.union (re.range "\u{ba}" "\u{ba}")(re.union (re.range "\u{c0}" "\u{d6}")(re.union (re.range "\u{d8}" "\u{f6}") (re.range "\u{f8}" "\u{ff}")))))))))))(re.++ (re.range "=" "=")(re.++ (re.* (re.union (re.range "0" "9")(re.union (re.range "A" "Z")(re.union (re.range "_" "_")(re.union (re.range "a" "z")(re.union (re.range "\u{aa}" "\u{aa}")(re.union (re.range "\u{b5}" "\u{b5}")(re.union (re.range "\u{ba}" "\u{ba}")(re.union (re.range "\u{c0}" "\u{d6}")(re.union (re.range "\u{d8}" "\u{f6}") (re.range "\u{f8}" "\u{ff}"))))))))))) (re.* (re.++ (re.range "&" "&")(re.++ (re.* (re.union (re.range "0" "9")(re.union (re.range "A" "Z")(re.union (re.range "_" "_")(re.union (re.range "a" "z")(re.union (re.range "\u{aa}" "\u{aa}")(re.union (re.range "\u{b5}" "\u{b5}")(re.union (re.range "\u{ba}" "\u{ba}")(re.union (re.range "\u{c0}" "\u{d6}")(re.union (re.range "\u{d8}" "\u{f6}") (re.range "\u{f8}" "\u{ff}")))))))))))(re.++ (re.range "=" "=") (re.* (re.union (re.range "0" "9")(re.union (re.range "A" "Z")(re.union (re.range "_" "_")(re.union (re.range "a" "z")(re.union (re.range "\u{aa}" "\u{aa}")(re.union (re.range "\u{b5}" "\u{b5}")(re.union (re.range "\u{ba}" "\u{ba}")(re.union (re.range "\u{c0}" "\u{d6}")(re.union (re.range "\u{d8}" "\u{f6}") (re.range "\u{f8}" "\u{ff}"))))))))))))))))))))) (re.union (re.range "\u{22}" "\u{22}") (re.range "'" "'")))))))))))

;check that the regex contains some x
(assert (str.in_re x regexA))
;check also the concrete witnesses
(assert (str.in_re Witness1 regexA))
(assert (str.in_re Witness2 regexA))
(check-sat)
