;---
; using 8-bit bit-vectors as characters
; check membership of .Net regex
; regexA = ([0-9]+\.[0-9]*)|([0-9]*\.[0-9]+)|([0-9]+)
;---
(set-info :status sat)
(set-option :print-success true)
(set-logic QF_BVRE)

(declare-const regexA (RegEx String))
(declare-const x String)

;witness1: "228.0"
(define-fun Witness1 () String (seq.++ "2" (seq.++ "2" (seq.++ "8" (seq.++ "." (seq.++ "0" ""))))))
;witness2: "\xAv0.\u0083"
(define-fun Witness2 () String (seq.++ "\x0a" (seq.++ "v" (seq.++ "0" (seq.++ "." (seq.++ "\x83" ""))))))

(assert (= regexA (re.union (re.++ (re.+ (re.range "0" "9"))(re.++ (re.range "." ".") (re.* (re.range "0" "9"))))(re.union (re.++ (re.* (re.range "0" "9"))(re.++ (re.range "." ".") (re.+ (re.range "0" "9")))) (re.+ (re.range "0" "9"))))))

;check that the regex contains some x
(assert (str.in_re x regexA))
;check also the concrete witnesses
(assert (str.in_re Witness1 regexA))
(assert (str.in_re Witness2 regexA))
(check-sat)
