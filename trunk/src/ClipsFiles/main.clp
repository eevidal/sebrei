
(deftemplate questions
   (slot question (default ?NONE))
   (slot atribute (default ?NONE))
   (slot type (default ?NONE))
)



;**************
;defrules     *
;**************
;***************

(defrule start1
	?init <- (initial-fact)
	(terminal)

=>
	(retract ?init)
	(printout t crlf "Será necesario imprimir a color?")
	(printout t crlf "Respuesta>")
	(bind ?color (read))
	(printout t crlf "Cúal es el volumen mensual de páginas?")
	(printout t crlf "Respuesta>")
	(bind ?pag (read))
	(printout t crlf "¿Cúal es el tamaño del grupo de trabajo?" )
	(printout t crlf "Respuesta>")
	(bind ?grupo (read))
	(printout t crlf "¿Cúanto es lo máximo que esta dispuesto a gastar?" )
        (printout t crlf "Respuesta>")
	(bind ?precio (read))
	(assert (color ?color))
	(assert (paginas ?pag))
	(assert (grupo ?grupo))
	(assert (precio ?precio))
	(assert (regla 1))
	(assert (adicionales))

)

(defrule start2
        ?init <- (initial-fact)
	(browser)
=>
        (retract ?init)
        (assert (questions(question "Será necesario imprimir a color?")(atribute color)(type bool) ))
        (assert (questions(question "Cúal es el volumen mensual de páginas?")(atribute paginas) (type int)))
        (assert (questions(question "¿Cúal es el tamaño del grupo de trabajo?")(atribute grupo) (type int)))
	(assert (questions(question "¿Cúanto es lo máximo que esta dispuesto a gastar?")(atribute precio) (type int)))
        (assert (regla 1))
	(assert (adicionales))

)


(defrule regla-conect1
	(grupo ?g)
	(test (<=  ?g  2))
=>
	(assert (conectivity usb))	

)

(defrule regla-conect2
        (grupo ?g)
        (and (test (<=  ?g  4)) (test (>  ?g  2))  )
=>
        (assert (conectivity usb wifi))

	
)

(defrule regla-conect3
        (grupo ?g)
         (test (>  ?g  4))  
=>
        (assert (conectivity ethernet))

)



(defrule regla-hog1
	(uso hogar)
	(terminal)
=> 
	
	(assert (a3 no))
	(assert (duplex no))
	(printout t crlf "Te interesaria ademas de imprimir poder escanear documentos con el mismo equipo?")
	(printout t crlf "Respuesta>")
	(bind ?ans (read)) 	
	(assert (escanear ?ans))
)


(defrule regla-hog1b
        (uso hogar)
	(browser)
=>

        (assert (a3 no))
        (assert (duplex no))
        (assert (questions(question "Te interesaria ademas de imprimir poder escanear documentos con el mismo equipo?")(atribute escanear)(type bool) ))

)


(defrule regla-hog2
	(uso hogar)
	(escanear si)
=> 
	(assert(functions imprimir copiar escanear ))
	(assert (tecnology inyeccion)) 
	(assert (tecnology laser))	
	(assert (type multifuncion))
)



(defrule regla-hog3
	(uso hogar)
	(escanear no)
	(terminal)
=> 
	(assert (functions imprimir))
	(printout t crlf "Necesitaras desplazar la impresora en viajes, o trasladarla a diferentes habitaciones?")
	(printout t crlf "Respuesta>")
	(bind ?ans (read)) 	
	(assert (movilidad ?ans))
)

(defrule regla-hog3b
        (uso hogar)
        (escanear no)
	(browser)
=>
        (assert (functions imprimir))
        (assert (questions (question "Necesitaras desplazar la impresora en viajes, o trasladarla a diferentes habitaciones?")(atribute movilidad)(type bool) ))

)



(defrule regla-hog4
	(movilidad no)
=> 
	(assert (tecnology inyeccion))
	(assert (tecnology laser))
	(assert (type impresora))
)

(defrule regla-hog5
	(movilidad si)
=> 
	(assert (type impresora_movil))
)

(defrule regla-hog6
	(movilidad si)
	(color si)
=> 
	(assert (tecnology inyeccion))
)

