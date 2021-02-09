;---
; using 8-bit bit-vectors as characters
; check membership of .Net regex
; regexA = ^\s*((?:(?:\d+(?:\x20+\w+\.?)+(?:(?:\x20+STREET|ST|DRIVE|DR|AVENUE|AVE|ROAD|RD|LOOP|COURT|CT|CIRCLE|LANE|LN|BOULEVARD|BLVD)\.?)?)|(?:(?:P\.\x20?O\.|P\x20?O)\x20*Box\x20+\d+)|(?:General\x20+Delivery)|(?:C[\\\/]O\x20+(?:\w+\x20*)+))\,?\x20*(?:(?:(?:APT|BLDG|DEPT|FL|HNGR|LOT|PIER|RM|S(?:LIP|PC|T(?:E|OP))|TRLR|UNIT|\x23)\.?\x20*(?:[a-zA-Z0-9\-]+))|(?:BSMT|FRNT|LBBY|LOWR|OFC|PH|REAR|SIDE|UPPR))?)\,?\s+((?:(?:\d+(?:\x20+\w+\.?)+(?:(?:\x20+STREET|ST|DRIVE|DR|AVENUE|AVE|ROAD|RD|LOOP|COURT|CT|CIRCLE|LANE|LN|BOULEVARD|BLVD)\.?)?)|(?:(?:P\.\x20?O\.|P\x20?O)\x20*Box\x20+\d+)|(?:General\x20+Delivery)|(?:C[\\\/]O\x20+(?:\w+\x20*)+))\,?\x20*(?:(?:(?:APT|BLDG|DEPT|FL|HNGR|LOT|PIER|RM|S(?:LIP|PC|T(?:E|OP))|TRLR|UNIT|\x23)\.?\x20*(?:[a-zA-Z0-9\-]+))|(?:BSMT|FRNT|LBBY|LOWR|OFC|PH|REAR|SIDE|UPPR))?)?\,?\s+((?:[A-Za-z]+\x20*)+)\,\s+(A[BLKSZRAP]|BC|C[AOT]|D[EC]|F[LM]|G[AU]|HI|I[ADLN]|K[SY]|LA|M[ABDEHINOPST]|N[BCDEHJLMSTUVY]|O[HKRN]|P[AERW]|QC|RI|S[CDK]|T[NX]|UT|V[AIT]|W[AIVY]|YT)\s+((\d{5}-\d{4})|(\d{5})|([AaBbCcEeGgHhJjKkLlMmNnPpRrSsTtVvXxYy]\d[A-Za-z]\s?\d[A-Za-z]\d))\s*$
;---
(set-info :status sat)
(set-option :print-success true)
(set-logic QF_BVRE)

(declare-const regexA (RegEx String))
(declare-const x String)

