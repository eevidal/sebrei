(defmodule MAIN (export ?ALL))	;;El modulo MAIN exporta TODAS sus construcciones

;;****************
;;* DEFFUNCTIONS *
;;****************

(deffunction MAIN::ask-question (?question ?allowed-values)
   (printout t ?question)
   (bind ?answer (read))
   (if (lexemep ?answer) then (bind ?answer (lowcase ?answer)))
   (while (not (member ?answer ?allowed-values)) do
      (printout t ?question)
      (bind ?answer (read))
      (if (lexemep ?answer) then (bind ?answer (lowcase ?answer))))
   ?answer)

;;*****************
;;* INITIAL STATE *
;;*****************

(deftemplate MAIN::attribute
   (slot name)
   (slot value)
   (slot certainty (default 100.0)))

(defrule MAIN::start
  (declare (salience 10000))
  =>
  (set-fact-duplication TRUE)
  (focus QUESTIONS CHOOSE-QUALITIES PRINTER PRINT-RESULTS))

(defrule MAIN::combine-certainties ""
  (declare (salience 100)
           (auto-focus TRUE))
  ?rem1 <- (attribute (name ?rel) (value ?val) (certainty ?per1))
  ?rem2 <- (attribute (name ?rel) (value ?val) (certainty ?per2))
  (test (neq ?rem1 ?rem2))
  =>
  (retract ?rem1)
  (modify ?rem2 (certainty (/ (- (* 100 (+ ?per1 ?per2)) (* ?per1 ?per2)) 100))))



;;******************
;;* QUESTION RULES *
;;******************

(defmodule QUESTIONS (import MAIN ?ALL) (export ?ALL))

(deftemplate QUESTIONS::question
   (slot attribute (default ?NONE))
   (slot the-question (default ?NONE))
   (multislot valid-answers (default ?DERIVE))
   (slot already-asked (default FALSE))
   (multislot precursors (default ?DERIVE)))
   
(defrule QUESTIONS::ask-a-question
   ?f <- (question (already-asked FALSE)
                   (precursors)
                   (the-question ?the-question)
                   (attribute ?the-attribute)
                   (valid-answers $?valid-answers))
   =>
   (modify ?f (already-asked TRUE))
   (assert (attribute (name ?the-attribute)
                      (value (ask-question ?the-question ?valid-answers)))))

(defrule QUESTIONS::precursor-is-satisfied
   ?f <- (question (already-asked FALSE)
                   (precursors ?name is ?value $?rest))
         (attribute (name ?name) (value ?value))
   =>
   (if (eq (nth 1 ?rest) and) 
    then (modify ?f (precursors (rest$ ?rest)))
    else (modify ?f (precursors ?rest))))

(defrule QUESTIONS::precursor-is-not-satisfied
   ?f <- (question (already-asked FALSE)
                   (precursors ?name is-not ?value $?rest))
         (attribute (name ?name) (value ~?value))
   =>
   (if (eq (nth 1 ?rest) and) 
    then (modify ?f (precursors (rest$ ?rest)))
    else (modify ?f (precursors ?rest))))








;;*********************
;;* PRINTER QUESTIONS *
;;*********************

(defmodule PRINTER-QUESTIONS (import QUESTIONS ?ALL))

