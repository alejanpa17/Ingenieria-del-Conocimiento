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
    (allowed-values robot ninio))
  (slot jugando
    (default inactivo)
    (type SYMBOL)
    (allowed-values activo inactivo)))


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
  ; ([game_1] of SESION (nombre imita_al_robot))
  ([game_2] of SESION (nombre twister))
)

(definstances personalidad
  ([ninio_1] of PERSONALIDAD (ninio no_mira) (robot atiende))
  ([ninio_2] of PERSONALIDAD (ninio grita) (robot silencio))
  ([ninio_3] of PERSONALIDAD (ninio pega) (robot calma))
)

(definstances juego_imitar

  ([pose_r_1] of JUEGOS (nombre imita_al_robot) (pose sentado) (individuo robot))
  ([pose_r_2] of JUEGOS (nombre imita_al_robot) (pose levantado) (individuo robot))
  ([pose_r_3] of JUEGOS (nombre imita_al_robot) (pose brazos_arriba) (individuo robot))
  ([pose_n_1] of JUEGOS (nombre imita_al_robot) (pose sentado) (individuo ninio))
  ([pose_n_2] of JUEGOS (nombre imita_al_robot) (pose levantado) (individuo ninio))
  ([pose_n_3] of JUEGOS (nombre imita_al_robot) (pose brazos_arriba) (individuo ninio))

)

