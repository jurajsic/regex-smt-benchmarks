;---
; using 8-bit bit-vectors as characters
; check membership of .Net regex
; regexA = ^(A(BW|FG|GO|IA|L(A|B)|N(D|T)|R(E|G|M)|SM|T(A|F|G)|U(S|T)|ZE)|B(DI|E(L|N)|FA|G(D|R)|H(R|S)|IH|L(M|R|Z)|MU|OL|R(A|B|N)|TN|VT|WA)|C(A(F|N)|CK|H(E|L|N)|IV|MR|O(D|G|K|L|M)|PV|RI|UB|XR|Y(M|P)|ZE)|D(EU|JI|MA|NK|OM|ZA)|E(CU|GY|RI|S(H|P|T)|TH)|F(IN|JI|LK|R(A|O)|SM)|G(AB|BR|EO|GY|HA|I(B|N)|LP|MB|NQ|NB|R(C|D|L)|TM|U(F|M|Y))|H(KG|MD|ND|RV|TI|UN)|I(DN|MN|ND|OT|R(L|N|Q)|S(L|R)|TA)|J(AM|EY|OR|PN)|K(AZ|EN|GZ|HM|IR|NA|OR|WT)|L(AO|B(N|R|Y)|CA|IE|KA|SO|TU|UX|VA)|M(A(C|F|R)|CO|D(A|G|V)|EX|HL|KD|L(I|T)|MR|N(E|G|P)|OZ|RT|SR|TQ|US|WI|Y(S|T))|N(AM|CL|ER|FK|GA|I(C|U)|LD|OR|PL|RU|ZL)|OMN|P(A(K|N)|CN|ER|HL|LW|NG|OL|R(I|K|T|Y)|SE|YF)|QAT|R(EU|OU|US|WA)|S(AU|DN|EN|G(P|S)|HN|JM|L(B|E|V)|MR|OM|PM|RB|TP|UR|V(K|N)|W(E|Z)|Y(C|R))|T(C(A|D)|GO|HA|JK|K(L|M)|LS|ON|TO|U(N|R|V)|WN|ZA)|U(EN|GA|KR|MI|RY|SA|ZB)|V(AT|CT|GB|IR|NM|UT)|W(LF|SM)|YEM|Z(AF|MB|WE))$
;---
(set-info :status sat)
(set-option :print-success true)
(set-logic QF_BVRE)

(declare-const regexA (RegEx String))
(declare-const x String)

;witness1: "NAM"
(define-fun Witness1 () String (seq.++ "N" (seq.++ "A" (seq.++ "M" ""))))
;witness2: "GHA"
(define-fun Witness2 () String (seq.++ "G" (seq.++ "H" (seq.++ "A" ""))))

