;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ARCHIVO GENERADO AUTOMATICAMENTE 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule regla-uso1
	?r<-(regla 1)
        (paginas ?p)
        (and (test (> ?p  0) )(test (<=  ?p  500)))
	=>
        (retract ?r)
        (assert (uso hogar))
)


(defrule regla-uso2
	?r<-(regla 1)
        (paginas ?p)
        (and (test (> ?p  500) )(test (<=  ?p  1000)))
	=>
        (retract ?r)
        (assert (uso profesional))
)


(defrule regla-uso3
	?r<-(regla 1)
        (paginas ?p)
        (and (test (> ?p  1000) )(test (<=  ?p  5000)))
	=>
        (retract ?r)
        (assert (uso pyme))
)


(defrule regla-uso4
	?r<-(regla 1)
        (paginas ?p)
        (and (test (> ?p  5000) )(test (<=  ?p  10000)))
	=>
        (retract ?r)
        (assert (uso pyme+))
)


(defrule regla-uso5
	?r<-(regla 1)
        (paginas ?p)
        (and (test (> ?p  10000) )(test (<=  ?p  2000000)))
	=>
        (retract ?r)
        (assert (uso corporativo))
)