(deffacts PRINTER-QUESTIONS::question-attributes

   (question (attribute indicated_use)
	(the-question "Que tipo de uso le va a dar al equipo? 
             	a) imprimir 
		b) imprimir, copiar y escanear 
		c) imprimir, copiar, escanear y envio digital 
		d) imprimir, copiar, escanear y fax
		e) imprimir, copiar, escanear, envio digital y fax")
        (valid-answers a b c d e))

   (question (attribute indicated-color)
        (the-question "Sera necesario imprimir en color, si o no?")
        (valid-answers si no))

   (question (attribute indicated-group)
        (the-question "Cual es el tamaño del grupo de trabajo (PCs simultáneas), personal chico mediano grande?
			" )
        (valid-answers personal chico mediano grande))
		
   (question (attribute indicated-tamaño)
        (the-question "¿cúal es el tamaño de la impresora? chica, mediana, grande, de_alto_volumen
			")
        (valid-answers chica mediana grande de_alto_volumen))



)


	
;;******************
;; The RULES module
;;******************

(defmodule RULES (import MAIN ?ALL) (export ?ALL))

(deftemplate RULES::rule
  (slot certainty (default 100.0))
  (multislot if)
  (multislot then))

(defrule RULES::throw-away-ands-in-antecedent
  ?f <- (rule (if and $?rest))
  =>
  (modify ?f (if ?rest)))

(defrule RULES::throw-away-ands-in-consequent
  ?f <- (rule (then and $?rest))
  =>
  (modify ?f (then ?rest)))

(defrule RULES::remove-is-condition-when-satisfied
  ?f <- (rule (certainty ?c1) 
              (if ?attribute is ?value $?rest))
  (attribute (name ?attribute) 
             (value ?value) 
             (certainty ?c2))
  =>
  (modify ?f (certainty (min ?c1 ?c2)) (if ?rest)))

(defrule RULES::remove-is-not-condition-when-satisfied
  ?f <- (rule (certainty ?c1) 
              (if ?attribute is-not ?value $?rest))
  (attribute (name ?attribute) (value ~?value) (certainty ?c2))
  =>
  (modify ?f (certainty (min ?c1 ?c2)) (if ?rest)))

(defrule RULES::perform-rule-consequent-with-certainty
  ?f <- (rule (certainty ?c1) 
              (if) 
              (then ?attribute is ?value with certainty ?c2 $?rest))
  =>
  (modify ?f (then ?rest))
  (assert (attribute (name ?attribute) 
                     (value ?value)
                     (certainty (/ (* ?c1 ?c2) 100)))))

(defrule RULES::perform-rule-consequent-without-certainty
  ?f <- (rule (certainty ?c1)
              (if)
              (then ?attribute is ?value $?rest))
  (test (or (eq (length$ ?rest) 0)
            (neq (nth 1 ?rest) with)))
  =>
  (modify ?f (then ?rest))
  (assert (attribute (name ?attribute) (value ?value) (certainty ?c1))))




;;**********************************
;;* CHOOSE PRINTER QUALITIES RULES *
;;**********************************

(defmodule CHOOSE-QUALITIES (import RULES ?ALL)
                            (import QUESTIONS ?ALL)
                            (import MAIN ?ALL))

(defrule CHOOSE-QUALITIES::startit => (focus RULES))

(deffacts the-printer-rules

;; tamaño => uso

  (rule (if indicated-tamaño is chica) 		
        (then printer_use is hogarenio with certainty 42 and 
	      printer_use is profesional with certainty 42 and
	      printer_use is pyme with certainty 17))

  (rule (if indicated-tamaño is mediana) 		
        (then printer_use is pyme with certainty 85 and 
	      printer_use is pyme+ with certainty 15))

  (rule (if indicated-tamaño is grande) 		
        (then printer_use is pyme+ with certainty 90))

  (rule (if indicated-tamaño is de_alto_volumen) 		
        (then printer_use is empresarial with certainty 85 and
	      printer_use is pyme+ with certainty 15))


;; color

  (rule (if indicated-color is si) 		
        (then color_printer is si ))

  (rule (if indicated-color is no) 		
        (then color_printer is no ))

;; tamaño del grupo => conectividad
  
  (rule (if indicated-group is personal) 		
        (then printer_conect is usb with certainty 90 and 
	      printer_conect is wifi with certainty 50 and 
	      printer_conect is ethernet  certainty 30 	))

    (rule (if  indicated-group is pequeño) 		
        (then printer_conect is usb with certainty 60 and 
	      printer_conect is wifi with certainty 50 and 
	      printer_conect is ethernet  certainty 60 	))


    (rule (if  indicated-group is mediano) 		
        (then printer_conect is usb with certainty 10 and 
	      printer_conect is wifi with certainty 30 and 
	      printer_conect is ethernet  certainty 90 	))


    (rule (if  indicated-group is grande) 		
        (then printer_conect is usb with certainty 5 and 
	      printer_conect is wifi with certainty 20 and 
	      printer_conect is ethernet  certainty 90 	))




 (rule (if printer_use is-not hogarenio) 		;;Si color = no AND vm > 500 => tecnologia = laser
        (then printer_tecnology is laser with certainty 90))

  (rule (if printer_use is hogarenio) 		;;Si color = si AND vm <= 500 => tecnologia = tinta
        (then printer_tecnology is tinta with certainty 90 and 
              printer_tecnology is laser with certainty 10 ))



;; uso => precio

  (rule (if printer_use is hogarenio) 			;;Si uso = hogarenio => precio = economico
        (then tag_printer is economico with certainty 90))

  (rule (if printer_use is profesional) 		;;Si uso = profesional => precio = moderado OR profesional
        (then tag_printer is moderado with certainty 90 and 
	      tag_printer is profesional with certainty 90))


;;select duplex

  (rule (if printer_use is hogarenio) 		
        (then duplex_printer is no with certainty 90))

  (rule (if printer_use is profesional) 		
        (then duplex_printer is no with certainty 60))


  (rule (if printer_use is pyme) 		
        (then duplex_printer is si with certainty 30))

 
  (rule (if printer_use is pyme+)
        (then duplex_printer is si with certainty 60))

  (rule (if printer_use is empresarial) 		
        (then duplex_printer is si with certainty 90))

;;select functions rules and type
;;             	a) imprimir 
;;		b) imprimir, copiar y escanear 
;;		c) imprimir, copiar, escanear y envio digital 
;;		d) imprimir, copiar, escanear, envio digital y fax")

  (rule (if indicated_use is a) 		
        (then functions_printer is imprimir  and 
	      type_printer is impresora ))

  (rule (if indicated_use is b) 		
        (then functions_printer is imprimir  and
	      functions_printer is copiar and 
	      functions_printer is escanear  and
	      type_printer is multifuncion))

  (rule (if indicated_use is c) 		
        (then functions_printer is imprimir  and
	      functions_printer is copiar  and 
	      functions_printer is escanear  and 
	      functions_printer is envio_digital  and
	      type_printer is multifuncion ))

  (rule (if indicated_use is d) 		
        (then functions_printer is imprimir  and
	      functions_printer is copiar  and 
	      functions_printer is escanear and 
	      functions_printer is fax with  and 
	      type_printer is multifuncion  ))


  (rule (if indicated_use is e) 		
        (then functions_printer is imprimir  and
	      functions_printer is copiar  and 
	      functions_printer is escanear and 
	      functions_printer is envio_digital and 
	      functions_printer is fax with  and 
	      type_printer is multifuncion  ))

)

