(defclass PERSONALIDAD (is-a USER)
   (slot ninio
     (type SYMBOL)
     (allowed-values no_mira grita pega))
   (slot robot
     (type SYMBOL)
     (allowed-values  atiende silencio calma)))


(defclass JUEGOS (is-a USER)
  (slot nombre
    (type SYMBOL)
    (allowed-values imita_al_robot twister))
  (slot pose
    (type SYMBOL)
    (allowed-values sentado levantado brazos_arriba))
  (slot color
    (type SYMBOL)
    (allowed-values azul amarillo rojo verde))
  (slot extremidad
    (type SYMBOL)
    (allowed-values mano_derecha mano_izquierda pierna_derecha pierna_izquierda))
  (slot individuo
    (type SYMBOL)
    (default none)
    (allowed-values none robot ninio)))


(defclass SESION (is-a USER)
  (slot nombre
    (type SYMBOL)
    (allowed-values imita_al_robot twister))
  (slot estado
    (type SYMBOL)
    (default empezado)
    (allowed-values empezado explicado en_proceso finalizado))
  (slot turno
    (type SYMBOL)
    (default robot)
    (allowed-values robot ninio))
  (slot fase
    (type INTEGER)
    (range 0 5)
    (default 0)))




(definstances sesion
  ;([game_1] of SESION (nombre imita_al_robot))
  ([game_2] of SESION (nombre twister))
)

(definstances personalidad
  ([ninio_1] of PERSONALIDAD (ninio no_mira) (robot atiende))
  ([ninio_2] of PERSONALIDAD (ninio grita) (robot silencio))
  ([ninio_3] of PERSONALIDAD (ninio pega) (robot calma))
)

(definstances juego_imitar

  ([imita_1] of JUEGOS (nombre imita_al_robot) (pose sentado))
  ([imita_2] of JUEGOS (nombre imita_al_robot) (pose levantado) )
  ([imita_3] of JUEGOS (nombre imita_al_robot) (pose brazos_arriba) )

)

(definstances juego_twister

  ([tw_1] of JUEGOS (nombre twister) (color azul) (extremidad mano_derecha))
  ([tw_2] of JUEGOS (nombre twister) (color azul) (extremidad mano_izquierda))
  ([tw_3] of JUEGOS (nombre twister) (color azul) (extremidad pierna_izquierda))
  ([tw_4] of JUEGOS (nombre twister) (color azul) (extremidad pierna_derecha))

  ([tw_5] of JUEGOS (nombre twister) (color amarillo) (extremidad mano_derecha))
  ([tw_6] of JUEGOS (nombre twister) (color amarillo) (extremidad mano_izquierda))
  ([tw_7] of JUEGOS (nombre twister) (color amarillo) (extremidad pierna_izquierda))
  ([tw_8] of JUEGOS (nombre twister) (color amarillo) (extremidad pierna_derecha))

  ([tw_9] of JUEGOS (nombre twister) (color rojo) (extremidad mano_derecha))
  ([tw_10] of JUEGOS (nombre twister) (color rojo) (extremidad mano_izquierda))
  ([tw_11] of JUEGOS (nombre twister) (color rojo) (extremidad pierna_izquierda))
  ([tw_12] of JUEGOS (nombre twister) (color rojo) (extremidad pierna_derecha))

  ([tw_13] of JUEGOS (nombre twister) (color verde) (extremidad mano_derecha))
  ([tw_14] of JUEGOS (nombre twister) (color verde) (extremidad mano_izquierda))
  ([tw_15] of JUEGOS (nombre twister) (color verde) (extremidad pierna_izquierda))
  ([tw_16] of JUEGOS (nombre twister) (color verde) (extremidad pierna_derecha))

)



(defrule iniciar_juego
  ?game <- (object (is-a SESION)(nombre ?a)(estado empezado)(turno robot)(fase 0))
  =>
  (modify-instance ?game (estado explicado)  )
  (printout t "El robot saluda al ninio " crlf)
)

(defrule explicar_juego
  ?game <- (object (is-a SESION)(nombre ?a)(estado explicado)(turno robot)(fase 0))
  =>
  (modify-instance ?game (estado en_proceso))
  (printout t "El robot explica el juego " ?a " al ninio " crlf)
)

