;---
; using 8-bit bit-vectors as characters
; check membership of .Net regex
; regexA = \d{1,3}[.]\d{1,3}[.]\d{1,3}[.]\d{1,3}\s.\s.\s\[\d{2}\/\D{3}\/\d{4}:\d{1,2}:\d{1,2}:\d{1,2}\s.\d{4}\]\s\&quot;\S*\s\S*\s\S*\&quot;\s\d{1,3}\s\S*\s\&quot;.*\&quot;\s\&quot;.*\&quot;
;---
(set-info :status sat)
(set-option :print-success true)
(set-logic QF_BVRE)

(declare-const regexA (RegEx String))
(declare-const x String)

;witness1: "834.9.217.8 \u00FC\xC\x1B\x9[47/\u00D0\u0089\x10/9217:88:60:89\xD\u00981369]\x9&quot;\u00A0\x8U &quot; 99\xC &quot;&quot;\u00A0&quot;>&quot;\u00D0"
(define-fun Witness1 () String (seq.++ "8" (seq.++ "3" (seq.++ "4" (seq.++ "." (seq.++ "9" (seq.++ "." (seq.++ "2" (seq.++ "1" (seq.++ "7" (seq.++ "." (seq.++ "8" (seq.++ " " (seq.++ "\xfc" (seq.++ "\x0c" (seq.++ "\x1b" (seq.++ "\x09" (seq.++ "[" (seq.++ "4" (seq.++ "7" (seq.++ "/" (seq.++ "\xd0" (seq.++ "\x89" (seq.++ "\x10" (seq.++ "/" (seq.++ "9" (seq.++ "2" (seq.++ "1" (seq.++ "7" (seq.++ ":" (seq.++ "8" (seq.++ "8" (seq.++ ":" (seq.++ "6" (seq.++ "0" (seq.++ ":" (seq.++ "8" (seq.++ "9" (seq.++ "\x0d" (seq.++ "\x98" (seq.++ "1" (seq.++ "3" (seq.++ "6" (seq.++ "9" (seq.++ "]" (seq.++ "\x09" (seq.++ "&" (seq.++ "q" (seq.++ "u" (seq.++ "o" (seq.++ "t" (seq.++ ";" (seq.++ "\xa0" (seq.++ "\x08" (seq.++ "U" (seq.++ " " (seq.++ "&" (seq.++ "q" (seq.++ "u" (seq.++ "o" (seq.++ "t" (seq.++ ";" (seq.++ " " (seq.++ "9" (seq.++ "9" (seq.++ "\x0c" (seq.++ " " (seq.++ "&" (seq.++ "q" (seq.++ "u" (seq.++ "o" (seq.++ "t" (seq.++ ";" (seq.++ "&" (seq.++ "q" (seq.++ "u" (seq.++ "o" (seq.++ "t" (seq.++ ";" (seq.++ "\xa0" (seq.++ "&" (seq.++ "q" (seq.++ "u" (seq.++ "o" (seq.++ "t" (seq.++ ";" (seq.++ ">" (seq.++ "&" (seq.++ "q" (seq.++ "u" (seq.++ "o" (seq.++ "t" (seq.++ ";" (seq.++ "\xd0" ""))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
;witness2: "\u00BC\x17995.9.6.93\u0085\u00F7\x9\u00E2 [95/$f\u00AF/8680:68:29:6\xC\u009E8589]\u0085&quot;K\u00D36\xD\x9\u007F&quot; 9 \u0084f`\u0085&quot;&quot;\u00A0&quot;&quot;"
(define-fun Witness2 () String (seq.++ "\xbc" (seq.++ "\x17" (seq.++ "9" (seq.++ "9" (seq.++ "5" (seq.++ "." (seq.++ "9" (seq.++ "." (seq.++ "6" (seq.++ "." (seq.++ "9" (seq.++ "3" (seq.++ "\x85" (seq.++ "\xf7" (seq.++ "\x09" (seq.++ "\xe2" (seq.++ " " (seq.++ "[" (seq.++ "9" (seq.++ "5" (seq.++ "/" (seq.++ "$" (seq.++ "f" (seq.++ "\xaf" (seq.++ "/" (seq.++ "8" (seq.++ "6" (seq.++ "8" (seq.++ "0" (seq.++ ":" (seq.++ "6" (seq.++ "8" (seq.++ ":" (seq.++ "2" (seq.++ "9" (seq.++ ":" (seq.++ "6" (seq.++ "\x0c" (seq.++ "\x9e" (seq.++ "8" (seq.++ "5" (seq.++ "8" (seq.++ "9" (seq.++ "]" (seq.++ "\x85" (seq.++ "&" (seq.++ "q" (seq.++ "u" (seq.++ "o" (seq.++ "t" (seq.++ ";" (seq.++ "K" (seq.++ "\xd3" (seq.++ "6" (seq.++ "\x0d" (seq.++ "\x09" (seq.++ "\x7f" (seq.++ "&" (seq.++ "q" (seq.++ "u" (seq.++ "o" (seq.++ "t" (seq.++ ";" (seq.++ " " (seq.++ "9" (seq.++ " " (seq.++ "\x84" (seq.++ "f" (seq.++ "`" (seq.++ "\x85" (seq.++ "&" (seq.++ "q" (seq.++ "u" (seq.++ "o" (seq.++ "t" (seq.++ ";" (seq.++ "&" (seq.++ "q" (seq.++ "u" (seq.++ "o" (seq.++ "t" (seq.++ ";" (seq.++ "\xa0" (seq.++ "&" (seq.++ "q" (seq.++ "u" (seq.++ "o" (seq.++ "t" (seq.++ ";" (seq.++ "&" (seq.++ "q" (seq.++ "u" (seq.++ "o" (seq.++ "t" (seq.++ ";" ""))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

(assert (= regexA (re.++ ((_ re.loop 1 3) (re.range "0" "9"))(re.++ (re.range "." ".")(re.++ ((_ re.loop 1 3) (re.range "0" "9"))(re.++ (re.range "." ".")(re.++ ((_ re.loop 1 3) (re.range "0" "9"))(re.++ (re.range "." ".")(re.++ ((_ re.loop 1 3) (re.range "0" "9"))(re.++ (re.union (re.range "\x09" "\x0d")(re.union (re.range " " " ")(re.union (re.range "\x85" "\x85") (re.range "\xa0" "\xa0"))))(re.++ (re.union (re.range "\x00" "\x09") (re.range "\x0b" "\xff"))(re.++ (re.union (re.range "\x09" "\x0d")(re.union (re.range " " " ")(re.union (re.range "\x85" "\x85") (re.range "\xa0" "\xa0"))))(re.++ (re.union (re.range "\x00" "\x09") (re.range "\x0b" "\xff"))(re.++ (re.union (re.range "\x09" "\x0d")(re.union (re.range " " " ")(re.union (re.range "\x85" "\x85") (re.range "\xa0" "\xa0"))))(re.++ (re.range "[" "[")(re.++ ((_ re.loop 2 2) (re.range "0" "9"))(re.++ (re.range "/" "/")(re.++ ((_ re.loop 3 3) (re.union (re.range "\x00" "/") (re.range ":" "\xff")))(re.++ (re.range "/" "/")(re.++ ((_ re.loop 4 4) (re.range "0" "9"))(re.++ (re.range ":" ":")(re.++ ((_ re.loop 1 2) (re.range "0" "9"))(re.++ (re.range ":" ":")(re.++ ((_ re.loop 1 2) (re.range "0" "9"))(re.++ (re.range ":" ":")(re.++ ((_ re.loop 1 2) (re.range "0" "9"))(re.++ (re.union (re.range "\x09" "\x0d")(re.union (re.range " " " ")(re.union (re.range "\x85" "\x85") (re.range "\xa0" "\xa0"))))(re.++ (re.union (re.range "\x00" "\x09") (re.range "\x0b" "\xff"))(re.++ ((_ re.loop 4 4) (re.range "0" "9"))(re.++ (re.range "]" "]")(re.++ (re.union (re.range "\x09" "\x0d")(re.union (re.range " " " ")(re.union (re.range "\x85" "\x85") (re.range "\xa0" "\xa0"))))(re.++ (str.to_re (seq.++ "&" (seq.++ "q" (seq.++ "u" (seq.++ "o" (seq.++ "t" (seq.++ ";" "")))))))(re.++ (re.* (re.union (re.range "\x00" "\x08")(re.union (re.range "\x0e" "\x1f")(re.union (re.range "!" "\x84")(re.union (re.range "\x86" "\x9f") (re.range "\xa1" "\xff"))))))(re.++ (re.union (re.range "\x09" "\x0d")(re.union (re.range " " " ")(re.union (re.range "\x85" "\x85") (re.range "\xa0" "\xa0"))))(re.++ (re.* (re.union (re.range "\x00" "\x08")(re.union (re.range "\x0e" "\x1f")(re.union (re.range "!" "\x84")(re.union (re.range "\x86" "\x9f") (re.range "\xa1" "\xff"))))))(re.++ (re.union (re.range "\x09" "\x0d")(re.union (re.range " " " ")(re.union (re.range "\x85" "\x85") (re.range "\xa0" "\xa0"))))(re.++ (re.* (re.union (re.range "\x00" "\x08")(re.union (re.range "\x0e" "\x1f")(re.union (re.range "!" "\x84")(re.union (re.range "\x86" "\x9f") (re.range "\xa1" "\xff"))))))(re.++ (str.to_re (seq.++ "&" (seq.++ "q" (seq.++ "u" (seq.++ "o" (seq.++ "t" (seq.++ ";" "")))))))(re.++ (re.union (re.range "\x09" "\x0d")(re.union (re.range " " " ")(re.union (re.range "\x85" "\x85") (re.range "\xa0" "\xa0"))))(re.++ ((_ re.loop 1 3) (re.range "0" "9"))(re.++ (re.union (re.range "\x09" "\x0d")(re.union (re.range " " " ")(re.union (re.range "\x85" "\x85") (re.range "\xa0" "\xa0"))))(re.++ (re.* (re.union (re.range "\x00" "\x08")(re.union (re.range "\x0e" "\x1f")(re.union (re.range "!" "\x84")(re.union (re.range "\x86" "\x9f") (re.range "\xa1" "\xff"))))))(re.++ (re.union (re.range "\x09" "\x0d")(re.union (re.range " " " ")(re.union (re.range "\x85" "\x85") (re.range "\xa0" "\xa0"))))(re.++ (str.to_re (seq.++ "&" (seq.++ "q" (seq.++ "u" (seq.++ "o" (seq.++ "t" (seq.++ ";" "")))))))(re.++ (re.* (re.union (re.range "\x00" "\x09") (re.range "\x0b" "\xff")))(re.++ (str.to_re (seq.++ "&" (seq.++ "q" (seq.++ "u" (seq.++ "o" (seq.++ "t" (seq.++ ";" "")))))))(re.++ (re.union (re.range "\x09" "\x0d")(re.union (re.range " " " ")(re.union (re.range "\x85" "\x85") (re.range "\xa0" "\xa0"))))(re.++ (str.to_re (seq.++ "&" (seq.++ "q" (seq.++ "u" (seq.++ "o" (seq.++ "t" (seq.++ ";" "")))))))(re.++ (re.* (re.union (re.range "\x00" "\x09") (re.range "\x0b" "\xff"))) (str.to_re (seq.++ "&" (seq.++ "q" (seq.++ "u" (seq.++ "o" (seq.++ "t" (seq.++ ";" ""))))))))))))))))))))))))))))))))))))))))))))))))))))))))

;check that the regex contains some x
(assert (str.in_re x regexA))
;check also the concrete witnesses
(assert (str.in_re Witness1 regexA))
(assert (str.in_re Witness2 regexA))
(check-sat)
