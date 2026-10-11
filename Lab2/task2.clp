; Laboratory work 2, task 2, variant 1.
; subset-of lists the named sets containing all elements of this set.
; The empty list means no containing set among the supplied sets.

(deftemplate set-info
  (slot name (type SYMBOL))
  (slot description (type STRING) (default ""))
  (multislot elements (type INTEGER SYMBOL))
  (slot is-subset (type SYMBOL) (allowed-symbols TRUE FALSE))
  (multislot subset-of (type SYMBOL)))

(deffacts sets
  (set-info (name A) (description "Numbers 1, 2, 3")
    (elements 1 2 3) (is-subset TRUE) (subset-of B))
  (set-info (name B) (description "Numbers and colors")
    (elements 1 2 3 red green) (is-subset FALSE) (subset-of))
  (set-info (name C) (description "Colors")
    (elements red green yellow blue) (is-subset FALSE) (subset-of)))
