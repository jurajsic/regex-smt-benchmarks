;---
; using 8-bit bit-vectors as characters
; check membership of .Net regex
; regexA = (^((((0[1-9])|([1-2][0-9])|(3[0-1]))|([1-9]))\x2F(((0[1-9])|(1[0-2]))|([1-9]))\x2F(([0-9]{2})|(((19)|([2]([0]{1})))([0-9]{2}))))$)
;---
(set-info :status sat)
(set-option :print-success true)
(set-logic QF_BVRE)

(declare-const regexA (RegEx String))
(declare-const x String)

;witness1: "01/12/2091"
(define-fun Witness1 () String (seq.++ "0" (seq.++ "1" (seq.++ "/" (seq.++ "1" (seq.++ "2" (seq.++ "/" (seq.++ "2" (seq.++ "0" (seq.++ "9" (seq.++ "1" "")))))))))))
;witness2: "08/12/1989"
(define-fun Witness2 () String (seq.++ "0" (seq.++ "8" (seq.++ "/" (seq.++ "1" (seq.++ "2" (seq.++ "/" (seq.++ "1" (seq.++ "9" (seq.++ "8" (seq.++ "9" "")))))))))))

(assert (= regexA (re.++ (str.to_re "")(re.++ (re.++ (re.union (re.union (re.++ (re.range "0" "0") (re.range "1" "9"))(re.union (re.++ (re.range "1" "2") (re.range "0" "9")) (re.++ (re.range "3" "3") (re.range "0" "1")))) (re.range "1" "9"))(re.++ (re.range "/" "/")(re.++ (re.union (re.union (re.++ (re.range "0" "0") (re.range "1" "9")) (re.++ (re.range "1" "1") (re.range "0" "2"))) (re.range "1" "9"))(re.++ (re.range "/" "/") (re.union ((_ re.loop 2 2) (re.range "0" "9")) (re.++ (re.union (str.to_re (seq.++ "1" (seq.++ "9" ""))) (re.++ (re.range "2" "2") (re.range "0" "0"))) ((_ re.loop 2 2) (re.range "0" "9")))))))) (str.to_re "")))))

;check that the regex contains some x
(assert (str.in_re x regexA))
;check also the concrete witnesses
(assert (str.in_re Witness1 regexA))
(assert (str.in_re Witness2 regexA))
(check-sat)