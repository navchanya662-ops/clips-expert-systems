(deftemplate person
    (slot name)
    (slot age)
    (slot gender)
)

(deffacts people
    (person
        (name Berta)
        (age 20)
        (gender female)
    )

    (person
        (name John)
        (age 25)
        (gender male)
    )

    (person
        (name Alex)
        (age 30)
        (gender male)
    )
)