;---
; using 8-bit bit-vectors as characters
; check if regexA is not a subset of regexB
; regexA = ^((\w|\d|\-|\.)+)@{1}(((\w|\d|\-){1,67})|((\w|\d|\-)+\.(\w|\d|\-){1,67}))\.((([a-z]|[A-Z]|\d){2,4})(\.([a-z]|A|Z|\d){2})?)\z
; regexB = ^((([A-Z]|[a-z]|[0-9])+[ ]+)|(([A-Z]|[a-z]|[0-9])+\-+)|(([A-Z]|[a-z]|[0-9])+\.+)|(([A-Z]|[a-z]|[0-9])+\++))*([A-Z]|[a-z]|[0-9])+@((\w+\-+)|(\w+\.))*\w{1,63}\.([A-Z]|[a-z]){2,6}\z
;---
;(set-info :status sat)
;(set-option :print-success true)
(set-logic QF_S)

(declare-const regexA RegLan)
(declare-const regexB RegLan)
(declare-const x String)

;witness: "0-@\u00AA.\u00EA.9e"
(define-fun Witness () String (str.++ "0" (str.++ "-" (str.++ "@" (str.++ "\u{aa}" (str.++ "." (str.++ "\u{ea}" (str.++ "." (str.++ "9" (str.++ "e" ""))))))))))

(assert (= regexA (re.++ (str.to_re "")(re.++ (re.+ (re.union (re.range "-" ".")(re.union (re.range "0" "9")(re.union (re.range "A" "Z")(re.union (re.range "_" "_")(re.union (re.range "a" "z")(re.union (re.range "\u{aa}" "\u{aa}")(re.union (re.range "\u{b5}" "\u{b5}")(re.union (re.range "\u{ba}" "\u{ba}")(re.union (re.range "\u{c0}" "\u{d6}")(re.union (re.range "\u{d8}" "\u{f6}") (re.range "\u{f8}" "\u{ff}"))))))))))))(re.++ (re.range "@" "@")(re.++ (re.union ((_ re.loop 1 67) (re.union (re.range "-" "-")(re.union (re.range "0" "9")(re.union (re.range "A" "Z")(re.union (re.range "_" "_")(re.union (re.range "a" "z")(re.union (re.range "\u{aa}" "\u{aa}")(re.union (re.range "\u{b5}" "\u{b5}")(re.union (re.range "\u{ba}" "\u{ba}")(re.union (re.range "\u{c0}" "\u{d6}")(re.union (re.range "\u{d8}" "\u{f6}") (re.range "\u{f8}" "\u{ff}")))))))))))) (re.++ (re.+ (re.union (re.range "-" "-")(re.union (re.range "0" "9")(re.union (re.range "A" "Z")(re.union (re.range "_" "_")(re.union (re.range "a" "z")(re.union (re.range "\u{aa}" "\u{aa}")(re.union (re.range "\u{b5}" "\u{b5}")(re.union (re.range "\u{ba}" "\u{ba}")(re.union (re.range "\u{c0}" "\u{d6}")(re.union (re.range "\u{d8}" "\u{f6}") (re.range "\u{f8}" "\u{ff}"))))))))))))(re.++ (re.range "." ".") ((_ re.loop 1 67) (re.union (re.range "-" "-")(re.union (re.range "0" "9")(re.union (re.range "A" "Z")(re.union (re.range "_" "_")(re.union (re.range "a" "z")(re.union (re.range "\u{aa}" "\u{aa}")(re.union (re.range "\u{b5}" "\u{b5}")(re.union (re.range "\u{ba}" "\u{ba}")(re.union (re.range "\u{c0}" "\u{d6}")(re.union (re.range "\u{d8}" "\u{f6}") (re.range "\u{f8}" "\u{ff}")))))))))))))))(re.++ (re.range "." ".")(re.++ (re.++ ((_ re.loop 2 4) (re.union (re.range "0" "9")(re.union (re.range "A" "Z") (re.range "a" "z")))) (re.opt (re.++ (re.range "." ".") ((_ re.loop 2 2) (re.union (re.range "0" "9")(re.union (re.range "A" "A")(re.union (re.range "Z" "Z") (re.range "a" "z")))))))) (str.to_re "")))))))))

(assert (= regexB (re.++ (str.to_re "")(re.++ (re.* (re.union (re.++ (re.+ (re.union (re.range "0" "9")(re.union (re.range "A" "Z") (re.range "a" "z")))) (re.+ (re.range " " " ")))(re.union (re.++ (re.+ (re.union (re.range "0" "9")(re.union (re.range "A" "Z") (re.range "a" "z")))) (re.+ (re.range "-" "-")))(re.union (re.++ (re.+ (re.union (re.range "0" "9")(re.union (re.range "A" "Z") (re.range "a" "z")))) (re.+ (re.range "." "."))) (re.++ (re.+ (re.union (re.range "0" "9")(re.union (re.range "A" "Z") (re.range "a" "z")))) (re.+ (re.range "+" "+")))))))(re.++ (re.+ (re.union (re.range "0" "9")(re.union (re.range "A" "Z") (re.range "a" "z"))))(re.++ (re.range "@" "@")(re.++ (re.* (re.union (re.++ (re.+ (re.union (re.range "0" "9")(re.union (re.range "A" "Z")(re.union (re.range "_" "_")(re.union (re.range "a" "z")(re.union (re.range "\u{aa}" "\u{aa}")(re.union (re.range "\u{b5}" "\u{b5}")(re.union (re.range "\u{ba}" "\u{ba}")(re.union (re.range "\u{c0}" "\u{d6}")(re.union (re.range "\u{d8}" "\u{f6}") (re.range "\u{f8}" "\u{ff}"))))))))))) (re.+ (re.range "-" "-"))) (re.++ (re.+ (re.union (re.range "0" "9")(re.union (re.range "A" "Z")(re.union (re.range "_" "_")(re.union (re.range "a" "z")(re.union (re.range "\u{aa}" "\u{aa}")(re.union (re.range "\u{b5}" "\u{b5}")(re.union (re.range "\u{ba}" "\u{ba}")(re.union (re.range "\u{c0}" "\u{d6}")(re.union (re.range "\u{d8}" "\u{f6}") (re.range "\u{f8}" "\u{ff}"))))))))))) (re.range "." "."))))(re.++ ((_ re.loop 1 63) (re.union (re.range "0" "9")(re.union (re.range "A" "Z")(re.union (re.range "_" "_")(re.union (re.range "a" "z")(re.union (re.range "\u{aa}" "\u{aa}")(re.union (re.range "\u{b5}" "\u{b5}")(re.union (re.range "\u{ba}" "\u{ba}")(re.union (re.range "\u{c0}" "\u{d6}")(re.union (re.range "\u{d8}" "\u{f6}") (re.range "\u{f8}" "\u{ff}")))))))))))(re.++ (re.range "." ".")(re.++ ((_ re.loop 2 6) (re.union (re.range "A" "Z") (re.range "a" "z"))) (str.to_re "")))))))))))

;(assert (not (re-subset regexA regexB)))
;check that the difference is nonempty, contains some x
(assert (str.in_re x regexA))
(assert (not (str.in_re x regexB)))
;check also the concrete witness
(assert (str.in_re Witness regexA))
(assert (not (str.in_re Witness regexB)))
(check-sat)
