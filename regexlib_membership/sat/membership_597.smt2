;---
; using 8-bit bit-vectors as characters
; check membership of .Net regex
; regexA = ^(((0[1-9]{1})|(1[0-2]{1}))\/?(([0-2]{1}[1-9]{1})|(3[0-1]{1}))\/?(([12]{1}[0-9]{1})?[0-9]{2}) ?(([01]{1}[0-9]{1})|(2[0-4]{1}))\:?([0-5]{1}[0-9]{1}))$
;---
(set-info :status sat)
(set-option :print-success true)
(set-logic QF_BVRE)

(declare-const regexA (RegEx String))
(declare-const x String)

;witness1: "10/30192418:58"
(define-fun Witness1 () String (seq.++ "1" (seq.++ "0" (seq.++ "/" (seq.++ "3" (seq.++ "0" (seq.++ "1" (seq.++ "9" (seq.++ "2" (seq.++ "4" (seq.++ "1" (seq.++ "8" (seq.++ ":" (seq.++ "5" (seq.++ "8" "")))))))))))))))
;witness2: "10/252878 0840"
(define-fun Witness2 () String (seq.++ "1" (seq.++ "0" (seq.++ "/" (seq.++ "2" (seq.++ "5" (seq.++ "2" (seq.++ "8" (seq.++ "7" (seq.++ "8" (seq.++ " " (seq.++ "0" (seq.++ "8" (seq.++ "4" (seq.++ "0" "")))))))))))))))

(assert (= regexA (re.++ (str.to_re "")(re.++ (re.++ (re.union (re.++ (re.range "0" "0") (re.range "1" "9")) (re.++ (re.range "1" "1") (re.range "0" "2")))(re.++ (re.opt (re.range "/" "/"))(re.++ (re.union (re.++ (re.range "0" "2") (re.range "1" "9")) (re.++ (re.range "3" "3") (re.range "0" "1")))(re.++ (re.opt (re.range "/" "/"))(re.++ (re.++ (re.opt (re.++ (re.range "1" "2") (re.range "0" "9"))) ((_ re.loop 2 2) (re.range "0" "9")))(re.++ (re.opt (re.range " " " "))(re.++ (re.union (re.++ (re.range "0" "1") (re.range "0" "9")) (re.++ (re.range "2" "2") (re.range "0" "4")))(re.++ (re.opt (re.range ":" ":")) (re.++ (re.range "0" "5") (re.range "0" "9")))))))))) (str.to_re "")))))

;check that the regex contains some x
(assert (str.in_re x regexA))
;check also the concrete witnesses
(assert (str.in_re Witness1 regexA))
(assert (str.in_re Witness2 regexA))
(check-sat)
