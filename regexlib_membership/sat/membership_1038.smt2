;---
; using 8-bit bit-vectors as characters
; check membership of .Net regex
; regexA = (\s)*(int|void|float|char|double|string)((\s)|(\*))*(\&?)(\s)+([a-z])([a-z0-9])*(\s)*(\()(\s)*((int|void|float|char|double|string)((\s)|(\*))*(\&?)(\s)+([a-z])([a-z0-9])*((\s)*[,](\s)*(int|void|float|char|double|string)((\s)|(\*))*(\&?)(\s)+([a-z])([a-z0-9])*)*)?(\s)*(\))(\s)*;
;---
(set-info :status sat)
(set-option :print-success true)
(set-logic QF_BVRE)

(declare-const regexA (RegEx String))
(declare-const x String)

;witness1: " \u00A0string& r( \u0085char  \xD  i9\u0085)\u00A0;"
(define-fun Witness1 () String (seq.++ " " (seq.++ "\xa0" (seq.++ "s" (seq.++ "t" (seq.++ "r" (seq.++ "i" (seq.++ "n" (seq.++ "g" (seq.++ "&" (seq.++ " " (seq.++ "r" (seq.++ "(" (seq.++ " " (seq.++ "\x85" (seq.++ "c" (seq.++ "h" (seq.++ "a" (seq.++ "r" (seq.++ " " (seq.++ " " (seq.++ "\x0d" (seq.++ " " (seq.++ " " (seq.++ "i" (seq.++ "9" (seq.++ "\x85" (seq.++ ")" (seq.++ "\xa0" (seq.++ ";" ""))))))))))))))))))))))))))))))
;witness2: " char\u0085\xC g\u0085\u0085(double  \xC\xDeh) ;"
(define-fun Witness2 () String (seq.++ " " (seq.++ "c" (seq.++ "h" (seq.++ "a" (seq.++ "r" (seq.++ "\x85" (seq.++ "\x0c" (seq.++ " " (seq.++ "g" (seq.++ "\x85" (seq.++ "\x85" (seq.++ "(" (seq.++ "d" (seq.++ "o" (seq.++ "u" (seq.++ "b" (seq.++ "l" (seq.++ "e" (seq.++ " " (seq.++ " " (seq.++ "\x0c" (seq.++ "\x0d" (seq.++ "e" (seq.++ "h" (seq.++ ")" (seq.++ " " (seq.++ ";" ""))))))))))))))))))))))))))))