(defrule regla-hog7
	(movilidad si)
	(color no)
=> 
	(assert (tecnology termic))
	(assert (tecnology inyeccion))

)

(defrule regla-A3
	(uso ~hogar)
	(terminal)
	
=> 

	(printout t crlf "¿Se necesitará imprimir en  A3?")
	(printout t crlf "Respuesta>")
	(bind ?ans (read)) 	
	(assert (a3 ?ans))
)

(defrule regla-A3b
        (uso ~hogar)
	(browser)
=>

        (assert (questions(question "¿Se necesitará imprimir en  A3?")(atribute a3)(type bool) ))

)


(defrule regla-duplex
	(uso ~hogar)
	(uso ~profesional)
	(terminal)
	
=> 

	(printout t crlf "Le interesa poder imprimir a doble faz de forma automatica?, encarecerá un poco el equipo.")
	(printout t crlf "Respuesta>")
	(bind ?ans (read)) 	
	(assert (duplex ?ans))
)

(defrule regla-duplexb
        (uso ~hogar)
        (uso ~profesional)
	(browser)

=>

        (assert (questions(question "¿Le interesa poder imprimir a doble faz de forma automatica?, encarecerá un poco el equipo.")(atribute duplex)(type bool) ) )
)




(defrule regla-pro1
	(uso profesional)
	(terminal)
=> 

	(assert (duplex no))
	(printout t crlf "¿Te interesar además de imprimir poder enviar fax con el mismo equipo?")
	(printout t crlf "Respuesta>")
	(bind ?ans (read)) 	
	(assert (fax ?ans))
)




(defrule regla-pro2
	(uso profesional)
	(fax no)
	(terminal)
=> 
	(printout t crlf "¿Te interesa ecanear o fotocopiar con el mismo equipo?")
	(printout t crlf "Respuesta>")
	(bind ?ans (read)) 	
	(assert (escanear ?ans))
)

(defrule regla-pro1b
        (uso profesional)
	(browser)
=>

        (assert (duplex no))
        (assert (questions(question "¿Te interesa ademas de imprimir poder enviar fax con el mismo equipo?")(atribute fax)(type bool) ))

)


(defrule regla-pro2b
        (uso profesional)
        (fax no)
	(browser)
=>
        (assert (questions(question "¿Te interesa ecanear o fotocopiar con el mismo equipo?")(atribute escanear) (type bool)) )
)




(defrule regla-pro3
	(uso profesional)
	(fax no)
	(escanear no)
=> 	
	(assert (type impresora))
	(assert (functions imprimir))
)


(defrule regla-pro4
	(uso profesional)
	(fax no)
	(escanear si)
=> 	
	(assert (type multifuncion))
	(assert (functions imprimir copiar escanear))
)


(defrule regla-pro5
	(uso profesional)
	(fax si)
=> 	
	(assert (escanear si))
	(assert (type multifuncion))
	(assert (functions imprimir copiar escanear fax))
)


(defrule regla-pro6
	(uso profesional)
	(paginas ?p)
	(test (>= ?p 800))

=> 	
	(assert (tecnology laser))
)

(defrule regla-pro7
	(uso profesional)
	(paginas ?p)
	(test (< ?p 800))

=> 	
	(assert (tecnology laser))
	(assert (tecnology inyeccion))
)

(defrule regla-py1
	(uso pyme)
	(terminal)
=> 
	(printout t crlf "¿Te interesa además de imprimir poder escanear documentos con el mismo equipo?")
	(printout t crlf "Respuesta>")
	(bind ?ans (read)) 	
	(assert (escanear ?ans))
)

(defrule regla-py2
	(uso pyme)
	(escanear si)
	(terminal)
=> 
	(assert (type multifuncion))
	(printout t crlf "¿Te interesar además de imprimir poder enviar fax con el mismo equipo?")
	(printout t crlf "Respuesta>")
	(bind ?f (read)) 	
	(assert (fax ?f))
	(printout t crlf "y hacer envíos digitales?")
	(printout t crlf "Respuesta>")
	(bind ?ans (read)) 	
	(assert (envio_digital ?ans))
)