;witness1: "\u00A0POBox 97BSMT, \u0085\u00A0InPBmB,\u00A0KY\x987871"
(define-fun Witness1 () String (seq.++ "\xa0" (seq.++ "P" (seq.++ "O" (seq.++ "B" (seq.++ "o" (seq.++ "x" (seq.++ " " (seq.++ "9" (seq.++ "7" (seq.++ "B" (seq.++ "S" (seq.++ "M" (seq.++ "T" (seq.++ "," (seq.++ " " (seq.++ "\x85" (seq.++ "\xa0" (seq.++ "I" (seq.++ "n" (seq.++ "P" (seq.++ "B" (seq.++ "m" (seq.++ "B" (seq.++ "," (seq.++ "\xa0" (seq.++ "K" (seq.++ "Y" (seq.++ "\x09" (seq.++ "8" (seq.++ "7" (seq.++ "8" (seq.++ "7" (seq.++ "1" ""))))))))))))))))))))))))))))))))))
;witness2: "C/O 799\u00FE\u00B5\u00B5,   RM.   K,\xDC\O \u00D1fAW,LOWR,\u00A0   KJD , \u00A0VA\u00A0\xD\xD\xC\u008562368"
(define-fun Witness2 () String (seq.++ "C" (seq.++ "/" (seq.++ "O" (seq.++ " " (seq.++ "7" (seq.++ "9" (seq.++ "9" (seq.++ "\xfe" (seq.++ "\xb5" (seq.++ "\xb5" (seq.++ "," (seq.++ " " (seq.++ " " (seq.++ " " (seq.++ "R" (seq.++ "M" (seq.++ "." (seq.++ " " (seq.++ " " (seq.++ " " (seq.++ "K" (seq.++ "," (seq.++ "\x0d" (seq.++ "C" (seq.++ "\x5c" (seq.++ "O" (seq.++ " " (seq.++ "\xd1" (seq.++ "f" (seq.++ "A" (seq.++ "W" (seq.++ "," (seq.++ "L" (seq.++ "O" (seq.++ "W" (seq.++ "R" (seq.++ "," (seq.++ "\xa0" (seq.++ " " (seq.++ " " (seq.++ " " (seq.++ "K" (seq.++ "J" (seq.++ "D" (seq.++ " " (seq.++ "," (seq.++ " " (seq.++ "\xa0" (seq.++ "V" (seq.++ "A" (seq.++ "\xa0" (seq.++ "\x0d" (seq.++ "\x0d" (seq.++ "\x0c" (seq.++ "\x85" (seq.++ "6" (seq.++ "2" (seq.++ "3" (seq.++ "6" (seq.++ "8" "")))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

(assert (= regexA (re.++ (str.to_re "")(re.++ (re.* (re.union (re.range "\x09" "\x0d")(re.union (re.range " " " ")(re.union (re.range "\x85" "\x85") (re.range "\xa0" "\xa0")))))(re.++ (re.++ (re.union (re.++ (re.+ (re.range "0" "9"))(re.++ (re.+ (re.++ (re.+ (re.range " " " "))(re.++ (re.+ (re.union (re.range "0" "9")(re.union (re.range "A" "Z")(re.union (re.range "_" "_")(re.union (re.range "a" "z")(re.union (re.range "\xaa" "\xaa")(re.union (re.range "\xb5" "\xb5")(re.union (re.range "\xba" "\xba")(re.union (re.range "\xc0" "\xd6")(re.union (re.range "\xd8" "\xf6") (re.range "\xf8" "\xff"))))))))))) (re.opt (re.range "." "."))))) (re.opt (re.++ (re.union (re.++ (re.+ (re.range " " " ")) (str.to_re (seq.++ "S" (seq.++ "T" (seq.++ "R" (seq.++ "E" (seq.++ "E" (seq.++ "T" ""))))))))(re.union (str.to_re (seq.++ "S" (seq.++ "T" "")))(re.union (str.to_re (seq.++ "D" (seq.++ "R" (seq.++ "I" (seq.++ "V" (seq.++ "E" ""))))))(re.union (str.to_re (seq.++ "D" (seq.++ "R" "")))(re.union (str.to_re (seq.++ "A" (seq.++ "V" (seq.++ "E" (seq.++ "N" (seq.++ "U" (seq.++ "E" "")))))))(re.union (str.to_re (seq.++ "A" (seq.++ "V" (seq.++ "E" ""))))(re.union (str.to_re (seq.++ "R" (seq.++ "O" (seq.++ "A" (seq.++ "D" "")))))(re.union (str.to_re (seq.++ "R" (seq.++ "D" "")))(re.union (str.to_re (seq.++ "L" (seq.++ "O" (seq.++ "O" (seq.++ "P" "")))))(re.union (str.to_re (seq.++ "C" (seq.++ "O" (seq.++ "U" (seq.++ "R" (seq.++ "T" ""))))))(re.union (str.to_re (seq.++ "C" (seq.++ "T" "")))(re.union (str.to_re (seq.++ "C" (seq.++ "I" (seq.++ "R" (seq.++ "C" (seq.++ "L" (seq.++ "E" "")))))))(re.union (str.to_re (seq.++ "L" (seq.++ "A" (seq.++ "N" (seq.++ "E" "")))))(re.union (str.to_re (seq.++ "L" (seq.++ "N" "")))(re.union (str.to_re (seq.++ "B" (seq.++ "O" (seq.++ "U" (seq.++ "L" (seq.++ "E" (seq.++ "V" (seq.++ "A" (seq.++ "R" (seq.++ "D" "")))))))))) (str.to_re (seq.++ "B" (seq.++ "L" (seq.++ "V" (seq.++ "D" "")))))))))))))))))))) (re.opt (re.range "." "."))))))(re.union (re.++ (re.union (re.++ (str.to_re (seq.++ "P" (seq.++ "." "")))(re.++ (re.opt (re.range " " " ")) (str.to_re (seq.++ "O" (seq.++ "." ""))))) (re.++ (re.range "P" "P")(re.++ (re.opt (re.range " " " ")) (re.range "O" "O"))))(re.++ (re.* (re.range " " " "))(re.++ (str.to_re (seq.++ "B" (seq.++ "o" (seq.++ "x" ""))))(re.++ (re.+ (re.range " " " ")) (re.+ (re.range "0" "9"))))))(re.union (re.++ (str.to_re (seq.++ "G" (seq.++ "e" (seq.++ "n" (seq.++ "e" (seq.++ "r" (seq.++ "a" (seq.++ "l" ""))))))))(re.++ (re.+ (re.range " " " ")) (str.to_re (seq.++ "D" (seq.++ "e" (seq.++ "l" (seq.++ "i" (seq.++ "v" (seq.++ "e" (seq.++ "r" (seq.++ "y" ""))))))))))) (re.++ (re.range "C" "C")(re.++ (re.union (re.range "/" "/") (re.range "\x5c" "\x5c"))(re.++ (re.range "O" "O")(re.++ (re.+ (re.range " " " ")) (re.+ (re.++ (re.+ (re.union (re.range "0" "9")(re.union (re.range "A" "Z")(re.union (re.range "_" "_")(re.union (re.range "a" "z")(re.union (re.range "\xaa" "\xaa")(re.union (re.range "\xb5" "\xb5")(re.union (re.range "\xba" "\xba")(re.union (re.range "\xc0" "\xd6")(re.union (re.range "\xd8" "\xf6") (re.range "\xf8" "\xff"))))))))))) (re.* (re.range " " " ")))))))))))(re.++ (re.opt (re.range "," ","))(re.++ (re.* (re.range " " " ")) (re.opt (re.union (re.++ (re.union (str.to_re (seq.++ "A" (seq.++ "P" (seq.++ "T" ""))))(re.union (str.to_re (seq.++ "B" (seq.++ "L" (seq.++ "D" (seq.++ "G" "")))))(re.union (str.to_re (seq.++ "D" (seq.++ "E" (seq.++ "P" (seq.++ "T" "")))))(re.union (str.to_re (seq.++ "F" (seq.++ "L" "")))(re.union (str.to_re (seq.++ "H" (seq.++ "N" (seq.++ "G" (seq.++ "R" "")))))(re.union (str.to_re (seq.++ "L" (seq.++ "O" (seq.++ "T" ""))))(re.union (str.to_re (seq.++ "P" (seq.++ "I" (seq.++ "E" (seq.++ "R" "")))))(re.union (str.to_re (seq.++ "R" (seq.++ "M" "")))(re.union (re.++ (re.range "S" "S") (re.union (str.to_re (seq.++ "L" (seq.++ "I" (seq.++ "P" ""))))(re.union (str.to_re (seq.++ "P" (seq.++ "C" ""))) (re.++ (re.range "T" "T") (re.union (re.range "E" "E") (str.to_re (seq.++ "O" (seq.++ "P" ""))))))))(re.union (str.to_re (seq.++ "T" (seq.++ "R" (seq.++ "L" (seq.++ "R" "")))))(re.union (str.to_re (seq.++ "U" (seq.++ "N" (seq.++ "I" (seq.++ "T" ""))))) (re.range "#" "#"))))))))))))(re.++ (re.opt (re.range "." "."))(re.++ (re.* (re.range " " " ")) (re.+ (re.union (re.range "-" "-")(re.union (re.range "0" "9")(re.union (re.range "A" "Z") (re.range "a" "z"))))))))(re.union (str.to_re (seq.++ "B" (seq.++ "S" (seq.++ "M" (seq.++ "T" "")))))(re.union (str.to_re (seq.++ "F" (seq.++ "R" (seq.++ "N" (seq.++ "T" "")))))(re.union (str.to_re (seq.++ "L" (seq.++ "B" (seq.++ "B" (seq.++ "Y" "")))))(re.union (str.to_re (seq.++ "L" (seq.++ "O" (seq.++ "W" (seq.++ "R" "")))))(re.union (str.to_re (seq.++ "O" (seq.++ "F" (seq.++ "C" ""))))(re.union (str.to_re (seq.++ "P" (seq.++ "H" "")))(re.union (str.to_re (seq.++ "R" (seq.++ "E" (seq.++ "A" (seq.++ "R" "")))))(re.union (str.to_re (seq.++ "S" (seq.++ "I" (seq.++ "D" (seq.++ "E" ""))))) (str.to_re (seq.++ "U" (seq.++ "P" (seq.++ "P" (seq.++ "R" ""))))))))))))))))))(re.++ (re.opt (re.range "," ","))(re.++ (re.+ (re.union (re.range "\x09" "\x0d")(re.union (re.range " " " ")(re.union (re.range "\x85" "\x85") (re.range "\xa0" "\xa0")))))(re.++ (re.opt (re.++ (re.union (re.++ (re.+ (re.range "0" "9"))(re.++ (re.+ (re.++ (re.+ (re.range " " " "))(re.++ (re.+ (re.union (re.range "0" "9")(re.union (re.range "A" "Z")(re.union (re.range "_" "_")(re.union (re.range "a" "z")(re.union (re.range "\xaa" "\xaa")(re.union (re.range "\xb5" "\xb5")(re.union (re.range "\xba" "\xba")(re.union (re.range "\xc0" "\xd6")(re.union (re.range "\xd8" "\xf6") (re.range "\xf8" "\xff"))))))))))) (re.opt (re.range "." "."))))) (re.opt (re.++ (re.union (re.++ (re.+ (re.range " " " ")) (str.to_re (seq.++ "S" (seq.++ "T" (seq.++ "R" (seq.++ "E" (seq.++ "E" (seq.++ "T" ""))))))))(re.union (str.to_re (seq.++ "S" (seq.++ "T" "")))(re.union (str.to_re (seq.++ "D" (seq.++ "R" (seq.++ "I" (seq.++ "V" (seq.++ "E" ""))))))(re.union (str.to_re (seq.++ "D" (seq.++ "R" "")))(re.union (str.to_re (seq.++ "A" (seq.++ "V" (seq.++ "E" (seq.++ "N" (seq.++ "U" (seq.++ "E" "")))))))(re.union (str.to_re (seq.++ "A" (seq.++ "V" (seq.++ "E" ""))))(re.union (str.to_re (seq.++ "R" (seq.++ "O" (seq.++ "A" (seq.++ "D" "")))))(re.union (str.to_re (seq.++ "R" (seq.++ "D" "")))(re.union (str.to_re (seq.++ "L" (seq.++ "O" (seq.++ "O" (seq.++ "P" "")))))(re.union (str.to_re (seq.++ "C" (seq.++ "O" (seq.++ "U" (seq.++ "R" (seq.++ "T" ""))))))(re.union (str.to_re (seq.++ "C" (seq.++ "T" "")))(re.union (str.to_re (seq.++ "C" (seq.++ "I" (seq.++ "R" (seq.++ "C" (seq.++ "L" (seq.++ "E" "")))))))(re.union (str.to_re (seq.++ "L" (seq.++ "A" (seq.++ "N" (seq.++ "E" "")))))(re.union (str.to_re (seq.++ "L" (seq.++ "N" "")))(re.union (str.to_re (seq.++ "B" (seq.++ "O" (seq.++ "U" (seq.++ "L" (seq.++ "E" (seq.++ "V" (seq.++ "A" (seq.++ "R" (seq.++ "D" "")))))))))) (str.to_re (seq.++ "B" (seq.++ "L" (seq.++ "V" (seq.++ "D" "")))))))))))))))))))) (re.opt (re.range "." "."))))))(re.union (re.++ (re.union (re.++ (str.to_re (seq.++ "P" (seq.++ "." "")))(re.++ (re.opt (re.range " " " ")) (str.to_re (seq.++ "O" (seq.++ "." ""))))) (re.++ (re.range "P" "P")(re.++ (re.opt (re.range " " " ")) (re.range "O" "O"))))(re.++ (re.* (re.range " " " "))(re.++ (str.to_re (seq.++ "B" (seq.++ "o" (seq.++ "x" ""))))(re.++ (re.+ (re.range " " " ")) (re.+ (re.range "0" "9"))))))(re.union (re.++ (str.to_re (seq.++ "G" (seq.++ "e" (seq.++ "n" (seq.++ "e" (seq.++ "r" (seq.++ "a" (seq.++ "l" ""))))))))(re.++ (re.+ (re.range " " " ")) (str.to_re (seq.++ "D" (seq.++ "e" (seq.++ "l" (seq.++ "i" (seq.++ "v" (seq.++ "e" (seq.++ "r" (seq.++ "y" ""))))))))))) (re.++ (re.range "C" "C")(re.++ (re.union (re.range "/" "/") (re.range "\x5c" "\x5c"))(re.++ (re.range "O" "O")(re.++ (re.+ (re.range " " " ")) (re.+ (re.++ (re.+ (re.union (re.range "0" "9")(re.union (re.range "A" "Z")(re.union (re.range "_" "_")(re.union (re.range "a" "z")(re.union (re.range "\xaa" "\xaa")(re.union (re.range "\xb5" "\xb5")(re.union (re.range "\xba" "\xba")(re.union (re.range "\xc0" "\xd6")(re.union (re.range "\xd8" "\xf6") (re.range "\xf8" "\xff"))))))))))) (re.* (re.range " " " ")))))))))))(re.++ (re.opt (re.range "," ","))(re.++ (re.* (re.range " " " ")) (re.opt (re.union (re.++ (re.union (str.to_re (seq.++ "A" (seq.++ "P" (seq.++ "T" ""))))(re.union (str.to_re (seq.++ "B" (seq.++ "L" (seq.++ "D" (seq.++ "G" "")))))(re.union (str.to_re (seq.++ "D" (seq.++ "E" (seq.++ "P" (seq.++ "T" "")))))(re.union (str.to_re (seq.++ "F" (seq.++ "L" "")))(re.union (str.to_re (seq.++ "H" (seq.++ "N" (seq.++ "G" (seq.++ "R" "")))))(re.union (str.to_re (seq.++ "L" (seq.++ "O" (seq.++ "T" ""))))(re.union (str.to_re (seq.++ "P" (seq.++ "I" (seq.++ "E" (seq.++ "R" "")))))(re.union (str.to_re (seq.++ "R" (seq.++ "M" "")))(re.union (re.++ (re.range "S" "S") (re.union (str.to_re (seq.++ "L" (seq.++ "I" (seq.++ "P" ""))))(re.union (str.to_re (seq.++ "P" (seq.++ "C" ""))) (re.++ (re.range "T" "T") (re.union (re.range "E" "E") (str.to_re (seq.++ "O" (seq.++ "P" ""))))))))(re.union (str.to_re (seq.++ "T" (seq.++ "R" (seq.++ "L" (seq.++ "R" "")))))(re.union (str.to_re (seq.++ "U" (seq.++ "N" (seq.++ "I" (seq.++ "T" ""))))) (re.range "#" "#"))))))))))))(re.++ (re.opt (re.range "." "."))(re.++ (re.* (re.range " " " ")) (re.+ (re.union (re.range "-" "-")(re.union (re.range "0" "9")(re.union (re.range "A" "Z") (re.range "a" "z"))))))))(re.union (str.to_re (seq.++ "B" (seq.++ "S" (seq.++ "M" (seq.++ "T" "")))))(re.union (str.to_re (seq.++ "F" (seq.++ "R" (seq.++ "N" (seq.++ "T" "")))))(re.union (str.to_re (seq.++ "L" (seq.++ "B" (seq.++ "B" (seq.++ "Y" "")))))(re.union (str.to_re (seq.++ "L" (seq.++ "O" (seq.++ "W" (seq.++ "R" "")))))(re.union (str.to_re (seq.++ "O" (seq.++ "F" (seq.++ "C" ""))))(re.union (str.to_re (seq.++ "P" (seq.++ "H" "")))(re.union (str.to_re (seq.++ "R" (seq.++ "E" (seq.++ "A" (seq.++ "R" "")))))(re.union (str.to_re (seq.++ "S" (seq.++ "I" (seq.++ "D" (seq.++ "E" ""))))) (str.to_re (seq.++ "U" (seq.++ "P" (seq.++ "P" (seq.++ "R" "")))))))))))))))))))(re.++ (re.opt (re.range "," ","))(re.++ (re.+ (re.union (re.range "\x09" "\x0d")(re.union (re.range " " " ")(re.union (re.range "\x85" "\x85") (re.range "\xa0" "\xa0")))))(re.++ (re.+ (re.++ (re.+ (re.union (re.range "A" "Z") (re.range "a" "z"))) (re.* (re.range " " " "))))(re.++ (re.range "," ",")(re.++ (re.+ (re.union (re.range "\x09" "\x0d")(re.union (re.range " " " ")(re.union (re.range "\x85" "\x85") (re.range "\xa0" "\xa0")))))(re.++ (re.union (re.++ (re.range "A" "A") (re.union (re.range "A" "B")(re.union (re.range "K" "L")(re.union (re.range "P" "P")(re.union (re.range "R" "S") (re.range "Z" "Z"))))))(re.union (str.to_re (seq.++ "B" (seq.++ "C" "")))(re.union (re.++ (re.range "C" "C") (re.union (re.range "A" "A")(re.union (re.range "O" "O") (re.range "T" "T"))))(re.union (re.++ (re.range "D" "D") (re.union (re.range "C" "C") (re.range "E" "E")))(re.union (re.++ (re.range "F" "F") (re.range "L" "M"))(re.union (re.++ (re.range "G" "G") (re.union (re.range "A" "A") (re.range "U" "U")))(re.union (str.to_re (seq.++ "H" (seq.++ "I" "")))(re.union (re.++ (re.range "I" "I") (re.union (re.range "A" "A")(re.union (re.range "D" "D")(re.union (re.range "L" "L") (re.range "N" "N")))))(re.union (re.++ (re.range "K" "K") (re.union (re.range "S" "S") (re.range "Y" "Y")))(re.union (str.to_re (seq.++ "L" (seq.++ "A" "")))(re.union (re.++ (re.range "M" "M") (re.union (re.range "A" "B")(re.union (re.range "D" "E")(re.union (re.range "H" "I")(re.union (re.range "N" "P") (re.range "S" "T"))))))(re.union (re.++ (re.range "N" "N") (re.union (re.range "B" "E")(re.union (re.range "H" "H")(re.union (re.range "J" "J")(re.union (re.range "L" "M")(re.union (re.range "S" "V") (re.range "Y" "Y")))))))(re.union (re.++ (re.range "O" "O") (re.union (re.range "H" "H")(re.union (re.range "K" "K")(re.union (re.range "N" "N") (re.range "R" "R")))))(re.union (re.++ (re.range "P" "P") (re.union (re.range "A" "A")(re.union (re.range "E" "E")(re.union (re.range "R" "R") (re.range "W" "W")))))(re.union (str.to_re (seq.++ "Q" (seq.++ "C" "")))(re.union (str.to_re (seq.++ "R" (seq.++ "I" "")))(re.union (re.++ (re.range "S" "S") (re.union (re.range "C" "D") (re.range "K" "K")))(re.union (re.++ (re.range "T" "T") (re.union (re.range "N" "N") (re.range "X" "X")))(re.union (str.to_re (seq.++ "U" (seq.++ "T" "")))(re.union (re.++ (re.range "V" "V") (re.union (re.range "A" "A")(re.union (re.range "I" "I") (re.range "T" "T"))))(re.union (re.++ (re.range "W" "W") (re.union (re.range "A" "A")(re.union (re.range "I" "I")(re.union (re.range "V" "V") (re.range "Y" "Y"))))) (str.to_re (seq.++ "Y" (seq.++ "T" ""))))))))))))))))))))))))(re.++ (re.+ (re.union (re.range "\x09" "\x0d")(re.union (re.range " " " ")(re.union (re.range "\x85" "\x85") (re.range "\xa0" "\xa0")))))(re.++ (re.union (re.++ ((_ re.loop 5 5) (re.range "0" "9"))(re.++ (re.range "-" "-") ((_ re.loop 4 4) (re.range "0" "9"))))(re.union ((_ re.loop 5 5) (re.range "0" "9")) (re.++ (re.union (re.range "A" "C")(re.union (re.range "E" "E")(re.union (re.range "G" "H")(re.union (re.range "J" "N")(re.union (re.range "P" "P")(re.union (re.range "R" "T")(re.union (re.range "V" "V")(re.union (re.range "X" "Y")(re.union (re.range "a" "c")(re.union (re.range "e" "e")(re.union (re.range "g" "h")(re.union (re.range "j" "n")(re.union (re.range "p" "p")(re.union (re.range "r" "t")(re.union (re.range "v" "v") (re.range "x" "y"))))))))))))))))(re.++ (re.range "0" "9")(re.++ (re.union (re.range "A" "Z") (re.range "a" "z"))(re.++ (re.opt (re.union (re.range "\x09" "\x0d")(re.union (re.range " " " ")(re.union (re.range "\x85" "\x85") (re.range "\xa0" "\xa0")))))(re.++ (re.range "0" "9")(re.++ (re.union (re.range "A" "Z") (re.range "a" "z")) (re.range "0" "9")))))))))(re.++ (re.* (re.union (re.range "\x09" "\x0d")(re.union (re.range " " " ")(re.union (re.range "\x85" "\x85") (re.range "\xa0" "\xa0"))))) (str.to_re ""))))))))))))))))))

;check that the regex contains some x
(assert (str.in_re x regexA))
;check also the concrete witnesses
(assert (str.in_re Witness1 regexA))
(assert (str.in_re Witness2 regexA))
(check-sat)
