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
   (slot a3 (default any))	
   (slot tag (default ?NONE))
 )

(deftemplate models "Modelos"
  (slot model)
)

;;*****************
;;*    defacts    *
;;*****************

(deffacts the-printer-list
  (printer (model "HP Deskjet 2050" )(tecnology laser) (type multifuncion) (conectivity usb) (functions imprimir copiar escanear) (color si) (duplex si) (use hogar)(tag economico))
  (printer (model "HP Officejet 4000")(tecnology laser)(type multifuncion)(conectivity usb)(functions imprimir copiar escanear) (color si)(duplex no) (use hogar)(tag economico))

  (printer (model "HP Photosmart Plus B210a")(tecnology laser)(type multifuncion)(conectivity usb wifi)(functions imprimir copiar escanear)(color si)(duplex no)(use hogar)(maxp 5000)(tag economico))

  (printer (model "HP Deskjet 1000")(tecnology inyeccion)(type impresora)(conectivity usb)(functions imprimir) (color si)(duplex no)(minp 250)(maxp 500)(use hogar)(tag economico))
  (printer (model "HP Deskjet 3050")(tecnology inyeccion) (type multifuncion)(conectivity wifi usb)(functions imprimir copiar escanear)(color si) (duplex no)(minp 250)(maxp 500)(use hogar)(tag economico))
  (printer (model "HP Photosmart D110a")(tecnology inyeccion)(type multifuncion)(conectivity web wifi usb)(functions imprimir copiar escanear)(color si)(duplex si)(minp 250)(maxp 500)(use hogar)(tag economico))
  (printer (model "HP Photosmart Plus B210a")(tecnology inyeccion)(type multifuncion)(conectivity web wifi usb)(functions imprimir copiar escanear)(color si)(duplex no)(minp 275)(maxp 500)(use hogar)(tag economico))

  (printer (model "HP LaserJet Pro CP1525nw")(tecnology laser)(type impresora)(conectivity ethernet wifi usb_alta_velocidad)(functions imprimir)(color si)(duplex no)(minp 250)(maxp 1000)(use profesional)(tag moderado))
  (printer (model "HP Officejet 4400")(tecnology inyeccion)(type multifuncion)(conectivity usb)(functions imprimir copiar escanear)(color si)(duplex no)(minp 250)(maxp 1000)(use profesional)(tag economico))
  (printer (model "HP LaserJet Pro 100 color M175a")(tecnology laser)(type multifuncion)(conectivity usb_alta_velocidad)(functions imprimir copiar escanear)(color si)(duplex no)(minp 250)(maxp 950)(use profesional)(tag moderado))
  (printer (model "HP OfficeJet 4500")(tecnology inyeccion)(type multifuncion)(conectivity usb)(functions imprimir copiar escanear fax)(color si)(duplex no)(minp 350)(maxp 600)(use hogar)(tag economico) (a3 no))
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
;;*****************
;;* MODULE PRINTER *
;;*****************
;;********************************;;
;; load  defacts printers
;;********************************;;



(defrule recomendar
 (printer
        (model ?model)
        (use ?uso)
        (type ?type)
        (tecnology ?tec)
        (color ?color)
        (duplex ?duplex)
        (a3 ?a3)
	(functions $?f))
	 (uso ?uso)
 (type ?type)
 (tecnology ?tec)
 (color ?color)
 (duplex ?duplex)
 (functions $?f)
=>
        (assert (models(model ?model)))

)

(defrule print-recom
 (models (model ?model))
=>
 (printout t crlf ?model "\n")
)