(defrule regla-py1b
        (uso pyme)
	(browser)
=>
        (assert (questions(question "¿Te interesa además de imprimir poder escanear documentos con el mismo equipo?")(atribute escanear)(type bool) ))

)

(defrule regla-py2b
        (uso pyme)
        (escanear si)
	(browser)
	
=>
        (assert (type multifuncion))
        (assert (questions(question "¿Te interesa poder enviar fax con el mismo equipo?")(atribute fax)(type bool) ))
        (assert (regla envio))
)

(defrule regla-envio
        ?r<-(regla envio)
	(browser)
=>
         (assert (questions( question "¿Será necesario hacer envíos digitales?")(atribute envio_digital)(type bool) ))
        (retract ?r)
)





(defrule regla-py3
	(uso pyme)
	(paginas ?p)
	(test (< ?p 1250))

=> 	
	(assert (tecnology laser))
	(assert (tecnology inyeccion))
)

(defrule regla-py4
	(uso pyme)
	(paginas ?p)
	(test (> ?p 1250))

=> 	
	(assert (tecnology laser))
)

(defrule regla-py5
	(uso pyme)
	(escanear no)

=> 	
	(assert (type impresora))
	(assert (functions imprimir))
)

(defrule regla-py6
	(uso pyme)
	(fax si)
	(envio_digital si)

=> 	
	(assert (functions imprimir copiar escanear fax envio_digital))
)

(defrule regla-py7
	(uso pyme)
	(fax si)
	(envio_digital no)

=> 	
	(assert (functions imprimir copiar escanear fax ))
)

(defrule regla-py8
	(uso pyme)
	(fax no)
	(envio_digital si)

=> 	
	(assert (functions imprimir copiar escanear envio_digital))
)

(defrule regla-py9
	(uso pyme)
	(escanear si)
	(fax no)
	(envio_digital no)

=> 	
	(assert (functions imprimir copiar escanear))
)


(defrule regla-laser
	(or (uso pyme+) (uso corporativo))

=> 	
	(assert (tecnology laser))
)


(defrule regla-py+1
	(uso pyme+)
	(terminal)
=> 
	(printout t crlf "¿Te interesa poder escanear documentos, enviar fax o archivos digitales via mail con el mismo equipo?")
	(printout t crlf "Respuesta>")
	(bind ?f (read)) 	
	(assert (fax ?f))

)

(defrule regla-py+1b
        (uso pyme+)
	(browser)
=>
        (assert (questions(question "¿Te interesa poder escanear documentos, enviar fax o archivos digitales via mail con el mismo equipo?")(atribute fax)(type bool) ))

)



(defrule regla-py+2
	(uso pyme+)
	(fax si)

=> 	
	(assert (type multifuncion))
	(assert (functions imprimir copiar escanear fax envio_digital))
)

(defrule regla-py+3
	(uso pyme+)
	(fax no)

=> 	
	(assert (type impresora))
	(assert (functions imprimir))
)

(defrule regla-emp1
	(uso corporativo)
	(terminal)
=> 
	(printout t crlf "¿Te interesa poder enviar fax de documentos con el mismo equipo?")
	(printout t crlf "Respuesta>")
	(bind ?f (read)) 	
	(assert (fax ?f))
	(printout t crlf "y hacer envíos digitales o escanear documentos?")
	(printout t crlf "Respuesta>")
	(bind ?ans (read)) 	
	(assert (envio_digital ?ans))
)

(defrule regla-py+2b
        (uso pyme+)
        (fax si)
	(browser)

=>
        (assert (type multifuncion))
        (assert (functions imprimir copiar escanear fax envio_digital))
)


(defrule regla-emp2
	(uso corporativo)
	(fax si)

=> 	
	(assert (type multifuncion))
	(assert (functions imprimir copiar escanear fax envio_digital))
	
)

(defrule regla-emp3
	(uso corporativo)
	(fax no)
	(envio_digital si)

=> 	
	(assert (type multifuncion))
	(assert (functions imprimir copiar escanear  envio_digital))
	
)


(defrule regla-emp4
	(uso corporativo)
	(fax no)
	(envio_digital no)

=> 	
	(assert (type impresora))
	(assert (functions imprimir))
	
)



