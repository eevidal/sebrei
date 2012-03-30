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
 )

;;*****************
;;*    defacts    *
;;*****************

(deffacts the-printer-list 
  (printer (model "HP Deskjet 2050" )(tecnology laser) (type multifuncion) (conectivity usb) (functions imprimir copiar escanear) (color si) (duplex si) (use hogareña)(tag economico))
  (printer (model "HP Officejet 4000")(tecnology laser)(type multifuncion)(conectivity usb)(functions imprimir copiar escanear) (color si)(duplex no) (use hogarenña)(tag economico))
 ;; (printer (model "HP Deskjet 1000")(tecnology laser)(type multifuncion)(conectivity usb)(functions imprimir copiar escanear) (color si)(duplex si)(use hogareña)(tag economico))
  (printer (model "HP Photosmart Plus B210a")(tecnology laser)(type multifuncion)(conectivity usb wifi)(functions imprimir copiar escanear)(color si)(duplex no)(use hogareña)(maxp 5000)(tag economico))
;;  (printer (model "HP Deskjet 3050")(tecnology laser) (type multifuncion)(conectivity usb)(functions imprimir copiar escanear)(color si) (duplex no)(use hogareña)(tag profesional))
 ;; (printer (model "HP Photosmart D110a")(tecnology laser)(type multifuncion)(conectivity usb wifi ethernet)(functions imprimir copiar escanear)(color si)(duplex si)(use hogarenio)(tag pofesional))

;;; hasta aca las que ya estaban // comente las repetidas
 
  (printer (model "HP Deskjet 1000")(tecnology inyeccion)(type impresora)(conectivity usb)(functions imprimir) (color si)(duplex no)(minp 250)(maxp 500)(use hogareña)(tag economico))
  (printer (model "HP Deskjet 3050")(tecnology inyeccion) (type multifuncion)(conectivity wifi usb)(functions imprimir copiar escanear)(color si) (duplex no)(minp 250)(maxp 500)(use hogareña)(tag economico))
  (printer (model "HP Photosmart D110a")(tecnology inyeccion)(type multifuncion)(conectivity web wifi usb)(functions imprimir copiar escanear)(color si)(duplex si)(minp 250)(maxp 500)(use hogareña)(tag economico))
  (printer (model "HP Photosmart Plus B210a")(tecnology inyeccion)(type multifuncion)(conectivity web wifi usb)(functions imprimir copiar escanear)(color si)(duplex no)(minp 275)(maxp 500)(use hogareña)(tag economico))

  (printer (model "HP LaserJet Pro CP1525nw")(tecnology laser)(type impresora)(conectivity ethernet wifi usb_alta_velocidad)(functions imprimir)(color si)(duplex no)(minp 250)(maxp 1000)(use profesional)(tag moderado))
  (printer (model "HP Officejet 4400")(tecnology inyeccion)(type multifuncion)(conectivity usb)(functions imprimir copiar escanear)(color si)(duplex no)(minp 250)(maxp 1000)(use profesional)(tag economico))
  (printer (model "HP LaserJet Pro 100 color M175a")(tecnology laser)(type multifuncion)(conectivity usb_alta_velocidad)(functions imprimir copiar escanear)(color si)(duplex no)(minp 250)(maxp 950)(use profesional)(tag moderado))
  (printer (model "HP OfficeJet 4500")(tecnology inyeccion)(type multifuncion)(conectivity usb)(functions imprimir copiar escanear fax)(color si)(duplex no)(minp 350)(maxp 600)(use hogareña)(tag economico))
  (printer (model "HP LaserJet Enterprise 500")(tecnology laser)(type impresora)(conectivity ethernet usb_alta_velocidad)(functions imprimir)(color si)(duplex si)(minp 1500)(maxp 5000)(use pyme)(tag profesional))
  (printer (model "HP LaserJet M2727nf")(tecnology laser)(type multifuncion)(conectivity ethernet usb)(functions imprimir copiar escanear fax)(color si)(duplex si)(minp 750)(maxp 3000)(use pyme)(tag moderado))
  (printer (model "HP LaserJet CM2320nf")(tecnology laser)(type multifuncion)(conectivity ethernet usb_alta_velocidad)(functions imprimir copiar escanear)(color si)(duplex no)(minp 1000)(maxp 2500)(use pyme)(tag economico))
  (printer (model "HP LaserJet M3027x")(tecnology laser)(type multifuncion)(conectivity ethernet usb usb_alta_velocidad)(functions imprimir copiar escanear fax envio_digital)(color no)(duplex si)(minp 2000)(maxp 6000)(use pyme)(tag profesional))
  (printer (model "HP LaserJet Enterprise CM4540f")(tecnology multifuncion)(type impresora)(conectivity ethernet usb usb_alta_velocidad)(functions imprimir copiar escanear fax envio_digital)(color si)(duplex si)(minp 5000)(maxp 9000)(use pyme+)(tag profesional))
  (printer (model "HP LaserJet 5200tn")(tecnology laser)(type impresora)(conectivity ethernet usb)(functions imprimir)(color no)(duplex no)(minp 2500)(maxp 10000)(use pyme+)(tag economico))
  (printer (model "HP LaserJet 9095dn")(tecnology laser)(type impresora)(conectivity usb)(functions imprimir)(color no)(duplex si)(minp 150000)(maxp 500000)(use empresarial)(tag profesional))
  (printer (model "HP LaserJet M5035xs")(tecnology laser)(type multifuncion)(conectivity usb usb_alta_velocidad)(functions imprimir copiar escanear fax envio_digital)(color no)(duplex si)(minp 3000)(maxp 12500)(use empresarial)(tag profesional))
  (printer (model "HP LaserJet CP6015dn")(tecnology laser)(type impresora)(conectivity ethernet usb usb_alta_velocidad)(functions imprimir)(color si)(duplex si)(minp 4000)(maxp 17000)(use empresarial)(tag profesional))
)

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
	(assert (regla 1))
)

