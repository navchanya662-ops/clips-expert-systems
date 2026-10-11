; Laboratory work 2, task 1.
; Load this file, then execute (reset) and (facts).

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
