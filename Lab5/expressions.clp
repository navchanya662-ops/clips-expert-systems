(deffunction show-expressions ()
  (printout t "a = " (+ (* (+ 3 4) (+ 5 6)) 7) crlf)
  (printout t "b = " (- (* 5 (+ 5 6 7)) (/ (+ (* 3 (/ 4 9)) 2) 8)) crlf)
  (printout t "c = " (- (+ (- 6 (/ (* 9 8) 3)) 4) (/ (* (- (- 8 2) 3) 6) 7)) crlf))