(defrule regla-uso1
	?r<-(regla 1)
	(volumen (paginas ?p))
	(test (< ?p  500) )
=> 
	(retract ?r)
	(assert (uso hogareña)))

(defrule regla-uso2
	?r<-(regla 1)
	(volumen (paginas ?p))
	(and (test (> ?p  500) )(test (<=  ?p  1000)))
=> 
	(retract ?r)
	(assert (uso profesional)))


(defrule regla-uso3
	?r<-(regla 1)
	(volumen (paginas ?p))
	(and (test (> ?p  1000) )(test (<=  ?p  5000)))
=> 
	(retract ?r)
	(assert (uso pyme)))

(defrule regla-uso4
	?r<-(regla 1)
	(volumen (paginas ?p))
	(and (test (> ?p  5000) )(test (<=  ?p  10000)))
=> 
	(retract ?r)
	(assert (uso pyme+)))

(defrule regla-uso5
	?r<-(regla 1)
	(volumen (paginas ?p))
	(test (> ?p  10000) )
=> 
	(retract ?r)
	(assert (uso empresarial)))



(defrule regla-funcion1
	(uso hogareña)
=> 
	
	(assert (A3 no))
	(assert (duplex no))
	(printout t crlf "Me pregunto si además te interesaría poder escanear documentos?")
	(printout t crlf "Respuesta>")
	(bind ?ans (read)) 	
	(assert (escanear ?ans))
)


(defrule regla-funcion2
	(uso hogareña)
	(escanear si)
=> 
	(assert(functions imprimir copiar escanear))
	(assert (tecnology inyeccion))  ;; porque en HP no hay multifunciones laser para menos de 500 pag
	(assert (type multifuncion))
)



(defrule regla-funcion3
	(uso hogareña)
	(escanear no)
=> 
	(assert (functions imprimir))
	(printout t crlf "Necesitaras desplazar la impresora en viajes, o trasladarla a diferentes habitaciones?")
	(printout t crlf "Respuesta>")
	(bind ?ans (read)) 	
	(assert (movilidad ?ans))
)

(defrule regla-funcion4
	(uso hogareña)
	(escanear no)
	(movilidad no)
=> 
	(assert (tecnology inyeccion))
	(assert (type impresora))
)

(defrule regla-funcion5
	(uso hogareña)
	(escanear no)
	(movilidad si)
=> 
	(assert (type impresora_movil))
)

(defrule regla-funcion6
	(uso hogareña)
	(escanear no)
	(movilidad si)
	(color si)
=> 
	(assert (tecnology inyeccion))
)

(defrule regla-funcion7
	(uso hogareña)
	(escanear no)
	(movilidad si)
	(color no)
=> 
	(assert (tecnology termic))
	(assert (tecnology inyeccion))

)


(defrule recomendar
 (printer  
	(model ?model)
	(use ?uso)
	(type ?type)
	(tecnology ?tec)
	(color ?color))
 (uso ?uso)
 (type ?type)
 (tecnology ?tec)
 (color ?color)
=> 
	(assert  (model ?model))
	
)


(defrule print-recom
 (model ?model)
=> 
 (printout t crlf ?model "\n")
)