(definstances juego_twister

  ([tw_r_1] of JUEGOS (nombre twister) (color azul) (extremidad mano_derecha)(individuo robot))
  ([tw_r_2] of JUEGOS (nombre twister) (color azul) (extremidad mano_izquierda)(individuo robot))
  ([tw_r_3] of JUEGOS (nombre twister) (color azul) (extremidad pierna_izquierda)(individuo robot))
  ([tw_r_4] of JUEGOS (nombre twister) (color azul) (extremidad pierna_derecha)(individuo robot))

  ([tw_r_5] of JUEGOS (nombre twister) (color amarillo) (extremidad mano_derecha)(individuo robot))
  ([tw_r_6] of JUEGOS (nombre twister) (color amarillo) (extremidad mano_izquierda)(individuo robot))
  ([tw_r_7] of JUEGOS (nombre twister) (color amarillo) (extremidad pierna_izquierda)(individuo robot))
  ([tw_r_8] of JUEGOS (nombre twister) (color amarillo) (extremidad pierna_derecha)(individuo robot))

  ([tw_r_9] of JUEGOS (nombre twister) (color rojo) (extremidad mano_derecha)(individuo robot))
  ([tw_r_10] of JUEGOS (nombre twister) (color rojo) (extremidad mano_izquierda)(individuo robot))
  ([tw_r_11] of JUEGOS (nombre twister) (color rojo) (extremidad pierna_izquierda)(individuo robot))
  ([tw_r_12] of JUEGOS (nombre twister) (color rojo) (extremidad pierna_derecha)(individuo robot))

  ([tw_r_13] of JUEGOS (nombre twister) (color verde) (extremidad mano_derecha)(individuo robot))
  ([tw_r_14] of JUEGOS (nombre twister) (color verde) (extremidad mano_izquierda)(individuo robot))
  ([tw_r_15] of JUEGOS (nombre twister) (color verde) (extremidad pierna_izquierda)(individuo robot))
  ([tw_r_16] of JUEGOS (nombre twister) (color verde) (extremidad pierna_derecha)(individuo robot))



    ([tw_n_1] of JUEGOS (nombre twister) (color azul) (extremidad mano_derecha)(individuo ninio))
    ([tw_n_2] of JUEGOS (nombre twister) (color azul) (extremidad mano_izquierda)(individuo ninio))
    ([tw_n_3] of JUEGOS (nombre twister) (color azul) (extremidad pierna_izquierda)(individuo ninio))
    ([tw_n_4] of JUEGOS (nombre twister) (color azul) (extremidad pierna_derecha)(individuo ninio))

    ([tw_n_5] of JUEGOS (nombre twister) (color amarillo) (extremidad mano_derecha)(individuo ninio))
    ([tw_n_6] of JUEGOS (nombre twister) (color amarillo) (extremidad mano_izquierda)(individuo ninio))
    ([tw_n_7] of JUEGOS (nombre twister) (color amarillo) (extremidad pierna_izquierda)(individuo ninio))
    ([tw_n_8] of JUEGOS (nombre twister) (color amarillo) (extremidad pierna_derecha)(individuo ninio))

    ([tw_n_9] of JUEGOS (nombre twister) (color rojo) (extremidad mano_derecha)(individuo ninio))
    ([tw_n_10] of JUEGOS (nombre twister) (color rojo) (extremidad mano_izquierda)(individuo ninio))
    ([tw_n_11] of JUEGOS (nombre twister) (color rojo) (extremidad pierna_izquierda)(individuo ninio))
    ([tw_n_12] of JUEGOS (nombre twister) (color rojo) (extremidad pierna_derecha)(individuo ninio))

    ([tw_n_13] of JUEGOS (nombre twister) (color verde) (extremidad mano_derecha)(individuo ninio))
    ([tw_n_14] of JUEGOS (nombre twister) (color verde) (extremidad mano_izquierda)(individuo ninio))
    ([tw_n_15] of JUEGOS (nombre twister) (color verde) (extremidad pierna_izquierda)(individuo ninio))
    ([tw_n_16] of JUEGOS (nombre twister) (color verde) (extremidad pierna_derecha)(individuo ninio))

  ; ([color_r_2] of JUEGOS (nombre twister) (color amarillo) (individuo robot))
  ; ([color_r_3] of JUEGOS (nombre twister) (color rojo) (individuo robot))
  ; ([color_r_4] of JUEGOS (nombre twister) (color verde) (individuo robot))
  ; ([color_n_1] of JUEGOS (nombre twister) (color azul) (individuo ninio))
  ; ([color_n_2] of JUEGOS (nombre twister) (color amarillo) (individuo ninio))
  ; ([color_n_3] of JUEGOS (nombre twister) (color rojo) (individuo ninio))
  ; ([color_n_4] of JUEGOS (nombre twister) (color verde) (individuo ninio))
  ;
  ; ([extr_r_1] of JUEGOS (nombre twister) (extremidad derecha)(individuo robot))
  ; ([extr_r_2] of JUEGOS (nombre twister) (extremidad derecha)(individuo robot))
  ; ([extr_r_3] of JUEGOS (nombre twister) (extremidad izquierda)(individuo robot))
  ; ([extr_r_4] of JUEGOS (nombre twister) (extremidad izquierda)(individuo robot))
  ; ([extr_n_1] of JUEGOS (nombre twister) (extremidad derecha)(individuo ninio))
  ; ([extr_n_2] of JUEGOS (nombre twister) (extremidad derecha)(individuo ninio))
  ; ([extr_n_3] of JUEGOS (nombre twister) (extremidad izquierda)(individuo ninio))
  ; ([extr_n_4] of JUEGOS (nombre twister) (extremidad izquierda)(individuo ninio))

)



; (defrule corregir
;   (object (is-a PERSONALIDAD)(ninio ?a)(robot ?b))
;   ?game <- (object (is-a SESION)(estado empezado)(turno robot)(fase 0))
;
;   =>
;   (printout t "El ninio " ?a " entonces el robot " ?b crlf)
; )

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
  ?move <-(object (is-a JUEGOS)(nombre ?a)(individuo robot)(jugando inactivo))
  =>
  (modify-instance ?game (turno ninio))
  (modify-instance ?move (jugando activo))
  (printout t " " crlf)
  (printout t "TURNO " ?f crlf)
  (printout t "El robot elige una accion " crlf)
)

