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
   (multislot valid-answers (default ?NONE))
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
		d) imprimir, copiar, escanear, envio digital y fax")
        (valid-answers a b c d))

   (question (attribute indicated-color)
        (the-question "Sera necesario imprimir en color, si o no?")
        (valid-answers si no))

   (question (attribute indicated-group)
        (the-question "El equipo es para uso individual o grupal" )
        (valid-answers individual grupal))

   (question (attribute pag_mensuales)
        (the-question "De los siguientes rangos de impresiones por mes. ¿cúal estima que en promedio es el que mejor describe su realidad? 
		a) hasta 500 impresiones al mes (aprox. 1 resma de hojas) 
		b) entre 500 y 1000 impresiones al mes 
		c) entre 1000 y 5000 impresiones al mes 
		d) entre 5000 y 10000 impresiones al mes 
		e) más de 10000 impresiones al mes")
        (valid-answers a b c d e)))


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

;; color

  (rule (if indicated-color is si) 		
        (then color_printer is si ))

  (rule (if indicated-color is no) 		
        (then color_printer is no ))


  
  (rule (if indicated-group is individual) 		
        (then printer_conect is usb with certainty 90 and 
	      printer_conect is wifi with certainty 60 ))

  (rule (if indicated_grupo is grupal) 		
        (then printer_conect is usb with certainty 20 and 
	      printer_conect is wifi with certainty 60 and 
	      printer_conect is ethernet with certainty 90))
  
;;Para mi no importa el color, la tecnología va a depender del volumen de hoja, independientemente del color, cierto? 
  (rule (if pag_mensuales not is a) 		;;Si color = no AND vm > 500 => tecnologia = laser
        (then printer_tecnology is laser with certainty 90))

  (rule (if pag_mensuales is a) 		;;Si color = si AND vm <= 500 => tecnologia = tinta
        (then printer_tecnology is tinta with certainty 90 and 
              printer_tecnology is laser with certainty 40 ))

  (rule (if pag_mensuales is a)			;;Si vm <= 500 => uso = hogarenio 		
        (then uso_printer is hogarenio with certainty 90 and
	      uso_printer is profesional with certainty 30 ))

  (rule (if pag_mensuales is b) 		;;Si vm >500 AND vm <= 1000 => uso = profesional		
        (then uso_printer is profesional with certainty 90  ))

  (rule (if pag_mensuales is c) 
        (then uso_printer is pyme with certainty 90))			;;(de 1000 a 5000 => pyme, de 5000 a 10000 pyme+

  (rule (if pag_mensuales is d)
        (then uso_printer is pyme2 with certainty 60))

  (rule (if pag_mensuales is e) 		;;+ de 10000 => gran_empresa)
        (then uso_printer is gran_empresa with certainty 90))

  (rule (if uso_printer is hogarenio) 			;;Si uso = hogarenio => precio = economico
        (then tag_printer is economico with certainty 90))

  (rule (if uso_printer is profesional) 		;;Si uso = profesional => precio = moderado OR profesional
        (then tag_printer is moderado with certainty 90 and 
	      tag_printer is profesional with certainty 90))


;;select duplex

  (rule (if pag_mensuales is a) 		
        (then duplex_printer is no with certainty 90))

  (rule (if pag_mensuales is b) 		
        (then duplex_printer is no with certainty 60))


  (rule (if pag_mensuales is c) 		
        (then duplex_printer is si with certainty 30))

 
  (rule (if pag_mensuales is d)
        (then duplex_printer is si with certainty 60))

  (rule (if pag_mensuales is e) 		
        (then duplex_printer is si with certainty 90))

;;select functions rules and type
;;             	a) imprimir 
;;		b) imprimir, copiar y escanear 
;;		c) imprimir, copiar, escanear y envio digital 
;;		d) imprimir, copiar, escanear, envio digital y fax")

  (rule (if indicated_use is a) 		
        (then functions is imprimir with certainty 90 and 
	      type_printer is impresora ))

  (rule (if indicated_use is b) 		
        (then functions_printer is imprimir with certainty 90 and
	      functions_printer is copiar with certainty 90 and 
	      functions_printer is escanear with certainty 90 and
	      type_printer is multifunsion))

  (rule (if indicated_use is c) 		
        (then functions_printer is imprimir with certainty 90 and
	      functions_printer is copiar with certainty 90 and 
	      functions_printer is escanear with certainty 90 and 
	      functions_printer is envio_digital with certainty 90 amd
	      type_printer is multifunsion ))

  (rule (if indicated_use is d) 		
        (then functions_printer is imprimir with certainty 90 and
	      functions_printer is copiar with certainty 90 and 
	      functions_printer is escanear with certainty 90 and 
	      functions_printer is envio_digital with certainty 90 and 
	      functions_printer is fax with certainty 90 and 
	      type_printer is multifunsion  ))


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
  (attribute (name tag_printer) (value any)))

(deftemplate PRINTER::printer 
   (slot model  (default ?NONE))
   (slot tecnology (default ?NONE))		
   (slot type (default ?NONE))
   (multislot conectivity (default any))
   (multislot functions (default any))
   (slot color (default any))
   (slot duplex (default any))
;;   (slot minp (default any))
;;   (slot maxp (default any))
   (slot tag (default ?NONE))
 )

;;*****************
;;*    defacts    *
;;*****************

(deffacts PRINTER::the-printer-list 
  (printer (model "HP Deskjet 2050" )(tecnology laser) (type multifunsion) (conectivity usb) (functions imprimir copiar escanear) (color si) (duplex si) (tag economico))
  (printer (model "HP Officejet 4000")(tecnology laser)(type multifunsion)(conectivity usb)(functions imprimir copiar escanear) (color si)(duplex no)(tag economico))
  (printer (model "HP Deskjet 1000")(tecnology laser)(type multifunsion)(conectivity usb)(functions imprimir copiar escanear) (color si)(duplex si)(tag economico))
  (printer (model "HP Photosmart Plus B210a")(tecnology laser)(type multifunsion)(conectivity usb wifi)(functions imprimir copiar escanear)(color si)(duplex no)(tag economico))
  (printer (model "HP Deskjet 3050")(tecnology laser) (type multifunsion)(conectivity usb)(functions imprimir copiar escanear)(color si) (duplex no)(tag profesional))
  (printer (model "HP Photosmart D110a")(tecnology laser)(type multifunsion)(conectivity usb wifi)(functions imprimir copiar escanear)(color si)(duplex si)(tag pofesional))
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
        (tag  ?tag ))
  (attribute (name printer_tecnology) (value ?tec) (certainty ?certainty-1))
  (attribute (name type_printer) (value ?type)  (certainty ?certainty-2)) 
  (attribute (name printer_conect) (value ?con) (certainty ?certainty-5)) 
  (attribute (name functions_printer) (value ?f)  (certainty ?certainty-3)) 
  (attribute (name color_printer) (value ?color) (certainty ?certainty-6))
  (attribute (name duplex_printer) (value ?duplex) (certainty ?certainty-7))
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