(defrule turno_robot
  ?game <- (object (is-a SESION)(nombre ?a)(estado en_proceso)(turno robot)(fase ?f))
  ?move <-(object (is-a JUEGOS)(nombre ?a)(pose ?p)(color ?c)(extremidad ?e)(individuo none))
  =>
  (modify-instance ?game (turno ninio))
  (make-instance of JUEGOS (nombre ?a)(pose ?p)(color ?c)(extremidad ?e)(individuo robot))
  (printout t " " crlf)
  (printout t "TURNO " ?f crlf)
  (printout t "El robot elige una accion " crlf)
)

(defrule turno_ninio
  ?game <- (object (is-a SESION)(nombre ?a)(estado en_proceso)(turno ninio))
  ?move <-(object (is-a JUEGOS)(nombre ?a)(pose ?p)(color ?c)(extremidad ?e)(individuo none))
  =>
  (modify-instance ?game (turno robot))
  (make-instance of JUEGOS (nombre ?a)(pose ?p)(color ?c)(extremidad ?e)(individuo ninio))
  (printout t "El ninio hace una accion " crlf)
)

(defrule check_bien_imita
  (declare (salience 10))
  ?game <- (object (is-a SESION)(nombre imita_al_robot)(estado en_proceso)(turno robot)(fase ?f))
  ?move_robot <-(object (is-a JUEGOS)(nombre imita_al_robot)(pose ?x)(individuo robot))
  ?move_ninio <-(object (is-a JUEGOS)(nombre imita_al_robot)(pose ?x)(individuo ninio))
  =>
  (modify-instance ?game (fase (+ ?f 1)))
  (unmake-instance ?move_robot)
  (unmake-instance ?move_ninio)
  (printout t "Bien, el ninio acerto!!! Ambos hicieron la pose " ?x crlf)
)

(defrule check_mal_imita
  (declare (salience 10))
  ?game <- (object (is-a SESION)(nombre imita_al_robot)(estado en_proceso)(turno robot)(fase ?f))
  ?move_robot <-(object (is-a JUEGOS)(nombre imita_al_robot)(pose ?x)(individuo robot))
  ?move_ninio <-(object (is-a JUEGOS)(nombre imita_al_robot)(pose ?y)(individuo ninio))
  (test (neq ?x ?y))
  =>
  (modify-instance ?game (fase (+ ?f 1)))
  (unmake-instance ?move_robot)
  (unmake-instance ?move_ninio)
  (printout t "Mal, el ninio fallo!!! El robot hizo la pose " ?x " y el ninio la pose " ?y crlf)
)

(defrule check_bien_twister
  (declare (salience 10))
  ?game <- (object (is-a SESION)(nombre twister)(estado en_proceso)(turno robot)(fase ?f))
  ?move_robot <-(object (is-a JUEGOS)(nombre twister)(color ?x) (extremidad ?y) (individuo robot))
  ?move_ninio <-(object (is-a JUEGOS)(nombre twister)(color ?x) (extremidad ?y) (individuo ninio))
  =>
  (modify-instance ?game (fase (+ ?f 1)))
  (unmake-instance ?move_robot)
  (unmake-instance ?move_ninio)
  (printout t "Bien, el ninio acerto!!! Puso su " ?y " en el color " ?x crlf)
)

(defrule check_mal_twister
  (declare (salience 10))
  ?game <- (object (is-a SESION)(nombre twister)(estado en_proceso)(turno robot)(fase ?f))
  ?move_robot <-(object (is-a JUEGOS)(nombre twister)(color ?x) (extremidad ?y) (individuo robot))
  ?move_ninio <-(object (is-a JUEGOS)(nombre twister)(color ?a) (extremidad ?b) (individuo ninio))
  (test (or (neq ?x ?a)(neq ?y ?b)))
  =>
  (modify-instance ?game (fase (+ ?f 1)))
  (unmake-instance ?move_robot)
  (unmake-instance ?move_ninio)
  (printout t "Mal, el ninio fallo!!! Puso su " ?b " en el color " ?a " y era " ?y " en el color " ?x crlf)
)

(defrule corregir
  ?pers <-(object (is-a PERSONALIDAD)(ninio ?a)(robot ?b))
  ;?game <- (object (is-a SESION)(estado empezado)(turno robot)(fase 0))
  =>
  (printout t "El ninio " ?a " entonces el robot le pide " ?b crlf)

)


(defrule finalizar_juego
  (declare (salience 100))
  ?game <- (object (is-a SESION)(nombre ?a)(estado en_proceso)(turno robot)(fase 5))
  =>
  (modify-instance ?game (estado finalizado))
  (printout t " " crlf)
  (printout t "El robot finaliza el juego " ?a crlf)
)
