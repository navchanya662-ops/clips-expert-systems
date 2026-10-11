(deftemplate person
    (multislot name)
    (slot age (type INTEGER))
    (slot gender (allowed-values male female))
)

(deffacts people
    (person
        (name Berta Ida)
        (age 20)
        (gender female)
    )

    (person
        (name John Smith)
        (age 25)
        (gender male)
    )

    (person
        (name Alex Brown)
        (age 30)
        (gender male)
    )
)