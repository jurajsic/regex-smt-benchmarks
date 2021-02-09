;---
; using 8-bit bit-vectors as characters
; check membership of .Net regex
; regexA = A(?:CCESS|LLEY|PPROACH|R(?:CADE|TERY)|VE(?:NUE)?)|B(?:A(?:NK|SIN|Y)|E(?:ACH|ND)|L(?:DG|VD)|O(?:ULEVARD|ARDWALK|WL)|R(?:ACE|AE|EAK|IDGE|O(?:ADWAY|OK|W))|UILDING|YPASS)|C(?:A(?:NAL|USEWAY)|ENTRE(?:WAY)?|HASE|IRC(?:LET?|U(?:IT|S))|L(?:OSE)?|O(?:MMON|NCOURSE|PSE|R(?:NER|SO)|UR(?:SE|T(?:YARD)?)|VE)|R(?:ES(?:CENT|T)?|IEF|OSS(?:ING)?)|U(?:LDESAC|RVE))|D(?:ALE|EVIATION|IP|OWNS|R(?:IVE(?:WAY)?)?)|E(?:ASEMENT|DGE|LBOW|N(?:D|TRANCE)|S(?:PLANADE|TATE)|X(?:P(?:(?:RESS)?WAY)|TENSION))|F(?:AIRWAY|IRETRAIL|O(?:LLOW|R(?:D|MATION))|R(?:(?:EEWAY|ONT(?:AGE)?)))|G(?:A(?:P|RDENS?|TE(?:S|WAY)?)|L(?:ADE|EN)|R(?:ANGE|EEN|O(?:UND|VET?)))|H(?:AVEN|E(?:ATH|IGHTS)|I(?:GHWAY|LL)|UB|WY)|I(?:NTER(?:CHANGE)?|SLAND)|JUNCTION|K(?:EY|NOLL)|L(?:A(?:NE(?:WAY)?)?|IN(?:E|K)|O(?:O(?:KOUT|P)|WER))|M(?:ALL|E(?:A(?:D|NDER)|WS)|OTORWAY)|NOOK|O(?:UTLOOK|VERPASS)|P(?:A(?:R(?:ADE|K(?:LANDS|WAY)?)|SS|TH(?:WAY)?)|DE|IER|L(?:A(?:CE|ZA))?|O(?:CKET|INT|RT)|RO(?:MENADE|PERTY)|URSUIT)?|QUA(?:D(?:RANT)?|YS?)|R(?:AMBLE|D|E(?:ACH|S(?:ERVE|T)|T(?:REAT|URN))|I(?:D(?:E|GE)|NG|S(?:E|ING))|O(?:AD(?:WAY)?|TARY|U(?:ND|TE)|W)|UN)|S(?:(?:ER(?:VICE)?WAY)|IDING|LOPE|PUR|QUARE|T(?:EPS|RAND|R(?:EET|IP))?|UBWAY)|T(?:ARN|CE|ERRACE|HRO(?:UGHWAY|WAY)|O(?:LLWAY|P|R)|RA(?:CK|IL)|URN)|UNDERPASS|V(?:AL(?:E|LEY)|I(?:EW|STA))|W(?:A(?:LK(?:WAY)?|Y)|HARF|YND)
;---
(set-info :status sat)
(set-option :print-success true)
(set-logic QF_BVRE)

(declare-const regexA (RegEx String))
(declare-const x String)

;witness1: "KNOLL"
(define-fun Witness1 () String (seq.++ "K" (seq.++ "N" (seq.++ "O" (seq.++ "L" (seq.++ "L" ""))))))
;witness2: "HEATH"
(define-fun Witness2 () String (seq.++ "H" (seq.++ "E" (seq.++ "A" (seq.++ "T" (seq.++ "H" ""))))))

