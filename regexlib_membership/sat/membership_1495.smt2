;---
; using 8-bit bit-vectors as characters
; check membership of .Net regex
; regexA = ^((((0?[13578])|(1[02]))[\/|\-]?((0?[1-9]|[0-2][0-9])|(3[01])))|(((0?[469])|(11))[\/|\-]?((0?[1-9]|[0-2][0-9])|(30)))|(0?[2][\/\-]?(0?[1-9]|[0-2][0-9])))[\/\-]?\d{2,4}$
;---
(set-info :status sat)
(set-option :print-success true)
(set-logic QF_BVRE)

(declare-const regexA (RegEx String))
(declare-const x String)

;witness1: "11|30/998"
(define-fun Witness1 () String (seq.++ "1" (seq.++ "1" (seq.++ "|" (seq.++ "3" (seq.++ "0" (seq.++ "/" (seq.++ "9" (seq.++ "9" (seq.++ "8" ""))))))))))
;witness2: "11|2-6822"
(define-fun Witness2 () String (seq.++ "1" (seq.++ "1" (seq.++ "|" (seq.++ "2" (seq.++ "-" (seq.++ "6" (seq.++ "8" (seq.++ "2" (seq.++ "2" ""))))))))))

(assert (= regexA (re.++ (str.to_re "")(re.++ (re.union (re.++ (re.union (re.++ (re.opt (re.range "0" "0")) (re.union (re.range "1" "1")(re.union (re.range "3" "3")(re.union (re.range "5" "5") (re.range "7" "8"))))) (re.++ (re.range "1" "1") (re.union (re.range "0" "0") (re.range "2" "2"))))(re.++ (re.opt (re.union (re.range "-" "-")(re.union (re.range "/" "/") (re.range "|" "|")))) (re.union (re.union (re.++ (re.opt (re.range "0" "0")) (re.range "1" "9")) (re.++ (re.range "0" "2") (re.range "0" "9"))) (re.++ (re.range "3" "3") (re.range "0" "1")))))(re.union (re.++ (re.union (re.++ (re.opt (re.range "0" "0")) (re.union (re.range "4" "4")(re.union (re.range "6" "6") (re.range "9" "9")))) (str.to_re (seq.++ "1" (seq.++ "1" ""))))(re.++ (re.opt (re.union (re.range "-" "-")(re.union (re.range "/" "/") (re.range "|" "|")))) (re.union (re.union (re.++ (re.opt (re.range "0" "0")) (re.range "1" "9")) (re.++ (re.range "0" "2") (re.range "0" "9"))) (str.to_re (seq.++ "3" (seq.++ "0" "")))))) (re.++ (re.opt (re.range "0" "0"))(re.++ (re.range "2" "2")(re.++ (re.opt (re.union (re.range "-" "-") (re.range "/" "/"))) (re.union (re.++ (re.opt (re.range "0" "0")) (re.range "1" "9")) (re.++ (re.range "0" "2") (re.range "0" "9"))))))))(re.++ (re.opt (re.union (re.range "-" "-") (re.range "/" "/")))(re.++ ((_ re.loop 2 4) (re.range "0" "9")) (str.to_re "")))))))

;check that the regex contains some x
(assert (str.in_re x regexA))
;check also the concrete witnesses
(assert (str.in_re Witness1 regexA))
(assert (str.in_re Witness2 regexA))
(check-sat)
