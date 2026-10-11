(deftemplate parent
  (slot child (type SYMBOL))
  (slot person (type SYMBOL))
  (slot role (type SYMBOL) (allowed-symbols father mother)))

(deftemplate parents
  (slot child (type SYMBOL))
  (slot father (type SYMBOL))
  (slot mother (type SYMBOL)))

(deftemplate family-role
  (slot person (type SYMBOL))
  (slot role (type SYMBOL) (allowed-symbols father mother son daughter)))

(deftemplate person-sex
  (slot person (type SYMBOL))
  (slot sex (type SYMBOL) (allowed-symbols male female)))

(deffacts family
  (parent (child John) (person Tom) (role father))
  (parent (child John) (person Susan) (role mother))
  (parents (child John) (father Tom) (mother Susan))
  (family-role (person Tom) (role father))
  (family-role (person Susan) (role mother))
  (family-role (person John) (role son))
  (person-sex (person Tom) (sex male))
  (person-sex (person Susan) (sex female))
  (person-sex (person John) (sex male)))

(deftemplate output-step (slot number (type INTEGER)))
(deffacts output-control (output-step (number 1)))

(defrule print-sentence-1
  ?step <- (output-step (number 1))
  (parent (child ?child) (person ?person) (role father))
  =>
  (printout t "The father of " ?child " is " ?person "." crlf)
  (modify ?step (number 2)))

(defrule print-sentence-2
  ?step <- (output-step (number 2))
  (parent (child ?child) (person ?person) (role mother))
  =>
  (printout t "The mother of " ?child " is " ?person "." crlf)
  (modify ?step (number 3)))

(defrule print-sentence-3
  ?step <- (output-step (number 3))
  (parents (child ?child) (father ?father) (mother ?mother))
  =>
  (printout t "The parents of " ?child " are " ?father " and " ?mother "." crlf)
  (modify ?step (number 4)))

(defrule print-sentence-4
  ?step <- (output-step (number 4))
  (family-role (person Tom) (role father))
  =>
  (printout t "Tom is a father." crlf)
  (modify ?step (number 5)))

(defrule print-sentence-5
  ?step <- (output-step (number 5))
  (family-role (person Susan) (role mother))
  =>
  (printout t "Susan is a mother." crlf)
  (modify ?step (number 6)))

(defrule print-sentence-6
  ?step <- (output-step (number 6))
  (family-role (person John) (role son))
  =>
  (printout t "John is a son." crlf)
  (modify ?step (number 7)))

(defrule print-sentence-7
  ?step <- (output-step (number 7))
  (person-sex (person Tom) (sex male))
  =>
  (printout t "Tom is a male." crlf)
  (modify ?step (number 8)))

(defrule print-sentence-8
  ?step <- (output-step (number 8))
  (person-sex (person Susan) (sex female))
  =>
  (printout t "Susan is a female." crlf)
  (modify ?step (number 9)))

(defrule print-sentence-9
  ?step <- (output-step (number 9))
  (person-sex (person John) (sex male))
  =>
  (printout t "John is a male." crlf)
  (modify ?step (number 10)))
