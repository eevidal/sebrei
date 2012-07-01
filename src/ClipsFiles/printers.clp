;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ARCHIVO GENERADO AUTOMATICAMENTE 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(deftemplate printer
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

(printer (model "Deskjet1000" )(tecnology laser)(type impresora) (conectivity usb) (functions imprimir)(color si)(duplex no)(use hogar hogar)(tag economica economica))

(printer (model "Deskjet2050" )(tecnology inyeccion)(type multifuncion) (conectivity usb) (functions imprimir escanear copiar)(color si)(duplex no)(use hogar hogar)(tag economica economica))

(printer (model "Deskjet3050" )(tecnology inyeccion)(type multifuncion) (conectivity usb wifi) (functions imprimir escanear copiar)(color si)(duplex no)(use hogar hogar)(tag economica economica))

(printer (model "Photosmart-D110a" )(tecnology inyeccion)(type multifuncion) (conectivity usb wifi) (functions imprimir escanear copiar)(color si)(duplex no)(use hogar hogar)(tag moderado moderado))

(printer (model "Photosmart_Plus-B210a" )(tecnology inyeccion)(type multifuncion) (conectivity usb wifi) (functions imprimir escanear copiar)(color si)(duplex no)(use hogar hogar)(tag moderado moderado))

(printer (model "Officejet4400-K410a" )(tecnology inyeccion)(type multifuncion) (conectivity usb) (functions imprimir escanear copiar)(color si)(duplex no)(use hogar profesional)(tag economica economica))

(printer (model "LaserJetPro100colorM175aMFP" )(tecnology laser)(type multifuncion) (conectivity usb) (functions imprimir escanear copiar)(color si)(duplex no)(use hogar profesional)(tag alto alto))

(printer (model "Officejet4500Desktop-G510a" )(tecnology inyeccion)(type multifuncion) (conectivity usb) (functions imprimir escanear fax copiar)(color si)(duplex no)(use hogar profesional)(tag economica economica))

(printer (model "Officejet100MobileL411a" )(tecnology inyeccion)(type impresora_movil) (conectivity usb) (functions imprimir)(color si)(duplex no)(use hogar hogar)(tag alto alto))

(printer (model "Officejet_4575_K710a" )(tecnology inyeccion)(type multifuncion) (conectivity usb) (functions imprimir escanear fax copiar)(color si)(duplex no)(use hogar profesional)(tag moderado moderado))

(printer (model "LaserJet_Pro_CP1025nw" )(tecnology laser)(type multifuncion) (conectivity ethernet usb wifi) (functions imprimir)(color si)(duplex no)(use hogar profesional)(tag alto alto))

(printer (model "LaserJet_Pro_CP1525nw" )(tecnology laser)(type impresora) (conectivity ethernet usb wifi) (functions imprimir)(color si)(duplex no)(use hogar profesional)(tag alto alto))

(printer (model "Officejet_7500A_E910a" )(tecnology inyeccion)(type multifuncion) (conectivity ethernet usb wifi) (functions imprimir escanear fax copiar)(color si)(duplex no)(use hogar profesional)(tag alto alto))

(printer (model "LaserJet_Enterprise_500_color_M551dn" )(tecnology laser)(type impresora) (conectivity ethernet usb) (functions imprimir)(color si)(duplex si)(use pyme pyme)(tag gran_inversion gran_inversion))

(printer (model "LaserJet_Pro400_color_M475dn_MFP" )(tecnology laser)(type multifuncion) (conectivity ethernet usb) (functions imprimir escanear fax copiar)(color si)(duplex si)(use profesional pyme)(tag gran_inversion gran_inversion))

(printer (model "LaserJet_P2055dn" )(tecnology laser)(type impresora) (conectivity ethernet usb) (functions imprimir)(color no)(duplex si)(use profesional pyme)(tag alto alto))

(printer (model "LaserJetPro_CM1415fnw_MFP" )(tecnology laser)(type multifuncion) (conectivity ethernet usb wifi) (functions imprimir escanear fax copiar)(color si)(duplex no)(use hogar pyme)(tag alto alto))

(printer (model "LaserJetPro400colorM475dwMFP" )(tecnology laser)(type multifuncion) (conectivity ethernet usb wifi) (functions imprimir escanear fax copiar)(color si)(duplex si)(use profesional pyme)(tag gran_inversion gran_inversion))

(printer (model "LaserJetEnterpriseP3015d" )(tecnology laser)(type impresora) (conectivity ethernet usb) (functions imprimir)(color no)(duplex si)(use pyme pyme)(tag alto alto))

(printer (model "OfficejetPro8000EnterpriseA811a" )(tecnology inyeccion)(type impresora) (conectivity ethernet usb) (functions imprimir)(color no)(duplex si)(use hogar pyme)(tag economica economica))

(printer (model "LaserJetPro400ColorPrinterM45dw" )(tecnology laser)(type impresora) (conectivity ethernet usb wifi) (functions imprimir)(color no)(duplex si)(use profesional pyme)(tag alto alto))

(printer (model "LaserJetEnterprise500colorM551n" )(tecnology laser)(type impresora) (conectivity ethernet usb) (functions imprimir)(color si)(duplex no)(use pyme pyme)(tag gran_inversion gran_inversion))

(printer (model "OfficejetPro_8100_ePrinter_N811aN811d" )(tecnology inyeccion)(type impresora) (conectivity ethernet usb wifi) (functions imprimir)(color si)(duplex si)(use hogar pyme)(tag moderado moderado))

(printer (model "LaserJetPro_P1102w" )(tecnology laser)(type impresora) (conectivity usb wifi) (functions imprimir)(color no)(duplex no)(use hogar pyme)(tag moderado moderado))

(printer (model "LaserJetPro_P1606dn" )(tecnology laser)(type impresora) (conectivity ethernet usb) (functions imprimir)(color no)(duplex si)(use hogar pyme)(tag alto alto))

(printer (model "LaserJetPro_M1132" )(tecnology laser)(type multifuncion) (conectivity usb) (functions imprimir escanear copiar)(color no)(duplex no)(use hogar pyme)(tag moderado moderado))

(printer (model "OfficejetPro_8600_N911a" )(tecnology inyeccion)(type multifuncion) (conectivity ethernet usb wifi) (functions imprimir escanear fax copiar)(color si)(duplex no)(use hogar pyme)(tag alto alto))

(printer (model "LaserJet_P2035" )(tecnology laser)(type impresora) (conectivity usb ) (functions imprimir)(color no)(duplex no)(use hogar pyme)(tag moderado moderado))

(printer (model "OfficejetPro_8600Plus_N911g" )(tecnology inyeccion)(type multifuncion) (conectivity ethernet usb wifi) (functions imprimir escanear fax copiar envio digital)(color si)(duplex si)(use hogar pyme)(tag alto alto))

(printer (model "LaserJetPro_M1212nf_MFP" )(tecnology laser)(type multifuncion) (conectivity ethernet usb) (functions imprimir escanear fax copiar)(color no)(duplex no)(use hogar pyme)(tag moderado moderado))

(printer (model "LaserJet_P2035n" )(tecnology laser)(type impresora) (conectivity ethernet usb) (functions imprimir)(color no)(duplex no)(use hogar pyme)(tag alto alto))

(printer (model "LaserJetPro_M1536dnf" )(tecnology laser)(type multifuncion) (conectivity ethernet usb) (functions imprimir escanear fax copiar)(color no)(duplex si)(use hogar pyme)(tag alto alto))

(printer (model "ColorLaserJetEnterprise_CM4540f_MFP" )(tecnology laser)(type multifuncion) (conectivity ethernet usb) (functions imprimir escanear fax copiar envio digital)(color si)(duplex si)(use pyme pyme+)(tag gran_inversion gran_inversion))

(printer (model "HP_Color_LaserJet_Enterprise_CP5525dn" )(tecnology laser)(type impresora) (conectivity ethernet usb) (functions imprimir)(color si)(duplex si)(use pyme pyme+)(tag gran_inversion gran_inversion))

)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Reglas
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule recomendar
 (printer
        (model ?model)
        (use $?uso)
        (type ?type)
        (tecnology ?tec)
        (color ?color)
        (duplex ?duplex)
	(functions $?functions)
)
	(uso $?uso2)
;;	(test(subsetp (($?uso2) ($?uso))))
	(type ?type)
	(tecnology ?tec)
	(color ?color)
	(duplex ?duplex)
=>
        (assert (models(model ?model)))
	(assert (f $?functions))

)
(defrule print-recom
 (models (model ?model))
=>
 (printout t crlf ?model "\n")
)