(assert (= regexA (re.union (re.++ (re.range "A" "A") (re.union (str.to_re (seq.++ "C" (seq.++ "C" (seq.++ "E" (seq.++ "S" (seq.++ "S" ""))))))(re.union (str.to_re (seq.++ "L" (seq.++ "L" (seq.++ "E" (seq.++ "Y" "")))))(re.union (str.to_re (seq.++ "P" (seq.++ "P" (seq.++ "R" (seq.++ "O" (seq.++ "A" (seq.++ "C" (seq.++ "H" ""))))))))(re.union (re.++ (re.range "R" "R") (re.union (str.to_re (seq.++ "C" (seq.++ "A" (seq.++ "D" (seq.++ "E" ""))))) (str.to_re (seq.++ "T" (seq.++ "E" (seq.++ "R" (seq.++ "Y" ""))))))) (re.++ (str.to_re (seq.++ "V" (seq.++ "E" ""))) (re.opt (str.to_re (seq.++ "N" (seq.++ "U" (seq.++ "E" "")))))))))))(re.union (re.++ (re.range "B" "B") (re.union (re.++ (re.range "A" "A") (re.union (str.to_re (seq.++ "N" (seq.++ "K" "")))(re.union (str.to_re (seq.++ "S" (seq.++ "I" (seq.++ "N" "")))) (re.range "Y" "Y"))))(re.union (re.++ (re.range "E" "E") (re.union (str.to_re (seq.++ "A" (seq.++ "C" (seq.++ "H" "")))) (str.to_re (seq.++ "N" (seq.++ "D" "")))))(re.union (re.++ (re.range "L" "L") (re.union (str.to_re (seq.++ "D" (seq.++ "G" ""))) (str.to_re (seq.++ "V" (seq.++ "D" "")))))(re.union (re.++ (re.range "O" "O") (re.union (str.to_re (seq.++ "U" (seq.++ "L" (seq.++ "E" (seq.++ "V" (seq.++ "A" (seq.++ "R" (seq.++ "D" ""))))))))(re.union (str.to_re (seq.++ "A" (seq.++ "R" (seq.++ "D" (seq.++ "W" (seq.++ "A" (seq.++ "L" (seq.++ "K" "")))))))) (str.to_re (seq.++ "W" (seq.++ "L" ""))))))(re.union (re.++ (re.range "R" "R") (re.union (str.to_re (seq.++ "A" (seq.++ "C" (seq.++ "E" ""))))(re.union (str.to_re (seq.++ "A" (seq.++ "E" "")))(re.union (str.to_re (seq.++ "E" (seq.++ "A" (seq.++ "K" ""))))(re.union (str.to_re (seq.++ "I" (seq.++ "D" (seq.++ "G" (seq.++ "E" ""))))) (re.++ (re.range "O" "O") (re.union (str.to_re (seq.++ "A" (seq.++ "D" (seq.++ "W" (seq.++ "A" (seq.++ "Y" ""))))))(re.union (str.to_re (seq.++ "O" (seq.++ "K" ""))) (re.range "W" "W")))))))))(re.union (str.to_re (seq.++ "U" (seq.++ "I" (seq.++ "L" (seq.++ "D" (seq.++ "I" (seq.++ "N" (seq.++ "G" "")))))))) (str.to_re (seq.++ "Y" (seq.++ "P" (seq.++ "A" (seq.++ "S" (seq.++ "S" "")))))))))))))(re.union (re.++ (re.range "C" "C") (re.union (re.++ (re.range "A" "A") (re.union (str.to_re (seq.++ "N" (seq.++ "A" (seq.++ "L" "")))) (str.to_re (seq.++ "U" (seq.++ "S" (seq.++ "E" (seq.++ "W" (seq.++ "A" (seq.++ "Y" "")))))))))(re.union (re.++ (str.to_re (seq.++ "E" (seq.++ "N" (seq.++ "T" (seq.++ "R" (seq.++ "E" "")))))) (re.opt (str.to_re (seq.++ "W" (seq.++ "A" (seq.++ "Y" ""))))))(re.union (str.to_re (seq.++ "H" (seq.++ "A" (seq.++ "S" (seq.++ "E" "")))))(re.union (re.++ (str.to_re (seq.++ "I" (seq.++ "R" (seq.++ "C" "")))) (re.union (re.++ (str.to_re (seq.++ "L" (seq.++ "E" ""))) (re.opt (re.range "T" "T"))) (re.++ (re.range "U" "U") (re.union (str.to_re (seq.++ "I" (seq.++ "T" ""))) (re.range "S" "S")))))(re.union (re.++ (re.range "L" "L") (re.opt (str.to_re (seq.++ "O" (seq.++ "S" (seq.++ "E" ""))))))(re.union (re.++ (re.range "O" "O") (re.union (str.to_re (seq.++ "M" (seq.++ "M" (seq.++ "O" (seq.++ "N" "")))))(re.union (str.to_re (seq.++ "N" (seq.++ "C" (seq.++ "O" (seq.++ "U" (seq.++ "R" (seq.++ "S" (seq.++ "E" ""))))))))(re.union (str.to_re (seq.++ "P" (seq.++ "S" (seq.++ "E" ""))))(re.union (re.++ (re.range "R" "R") (re.union (str.to_re (seq.++ "N" (seq.++ "E" (seq.++ "R" "")))) (str.to_re (seq.++ "S" (seq.++ "O" "")))))(re.union (re.++ (str.to_re (seq.++ "U" (seq.++ "R" ""))) (re.union (str.to_re (seq.++ "S" (seq.++ "E" ""))) (re.++ (re.range "T" "T") (re.opt (str.to_re (seq.++ "Y" (seq.++ "A" (seq.++ "R" (seq.++ "D" ""))))))))) (str.to_re (seq.++ "V" (seq.++ "E" "")))))))))(re.union (re.++ (re.range "R" "R") (re.union (re.++ (str.to_re (seq.++ "E" (seq.++ "S" ""))) (re.opt (re.union (str.to_re (seq.++ "C" (seq.++ "E" (seq.++ "N" (seq.++ "T" ""))))) (re.range "T" "T"))))(re.union (str.to_re (seq.++ "I" (seq.++ "E" (seq.++ "F" "")))) (re.++ (str.to_re (seq.++ "O" (seq.++ "S" (seq.++ "S" "")))) (re.opt (str.to_re (seq.++ "I" (seq.++ "N" (seq.++ "G" ""))))))))) (re.++ (re.range "U" "U") (re.union (str.to_re (seq.++ "L" (seq.++ "D" (seq.++ "E" (seq.++ "S" (seq.++ "A" (seq.++ "C" ""))))))) (str.to_re (seq.++ "R" (seq.++ "V" (seq.++ "E" ""))))))))))))))(re.union (re.++ (re.range "D" "D") (re.union (str.to_re (seq.++ "A" (seq.++ "L" (seq.++ "E" ""))))(re.union (str.to_re (seq.++ "E" (seq.++ "V" (seq.++ "I" (seq.++ "A" (seq.++ "T" (seq.++ "I" (seq.++ "O" (seq.++ "N" "")))))))))(re.union (str.to_re (seq.++ "I" (seq.++ "P" "")))(re.union (str.to_re (seq.++ "O" (seq.++ "W" (seq.++ "N" (seq.++ "S" ""))))) (re.++ (re.range "R" "R") (re.opt (re.++ (str.to_re (seq.++ "I" (seq.++ "V" (seq.++ "E" "")))) (re.opt (str.to_re (seq.++ "W" (seq.++ "A" (seq.++ "Y" "")))))))))))))(re.union (re.++ (re.range "E" "E") (re.union (str.to_re (seq.++ "A" (seq.++ "S" (seq.++ "E" (seq.++ "M" (seq.++ "E" (seq.++ "N" (seq.++ "T" ""))))))))(re.union (str.to_re (seq.++ "D" (seq.++ "G" (seq.++ "E" ""))))(re.union (str.to_re (seq.++ "L" (seq.++ "B" (seq.++ "O" (seq.++ "W" "")))))(re.union (re.++ (re.range "N" "N") (re.union (re.range "D" "D") (str.to_re (seq.++ "T" (seq.++ "R" (seq.++ "A" (seq.++ "N" (seq.++ "C" (seq.++ "E" "")))))))))(re.union (re.++ (re.range "S" "S") (re.union (str.to_re (seq.++ "P" (seq.++ "L" (seq.++ "A" (seq.++ "N" (seq.++ "A" (seq.++ "D" (seq.++ "E" "")))))))) (str.to_re (seq.++ "T" (seq.++ "A" (seq.++ "T" (seq.++ "E" ""))))))) (re.++ (re.range "X" "X") (re.union (re.++ (re.range "P" "P")(re.++ (re.opt (str.to_re (seq.++ "R" (seq.++ "E" (seq.++ "S" (seq.++ "S" "")))))) (str.to_re (seq.++ "W" (seq.++ "A" (seq.++ "Y" "")))))) (str.to_re (seq.++ "T" (seq.++ "E" (seq.++ "N" (seq.++ "S" (seq.++ "I" (seq.++ "O" (seq.++ "N" ""))))))))))))))))(re.union (re.++ (re.range "F" "F") (re.union (str.to_re (seq.++ "A" (seq.++ "I" (seq.++ "R" (seq.++ "W" (seq.++ "A" (seq.++ "Y" "")))))))(re.union (str.to_re (seq.++ "I" (seq.++ "R" (seq.++ "E" (seq.++ "T" (seq.++ "R" (seq.++ "A" (seq.++ "I" (seq.++ "L" "")))))))))(re.union (re.++ (re.range "O" "O") (re.union (str.to_re (seq.++ "L" (seq.++ "L" (seq.++ "O" (seq.++ "W" ""))))) (re.++ (re.range "R" "R") (re.union (re.range "D" "D") (str.to_re (seq.++ "M" (seq.++ "A" (seq.++ "T" (seq.++ "I" (seq.++ "O" (seq.++ "N" ""))))))))))) (re.++ (re.range "R" "R") (re.union (str.to_re (seq.++ "E" (seq.++ "E" (seq.++ "W" (seq.++ "A" (seq.++ "Y" "")))))) (re.++ (str.to_re (seq.++ "O" (seq.++ "N" (seq.++ "T" "")))) (re.opt (str.to_re (seq.++ "A" (seq.++ "G" (seq.++ "E" ""))))))))))))(re.union (re.++ (re.range "G" "G") (re.union (re.++ (re.range "A" "A") (re.union (re.range "P" "P")(re.union (re.++ (str.to_re (seq.++ "R" (seq.++ "D" (seq.++ "E" (seq.++ "N" ""))))) (re.opt (re.range "S" "S"))) (re.++ (str.to_re (seq.++ "T" (seq.++ "E" ""))) (re.opt (re.union (re.range "S" "S") (str.to_re (seq.++ "W" (seq.++ "A" (seq.++ "Y" ""))))))))))(re.union (re.++ (re.range "L" "L") (re.union (str.to_re (seq.++ "A" (seq.++ "D" (seq.++ "E" "")))) (str.to_re (seq.++ "E" (seq.++ "N" ""))))) (re.++ (re.range "R" "R") (re.union (str.to_re (seq.++ "A" (seq.++ "N" (seq.++ "G" (seq.++ "E" "")))))(re.union (str.to_re (seq.++ "E" (seq.++ "E" (seq.++ "N" "")))) (re.++ (re.range "O" "O") (re.union (str.to_re (seq.++ "U" (seq.++ "N" (seq.++ "D" "")))) (re.++ (str.to_re (seq.++ "V" (seq.++ "E" ""))) (re.opt (re.range "T" "T")))))))))))(re.union (re.++ (re.range "H" "H") (re.union (str.to_re (seq.++ "A" (seq.++ "V" (seq.++ "E" (seq.++ "N" "")))))(re.union (re.++ (re.range "E" "E") (re.union (str.to_re (seq.++ "A" (seq.++ "T" (seq.++ "H" "")))) (str.to_re (seq.++ "I" (seq.++ "G" (seq.++ "H" (seq.++ "T" (seq.++ "S" ""))))))))(re.union (re.++ (re.range "I" "I") (re.union (str.to_re (seq.++ "G" (seq.++ "H" (seq.++ "W" (seq.++ "A" (seq.++ "Y" "")))))) (str.to_re (seq.++ "L" (seq.++ "L" "")))))(re.union (str.to_re (seq.++ "U" (seq.++ "B" ""))) (str.to_re (seq.++ "W" (seq.++ "Y" ""))))))))(re.union (re.++ (re.range "I" "I") (re.union (re.++ (str.to_re (seq.++ "N" (seq.++ "T" (seq.++ "E" (seq.++ "R" ""))))) (re.opt (str.to_re (seq.++ "C" (seq.++ "H" (seq.++ "A" (seq.++ "N" (seq.++ "G" (seq.++ "E" ""))))))))) (str.to_re (seq.++ "S" (seq.++ "L" (seq.++ "A" (seq.++ "N" (seq.++ "D" ""))))))))(re.union (str.to_re (seq.++ "J" (seq.++ "U" (seq.++ "N" (seq.++ "C" (seq.++ "T" (seq.++ "I" (seq.++ "O" (seq.++ "N" "")))))))))(re.union (re.++ (re.range "K" "K") (re.union (str.to_re (seq.++ "E" (seq.++ "Y" ""))) (str.to_re (seq.++ "N" (seq.++ "O" (seq.++ "L" (seq.++ "L" "")))))))(re.union (re.++ (re.range "L" "L") (re.union (re.++ (re.range "A" "A") (re.opt (re.++ (str.to_re (seq.++ "N" (seq.++ "E" ""))) (re.opt (str.to_re (seq.++ "W" (seq.++ "A" (seq.++ "Y" ""))))))))(re.union (re.++ (str.to_re (seq.++ "I" (seq.++ "N" ""))) (re.union (re.range "E" "E") (re.range "K" "K"))) (re.++ (re.range "O" "O") (re.union (re.++ (re.range "O" "O") (re.union (str.to_re (seq.++ "K" (seq.++ "O" (seq.++ "U" (seq.++ "T" ""))))) (re.range "P" "P"))) (str.to_re (seq.++ "W" (seq.++ "E" (seq.++ "R" "")))))))))(re.union (re.++ (re.range "M" "M") (re.union (str.to_re (seq.++ "A" (seq.++ "L" (seq.++ "L" ""))))(re.union (re.++ (re.range "E" "E") (re.union (re.++ (re.range "A" "A") (re.union (re.range "D" "D") (str.to_re (seq.++ "N" (seq.++ "D" (seq.++ "E" (seq.++ "R" ""))))))) (str.to_re (seq.++ "W" (seq.++ "S" ""))))) (str.to_re (seq.++ "O" (seq.++ "T" (seq.++ "O" (seq.++ "R" (seq.++ "W" (seq.++ "A" (seq.++ "Y" "")))))))))))(re.union (str.to_re (seq.++ "N" (seq.++ "O" (seq.++ "O" (seq.++ "K" "")))))(re.union (re.++ (re.range "O" "O") (re.union (str.to_re (seq.++ "U" (seq.++ "T" (seq.++ "L" (seq.++ "O" (seq.++ "O" (seq.++ "K" ""))))))) (str.to_re (seq.++ "V" (seq.++ "E" (seq.++ "R" (seq.++ "P" (seq.++ "A" (seq.++ "S" (seq.++ "S" ""))))))))))(re.union (re.++ (re.range "P" "P") (re.opt (re.union (re.++ (re.range "A" "A") (re.union (re.++ (re.range "R" "R") (re.union (str.to_re (seq.++ "A" (seq.++ "D" (seq.++ "E" "")))) (re.++ (re.range "K" "K") (re.opt (re.union (str.to_re (seq.++ "L" (seq.++ "A" (seq.++ "N" (seq.++ "D" (seq.++ "S" "")))))) (str.to_re (seq.++ "W" (seq.++ "A" (seq.++ "Y" "")))))))))(re.union (str.to_re (seq.++ "S" (seq.++ "S" ""))) (re.++ (str.to_re (seq.++ "T" (seq.++ "H" ""))) (re.opt (str.to_re (seq.++ "W" (seq.++ "A" (seq.++ "Y" "")))))))))(re.union (str.to_re (seq.++ "D" (seq.++ "E" "")))(re.union (str.to_re (seq.++ "I" (seq.++ "E" (seq.++ "R" ""))))(re.union (re.++ (re.range "L" "L") (re.opt (re.++ (re.range "A" "A") (re.union (str.to_re (seq.++ "C" (seq.++ "E" ""))) (str.to_re (seq.++ "Z" (seq.++ "A" "")))))))(re.union (re.++ (re.range "O" "O") (re.union (str.to_re (seq.++ "C" (seq.++ "K" (seq.++ "E" (seq.++ "T" "")))))(re.union (str.to_re (seq.++ "I" (seq.++ "N" (seq.++ "T" "")))) (str.to_re (seq.++ "R" (seq.++ "T" ""))))))(re.union (re.++ (str.to_re (seq.++ "R" (seq.++ "O" ""))) (re.union (str.to_re (seq.++ "M" (seq.++ "E" (seq.++ "N" (seq.++ "A" (seq.++ "D" (seq.++ "E" ""))))))) (str.to_re (seq.++ "P" (seq.++ "E" (seq.++ "R" (seq.++ "T" (seq.++ "Y" "")))))))) (str.to_re (seq.++ "U" (seq.++ "R" (seq.++ "S" (seq.++ "U" (seq.++ "I" (seq.++ "T" "")))))))))))))))(re.union (re.++ (str.to_re (seq.++ "Q" (seq.++ "U" (seq.++ "A" "")))) (re.union (re.++ (re.range "D" "D") (re.opt (str.to_re (seq.++ "R" (seq.++ "A" (seq.++ "N" (seq.++ "T" ""))))))) (re.++ (re.range "Y" "Y") (re.opt (re.range "S" "S")))))(re.union (re.++ (re.range "R" "R") (re.union (str.to_re (seq.++ "A" (seq.++ "M" (seq.++ "B" (seq.++ "L" (seq.++ "E" ""))))))(re.union (re.range "D" "D")(re.union (re.++ (re.range "E" "E") (re.union (str.to_re (seq.++ "A" (seq.++ "C" (seq.++ "H" ""))))(re.union (re.++ (re.range "S" "S") (re.union (str.to_re (seq.++ "E" (seq.++ "R" (seq.++ "V" (seq.++ "E" ""))))) (re.range "T" "T"))) (re.++ (re.range "T" "T") (re.union (str.to_re (seq.++ "R" (seq.++ "E" (seq.++ "A" (seq.++ "T" ""))))) (str.to_re (seq.++ "U" (seq.++ "R" (seq.++ "N" "")))))))))(re.union (re.++ (re.range "I" "I") (re.union (re.++ (re.range "D" "D") (re.union (re.range "E" "E") (str.to_re (seq.++ "G" (seq.++ "E" "")))))(re.union (str.to_re (seq.++ "N" (seq.++ "G" ""))) (re.++ (re.range "S" "S") (re.union (re.range "E" "E") (str.to_re (seq.++ "I" (seq.++ "N" (seq.++ "G" "")))))))))(re.union (re.++ (re.range "O" "O") (re.union (re.++ (str.to_re (seq.++ "A" (seq.++ "D" ""))) (re.opt (str.to_re (seq.++ "W" (seq.++ "A" (seq.++ "Y" ""))))))(re.union (str.to_re (seq.++ "T" (seq.++ "A" (seq.++ "R" (seq.++ "Y" "")))))(re.union (re.++ (re.range "U" "U") (re.union (str.to_re (seq.++ "N" (seq.++ "D" ""))) (str.to_re (seq.++ "T" (seq.++ "E" ""))))) (re.range "W" "W"))))) (str.to_re (seq.++ "U" (seq.++ "N" "")))))))))(re.union (re.++ (re.range "S" "S") (re.union (re.++ (str.to_re (seq.++ "E" (seq.++ "R" "")))(re.++ (re.opt (str.to_re (seq.++ "V" (seq.++ "I" (seq.++ "C" (seq.++ "E" "")))))) (str.to_re (seq.++ "W" (seq.++ "A" (seq.++ "Y" ""))))))(re.union (str.to_re (seq.++ "I" (seq.++ "D" (seq.++ "I" (seq.++ "N" (seq.++ "G" ""))))))(re.union (str.to_re (seq.++ "L" (seq.++ "O" (seq.++ "P" (seq.++ "E" "")))))(re.union (str.to_re (seq.++ "P" (seq.++ "U" (seq.++ "R" ""))))(re.union (str.to_re (seq.++ "Q" (seq.++ "U" (seq.++ "A" (seq.++ "R" (seq.++ "E" ""))))))(re.union (re.++ (re.range "T" "T") (re.opt (re.union (str.to_re (seq.++ "E" (seq.++ "P" (seq.++ "S" ""))))(re.union (str.to_re (seq.++ "R" (seq.++ "A" (seq.++ "N" (seq.++ "D" ""))))) (re.++ (re.range "R" "R") (re.union (str.to_re (seq.++ "E" (seq.++ "E" (seq.++ "T" "")))) (str.to_re (seq.++ "I" (seq.++ "P" ""))))))))) (str.to_re (seq.++ "U" (seq.++ "B" (seq.++ "W" (seq.++ "A" (seq.++ "Y" "")))))))))))))(re.union (re.++ (re.range "T" "T") (re.union (str.to_re (seq.++ "A" (seq.++ "R" (seq.++ "N" ""))))(re.union (str.to_re (seq.++ "C" (seq.++ "E" "")))(re.union (str.to_re (seq.++ "E" (seq.++ "R" (seq.++ "R" (seq.++ "A" (seq.++ "C" (seq.++ "E" "")))))))(re.union (re.++ (str.to_re (seq.++ "H" (seq.++ "R" (seq.++ "O" "")))) (re.union (str.to_re (seq.++ "U" (seq.++ "G" (seq.++ "H" (seq.++ "W" (seq.++ "A" (seq.++ "Y" ""))))))) (str.to_re (seq.++ "W" (seq.++ "A" (seq.++ "Y" ""))))))(re.union (re.++ (re.range "O" "O") (re.union (str.to_re (seq.++ "L" (seq.++ "L" (seq.++ "W" (seq.++ "A" (seq.++ "Y" "")))))) (re.union (re.range "P" "P") (re.range "R" "R"))))(re.union (re.++ (str.to_re (seq.++ "R" (seq.++ "A" ""))) (re.union (str.to_re (seq.++ "C" (seq.++ "K" ""))) (str.to_re (seq.++ "I" (seq.++ "L" ""))))) (str.to_re (seq.++ "U" (seq.++ "R" (seq.++ "N" "")))))))))))(re.union (str.to_re (seq.++ "U" (seq.++ "N" (seq.++ "D" (seq.++ "E" (seq.++ "R" (seq.++ "P" (seq.++ "A" (seq.++ "S" (seq.++ "S" ""))))))))))(re.union (re.++ (re.range "V" "V") (re.union (re.++ (str.to_re (seq.++ "A" (seq.++ "L" ""))) (re.union (re.range "E" "E") (str.to_re (seq.++ "L" (seq.++ "E" (seq.++ "Y" "")))))) (re.++ (re.range "I" "I") (re.union (str.to_re (seq.++ "E" (seq.++ "W" ""))) (str.to_re (seq.++ "S" (seq.++ "T" (seq.++ "A" "")))))))) (re.++ (re.range "W" "W") (re.union (re.++ (re.range "A" "A") (re.union (re.++ (str.to_re (seq.++ "L" (seq.++ "K" ""))) (re.opt (str.to_re (seq.++ "W" (seq.++ "A" (seq.++ "Y" "")))))) (re.range "Y" "Y")))(re.union (str.to_re (seq.++ "H" (seq.++ "A" (seq.++ "R" (seq.++ "F" ""))))) (str.to_re (seq.++ "Y" (seq.++ "N" (seq.++ "D" "")))))))))))))))))))))))))))))))

;check that the regex contains some x
(assert (str.in_re x regexA))
;check also the concrete witnesses
(assert (str.in_re Witness1 regexA))
(assert (str.in_re Witness2 regexA))
(check-sat)