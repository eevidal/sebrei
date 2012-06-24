
;(deftemplate volumen "Volumen mensual"
;  (slot paginas)
;)
(deftemplate tgrupo "tamaño del grupo"
  (slot miembros)
)

(deftemplate questions
   (slot question (default ?NONE))
   (slot atribute (default ?NONE))
   (slot type (default ?NONE))
)



;;*****************
;; INIT
;;*****************

(defrule start
        ?init <- (initial-fact)
=>
        (retract ?init)
        (assert (questions(question "Será necesario imprimir a color?")(atribute color)(type bool) ))
        (assert (questions(question "Cúal es el volumen mensual de páginas?")(atribute paginas) (type int)))
        (assert (questions(question "¿Cúal es el tamaño del grupo de trabajo?")(atribute grupo) (type int)))
        (assert (regla 1))
)


