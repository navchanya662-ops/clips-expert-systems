(defrule find-by-name
    (person
        (name John Smith)
    )
    =>
    (printout t "Found by name: John Smith" crlf)
)

(defrule find-by-age
    (person
        (name $?name)
        (age 25)
    )
    =>
    (printout t "Found age 25: " $?name crlf)
)