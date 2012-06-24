(deftemplate printer 
   (slot model  (default ?NONE))
   (slot tecnology (default ?NONE))		
   (slot type (default ?NONE))
   (multislot conectivity (default any))
   (multislot functions (default any))
   (slot color (default any))
   (slot duplex (default any))
   (slot use (default any))
   (slot maxp (default any))
   (slot minp (default any))
   (slot tag (default ?NONE))
   (slot a3 (default any))
 )

;;*****************
;;*    defacts    *
;;*****************


;;********************************;; 


(deftemplate volumen "Volumen mensual"
  (slot paginas)
)
(deftemplate tgrupo "tamaño del grupo"
  (slot miembros)
)
 

;**************
;defrules     *
;**************
;***************

(defrule start
	?init <- (initial-fact)
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
	(bind ?vol (max ?pag ?grupo))
	(assert (color ?color))
	(assert (volumen (paginas ?vol)))
	(assert (tgrupo (miembros ?grupo)))

)




(defrule regla-hog1
	(uso hogar)
=> 
	
	(assert (a3 no))
	(assert (duplex no))
	(printout t crlf "Te interesaria ademas de imprimir poder escanear documentos con el mismo equipo?")
	(printout t crlf "Respuesta>")
	(bind ?ans (read)) 	
	(assert (escanear ?ans))
)


(defrule regla-hog2
	(uso hogar)
	(escanear si)
=> 
	(assert(functions imprimir copiar escanear))
	(assert (tecnology inyeccion))  ;; porque en HP no hay multifunciones laser para menos de 500 pag
	(assert (type multifuncion))
)



(defrule regla-hog3
	(uso hogar)
	(escanear no)
=> 
	(assert (functions imprimir))
	(printout t crlf "Necesitaras desplazar la impresora en viajes, o trasladarla a diferentes habitaciones?")
	(printout t crlf "Respuesta>")
	(bind ?ans (read)) 	
	(assert (movilidad ?ans))
)

(defrule regla-hog4
	(uso hogar)
	(escanear no)
	(movilidad no)
=> 
	(assert (tecnology inyeccion))
	(assert (type impresora))
)

(defrule regla-hog5
	(uso hogar)
	(escanear no)
	(movilidad si)
=> 
	(assert (type impresora_movil))
)

(defrule regla-hog6
	(uso hogar)
	(escanear no)
	(movilidad si)
	(color si)
=> 
	(assert (tecnology inyeccion))
)

(defrule regla-hog7
	(uso hogar)
	(escanear no)
	(movilidad si)
	(color no)
=> 
	(assert (tecnology termic))
	(assert (tecnology inyeccion))

)

(defrule regla-A3
	(uso ~hogar)
	
=> 

	(printout t crlf "¿Se necesitará imprimir en  A3?")
	(printout t crlf "Respuesta>")
	(bind ?ans (read)) 	
	(assert (a3 ?ans))
)

(defrule regla-duplex
	(uso ~hogar)
	(uso ~profesional)
	
=> 

	(printout t crlf "Le interesa poder imprimir a doble fax de forma automatica?, encarecerá un poco el equipo.")
	(printout t crlf "Respuesta>")
	(bind ?ans (read)) 	
	(assert (duplex ?ans))
)


(defrule regla-pro1
	(uso profesional)
=> 

	(assert (duplex no))
	(printout t crlf "Te interesar�a adem�s de imprimir poder env�ar fax con el mismo equipo?")
	(printout t crlf "Respuesta>")
	(bind ?ans (read)) 	
	(assert (fax ?ans))
)


(defrule regla-pro2
	(uso profesional)
	(fax no)
=> 
	(printout t crlf " ecanear o fotocopiar con el mismo equipo?")
	(printout t crlf "Respuesta>")
	(bind ?ans (read)) 	
	(assert (escanear ?ans))
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
	(volumen (paginas ?p))
	(test (>= ?p 800))

=> 	
	(assert (tecnology laser))
)

(defrule regla-pro7
	(uso profesional)
	(volumen (paginas ?p))
	(test (< ?p 800))

=> 	
	(assert (tecnology laser))
	(assert (tecnology inyeccion))
)

(defrule regla-py1
	(uso pyme)
=> 
	(printout t crlf "Te interesaria ademas de imprimir poder escanear documentos con el mismo equipo?")
	(printout t crlf "Respuesta>")
	(bind ?ans (read)) 	
	(assert (escanear ?ans))
)

(defrule regla-py2
	(uso pyme)
	(escanear si)
=> 
	(assert (type multifuncion))
	(printout t crlf "Te interesaria ademas de imprimir poder enviar fax con el mismo equipo?")
	(printout t crlf "Respuesta>")
	(bind ?f (read)) 	
	(assert (fax ?f))
	(printout t crlf "y hacer envíos digitales?")
	(printout t crlf "Respuesta>")
	(bind ?ans (read)) 	
	(assert (envio_digital ?ans))
)

(defrule regla-py3
	(uso pyme)
	(volumen (paginas ?p))
	(test (< ?p 1250))

=> 	
	(assert (tecnology laser))
	(assert (tecnology inyeccion))
)

(defrule regla-py4
	(uso pyme)
	(volumen (paginas ?p))
	(test (> ?p 1250))

=> 	
	(assert (tecnology laser))
)

(defrule regla-py5
	(uso pyme)
	(escaner no)

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
	(escaner si)
	(fax no)
	(envio_digital no)

=> 	
	(assert (functions imprimir copiar escanear))
)


(defrule regla-laser
	(or (uso pyme+) (uso empresarial))

=> 	
	(assert (tecnology laser))
)


(defrule regla-py+1
	(uso pyme+)
=> 
	(printout t crlf "Te interesaria ademas de imprimir poder escanear documentos, enviar fax o archivos digitales via mail con el mismo equipo?")
	(printout t crlf "Respuesta>")
	(bind ?f (read)) 	
	(assert (fax ?f))

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
	(uso empresarial)
=> 
	(printout t crlf "Te interesaria ademas de imprimir poder enviar fax de documentos con el mismo equipo?")
	(printout t crlf "Respuesta>")
	(bind ?f (read)) 	
	(assert (fax ?f))
	(printout t crlf "y hacer envíos digitales o escanear documentos?")
	(printout t crlf "Respuesta>")
	(bind ?ans (read)) 	
	(assert (envio_digital ?ans))
)

(defrule regla-emp2
	(uso empresarial)
	(fax si)

=> 	
	(assert (type multifuncion))
	(assert (functions imprimir copiar escanear fax envio_digital))
	
)

(defrule regla-emp3
	(uso empresarial)
	(fax no)
	(envio_digital si)

=> 	
	(assert (type multifuncion))
	(assert (functions imprimir copiar escanear  envio_digital))
	
)


(defrule regla-emp4
	(uso empresarial)
	(fax no)
	(envio_digital no)

=> 	
	(assert (type impresora))
	(assert (functions imprimir))
	
)


(defrule recomendar
 (printer  
	(model ?model)
	(use ?uso)
	(type ?type)
	(tecnology ?tec)
	(color ?color)
	(duplex ?duplex)
	(a3 ?a3))
 (uso ?uso)
 (type ?type)
 (tecnology ?tec)
 (color ?color)
 (duplex ?duplex) 
 (a3 ?a3)
=> 
	(assert  (model ?model))
	
)


(defrule print-recom
 (model ?model)
=> 
 (printout t crlf ?model "\n")
)
