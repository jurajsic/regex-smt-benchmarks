;---
; using 8-bit bit-vectors as characters
; check membership of .Net regex
; regexA = ^(\d{4}-){3}\d{4}$|^(\d{4} ){3}\d{4}$|^\d{16}$
;---
(set-info :status sat)
(set-option :print-success true)
(set-logic QF_BVRE)

(declare-const regexA (RegEx String))
(declare-const x String)

;witness1: "9912-6587-0885-0739"
(define-fun Witness1 () String (seq.++ "9" (seq.++ "9" (seq.++ "1" (seq.++ "2" (seq.++ "-" (seq.++ "6" (seq.++ "5" (seq.++ "8" (seq.++ "7" (seq.++ "-" (seq.++ "0" (seq.++ "8" (seq.++ "8" (seq.++ "5" (seq.++ "-" (seq.++ "0" (seq.++ "7" (seq.++ "3" (seq.++ "9" ""))))))))))))))))))))
;witness2: "4978 9269 6598 9038"
(define-fun Witness2 () String (seq.++ "4" (seq.++ "9" (seq.++ "7" (seq.++ "8" (seq.++ " " (seq.++ "9" (seq.++ "2" (seq.++ "6" (seq.++ "9" (seq.++ " " (seq.++ "6" (seq.++ "5" (seq.++ "9" (seq.++ "8" (seq.++ " " (seq.++ "9" (seq.++ "0" (seq.++ "3" (seq.++ "8" ""))))))))))))))))))))

(assert (= regexA (re.union (re.++ (str.to_re "")(re.++ ((_ re.loop 3 3) (re.++ ((_ re.loop 4 4) (re.range "0" "9")) (re.range "-" "-")))(re.++ ((_ re.loop 4 4) (re.range "0" "9")) (str.to_re ""))))(re.union (re.++ (str.to_re "")(re.++ ((_ re.loop 3 3) (re.++ ((_ re.loop 4 4) (re.range "0" "9")) (re.range " " " ")))(re.++ ((_ re.loop 4 4) (re.range "0" "9")) (str.to_re "")))) (re.++ (str.to_re "")(re.++ ((_ re.loop 16 16) (re.range "0" "9")) (str.to_re "")))))))

;check that the regex contains some x
(assert (str.in_re x regexA))
;check also the concrete witnesses
(assert (str.in_re Witness1 regexA))
(assert (str.in_re Witness2 regexA))
(check-sat)
