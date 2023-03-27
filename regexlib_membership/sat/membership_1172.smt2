;---
; using 8-bit bit-vectors as characters
; check membership of .Net regex
; regexA = (((file|gopher|news|nntp|telnet|http|ftp|https|ftps|sftp)://)|(www\.))+(([a-zA-Z0-9\._-]+\.[a-zA-Z]{2,6})|([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}))(/[a-zA-Z0-9\&amp;%_\./-~-]*)?
;---
;(set-info :status sat)
;(set-option :print-success true)
(set-logic QF_S)

(declare-const regexA RegLan)
(declare-const x String)

;witness1: "G\u0098http://telnet://ftp://gopher://ftp://ftp://gopher://nntp://ftps://http://sftp://gopher://telnet://https://sftp://sftp://news://news://sftp://ftps://nntp://nntp://http://gopher://ftp://nntp://https://news://gopher://news://nntp://www.telnet://https://www.ftps://file://telnet://https://nntp://ftp://https://5.3.809.61"
(define-fun Witness1 () String (str.++ "G" (str.++ "\u{98}" (str.++ "h" (str.++ "t" (str.++ "t" (str.++ "p" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "t" (str.++ "e" (str.++ "l" (str.++ "n" (str.++ "e" (str.++ "t" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "f" (str.++ "t" (str.++ "p" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "g" (str.++ "o" (str.++ "p" (str.++ "h" (str.++ "e" (str.++ "r" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "f" (str.++ "t" (str.++ "p" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "f" (str.++ "t" (str.++ "p" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "g" (str.++ "o" (str.++ "p" (str.++ "h" (str.++ "e" (str.++ "r" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "n" (str.++ "n" (str.++ "t" (str.++ "p" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "f" (str.++ "t" (str.++ "p" (str.++ "s" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "h" (str.++ "t" (str.++ "t" (str.++ "p" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "s" (str.++ "f" (str.++ "t" (str.++ "p" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "g" (str.++ "o" (str.++ "p" (str.++ "h" (str.++ "e" (str.++ "r" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "t" (str.++ "e" (str.++ "l" (str.++ "n" (str.++ "e" (str.++ "t" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "h" (str.++ "t" (str.++ "t" (str.++ "p" (str.++ "s" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "s" (str.++ "f" (str.++ "t" (str.++ "p" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "s" (str.++ "f" (str.++ "t" (str.++ "p" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "n" (str.++ "e" (str.++ "w" (str.++ "s" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "n" (str.++ "e" (str.++ "w" (str.++ "s" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "s" (str.++ "f" (str.++ "t" (str.++ "p" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "f" (str.++ "t" (str.++ "p" (str.++ "s" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "n" (str.++ "n" (str.++ "t" (str.++ "p" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "n" (str.++ "n" (str.++ "t" (str.++ "p" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "h" (str.++ "t" (str.++ "t" (str.++ "p" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "g" (str.++ "o" (str.++ "p" (str.++ "h" (str.++ "e" (str.++ "r" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "f" (str.++ "t" (str.++ "p" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "n" (str.++ "n" (str.++ "t" (str.++ "p" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "h" (str.++ "t" (str.++ "t" (str.++ "p" (str.++ "s" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "n" (str.++ "e" (str.++ "w" (str.++ "s" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "g" (str.++ "o" (str.++ "p" (str.++ "h" (str.++ "e" (str.++ "r" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "n" (str.++ "e" (str.++ "w" (str.++ "s" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "n" (str.++ "n" (str.++ "t" (str.++ "p" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "w" (str.++ "w" (str.++ "w" (str.++ "." (str.++ "t" (str.++ "e" (str.++ "l" (str.++ "n" (str.++ "e" (str.++ "t" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "h" (str.++ "t" (str.++ "t" (str.++ "p" (str.++ "s" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "w" (str.++ "w" (str.++ "w" (str.++ "." (str.++ "f" (str.++ "t" (str.++ "p" (str.++ "s" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "f" (str.++ "i" (str.++ "l" (str.++ "e" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "t" (str.++ "e" (str.++ "l" (str.++ "n" (str.++ "e" (str.++ "t" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "h" (str.++ "t" (str.++ "t" (str.++ "p" (str.++ "s" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "n" (str.++ "n" (str.++ "t" (str.++ "p" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "f" (str.++ "t" (str.++ "p" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "h" (str.++ "t" (str.++ "t" (str.++ "p" (str.++ "s" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "5" (str.++ "." (str.++ "3" (str.++ "." (str.++ "8" (str.++ "0" (str.++ "9" (str.++ "." (str.++ "6" (str.++ "1" "")))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
;witness2: "telnet://gopher://sftp://https://ftp://nntp://ftps://ftp://http://www.http://www.news://ftps://https://sftp://https://http://gopher://www.ftp://www.https://https://http://telnet://nntp://ftps://ftp://http://ftp://telnet://ftp://www.sftp://news://www.ftp://telnet://nntp://news://telnet://ftps://gopher://file://telnet://www.news://file://ftp://sftp://www.sftp://file://file://ftps://news://gopher://a.Jt"
(define-fun Witness2 () String (str.++ "t" (str.++ "e" (str.++ "l" (str.++ "n" (str.++ "e" (str.++ "t" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "g" (str.++ "o" (str.++ "p" (str.++ "h" (str.++ "e" (str.++ "r" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "s" (str.++ "f" (str.++ "t" (str.++ "p" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "h" (str.++ "t" (str.++ "t" (str.++ "p" (str.++ "s" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "f" (str.++ "t" (str.++ "p" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "n" (str.++ "n" (str.++ "t" (str.++ "p" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "f" (str.++ "t" (str.++ "p" (str.++ "s" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "f" (str.++ "t" (str.++ "p" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "h" (str.++ "t" (str.++ "t" (str.++ "p" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "w" (str.++ "w" (str.++ "w" (str.++ "." (str.++ "h" (str.++ "t" (str.++ "t" (str.++ "p" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "w" (str.++ "w" (str.++ "w" (str.++ "." (str.++ "n" (str.++ "e" (str.++ "w" (str.++ "s" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "f" (str.++ "t" (str.++ "p" (str.++ "s" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "h" (str.++ "t" (str.++ "t" (str.++ "p" (str.++ "s" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "s" (str.++ "f" (str.++ "t" (str.++ "p" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "h" (str.++ "t" (str.++ "t" (str.++ "p" (str.++ "s" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "h" (str.++ "t" (str.++ "t" (str.++ "p" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "g" (str.++ "o" (str.++ "p" (str.++ "h" (str.++ "e" (str.++ "r" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "w" (str.++ "w" (str.++ "w" (str.++ "." (str.++ "f" (str.++ "t" (str.++ "p" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "w" (str.++ "w" (str.++ "w" (str.++ "." (str.++ "h" (str.++ "t" (str.++ "t" (str.++ "p" (str.++ "s" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "h" (str.++ "t" (str.++ "t" (str.++ "p" (str.++ "s" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "h" (str.++ "t" (str.++ "t" (str.++ "p" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "t" (str.++ "e" (str.++ "l" (str.++ "n" (str.++ "e" (str.++ "t" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "n" (str.++ "n" (str.++ "t" (str.++ "p" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "f" (str.++ "t" (str.++ "p" (str.++ "s" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "f" (str.++ "t" (str.++ "p" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "h" (str.++ "t" (str.++ "t" (str.++ "p" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "f" (str.++ "t" (str.++ "p" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "t" (str.++ "e" (str.++ "l" (str.++ "n" (str.++ "e" (str.++ "t" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "f" (str.++ "t" (str.++ "p" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "w" (str.++ "w" (str.++ "w" (str.++ "." (str.++ "s" (str.++ "f" (str.++ "t" (str.++ "p" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "n" (str.++ "e" (str.++ "w" (str.++ "s" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "w" (str.++ "w" (str.++ "w" (str.++ "." (str.++ "f" (str.++ "t" (str.++ "p" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "t" (str.++ "e" (str.++ "l" (str.++ "n" (str.++ "e" (str.++ "t" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "n" (str.++ "n" (str.++ "t" (str.++ "p" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "n" (str.++ "e" (str.++ "w" (str.++ "s" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "t" (str.++ "e" (str.++ "l" (str.++ "n" (str.++ "e" (str.++ "t" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "f" (str.++ "t" (str.++ "p" (str.++ "s" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "g" (str.++ "o" (str.++ "p" (str.++ "h" (str.++ "e" (str.++ "r" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "f" (str.++ "i" (str.++ "l" (str.++ "e" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "t" (str.++ "e" (str.++ "l" (str.++ "n" (str.++ "e" (str.++ "t" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "w" (str.++ "w" (str.++ "w" (str.++ "." (str.++ "n" (str.++ "e" (str.++ "w" (str.++ "s" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "f" (str.++ "i" (str.++ "l" (str.++ "e" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "f" (str.++ "t" (str.++ "p" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "s" (str.++ "f" (str.++ "t" (str.++ "p" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "w" (str.++ "w" (str.++ "w" (str.++ "." (str.++ "s" (str.++ "f" (str.++ "t" (str.++ "p" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "f" (str.++ "i" (str.++ "l" (str.++ "e" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "f" (str.++ "i" (str.++ "l" (str.++ "e" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "f" (str.++ "t" (str.++ "p" (str.++ "s" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "n" (str.++ "e" (str.++ "w" (str.++ "s" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "g" (str.++ "o" (str.++ "p" (str.++ "h" (str.++ "e" (str.++ "r" (str.++ ":" (str.++ "/" (str.++ "/" (str.++ "a" (str.++ "." (str.++ "J" (str.++ "t" ""))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

(assert (= regexA (re.++ (re.+ (re.union (re.++ (re.union (str.to_re (str.++ "f" (str.++ "i" (str.++ "l" (str.++ "e" "")))))(re.union (str.to_re (str.++ "g" (str.++ "o" (str.++ "p" (str.++ "h" (str.++ "e" (str.++ "r" "")))))))(re.union (str.to_re (str.++ "n" (str.++ "e" (str.++ "w" (str.++ "s" "")))))(re.union (str.to_re (str.++ "n" (str.++ "n" (str.++ "t" (str.++ "p" "")))))(re.union (str.to_re (str.++ "t" (str.++ "e" (str.++ "l" (str.++ "n" (str.++ "e" (str.++ "t" "")))))))(re.union (str.to_re (str.++ "h" (str.++ "t" (str.++ "t" (str.++ "p" "")))))(re.union (str.to_re (str.++ "f" (str.++ "t" (str.++ "p" ""))))(re.union (str.to_re (str.++ "h" (str.++ "t" (str.++ "t" (str.++ "p" (str.++ "s" ""))))))(re.union (str.to_re (str.++ "f" (str.++ "t" (str.++ "p" (str.++ "s" ""))))) (str.to_re (str.++ "s" (str.++ "f" (str.++ "t" (str.++ "p" "")))))))))))))) (str.to_re (str.++ ":" (str.++ "/" (str.++ "/" ""))))) (str.to_re (str.++ "w" (str.++ "w" (str.++ "w" (str.++ "." "")))))))(re.++ (re.union (re.++ (re.+ (re.union (re.range "-" ".")(re.union (re.range "0" "9")(re.union (re.range "A" "Z")(re.union (re.range "_" "_") (re.range "a" "z"))))))(re.++ (re.range "." ".") ((_ re.loop 2 6) (re.union (re.range "A" "Z") (re.range "a" "z"))))) (re.++ ((_ re.loop 1 3) (re.range "0" "9"))(re.++ (re.range "." ".")(re.++ ((_ re.loop 1 3) (re.range "0" "9"))(re.++ (re.range "." ".")(re.++ ((_ re.loop 1 3) (re.range "0" "9"))(re.++ (re.range "." ".") ((_ re.loop 1 3) (re.range "0" "9"))))))))) (re.opt (re.++ (re.range "/" "/") (re.* (re.union (re.range "%" "&") (re.range "-" "~")))))))))

;check that the regex contains some x
(assert (str.in_re x regexA))
;check also the concrete witnesses
(assert (str.in_re Witness1 regexA))
(assert (str.in_re Witness2 regexA))
(check-sat)
