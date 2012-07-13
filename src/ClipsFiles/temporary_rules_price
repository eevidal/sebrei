;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ARCHIVO GENERADO AUTOMATICAMENTE 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule regla-price1
        (precio ?p)
        (and (test (> ?p  0) )(test (<=  ?p  500)))
	=>
        (assert (tag economica))
)


(defrule regla-price2
        (precio ?p)
        (and (test (> ?p  500) )(test (<=  ?p  1000)))
	=>
        (assert (tag moderado economica))
)


(defrule regla-price3
        (precio ?p)
        (and (test (> ?p  1000) )(test (<=  ?p  3000)))
	=>
        (assert (tag alto economica moderado))
)


(defrule regla-price4
        (precio ?p)
        (and (test (> ?p  3000) )(test (<=  ?p  150000)))
	=>
        (assert (tag gran_inversion economica moderado alto))
)