(assert (= regexA (re.++ (re.* (re.union (re.range "\x09" "\x0d")(re.union (re.range " " " ")(re.union (re.range "\x85" "\x85") (re.range "\xa0" "\xa0")))))(re.++ (re.union (str.to_re (seq.++ "i" (seq.++ "n" (seq.++ "t" ""))))(re.union (str.to_re (seq.++ "v" (seq.++ "o" (seq.++ "i" (seq.++ "d" "")))))(re.union (str.to_re (seq.++ "f" (seq.++ "l" (seq.++ "o" (seq.++ "a" (seq.++ "t" ""))))))(re.union (str.to_re (seq.++ "c" (seq.++ "h" (seq.++ "a" (seq.++ "r" "")))))(re.union (str.to_re (seq.++ "d" (seq.++ "o" (seq.++ "u" (seq.++ "b" (seq.++ "l" (seq.++ "e" ""))))))) (str.to_re (seq.++ "s" (seq.++ "t" (seq.++ "r" (seq.++ "i" (seq.++ "n" (seq.++ "g" ""))))))))))))(re.++ (re.* (re.union (re.union (re.range "\x09" "\x0d")(re.union (re.range " " " ")(re.union (re.range "\x85" "\x85") (re.range "\xa0" "\xa0")))) (re.range "*" "*")))(re.++ (re.opt (re.range "&" "&"))(re.++ (re.+ (re.union (re.range "\x09" "\x0d")(re.union (re.range " " " ")(re.union (re.range "\x85" "\x85") (re.range "\xa0" "\xa0")))))(re.++ (re.range "a" "z")(re.++ (re.* (re.union (re.range "0" "9") (re.range "a" "z")))(re.++ (re.* (re.union (re.range "\x09" "\x0d")(re.union (re.range " " " ")(re.union (re.range "\x85" "\x85") (re.range "\xa0" "\xa0")))))(re.++ (re.range "(" "(")(re.++ (re.* (re.union (re.range "\x09" "\x0d")(re.union (re.range " " " ")(re.union (re.range "\x85" "\x85") (re.range "\xa0" "\xa0")))))(re.++ (re.opt (re.++ (re.union (str.to_re (seq.++ "i" (seq.++ "n" (seq.++ "t" ""))))(re.union (str.to_re (seq.++ "v" (seq.++ "o" (seq.++ "i" (seq.++ "d" "")))))(re.union (str.to_re (seq.++ "f" (seq.++ "l" (seq.++ "o" (seq.++ "a" (seq.++ "t" ""))))))(re.union (str.to_re (seq.++ "c" (seq.++ "h" (seq.++ "a" (seq.++ "r" "")))))(re.union (str.to_re (seq.++ "d" (seq.++ "o" (seq.++ "u" (seq.++ "b" (seq.++ "l" (seq.++ "e" ""))))))) (str.to_re (seq.++ "s" (seq.++ "t" (seq.++ "r" (seq.++ "i" (seq.++ "n" (seq.++ "g" ""))))))))))))(re.++ (re.* (re.union (re.union (re.range "\x09" "\x0d")(re.union (re.range " " " ")(re.union (re.range "\x85" "\x85") (re.range "\xa0" "\xa0")))) (re.range "*" "*")))(re.++ (re.opt (re.range "&" "&"))(re.++ (re.+ (re.union (re.range "\x09" "\x0d")(re.union (re.range " " " ")(re.union (re.range "\x85" "\x85") (re.range "\xa0" "\xa0")))))(re.++ (re.range "a" "z")(re.++ (re.* (re.union (re.range "0" "9") (re.range "a" "z"))) (re.* (re.++ (re.* (re.union (re.range "\x09" "\x0d")(re.union (re.range " " " ")(re.union (re.range "\x85" "\x85") (re.range "\xa0" "\xa0")))))(re.++ (re.range "," ",")(re.++ (re.* (re.union (re.range "\x09" "\x0d")(re.union (re.range " " " ")(re.union (re.range "\x85" "\x85") (re.range "\xa0" "\xa0")))))(re.++ (re.union (str.to_re (seq.++ "i" (seq.++ "n" (seq.++ "t" ""))))(re.union (str.to_re (seq.++ "v" (seq.++ "o" (seq.++ "i" (seq.++ "d" "")))))(re.union (str.to_re (seq.++ "f" (seq.++ "l" (seq.++ "o" (seq.++ "a" (seq.++ "t" ""))))))(re.union (str.to_re (seq.++ "c" (seq.++ "h" (seq.++ "a" (seq.++ "r" "")))))(re.union (str.to_re (seq.++ "d" (seq.++ "o" (seq.++ "u" (seq.++ "b" (seq.++ "l" (seq.++ "e" ""))))))) (str.to_re (seq.++ "s" (seq.++ "t" (seq.++ "r" (seq.++ "i" (seq.++ "n" (seq.++ "g" ""))))))))))))(re.++ (re.* (re.union (re.union (re.range "\x09" "\x0d")(re.union (re.range " " " ")(re.union (re.range "\x85" "\x85") (re.range "\xa0" "\xa0")))) (re.range "*" "*")))(re.++ (re.opt (re.range "&" "&"))(re.++ (re.+ (re.union (re.range "\x09" "\x0d")(re.union (re.range " " " ")(re.union (re.range "\x85" "\x85") (re.range "\xa0" "\xa0")))))(re.++ (re.range "a" "z") (re.* (re.union (re.range "0" "9") (re.range "a" "z")))))))))))))))))))(re.++ (re.* (re.union (re.range "\x09" "\x0d")(re.union (re.range " " " ")(re.union (re.range "\x85" "\x85") (re.range "\xa0" "\xa0")))))(re.++ (re.range ")" ")")(re.++ (re.* (re.union (re.range "\x09" "\x0d")(re.union (re.range " " " ")(re.union (re.range "\x85" "\x85") (re.range "\xa0" "\xa0"))))) (re.range ";" ";")))))))))))))))))

;check that the regex contains some x
(assert (str.in_re x regexA))
;check also the concrete witnesses
(assert (str.in_re Witness1 regexA))
(assert (str.in_re Witness2 regexA))
(check-sat)