;;********************
;;* Modulo PRINTER *
;;********************

(defmodule PRINTER (import MAIN ?ALL) (export ?ALL))

(deffacts any-attributes
  (attribute (name printer_tecnology) (value any))
  (attribute (name type_printer) (value any))
  (attribute (name printer_conect) (value any)) 
  (attribute (name functions_printer) (value any))
  (attribute (name color_printer) (value any)) 
  (attribute (name duplex_printer) (value any))
  (attribute (name printer_use) (value any))
  (attribute (name tag_printer) (value any)))

(deftemplate PRINTER::printer 
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

(deffacts PRINTER::the-printer-list 
  (printer (model "HP Deskjet 2050" )(tecnology laser) (type multifuncion) (conectivity usb) (functions imprimir copiar escanear) (color si) (duplex si) (use hogarenio)(tag economico))
  (printer (model "HP Officejet 4000")(tecnology laser)(type multifuncion)(conectivity usb)(functions imprimir copiar escanear) (color si)(duplex no) (use hogarenio)(tag economico))
 ;; (printer (model "HP Deskjet 1000")(tecnology laser)(type multifuncion)(conectivity usb)(functions imprimir copiar escanear) (color si)(duplex si)(use hogareño)(tag economico))
  (printer (model "HP Photosmart Plus B210a")(tecnology laser)(type multifuncion)(conectivity usb wifi)(functions imprimir copiar escanear)(color si)(duplex no)(use hogarenio)(maxp 5000)(tag economico))
;;  (printer (model "HP Deskjet 3050")(tecnology laser) (type multifuncion)(conectivity usb)(functions imprimir copiar escanear)(color si) (duplex no)(use hogareño)(tag profesional))
 ;; (printer (model "HP Photosmart D110a")(tecnology laser)(type multifuncion)(conectivity usb wifi ethernet)(functions imprimir copiar escanear)(color si)(duplex si)(use hogarenio)(tag pofesional))

;;; hasta aca las que ya estaban
 
  (printer (model "HP Deskjet 1000")(tecnology inyeccion)(type impresora)(conectivity usb)(functions imprimir) (color si)(duplex no)(minp 250)(maxp 500)(use hogarenio)(tag economico))
  (printer (model "HP Deskjet 3050")(tecnology inyeccion) (type multifuncion)(conectivity wifi usb)(functions imprimir copiar escanear)(color si) (duplex no)(minp 250)(maxp 500)(use hogarenio)(tag economico))
  (printer (model "HP Photosmart D110a")(tecnology inyeccion)(type multifuncion)(conectivity web wifi usb)(functions imprimir copiar escanear)(color si)(duplex si)(minp 250)(maxp 500)(use hogarenio)(tag economico))
  (printer (model "HP Photosmart Plus B210a")(tecnology inyeccion)(type multifuncion)(conectivity web wifi usb)(functions imprimir copiar escanear)(color si)(duplex no)(minp 275)(maxp 500)(use hogarenio)(tag economico))

  (printer (model "HP LaserJet Pro CP1525nw")(tecnology laser)(type impresora)(conectivity ethernet wifi usb_alta_velocidad)(functions imprimir)(color si)(duplex no)(minp 250)(maxp 1000)(use profesional)(tag moderado))
  (printer (model "HP Officejet 4400")(tecnology inyeccion)(type multifuncion)(conectivity usb)(functions imprimir copiar escanear)(color si)(duplex no)(minp 250)(maxp 1000)(use profesional)(tag economico))
  (printer (model "HP LaserJet Pro 100 color M175a")(tecnology laser)(type multifuncion)(conectivity usb_alta_velocidad)(functions imprimir copiar escanear)(color si)(duplex no)(minp 250)(maxp 950)(use profesional)(tag moderado))
  (printer (model "HP OfficeJet 4500")(tecnology inyeccion)(type multifuncion)(conectivity usb)(functions imprimir copiar escanear fax)(color si)(duplex no)(minp 350)(maxp 600)(use hogarenio)(tag economico))

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



(defrule PRINTER::generate-printers
  (printer
	(model ?name)
	(tecnology  ?tec )
	(type ?type )
	(conectivity $?  ?con $? )
  	(functions $? ?f $?)  
	(color ?color)
	(duplex ?duplex)
	(use ?use)	
        (tag  ?tag ))
  (attribute (name printer_tecnology) (value ?tec) (certainty ?certainty-1))
  (attribute (name type_printer) (value ?type)  (certainty ?certainty-2)) 
  (attribute (name printer_conect) (value ?con) (certainty ?certainty-5)) 
  (attribute (name functions_printer) (value ?f)  (certainty ?certainty-3)) 
  (attribute (name color_printer) (value ?color) (certainty ?certainty-6))
  (attribute (name duplex_printer) (value ?duplex) (certainty ?certainty-7))
  (attribute (name printer_use) (value ?use) (certainty ?certainty-8))
  (attribute (name tag_printer) (value ?tag) (certainty ?certainty-4))

  =>
  (assert (attribute (name printer) (value ?name)
                     (certainty (min ?certainty-1  ?certainty-2 ?certainty-3 ?certainty-4 ?certainty-5 ?certainty-6 ?certainty-7)))))

;;*****************************
;;* PRINT SELECTED PRINTER RULES *
;;*****************************

(defmodule PRINT-RESULTS (import MAIN ?ALL))

(defrule PRINT-RESULTS::header ""
   (declare (salience 10))
   =>
   (printout t t)
   (printout t " SELECTED PRINTER" t t)
   (printout t " PRINTER CERTAINTY" t)
   (printout t " -------------------------------" t)
   (assert (phase print-printer)))

(defrule PRINT-RESULTS::print-printers ""
  ?rem <- (attribute (name printer) (value ?name) (certainty ?per))		  
  (not (attribute (name printer) (certainty ?per1&:(> ?per1 ?per))))
  =>
  (retract ?rem)
  (format t " %-24s %2d%%%n" ?name ?per))

(defrule PRINT-RESULTS::remove-poor-printer-choices ""
  ?rem <- (attribute (name printer) (certainty ?per&:(< ?per 20)))
  =>
  (retract ?rem))

(defrule PRINT-RESULTS::end-spaces ""
   (not (attribute (name printer)))
   =>
   (printout t t))


