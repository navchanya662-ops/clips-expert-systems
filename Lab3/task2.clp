; Input is supplied using assert after reset, or by loading test-input.clp.
(deftemplate symptom
  (slot plant (type SYMBOL))
  (slot kind (type SYMBOL)
    (allowed-symbols stunted-growth pale-yellow reddish-brown-leaf-edges stunted-root-growth spindly-stalk purplish delayed-maturing scorched-leaf-edges weakened-stems shriveled-seeds-or-fruits)))

(deftemplate deficiency
  (slot plant (type SYMBOL))
  (slot nutrient (type SYMBOL)
    (allowed-symbols nitrogen phosphorus potassium)))

(deftemplate reported
  (slot plant (type SYMBOL))
  (slot nutrient (type SYMBOL)
    (allowed-symbols nitrogen phosphorus potassium)))

(defrule detect-stunted-growth
  (declare (salience 10))
  (symptom (plant ?plant) (kind stunted-growth))
  (not (deficiency (plant ?plant) (nutrient nitrogen)))
  =>
  (assert (deficiency (plant ?plant) (nutrient nitrogen))))

(defrule detect-pale-yellow
  (declare (salience 10))
  (symptom (plant ?plant) (kind pale-yellow))
  (not (deficiency (plant ?plant) (nutrient nitrogen)))
  =>
  (assert (deficiency (plant ?plant) (nutrient nitrogen))))

(defrule detect-reddish-brown-leaf-edges
  (declare (salience 10))
  (symptom (plant ?plant) (kind reddish-brown-leaf-edges))
  (not (deficiency (plant ?plant) (nutrient nitrogen)))
  =>
  (assert (deficiency (plant ?plant) (nutrient nitrogen))))

(defrule detect-stunted-root-growth
  (declare (salience 10))
  (symptom (plant ?plant) (kind stunted-root-growth))
  (not (deficiency (plant ?plant) (nutrient phosphorus)))
  =>
  (assert (deficiency (plant ?plant) (nutrient phosphorus))))

(defrule detect-spindly-stalk
  (declare (salience 10))
  (symptom (plant ?plant) (kind spindly-stalk))
  (not (deficiency (plant ?plant) (nutrient phosphorus)))
  =>
  (assert (deficiency (plant ?plant) (nutrient phosphorus))))

(defrule detect-purplish
  (declare (salience 10))
  (symptom (plant ?plant) (kind purplish))
  (not (deficiency (plant ?plant) (nutrient phosphorus)))
  =>
  (assert (deficiency (plant ?plant) (nutrient phosphorus))))

(defrule detect-delayed-maturing
  (declare (salience 10))
  (symptom (plant ?plant) (kind delayed-maturing))
  (not (deficiency (plant ?plant) (nutrient phosphorus)))
  =>
  (assert (deficiency (plant ?plant) (nutrient phosphorus))))

(defrule detect-scorched-leaf-edges
  (declare (salience 10))
  (symptom (plant ?plant) (kind scorched-leaf-edges))
  (not (deficiency (plant ?plant) (nutrient potassium)))
  =>
  (assert (deficiency (plant ?plant) (nutrient potassium))))

(defrule detect-weakened-stems
  (declare (salience 10))
  (symptom (plant ?plant) (kind weakened-stems))
  (not (deficiency (plant ?plant) (nutrient potassium)))
  =>
  (assert (deficiency (plant ?plant) (nutrient potassium))))

(defrule detect-shriveled-seeds-or-fruits
  (declare (salience 10))
  (symptom (plant ?plant) (kind shriveled-seeds-or-fruits))
  (not (deficiency (plant ?plant) (nutrient potassium)))
  =>
  (assert (deficiency (plant ?plant) (nutrient potassium))))

(defrule report-deficiency
  (deficiency (plant ?plant) (nutrient ?nutrient))
  (not (reported (plant ?plant) (nutrient ?nutrient)))
  =>
  (assert (reported (plant ?plant) (nutrient ?nutrient)))
  (printout t "Plant " ?plant " may have a " ?nutrient " deficiency." crlf))
