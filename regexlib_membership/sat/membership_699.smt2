;---
; using 8-bit bit-vectors as characters
; check membership of .Net regex
; regexA = ([\w\-\.]*)@(([\d]{1,3}\.[\d]{1,3}\.[\d]{1,3}\.[\d]{1,3})|([\w\-]+\.)+(((af|ax|al|dz|as|ad|ao|ai|aq|ag|am|aw|au|at|az|bs|bh|bd|bb|by|be|bz|bj|bm|bt|bo|ba|bw|bv|br|io|bn|bg|bf|kh|cm|ca|cv|ky|cf|td|cl|cn|cx|cc|km|cg|cd|ck|cr|ci|hr|cu|cy|cz|dk|dj|dm|do|ec|eg|sv|gq|er|ee|et|fk|fo|fj|fi|fr|gf|pf|tf|ga|gm|ge|de|gh|gi|gr|gl|gd|gp|gu|gt| gg|gn|gw|gy|ht|hm|va|hn|hk|hu|is|id|ir|iq|ie|im|il|it|jm|jp|je|jo|kz|ke|ki|kp|kr|kw|kg|la|lv|lb|ls|lr|ly|li|lt|lu|mo|mk|mg|mw|my|mv|ml|mt|mh|mq|mr|yt|mx|fm|md|mc|mn|ms|ma|mz|mm|nr|np|nl|an|nc|nz|ni|ng|nu|nf|mp|no|om|pk|pw|ps|pa|pg|py|pe|ph|pn|pl|pt|qa|re|ro|ru|rw|sh|kn|lc|pm|vc|ws|sm|st|sa|sn|cs|sc|sl|sg|sk|si|sb|so|za|gs|es|lk|sd|sr|sj|sz|se|ch|sy|tw|tj|tz|th|tl|tg|tk|to|tt|tn|tr|tm|tc|tv|ug|ua|gb|us|um|uy|uz|vu|ve|vn|vg|vi|wf|eh|ye|zm|zw|uk|com|edu|gov|int|mil|net|org|biz|info|name|pro|aero|coop|museum|arpa|co|in|ne|bi|na|pr|ae|mu|ar)))?)
;---
(set-info :status sat)
(set-option :print-success true)
(set-logic QF_BVRE)

(declare-const regexA (RegEx String))
(declare-const x String)

;witness1: "\u00E6@9.59.85.379"
(define-fun Witness1 () String (seq.++ "\xe6" (seq.++ "@" (seq.++ "9" (seq.++ "." (seq.++ "5" (seq.++ "9" (seq.++ "." (seq.++ "8" (seq.++ "5" (seq.++ "." (seq.++ "3" (seq.++ "7" (seq.++ "9" ""))))))))))))))
;witness2: "z0@dk.2.\u00B5\u00AA.\u00E6.\u00C3\u00B5\u00BA8\u00AA.9.pe\u00D5\u00C9\u00FB^>"
(define-fun Witness2 () String (seq.++ "z" (seq.++ "0" (seq.++ "@" (seq.++ "d" (seq.++ "k" (seq.++ "." (seq.++ "2" (seq.++ "." (seq.++ "\xb5" (seq.++ "\xaa" (seq.++ "." (seq.++ "\xe6" (seq.++ "." (seq.++ "\xc3" (seq.++ "\xb5" (seq.++ "\xba" (seq.++ "8" (seq.++ "\xaa" (seq.++ "." (seq.++ "9" (seq.++ "." (seq.++ "p" (seq.++ "e" (seq.++ "\xd5" (seq.++ "\xc9" (seq.++ "\xfb" (seq.++ "^" (seq.++ ">" "")))))))))))))))))))))))))))))