(defrule turno_ninio
  ?game <- (object (is-a SESION)(nombre ?a)(estado en_proceso)(turno ninio))
  ?move <-(object (is-a JUEGOS)(nombre ?a)(individuo ninio)(jugando inactivo))
  =>
  (modify-instance ?game (turno robot))
  (modify-instance ?move (jugando activo))
  (printout t "El ninio hace una accion " crlf)
)

(defrule check_bien_imita
  (declare (salience 20))
  ?game <- (object (is-a SESION)(nombre imita_al_robot)(estado en_proceso)(turno robot)(fase ?f))
  ?move_robot <-(object (is-a JUEGOS)(nombre imita_al_robot)(pose ?x)(individuo robot)(jugando activo))
  ?move_ninio <-(object (is-a JUEGOS)(nombre imita_al_robot)(pose ?x)(individuo ninio)(jugando activo))
  =>
  (modify-instance ?game (fase (+ ?f 1)))
  (modify-instance ?move_robot (jugando inactivo))
  (modify-instance ?move_ninio (jugando inactivo))
  (printout t "Bien, el ninio acerto!!! Ambos hicieron la pose " ?x crlf)
)

(defrule check_mal_imita
  (declare (salience 10))
  ?game <- (object (is-a SESION)(nombre imita_al_robot)(estado en_proceso)(turno robot)(fase ?f))
  ?move_robot <-(object (is-a JUEGOS)(nombre imita_al_robot)(pose ?x)(individuo robot)(jugando activo))
  ?move_ninio <-(object (is-a JUEGOS)(nombre imita_al_robot)(pose ?y)(individuo ninio)(jugando activo))
  =>
  (modify-instance ?game (fase (+ ?f 1)))
  (modify-instance ?move_robot (jugando inactivo))
  (modify-instance ?move_ninio (jugando inactivo))
  (printout t "Mal, el ninio fallo!!! El robot hizo la pose " ?x " y el ninio la pose " ?y crlf)
)

(defrule check_bien_twister
  (declare (salience 20))
  ?game <- (object (is-a SESION)(nombre twister)(estado en_proceso)(turno robot)(fase ?f))
  ?move_robot <-(object (is-a JUEGOS)(nombre twister)(color ?x) (extremidad ?y) (individuo robot) (jugando activo))
  ?move_ninio <-(object (is-a JUEGOS)(nombre twister)(color ?x) (extremidad ?y) (individuo ninio) (jugando activo))
  =>
  (modify-instance ?game (fase (+ ?f 1)))
  (modify-instance ?move_robot (jugando inactivo))
  (modify-instance ?move_ninio (jugando inactivo))
  (printout t "Bien, el ninio acerto!!! Puso su " ?y " en el color " ?x crlf)
)

(defrule check_mal_twister
  (declare (salience 10))
  ?game <- (object (is-a SESION)(nombre twister)(estado en_proceso)(turno robot)(fase ?f))
  ?move_robot <-(object (is-a JUEGOS)(nombre twister)(color ?x) (extremidad ?y) (individuo robot)(jugando activo))
  ?move_ninio <-(object (is-a JUEGOS)(nombre twister)(color ?a) (extremidad ?b) (individuo ninio)(jugando activo))
  =>
  (modify-instance ?game (fase (+ ?f 1)))
  (modify-instance ?move_robot (jugando inactivo))
  (modify-instance ?move_ninio (jugando inactivo))
  (printout t "Mal, el ninio fallo!!! Puso su " ?b " en el color " ?a " y era " ?y " en el color " ?x crlf)
)



(defrule finalizar_juego
  (declare (salience 100))
  ?game <- (object (is-a SESION)(nombre ?a)(estado en_proceso)(turno robot)(fase 5))
  =>
  (modify-instance ?game (estado finalizado))
  (printout t " " crlf)
  (printout t "El robot finaliza el juego " ?a crlf)
)
