;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ARCHIVO GENERADO AUTOMATICAMENTE 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(deftemplate printer
   (slot id (default ?NONE))	
   (slot model  (default ?NONE))
   (slot tecnology (default ?NONE))
   (slot type (default ?NONE))
   (multislot conectivity (default any))
   (multislot functions (default any))
   (slot color (default any))
   (slot duplex (default any))
   (multislot use (default any))
   (multislot tag (default any))
   (slot a3 (default any))
)
(deftemplate models "Modelos"
  (slot model)
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; lista de hechos
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(deffacts the-printer-list

(printer (id 15)(model "Deskjet1000" )(tecnology laser)(type impresora) (conectivity usb) (functions imprimir)(color si)(duplex no)(use hogar hogar)(tag economica economica)(a3 no))

(printer (id 16)(model "Deskjet2050" )(tecnology inyeccion)(type multifuncion) (conectivity usb) (functions imprimir escanear copiar)(color si)(duplex no)(use hogar hogar)(tag economica economica)(a3 no))

(printer (id 17)(model "Deskjet3050" )(tecnology inyeccion)(type multifuncion) (conectivity usb wifi) (functions imprimir escanear copiar)(color si)(duplex no)(use hogar hogar)(tag economica economica)(a3 no))

(printer (id 18)(model "Photosmart_D110a" )(tecnology inyeccion)(type multifuncion) (conectivity usb wifi) (functions imprimir escanear copiar)(color no)(duplex no)(use profesional profesional)(tag moderado moderado)(a3 no))

(printer (id 19)(model "Photosmart_Plus-B210a" )(tecnology inyeccion)(type multifuncion) (conectivity usb wifi) (functions imprimir escanear copiar)(color si)(duplex no)(use profesional profesional)(tag moderado moderado)(a3 no))

(printer (id 20)(model "Officejet4400-K410a" )(tecnology inyeccion)(type multifuncion) (conectivity usb) (functions imprimir escanear copiar)(color si)(duplex no)(use hogar hogar)(tag economica economica)(a3 no))

(printer (id 21)(model "LaserJet_Pro_100_color_M175a_MFP" )(tecnology laser)(type multifuncion) (conectivity usb) (functions imprimir escanear copiar)(color no)(duplex no)(use pyme pyme)(tag alto alto)(a3 no))

(printer (id 22)(model "Officejet4500Desktop-G510a" )(tecnology inyeccion)(type multifuncion) (conectivity usb) (functions imprimir escanear fax copiar)(color si)(duplex no)(use hogar hogar)(tag economica economica)(a3 no))

(printer (id 23)(model "Officejet100MobileL411a" )(tecnology inyeccion)(type impresora_movil) (conectivity usb) (functions imprimir)(color si)(duplex no)(use pyme pyme)(tag alto alto)(a3 no))

(printer (id 24)(model "Officejet_4575_K710a" )(tecnology inyeccion)(type multifuncion) (conectivity usb) (functions imprimir escanear fax copiar)(color si)(duplex no)(use profesional profesional)(tag moderado moderado)(a3 no))

(printer (id 25)(model "LaserJet_Pro_CP1025nw" )(tecnology laser)(type multifuncion) (conectivity ethernet usb wifi) (functions imprimir)(color si)(duplex no)(use pyme pyme)(tag alto alto)(a3 no))

(printer (id 26)(model "LaserJet_Pro_CP1525nw" )(tecnology laser)(type impresora) (conectivity ethernet usb wifi) (functions imprimir)(color si)(duplex no)(use pyme pyme)(tag alto alto)(a3 no))

(printer (id 27)(model "Officejet_7500A_E910a" )(tecnology inyeccion)(type multifuncion) (conectivity ethernet usb wifi) (functions imprimir escanear fax copiar)(color si)(duplex no)(use pyme pyme)(tag alto alto)(a3 si))

(printer (id 28)(model "LaserJet_Enterprise_500_color_M551dn" )(tecnology laser)(type impresora) (conectivity ethernet usb) (functions imprimir)(color si)(duplex si)(use pyme+ pyme+)(tag gran_inversion gran_inversion)(a3 no))

(printer (id 29)(model "LaserJet_Pro400_color_M475dn_MFP" )(tecnology laser)(type multifuncion) (conectivity ethernet usb) (functions imprimir escanear fax copiar)(color si)(duplex si)(use pyme+ pyme+)(tag gran_inversion gran_inversion)(a3 no))

(printer (id 30)(model "LaserJet_P2055dn" )(tecnology laser)(type impresora) (conectivity ethernet usb) (functions imprimir)(color no)(duplex si)(use pyme pyme)(tag alto alto)(a3 no))

(printer (id 31)(model "LaserJetPro_CM1415fnw_MFP" )(tecnology laser)(type multifuncion) (conectivity ethernet usb wifi) (functions imprimir escanear fax copiar)(color si)(duplex no)(use pyme pyme)(tag alto alto)(a3 no))

(printer (id 32)(model "LaserJetPro400colorM475dwMFP" )(tecnology laser)(type multifuncion) (conectivity ethernet usb wifi) (functions imprimir escanear fax copiar)(color si)(duplex si)(use pyme+ pyme+)(tag gran_inversion gran_inversion)(a3 no))

(printer (id 33)(model "LaserJetEnterpriseP3015d" )(tecnology laser)(type impresora) (conectivity ethernet usb) (functions imprimir)(color no)(duplex si)(use pyme pyme)(tag alto alto)(a3 no))

(printer (id 34)(model "OfficejetPro8000EnterpriseA811a" )(tecnology inyeccion)(type impresora) (conectivity ethernet usb) (functions imprimir)(color no)(duplex si)(use hogar hogar)(tag economica economica)(a3 no))

(printer (id 35)(model "LaserJetPro400ColorPrinterM45dw" )(tecnology laser)(type impresora) (conectivity ethernet usb wifi) (functions imprimir)(color no)(duplex si)(use pyme pyme)(tag alto alto)(a3 no))

(printer (id 36)(model "LaserJet_Enterprise_500_color_M551n" )(tecnology laser)(type impresora) (conectivity ethernet usb) (functions imprimir)(color no)(duplex no)(use pyme+ pyme+)(tag gran_inversion gran_inversion)(a3 no))

(printer (id 37)(model "OfficejetPro_8100_ePrinter_N811aN811d" )(tecnology inyeccion)(type impresora) (conectivity ethernet usb wifi) (functions imprimir)(color si)(duplex si)(use profesional profesional)(tag moderado moderado)(a3 no))

(printer (id 38)(model "LaserJetPro_P1102w" )(tecnology laser)(type impresora) (conectivity usb wifi) (functions imprimir)(color no)(duplex no)(use profesional profesional)(tag moderado moderado)(a3 no))

(printer (id 39)(model "LaserJetPro_P1606dn" )(tecnology laser)(type impresora) (conectivity ethernet usb) (functions imprimir)(color no)(duplex si)(use pyme pyme)(tag alto alto)(a3 no))

(printer (id 40)(model "LaserJetPro_M1132" )(tecnology laser)(type multifuncion) (conectivity usb) (functions imprimir escanear copiar)(color no)(duplex no)(use profesional profesional)(tag moderado moderado)(a3 no))

(printer (id 41)(model "OfficejetPro_8600_N911a" )(tecnology inyeccion)(type multifuncion) (conectivity ethernet usb wifi) (functions imprimir escanear fax copiar)(color si)(duplex no)(use pyme pyme)(tag alto alto)(a3 no))

(printer (id 42)(model "LaserJet_P2035" )(tecnology laser)(type impresora) (conectivity usb ) (functions imprimir)(color no)(duplex no)(use profesional profesional)(tag moderado moderado)(a3 no))

(printer (id 43)(model "OfficejetPro_8600Plus_N911g" )(tecnology inyeccion)(type multifuncion) (conectivity ethernet usb wifi) (functions imprimir escanear fax copiar envio digital)(color si)(duplex si)(use pyme pyme)(tag alto alto)(a3 no))

(printer (id 44)(model "LaserJetPro_M1212nf_MFP" )(tecnology laser)(type multifuncion) (conectivity ethernet usb) (functions imprimir escanear fax copiar)(color no)(duplex no)(use profesional profesional)(tag moderado moderado)(a3 no))

(printer (id 45)(model "LaserJet_P2035n" )(tecnology laser)(type impresora) (conectivity ethernet usb) (functions imprimir)(color no)(duplex no)(use pyme pyme)(tag alto alto)(a3 no))

(printer (id 46)(model "LaserJetPro_M1536dnf" )(tecnology laser)(type multifuncion) (conectivity ethernet usb) (functions imprimir escanear fax copiar)(color no)(duplex si)(use pyme pyme)(tag alto alto)(a3 no))

(printer (id 47)(model "Color_LaserJet_Enterprise_CM4540f_MFP" )(tecnology laser)(type multifuncion) (conectivity ethernet usb) (functions imprimir escanear fax copiar envio digital)(color no)(duplex no)(use pyme+ pyme+)(tag gran_inversion gran_inversion)(a3 no))

(printer (id 48)(model "HP_Color_LaserJet_Enterprise_CP5525dn" )(tecnology laser)(type impresora) (conectivity ethernet usb) (functions imprimir)(color si)(duplex si)(use pyme+ pyme+)(tag gran_inversion gran_inversion)(a3 si))

)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Reglas
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule recomendar
 (printer
	(id ?id)
        (model ?model)
        (use $?uso)
        (type ?type)
        (tecnology ?tec)
        (color ?color)
        (duplex ?duplex)
        (a3 ?a3)	
	(functions $?functions)
)
	(uso $?uso2)
	(functions $?functions2)
        (test (subsetp $?uso2 $?uso))
        (test (subsetp $?functions $?functions2))
        (test (subsetp $?functions2 $?functions))
	(type ?type)
	(tecnology ?tec)
	(color ?color)
	(a3 ?a3)
	(duplex ?duplex)
=>
        (assert (models(model ?model)))
	(assert (id ?id))

)
(defrule print-recom
 (models (model ?model))
=>
 (printout t crlf ?model "\n")
)