(assert (= regexA (re.++ (re.* (re.union (re.range "-" ".")(re.union (re.range "0" "9")(re.union (re.range "A" "Z")(re.union (re.range "_" "_")(re.union (re.range "a" "z")(re.union (re.range "\xaa" "\xaa")(re.union (re.range "\xb5" "\xb5")(re.union (re.range "\xba" "\xba")(re.union (re.range "\xc0" "\xd6")(re.union (re.range "\xd8" "\xf6") (re.range "\xf8" "\xff"))))))))))))(re.++ (re.range "@" "@") (re.union (re.++ ((_ re.loop 1 3) (re.range "0" "9"))(re.++ (re.range "." ".")(re.++ ((_ re.loop 1 3) (re.range "0" "9"))(re.++ (re.range "." ".")(re.++ ((_ re.loop 1 3) (re.range "0" "9"))(re.++ (re.range "." ".") ((_ re.loop 1 3) (re.range "0" "9")))))))) (re.++ (re.+ (re.++ (re.+ (re.union (re.range "-" "-")(re.union (re.range "0" "9")(re.union (re.range "A" "Z")(re.union (re.range "_" "_")(re.union (re.range "a" "z")(re.union (re.range "\xaa" "\xaa")(re.union (re.range "\xb5" "\xb5")(re.union (re.range "\xba" "\xba")(re.union (re.range "\xc0" "\xd6")(re.union (re.range "\xd8" "\xf6") (re.range "\xf8" "\xff")))))))))))) (re.range "." "."))) (re.opt (re.union (str.to_re (seq.++ "a" (seq.++ "f" "")))(re.union (str.to_re (seq.++ "a" (seq.++ "x" "")))(re.union (str.to_re (seq.++ "a" (seq.++ "l" "")))(re.union (str.to_re (seq.++ "d" (seq.++ "z" "")))(re.union (str.to_re (seq.++ "a" (seq.++ "s" "")))(re.union (str.to_re (seq.++ "a" (seq.++ "d" "")))(re.union (str.to_re (seq.++ "a" (seq.++ "o" "")))(re.union (str.to_re (seq.++ "a" (seq.++ "i" "")))(re.union (str.to_re (seq.++ "a" (seq.++ "q" "")))(re.union (str.to_re (seq.++ "a" (seq.++ "g" "")))(re.union (str.to_re (seq.++ "a" (seq.++ "m" "")))(re.union (str.to_re (seq.++ "a" (seq.++ "w" "")))(re.union (str.to_re (seq.++ "a" (seq.++ "u" "")))(re.union (str.to_re (seq.++ "a" (seq.++ "t" "")))(re.union (str.to_re (seq.++ "a" (seq.++ "z" "")))(re.union (str.to_re (seq.++ "b" (seq.++ "s" "")))(re.union (str.to_re (seq.++ "b" (seq.++ "h" "")))(re.union (str.to_re (seq.++ "b" (seq.++ "d" "")))(re.union (str.to_re (seq.++ "b" (seq.++ "b" "")))(re.union (str.to_re (seq.++ "b" (seq.++ "y" "")))(re.union (str.to_re (seq.++ "b" (seq.++ "e" "")))(re.union (str.to_re (seq.++ "b" (seq.++ "z" "")))(re.union (str.to_re (seq.++ "b" (seq.++ "j" "")))(re.union (str.to_re (seq.++ "b" (seq.++ "m" "")))(re.union (str.to_re (seq.++ "b" (seq.++ "t" "")))(re.union (str.to_re (seq.++ "b" (seq.++ "o" "")))(re.union (str.to_re (seq.++ "b" (seq.++ "a" "")))(re.union (str.to_re (seq.++ "b" (seq.++ "w" "")))(re.union (str.to_re (seq.++ "b" (seq.++ "v" "")))(re.union (str.to_re (seq.++ "b" (seq.++ "r" "")))(re.union (str.to_re (seq.++ "i" (seq.++ "o" "")))(re.union (str.to_re (seq.++ "b" (seq.++ "n" "")))(re.union (str.to_re (seq.++ "b" (seq.++ "g" "")))(re.union (str.to_re (seq.++ "b" (seq.++ "f" "")))(re.union (str.to_re (seq.++ "k" (seq.++ "h" "")))(re.union (str.to_re (seq.++ "c" (seq.++ "m" "")))(re.union (str.to_re (seq.++ "c" (seq.++ "a" "")))(re.union (str.to_re (seq.++ "c" (seq.++ "v" "")))(re.union (str.to_re (seq.++ "k" (seq.++ "y" "")))(re.union (str.to_re (seq.++ "c" (seq.++ "f" "")))(re.union (str.to_re (seq.++ "t" (seq.++ "d" "")))(re.union (str.to_re (seq.++ "c" (seq.++ "l" "")))(re.union (str.to_re (seq.++ "c" (seq.++ "n" "")))(re.union (str.to_re (seq.++ "c" (seq.++ "x" "")))(re.union (str.to_re (seq.++ "c" (seq.++ "c" "")))(re.union (str.to_re (seq.++ "k" (seq.++ "m" "")))(re.union (str.to_re (seq.++ "c" (seq.++ "g" "")))(re.union (str.to_re (seq.++ "c" (seq.++ "d" "")))(re.union (str.to_re (seq.++ "c" (seq.++ "k" "")))(re.union (str.to_re (seq.++ "c" (seq.++ "r" "")))(re.union (str.to_re (seq.++ "c" (seq.++ "i" "")))(re.union (str.to_re (seq.++ "h" (seq.++ "r" "")))(re.union (str.to_re (seq.++ "c" (seq.++ "u" "")))(re.union (str.to_re (seq.++ "c" (seq.++ "y" "")))(re.union (str.to_re (seq.++ "c" (seq.++ "z" "")))(re.union (str.to_re (seq.++ "d" (seq.++ "k" "")))(re.union (str.to_re (seq.++ "d" (seq.++ "j" "")))(re.union (str.to_re (seq.++ "d" (seq.++ "m" "")))(re.union (str.to_re (seq.++ "d" (seq.++ "o" "")))(re.union (str.to_re (seq.++ "e" (seq.++ "c" "")))(re.union (str.to_re (seq.++ "e" (seq.++ "g" "")))(re.union (str.to_re (seq.++ "s" (seq.++ "v" "")))(re.union (str.to_re (seq.++ "g" (seq.++ "q" "")))(re.union (str.to_re (seq.++ "e" (seq.++ "r" "")))(re.union (str.to_re (seq.++ "e" (seq.++ "e" "")))(re.union (str.to_re (seq.++ "e" (seq.++ "t" "")))(re.union (str.to_re (seq.++ "f" (seq.++ "k" "")))(re.union (str.to_re (seq.++ "f" (seq.++ "o" "")))(re.union (str.to_re (seq.++ "f" (seq.++ "j" "")))(re.union (str.to_re (seq.++ "f" (seq.++ "i" "")))(re.union (str.to_re (seq.++ "f" (seq.++ "r" "")))(re.union (str.to_re (seq.++ "g" (seq.++ "f" "")))(re.union (str.to_re (seq.++ "p" (seq.++ "f" "")))(re.union (str.to_re (seq.++ "t" (seq.++ "f" "")))(re.union (str.to_re (seq.++ "g" (seq.++ "a" "")))(re.union (str.to_re (seq.++ "g" (seq.++ "m" "")))(re.union (str.to_re (seq.++ "g" (seq.++ "e" "")))(re.union (str.to_re (seq.++ "d" (seq.++ "e" "")))(re.union (str.to_re (seq.++ "g" (seq.++ "h" "")))(re.union (str.to_re (seq.++ "g" (seq.++ "i" "")))(re.union (str.to_re (seq.++ "g" (seq.++ "r" "")))(re.union (str.to_re (seq.++ "g" (seq.++ "l" "")))(re.union (str.to_re (seq.++ "g" (seq.++ "d" "")))(re.union (str.to_re (seq.++ "g" (seq.++ "p" "")))(re.union (str.to_re (seq.++ "g" (seq.++ "u" "")))(re.union (str.to_re (seq.++ "g" (seq.++ "t" "")))(re.union (str.to_re (seq.++ " " (seq.++ "g" (seq.++ "g" ""))))(re.union (str.to_re (seq.++ "g" (seq.++ "n" "")))(re.union (str.to_re (seq.++ "g" (seq.++ "w" "")))(re.union (str.to_re (seq.++ "g" (seq.++ "y" "")))(re.union (str.to_re (seq.++ "h" (seq.++ "t" "")))(re.union (str.to_re (seq.++ "h" (seq.++ "m" "")))(re.union (str.to_re (seq.++ "v" (seq.++ "a" "")))(re.union (str.to_re (seq.++ "h" (seq.++ "n" "")))(re.union (str.to_re (seq.++ "h" (seq.++ "k" "")))(re.union (str.to_re (seq.++ "h" (seq.++ "u" "")))(re.union (str.to_re (seq.++ "i" (seq.++ "s" "")))(re.union (str.to_re (seq.++ "i" (seq.++ "d" "")))(re.union (str.to_re (seq.++ "i" (seq.++ "r" "")))(re.union (str.to_re (seq.++ "i" (seq.++ "q" "")))(re.union (str.to_re (seq.++ "i" (seq.++ "e" "")))(re.union (str.to_re (seq.++ "i" (seq.++ "m" "")))(re.union (str.to_re (seq.++ "i" (seq.++ "l" "")))(re.union (str.to_re (seq.++ "i" (seq.++ "t" "")))(re.union (str.to_re (seq.++ "j" (seq.++ "m" "")))(re.union (str.to_re (seq.++ "j" (seq.++ "p" "")))(re.union (str.to_re (seq.++ "j" (seq.++ "e" "")))(re.union (str.to_re (seq.++ "j" (seq.++ "o" "")))(re.union (str.to_re (seq.++ "k" (seq.++ "z" "")))(re.union (str.to_re (seq.++ "k" (seq.++ "e" "")))(re.union (str.to_re (seq.++ "k" (seq.++ "i" "")))(re.union (str.to_re (seq.++ "k" (seq.++ "p" "")))(re.union (str.to_re (seq.++ "k" (seq.++ "r" "")))(re.union (str.to_re (seq.++ "k" (seq.++ "w" "")))(re.union (str.to_re (seq.++ "k" (seq.++ "g" "")))(re.union (str.to_re (seq.++ "l" (seq.++ "a" "")))(re.union (str.to_re (seq.++ "l" (seq.++ "v" "")))(re.union (str.to_re (seq.++ "l" (seq.++ "b" "")))(re.union (str.to_re (seq.++ "l" (seq.++ "s" "")))(re.union (str.to_re (seq.++ "l" (seq.++ "r" "")))(re.union (str.to_re (seq.++ "l" (seq.++ "y" "")))(re.union (str.to_re (seq.++ "l" (seq.++ "i" "")))(re.union (str.to_re (seq.++ "l" (seq.++ "t" "")))(re.union (str.to_re (seq.++ "l" (seq.++ "u" "")))(re.union (str.to_re (seq.++ "m" (seq.++ "o" "")))(re.union (str.to_re (seq.++ "m" (seq.++ "k" "")))(re.union (str.to_re (seq.++ "m" (seq.++ "g" "")))(re.union (str.to_re (seq.++ "m" (seq.++ "w" "")))(re.union (str.to_re (seq.++ "m" (seq.++ "y" "")))(re.union (str.to_re (seq.++ "m" (seq.++ "v" "")))(re.union (str.to_re (seq.++ "m" (seq.++ "l" "")))(re.union (str.to_re (seq.++ "m" (seq.++ "t" "")))(re.union (str.to_re (seq.++ "m" (seq.++ "h" "")))(re.union (str.to_re (seq.++ "m" (seq.++ "q" "")))(re.union (str.to_re (seq.++ "m" (seq.++ "r" "")))(re.union (str.to_re (seq.++ "y" (seq.++ "t" "")))(re.union (str.to_re (seq.++ "m" (seq.++ "x" "")))(re.union (str.to_re (seq.++ "f" (seq.++ "m" "")))(re.union (str.to_re (seq.++ "m" (seq.++ "d" "")))(re.union (str.to_re (seq.++ "m" (seq.++ "c" "")))(re.union (str.to_re (seq.++ "m" (seq.++ "n" "")))(re.union (str.to_re (seq.++ "m" (seq.++ "s" "")))(re.union (str.to_re (seq.++ "m" (seq.++ "a" "")))(re.union (str.to_re (seq.++ "m" (seq.++ "z" "")))(re.union (str.to_re (seq.++ "m" (seq.++ "m" "")))(re.union (str.to_re (seq.++ "n" (seq.++ "r" "")))(re.union (str.to_re (seq.++ "n" (seq.++ "p" "")))(re.union (str.to_re (seq.++ "n" (seq.++ "l" "")))(re.union (str.to_re (seq.++ "a" (seq.++ "n" "")))(re.union (str.to_re (seq.++ "n" (seq.++ "c" "")))(re.union (str.to_re (seq.++ "n" (seq.++ "z" "")))(re.union (str.to_re (seq.++ "n" (seq.++ "i" "")))(re.union (str.to_re (seq.++ "n" (seq.++ "g" "")))(re.union (str.to_re (seq.++ "n" (seq.++ "u" "")))(re.union (str.to_re (seq.++ "n" (seq.++ "f" "")))(re.union (str.to_re (seq.++ "m" (seq.++ "p" "")))(re.union (str.to_re (seq.++ "n" (seq.++ "o" "")))(re.union (str.to_re (seq.++ "o" (seq.++ "m" "")))(re.union (str.to_re (seq.++ "p" (seq.++ "k" "")))(re.union (str.to_re (seq.++ "p" (seq.++ "w" "")))(re.union (str.to_re (seq.++ "p" (seq.++ "s" "")))(re.union (str.to_re (seq.++ "p" (seq.++ "a" "")))(re.union (str.to_re (seq.++ "p" (seq.++ "g" "")))(re.union (str.to_re (seq.++ "p" (seq.++ "y" "")))(re.union (str.to_re (seq.++ "p" (seq.++ "e" "")))(re.union (str.to_re (seq.++ "p" (seq.++ "h" "")))(re.union (str.to_re (seq.++ "p" (seq.++ "n" "")))(re.union (str.to_re (seq.++ "p" (seq.++ "l" "")))(re.union (str.to_re (seq.++ "p" (seq.++ "t" "")))(re.union (str.to_re (seq.++ "q" (seq.++ "a" "")))(re.union (str.to_re (seq.++ "r" (seq.++ "e" "")))(re.union (str.to_re (seq.++ "r" (seq.++ "o" "")))(re.union (str.to_re (seq.++ "r" (seq.++ "u" "")))(re.union (str.to_re (seq.++ "r" (seq.++ "w" "")))(re.union (str.to_re (seq.++ "s" (seq.++ "h" "")))(re.union (str.to_re (seq.++ "k" (seq.++ "n" "")))(re.union (str.to_re (seq.++ "l" (seq.++ "c" "")))(re.union (str.to_re (seq.++ "p" (seq.++ "m" "")))(re.union (str.to_re (seq.++ "v" (seq.++ "c" "")))(re.union (str.to_re (seq.++ "w" (seq.++ "s" "")))(re.union (str.to_re (seq.++ "s" (seq.++ "m" "")))(re.union (str.to_re (seq.++ "s" (seq.++ "t" "")))(re.union (str.to_re (seq.++ "s" (seq.++ "a" "")))(re.union (str.to_re (seq.++ "s" (seq.++ "n" "")))(re.union (str.to_re (seq.++ "c" (seq.++ "s" "")))(re.union (str.to_re (seq.++ "s" (seq.++ "c" "")))(re.union (str.to_re (seq.++ "s" (seq.++ "l" "")))(re.union (str.to_re (seq.++ "s" (seq.++ "g" "")))(re.union (str.to_re (seq.++ "s" (seq.++ "k" "")))(re.union (str.to_re (seq.++ "s" (seq.++ "i" "")))(re.union (str.to_re (seq.++ "s" (seq.++ "b" "")))(re.union (str.to_re (seq.++ "s" (seq.++ "o" "")))(re.union (str.to_re (seq.++ "z" (seq.++ "a" "")))(re.union (str.to_re (seq.++ "g" (seq.++ "s" "")))(re.union (str.to_re (seq.++ "e" (seq.++ "s" "")))(re.union (str.to_re (seq.++ "l" (seq.++ "k" "")))(re.union (str.to_re (seq.++ "s" (seq.++ "d" "")))(re.union (str.to_re (seq.++ "s" (seq.++ "r" "")))(re.union (str.to_re (seq.++ "s" (seq.++ "j" "")))(re.union (str.to_re (seq.++ "s" (seq.++ "z" "")))(re.union (str.to_re (seq.++ "s" (seq.++ "e" "")))(re.union (str.to_re (seq.++ "c" (seq.++ "h" "")))(re.union (str.to_re (seq.++ "s" (seq.++ "y" "")))(re.union (str.to_re (seq.++ "t" (seq.++ "w" "")))(re.union (str.to_re (seq.++ "t" (seq.++ "j" "")))(re.union (str.to_re (seq.++ "t" (seq.++ "z" "")))(re.union (str.to_re (seq.++ "t" (seq.++ "h" "")))(re.union (str.to_re (seq.++ "t" (seq.++ "l" "")))(re.union (str.to_re (seq.++ "t" (seq.++ "g" "")))(re.union (str.to_re (seq.++ "t" (seq.++ "k" "")))(re.union (str.to_re (seq.++ "t" (seq.++ "o" "")))(re.union (str.to_re (seq.++ "t" (seq.++ "t" "")))(re.union (str.to_re (seq.++ "t" (seq.++ "n" "")))(re.union (str.to_re (seq.++ "t" (seq.++ "r" "")))(re.union (str.to_re (seq.++ "t" (seq.++ "m" "")))(re.union (str.to_re (seq.++ "t" (seq.++ "c" "")))(re.union (str.to_re (seq.++ "t" (seq.++ "v" "")))(re.union (str.to_re (seq.++ "u" (seq.++ "g" "")))(re.union (str.to_re (seq.++ "u" (seq.++ "a" "")))(re.union (str.to_re (seq.++ "g" (seq.++ "b" "")))(re.union (str.to_re (seq.++ "u" (seq.++ "s" "")))(re.union (str.to_re (seq.++ "u" (seq.++ "m" "")))(re.union (str.to_re (seq.++ "u" (seq.++ "y" "")))(re.union (str.to_re (seq.++ "u" (seq.++ "z" "")))(re.union (str.to_re (seq.++ "v" (seq.++ "u" "")))(re.union (str.to_re (seq.++ "v" (seq.++ "e" "")))(re.union (str.to_re (seq.++ "v" (seq.++ "n" "")))(re.union (str.to_re (seq.++ "v" (seq.++ "g" "")))(re.union (str.to_re (seq.++ "v" (seq.++ "i" "")))(re.union (str.to_re (seq.++ "w" (seq.++ "f" "")))(re.union (str.to_re (seq.++ "e" (seq.++ "h" "")))(re.union (str.to_re (seq.++ "y" (seq.++ "e" "")))(re.union (str.to_re (seq.++ "z" (seq.++ "m" "")))(re.union (str.to_re (seq.++ "z" (seq.++ "w" "")))(re.union (str.to_re (seq.++ "u" (seq.++ "k" "")))(re.union (str.to_re (seq.++ "c" (seq.++ "o" (seq.++ "m" ""))))(re.union (str.to_re (seq.++ "e" (seq.++ "d" (seq.++ "u" ""))))(re.union (str.to_re (seq.++ "g" (seq.++ "o" (seq.++ "v" ""))))(re.union (str.to_re (seq.++ "i" (seq.++ "n" (seq.++ "t" ""))))(re.union (str.to_re (seq.++ "m" (seq.++ "i" (seq.++ "l" ""))))(re.union (str.to_re (seq.++ "n" (seq.++ "e" (seq.++ "t" ""))))(re.union (str.to_re (seq.++ "o" (seq.++ "r" (seq.++ "g" ""))))(re.union (str.to_re (seq.++ "b" (seq.++ "i" (seq.++ "z" ""))))(re.union (str.to_re (seq.++ "i" (seq.++ "n" (seq.++ "f" (seq.++ "o" "")))))(re.union (str.to_re (seq.++ "n" (seq.++ "a" (seq.++ "m" (seq.++ "e" "")))))(re.union (str.to_re (seq.++ "p" (seq.++ "r" (seq.++ "o" ""))))(re.union (str.to_re (seq.++ "a" (seq.++ "e" (seq.++ "r" (seq.++ "o" "")))))(re.union (str.to_re (seq.++ "c" (seq.++ "o" (seq.++ "o" (seq.++ "p" "")))))(re.union (str.to_re (seq.++ "m" (seq.++ "u" (seq.++ "s" (seq.++ "e" (seq.++ "u" (seq.++ "m" "")))))))(re.union (str.to_re (seq.++ "a" (seq.++ "r" (seq.++ "p" (seq.++ "a" "")))))(re.union (str.to_re (seq.++ "c" (seq.++ "o" "")))(re.union (str.to_re (seq.++ "i" (seq.++ "n" "")))(re.union (str.to_re (seq.++ "n" (seq.++ "e" "")))(re.union (str.to_re (seq.++ "b" (seq.++ "i" "")))(re.union (str.to_re (seq.++ "n" (seq.++ "a" "")))(re.union (str.to_re (seq.++ "p" (seq.++ "r" "")))(re.union (str.to_re (seq.++ "a" (seq.++ "e" "")))(re.union (str.to_re (seq.++ "m" (seq.++ "u" ""))) (str.to_re (seq.++ "a" (seq.++ "r" ""))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

;check that the regex contains some x
(assert (str.in_re x regexA))
;check also the concrete witnesses
(assert (str.in_re Witness1 regexA))
(assert (str.in_re Witness2 regexA))
(check-sat)
