(defmodule MAIN (export ?ALL))	;;El modulo MAIN exporta TODAS sus construcciones

;;****************
;;* DEFFUNCTIONS *
;;****************

;;Esto lo saqué del ejemplo wine, me gusta porq valida las repuesta								
(deffunction MAIN::ask-question (?question ?allowed-values)		;;Toma como parámetros 2 valores: (?question) y (?allowed-values)
   (printout t ?question)						;;Imprime por pantalla la (?question)
   (bind ?answer (read))						;;Le asina a la variable (?answer) lo que leyó (read)
   (if (lexemep ?answer) then (bind ?answer (lowcase ?answer)))		;;Si la respuesta es del tipo symbol o string, pasa a "minúscula" lo que hay en (?answer)
   (while (not (member ?answer ?allowed-values)) do			;;Mientras (?answer) no esté dentro de (?allowed-values)
      (printout t ?question)							;;repetimos todo de nuevo
      (bind ?answer (read))
      (if (lexemep ?answer) then (bind ?answer (lowcase ?answer))))
   ?answer)


;;********************
;;* Modulo IMPRESORA *
;;********************

(defmodulo IMPRESORA (import MAIN ?ALL) (export ?ALL))

(deftemplate IMPRESORA::printer 
   (slot vendor (default ?NONE)) 
   (slot model  (default ?NONE))
   (slot tecnology (default ?NONE))		;;(slot type (default ?NONE)) Este campo no va, vendría a ser la tecnología
   (multislot conectivity (default ?NONE))
   (multislot consumibles (default ?NONE))	;;ESTE CAMPO LO TENGO Q RECOLECTAR
   (multislot functions (default ?NONE))
   (multislot paper (default ?NONE))		;;tipo de papel
   (multislot quality (default any))		;;calidad en blanco y negro o a color?? Como lo desglosas??
   (multislot sheet (default ?NONE))		;;tamaño de papel
   (multislot so (default ?NONE))
   (multislot velocity (default any))
   (slot color (default no))
   (slot duplex (default no))
   (slot minp (default ?NONE))
   (slot maxp (default ?NONE))
   (slot tag (default ?NONE))
 )

;;*****************
;;*    defacts    *
;;*****************

(deffacts IMPRESORA::the-printer-list 
  (printer (vendor HP) (model "Deskjet 2050") (tecnology multifunsion) (conectivity usb) (functions impresion copiar escanear) (paper papel papel_fotografico sobres etiquetas tarjetas transparencias) (quality 600) (sheet A4 B5 A5 A6 DL) (so windows mac) (velocity 5.5) (color si) (duplex si) (tag economico))
  (printer (vendor HP) (model "Officejet 4000") (tecnology multifunsion) (conectivity usb) (paper papel sobres transparencias etiquetas tarjetas estampados soportes_sin_bordes panoramico) (quality 600) (sheet A4 A5 A6 B5) (so windows mac) (velocity 9) (color si) (tag economico))
  (printer (vendor HP) (model "Deskjet 1000") (tecnology multifunsion) (conectivity usb) (paper papel papel_fotografico sobres etiquetas tarjetas transparencias) (quality 600) (sheet A4 B5 A5 A6 DL) (so windows mac) (velocity 5.5) (color si) (duplex si) (tag economico))
  (printer (vendor HP) (model "Photosmart Plus B210a") (tecnology multifunsion) (conectivity usb wifi) (functions impresion copiar escanear) (paper papel papel_fotografico sobres etiquetas tarjetas transparencias) (quality 600) (sheet A4 A5 A6 B5 B6 B7 C5 C6) (so windows mac) (velocity 8.5) (color si) (tag economico))
  (printer (vendor HP) (model "Deskjet 3050") (tecnology multifunsion) (conectivity usb) (functions impresion copiar escanear) (paper papel papel_fotografico sobres etiquetas tarjetas transparencias) (quality 600) (sheet A4 A5 A6 B5) (so windows mac) (velocity 5.5) (color si) (tag economico))
  (printer (vendor HP) (model "Photosmart D110a") (tecnology multifunsion) (conectivity usb wifi) (functions impresion copiar escanear) (paper papel sobres transparencias etiquetas tarjetas estampados soportes_sin_bordes panoramico) (quality 600) (sheet A4 A5 B5 DL C6 A6) (so windows mac) (velocity 6) (color si) (duplex si) (tag economico)))