(assert (= regexA (re.++ (str.to_re "")(re.++ (re.union (re.++ (re.range "A" "A") (re.union (str.to_re (seq.++ "B" (seq.++ "W" "")))(re.union (str.to_re (seq.++ "F" (seq.++ "G" "")))(re.union (str.to_re (seq.++ "G" (seq.++ "O" "")))(re.union (str.to_re (seq.++ "I" (seq.++ "A" "")))(re.union (re.++ (re.range "L" "L") (re.range "A" "B"))(re.union (re.++ (re.range "N" "N") (re.union (re.range "D" "D") (re.range "T" "T")))(re.union (re.++ (re.range "R" "R") (re.union (re.range "E" "E")(re.union (re.range "G" "G") (re.range "M" "M"))))(re.union (str.to_re (seq.++ "S" (seq.++ "M" "")))(re.union (re.++ (re.range "T" "T") (re.union (re.range "A" "A") (re.range "F" "G")))(re.union (re.++ (re.range "U" "U") (re.range "S" "T")) (str.to_re (seq.++ "Z" (seq.++ "E" ""))))))))))))))(re.union (re.++ (re.range "B" "B") (re.union (str.to_re (seq.++ "D" (seq.++ "I" "")))(re.union (re.++ (re.range "E" "E") (re.union (re.range "L" "L") (re.range "N" "N")))(re.union (str.to_re (seq.++ "F" (seq.++ "A" "")))(re.union (re.++ (re.range "G" "G") (re.union (re.range "D" "D") (re.range "R" "R")))(re.union (re.++ (re.range "H" "H") (re.range "R" "S"))(re.union (str.to_re (seq.++ "I" (seq.++ "H" "")))(re.union (re.++ (re.range "L" "L") (re.union (re.range "M" "M")(re.union (re.range "R" "R") (re.range "Z" "Z"))))(re.union (str.to_re (seq.++ "M" (seq.++ "U" "")))(re.union (str.to_re (seq.++ "O" (seq.++ "L" "")))(re.union (re.++ (re.range "R" "R") (re.union (re.range "A" "B") (re.range "N" "N")))(re.union (str.to_re (seq.++ "T" (seq.++ "N" "")))(re.union (str.to_re (seq.++ "V" (seq.++ "T" ""))) (str.to_re (seq.++ "W" (seq.++ "A" ""))))))))))))))))(re.union (re.++ (re.range "C" "C") (re.union (re.++ (re.range "A" "A") (re.union (re.range "F" "F") (re.range "N" "N")))(re.union (str.to_re (seq.++ "C" (seq.++ "K" "")))(re.union (re.++ (re.range "H" "H") (re.union (re.range "E" "E")(re.union (re.range "L" "L") (re.range "N" "N"))))(re.union (str.to_re (seq.++ "I" (seq.++ "V" "")))(re.union (str.to_re (seq.++ "M" (seq.++ "R" "")))(re.union (re.++ (re.range "O" "O") (re.union (re.range "D" "D")(re.union (re.range "G" "G") (re.range "K" "M"))))(re.union (str.to_re (seq.++ "P" (seq.++ "V" "")))(re.union (str.to_re (seq.++ "R" (seq.++ "I" "")))(re.union (str.to_re (seq.++ "U" (seq.++ "B" "")))(re.union (str.to_re (seq.++ "X" (seq.++ "R" "")))(re.union (re.++ (re.range "Y" "Y") (re.union (re.range "M" "M") (re.range "P" "P"))) (str.to_re (seq.++ "Z" (seq.++ "E" "")))))))))))))))(re.union (re.++ (re.range "D" "D") (re.union (str.to_re (seq.++ "E" (seq.++ "U" "")))(re.union (str.to_re (seq.++ "J" (seq.++ "I" "")))(re.union (str.to_re (seq.++ "M" (seq.++ "A" "")))(re.union (str.to_re (seq.++ "N" (seq.++ "K" "")))(re.union (str.to_re (seq.++ "O" (seq.++ "M" ""))) (str.to_re (seq.++ "Z" (seq.++ "A" "")))))))))(re.union (re.++ (re.range "E" "E") (re.union (str.to_re (seq.++ "C" (seq.++ "U" "")))(re.union (str.to_re (seq.++ "G" (seq.++ "Y" "")))(re.union (str.to_re (seq.++ "R" (seq.++ "I" "")))(re.union (re.++ (re.range "S" "S") (re.union (re.range "H" "H")(re.union (re.range "P" "P") (re.range "T" "T")))) (str.to_re (seq.++ "T" (seq.++ "H" ""))))))))(re.union (re.++ (re.range "F" "F") (re.union (str.to_re (seq.++ "I" (seq.++ "N" "")))(re.union (str.to_re (seq.++ "J" (seq.++ "I" "")))(re.union (str.to_re (seq.++ "L" (seq.++ "K" "")))(re.union (re.++ (re.range "R" "R") (re.union (re.range "A" "A") (re.range "O" "O"))) (str.to_re (seq.++ "S" (seq.++ "M" ""))))))))(re.union (re.++ (re.range "G" "G") (re.union (str.to_re (seq.++ "A" (seq.++ "B" "")))(re.union (str.to_re (seq.++ "B" (seq.++ "R" "")))(re.union (str.to_re (seq.++ "E" (seq.++ "O" "")))(re.union (str.to_re (seq.++ "G" (seq.++ "Y" "")))(re.union (str.to_re (seq.++ "H" (seq.++ "A" "")))(re.union (re.++ (re.range "I" "I") (re.union (re.range "B" "B") (re.range "N" "N")))(re.union (str.to_re (seq.++ "L" (seq.++ "P" "")))(re.union (str.to_re (seq.++ "M" (seq.++ "B" "")))(re.union (str.to_re (seq.++ "N" (seq.++ "Q" "")))(re.union (str.to_re (seq.++ "N" (seq.++ "B" "")))(re.union (re.++ (re.range "R" "R") (re.union (re.range "C" "D") (re.range "L" "L")))(re.union (str.to_re (seq.++ "T" (seq.++ "M" ""))) (re.++ (re.range "U" "U") (re.union (re.range "F" "F")(re.union (re.range "M" "M") (re.range "Y" "Y")))))))))))))))))(re.union (re.++ (re.range "H" "H") (re.union (str.to_re (seq.++ "K" (seq.++ "G" "")))(re.union (str.to_re (seq.++ "M" (seq.++ "D" "")))(re.union (str.to_re (seq.++ "N" (seq.++ "D" "")))(re.union (str.to_re (seq.++ "R" (seq.++ "V" "")))(re.union (str.to_re (seq.++ "T" (seq.++ "I" ""))) (str.to_re (seq.++ "U" (seq.++ "N" "")))))))))(re.union (re.++ (re.range "I" "I") (re.union (str.to_re (seq.++ "D" (seq.++ "N" "")))(re.union (str.to_re (seq.++ "M" (seq.++ "N" "")))(re.union (str.to_re (seq.++ "N" (seq.++ "D" "")))(re.union (str.to_re (seq.++ "O" (seq.++ "T" "")))(re.union (re.++ (re.range "R" "R") (re.union (re.range "L" "L")(re.union (re.range "N" "N") (re.range "Q" "Q"))))(re.union (re.++ (re.range "S" "S") (re.union (re.range "L" "L") (re.range "R" "R"))) (str.to_re (seq.++ "T" (seq.++ "A" ""))))))))))(re.union (re.++ (re.range "J" "J") (re.union (str.to_re (seq.++ "A" (seq.++ "M" "")))(re.union (str.to_re (seq.++ "E" (seq.++ "Y" "")))(re.union (str.to_re (seq.++ "O" (seq.++ "R" ""))) (str.to_re (seq.++ "P" (seq.++ "N" "")))))))(re.union (re.++ (re.range "K" "K") (re.union (str.to_re (seq.++ "A" (seq.++ "Z" "")))(re.union (str.to_re (seq.++ "E" (seq.++ "N" "")))(re.union (str.to_re (seq.++ "G" (seq.++ "Z" "")))(re.union (str.to_re (seq.++ "H" (seq.++ "M" "")))(re.union (str.to_re (seq.++ "I" (seq.++ "R" "")))(re.union (str.to_re (seq.++ "N" (seq.++ "A" "")))(re.union (str.to_re (seq.++ "O" (seq.++ "R" ""))) (str.to_re (seq.++ "W" (seq.++ "T" "")))))))))))(re.union (re.++ (re.range "L" "L") (re.union (str.to_re (seq.++ "A" (seq.++ "O" "")))(re.union (re.++ (re.range "B" "B") (re.union (re.range "N" "N")(re.union (re.range "R" "R") (re.range "Y" "Y"))))(re.union (str.to_re (seq.++ "C" (seq.++ "A" "")))(re.union (str.to_re (seq.++ "I" (seq.++ "E" "")))(re.union (str.to_re (seq.++ "K" (seq.++ "A" "")))(re.union (str.to_re (seq.++ "S" (seq.++ "O" "")))(re.union (str.to_re (seq.++ "T" (seq.++ "U" "")))(re.union (str.to_re (seq.++ "U" (seq.++ "X" ""))) (str.to_re (seq.++ "V" (seq.++ "A" ""))))))))))))(re.union (re.++ (re.range "M" "M") (re.union (re.++ (re.range "A" "A") (re.union (re.range "C" "C")(re.union (re.range "F" "F") (re.range "R" "R"))))(re.union (str.to_re (seq.++ "C" (seq.++ "O" "")))(re.union (re.++ (re.range "D" "D") (re.union (re.range "A" "A")(re.union (re.range "G" "G") (re.range "V" "V"))))(re.union (str.to_re (seq.++ "E" (seq.++ "X" "")))(re.union (str.to_re (seq.++ "H" (seq.++ "L" "")))(re.union (str.to_re (seq.++ "K" (seq.++ "D" "")))(re.union (re.++ (re.range "L" "L") (re.union (re.range "I" "I") (re.range "T" "T")))(re.union (str.to_re (seq.++ "M" (seq.++ "R" "")))(re.union (re.++ (re.range "N" "N") (re.union (re.range "E" "E")(re.union (re.range "G" "G") (re.range "P" "P"))))(re.union (str.to_re (seq.++ "O" (seq.++ "Z" "")))(re.union (str.to_re (seq.++ "R" (seq.++ "T" "")))(re.union (str.to_re (seq.++ "S" (seq.++ "R" "")))(re.union (str.to_re (seq.++ "T" (seq.++ "Q" "")))(re.union (str.to_re (seq.++ "U" (seq.++ "S" "")))(re.union (str.to_re (seq.++ "W" (seq.++ "I" ""))) (re.++ (re.range "Y" "Y") (re.range "S" "T"))))))))))))))))))(re.union (re.++ (re.range "N" "N") (re.union (str.to_re (seq.++ "A" (seq.++ "M" "")))(re.union (str.to_re (seq.++ "C" (seq.++ "L" "")))(re.union (str.to_re (seq.++ "E" (seq.++ "R" "")))(re.union (str.to_re (seq.++ "F" (seq.++ "K" "")))(re.union (str.to_re (seq.++ "G" (seq.++ "A" "")))(re.union (re.++ (re.range "I" "I") (re.union (re.range "C" "C") (re.range "U" "U")))(re.union (str.to_re (seq.++ "L" (seq.++ "D" "")))(re.union (str.to_re (seq.++ "O" (seq.++ "R" "")))(re.union (str.to_re (seq.++ "P" (seq.++ "L" "")))(re.union (str.to_re (seq.++ "R" (seq.++ "U" ""))) (str.to_re (seq.++ "Z" (seq.++ "L" ""))))))))))))))(re.union (str.to_re (seq.++ "O" (seq.++ "M" (seq.++ "N" ""))))(re.union (re.++ (re.range "P" "P") (re.union (re.++ (re.range "A" "A") (re.union (re.range "K" "K") (re.range "N" "N")))(re.union (str.to_re (seq.++ "C" (seq.++ "N" "")))(re.union (str.to_re (seq.++ "E" (seq.++ "R" "")))(re.union (str.to_re (seq.++ "H" (seq.++ "L" "")))(re.union (str.to_re (seq.++ "L" (seq.++ "W" "")))(re.union (str.to_re (seq.++ "N" (seq.++ "G" "")))(re.union (str.to_re (seq.++ "O" (seq.++ "L" "")))(re.union (re.++ (re.range "R" "R") (re.union (re.range "I" "I")(re.union (re.range "K" "K")(re.union (re.range "T" "T") (re.range "Y" "Y")))))(re.union (str.to_re (seq.++ "S" (seq.++ "E" ""))) (str.to_re (seq.++ "Y" (seq.++ "F" "")))))))))))))(re.union (str.to_re (seq.++ "Q" (seq.++ "A" (seq.++ "T" ""))))(re.union (re.++ (re.range "R" "R") (re.union (str.to_re (seq.++ "E" (seq.++ "U" "")))(re.union (str.to_re (seq.++ "O" (seq.++ "U" "")))(re.union (str.to_re (seq.++ "U" (seq.++ "S" ""))) (str.to_re (seq.++ "W" (seq.++ "A" "")))))))(re.union (re.++ (re.range "S" "S") (re.union (str.to_re (seq.++ "A" (seq.++ "U" "")))(re.union (str.to_re (seq.++ "D" (seq.++ "N" "")))(re.union (str.to_re (seq.++ "E" (seq.++ "N" "")))(re.union (re.++ (re.range "G" "G") (re.union (re.range "P" "P") (re.range "S" "S")))(re.union (str.to_re (seq.++ "H" (seq.++ "N" "")))(re.union (str.to_re (seq.++ "J" (seq.++ "M" "")))(re.union (re.++ (re.range "L" "L") (re.union (re.range "B" "B")(re.union (re.range "E" "E") (re.range "V" "V"))))(re.union (str.to_re (seq.++ "M" (seq.++ "R" "")))(re.union (str.to_re (seq.++ "O" (seq.++ "M" "")))(re.union (str.to_re (seq.++ "P" (seq.++ "M" "")))(re.union (str.to_re (seq.++ "R" (seq.++ "B" "")))(re.union (str.to_re (seq.++ "T" (seq.++ "P" "")))(re.union (str.to_re (seq.++ "U" (seq.++ "R" "")))(re.union (re.++ (re.range "V" "V") (re.union (re.range "K" "K") (re.range "N" "N")))(re.union (re.++ (re.range "W" "W") (re.union (re.range "E" "E") (re.range "Z" "Z"))) (re.++ (re.range "Y" "Y") (re.union (re.range "C" "C") (re.range "R" "R")))))))))))))))))))(re.union (re.++ (re.range "T" "T") (re.union (re.++ (re.range "C" "C") (re.union (re.range "A" "A") (re.range "D" "D")))(re.union (str.to_re (seq.++ "G" (seq.++ "O" "")))(re.union (str.to_re (seq.++ "H" (seq.++ "A" "")))(re.union (str.to_re (seq.++ "J" (seq.++ "K" "")))(re.union (re.++ (re.range "K" "K") (re.range "L" "M"))(re.union (str.to_re (seq.++ "L" (seq.++ "S" "")))(re.union (str.to_re (seq.++ "O" (seq.++ "N" "")))(re.union (str.to_re (seq.++ "T" (seq.++ "O" "")))(re.union (re.++ (re.range "U" "U") (re.union (re.range "N" "N")(re.union (re.range "R" "R") (re.range "V" "V"))))(re.union (str.to_re (seq.++ "W" (seq.++ "N" ""))) (str.to_re (seq.++ "Z" (seq.++ "A" ""))))))))))))))(re.union (re.++ (re.range "U" "U") (re.union (str.to_re (seq.++ "E" (seq.++ "N" "")))(re.union (str.to_re (seq.++ "G" (seq.++ "A" "")))(re.union (str.to_re (seq.++ "K" (seq.++ "R" "")))(re.union (str.to_re (seq.++ "M" (seq.++ "I" "")))(re.union (str.to_re (seq.++ "R" (seq.++ "Y" "")))(re.union (str.to_re (seq.++ "S" (seq.++ "A" ""))) (str.to_re (seq.++ "Z" (seq.++ "B" ""))))))))))(re.union (re.++ (re.range "V" "V") (re.union (str.to_re (seq.++ "A" (seq.++ "T" "")))(re.union (str.to_re (seq.++ "C" (seq.++ "T" "")))(re.union (str.to_re (seq.++ "G" (seq.++ "B" "")))(re.union (str.to_re (seq.++ "I" (seq.++ "R" "")))(re.union (str.to_re (seq.++ "N" (seq.++ "M" ""))) (str.to_re (seq.++ "U" (seq.++ "T" "")))))))))(re.union (re.++ (re.range "W" "W") (re.union (str.to_re (seq.++ "L" (seq.++ "F" ""))) (str.to_re (seq.++ "S" (seq.++ "M" "")))))(re.union (str.to_re (seq.++ "Y" (seq.++ "E" (seq.++ "M" "")))) (re.++ (re.range "Z" "Z") (re.union (str.to_re (seq.++ "A" (seq.++ "F" "")))(re.union (str.to_re (seq.++ "M" (seq.++ "B" ""))) (str.to_re (seq.++ "W" (seq.++ "E" "")))))))))))))))))))))))))))))) (str.to_re "")))))

;check that the regex contains some x
(assert (str.in_re x regexA))
;check also the concrete witnesses
(assert (str.in_re Witness1 regexA))
(assert (str.in_re Witness2 regexA))
(check-sat)
