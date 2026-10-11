; Laboratory 4, variant 1: plant nutrient deficiency using functions.
(deftemplate symptom
  (slot plant (type SYMBOL))
  (slot kind (type SYMBOL)
    (allowed-symbols stunted-growth pale-yellow
      reddish-brown-leaf-edges stunted-root-growth spindly-stalk
      purplish delayed-maturing scorched-leaf-edges
      weakened-stems shriveled-seeds-or-fruits)))

(deftemplate deficiency
  (slot plant (type SYMBOL))
  (slot nutrient (type SYMBOL)
    (allowed-symbols nitrogen phosphorus potassium)))

(deftemplate reported
  (slot plant (type SYMBOL))
  (slot nutrient (type SYMBOL)
    (allowed-symbols nitrogen phosphorus potassium)))

(deffunction nutrient-for (?kind)
  (if (member$ ?kind
        (create$ stunted-growth pale-yellow reddish-brown-leaf-edges))
    then (return nitrogen))
  (if (member$ ?kind
        (create$ stunted-root-growth spindly-stalk purplish delayed-maturing))
    then (return phosphorus))
  (if (member$ ?kind
        (create$ scorched-leaf-edges weakened-stems shriveled-seeds-or-fruits))
    then (return potassium))
  (return FALSE))

(deffunction add-symptoms (?plant $?kinds)
  (if (not (symbolp ?plant)) then (return FALSE))
  ; Validate all input before inserting any facts.
  (foreach ?kind ?kinds
    (if (eq (nutrient-for ?kind) FALSE) then (return FALSE)))
  (bind ?count 0)
  (foreach ?kind ?kinds
    (if (not (any-factp ((?s symptom))
          (and (eq ?s:plant ?plant) (eq ?s:kind ?kind)))) then
      (assert (symptom (plant ?plant) (kind ?kind)))
      (bind ?count (+ ?count 1))))
  (return ?count))

(deffunction record-deficiency (?plant ?nutrient)
  (if (any-factp ((?d deficiency))
        (and (eq ?d:plant ?plant) (eq ?d:nutrient ?nutrient)))
    then (return FALSE))
  (assert (deficiency (plant ?plant) (nutrient ?nutrient)))
  (return TRUE))

(deffunction report-once (?plant ?nutrient)
  (if (any-factp ((?r reported))
        (and (eq ?r:plant ?plant) (eq ?r:nutrient ?nutrient)))
    then (return FALSE))
  (assert (reported (plant ?plant) (nutrient ?nutrient)))
  (printout t "Plant " ?plant " may have a " ?nutrient " deficiency." crlf)
  (return TRUE))

(defrule detect-deficiency
  (declare (salience 10))
  (symptom (plant ?plant) (kind ?kind))
  (test (neq (nutrient-for ?kind) FALSE))
  (not (deficiency (plant ?plant)
    (nutrient ?nutrient&:(eq ?nutrient (nutrient-for ?kind)))))
  =>
  (record-deficiency ?plant (nutrient-for ?kind)))

(defrule print-deficiency
  (deficiency (plant ?plant) (nutrient ?nutrient))
  (not (reported (plant ?plant) (nutrient ?nutrient)))
  =>
  (report-once ?plant ?nutrient))
