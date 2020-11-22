(defclass PERSONALIDAD (is-a USER)
   (slot ninio
     (type SYMBOL)
     (allowed-values no_mira grita pega))
   (slot robot
     (type SYMBOL)
     (allowed-values  atiende silencio calma)))


(defclass POSE (is-a USER)
  (slot estado
    (type SYMBOL)
    (default sentado)
    (allowed-values sentado levantado brazos_arriba))
  (slot individuo
    (type SYMBOL)
    (allowed-values robot ninio)))


(defclass COLOR (is-a USER)
   (slot nombre
     (type SYMBOL)
     (allowed-values azul amarillo rojo verde))
   (slot individuo
     (type SYMBOL)
     (allowed-values robot ninio)))


(defclass JUEGO (is-a USER)
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


(defclass EXTREMIDAD (is-a USER)
  (slot mano
    (type SYMBOL)
    (allowed-values derecha izquierda))
  (slot pierna
    (type SYMBOL)
    (allowed-values derecha izquierda))
  (slot individuo
    (type SYMBOL)
    (allowed-values robot ninio)))


(definstances start

  ([game_1] of JUEGO (nombre imita_al_robot))
  ([game_2] of JUEGO (nombre twister))

  ([ninio_1] of PERSONALIDAD (ninio no_mira) (robot atiende))
  ([ninio_2] of PERSONALIDAD (ninio grita) (robot silencio))
  ([ninio_3] of PERSONALIDAD (ninio pega) (robot calma))

  ([pose_r_1] of POSE (estado sentado) (individuo robot))
  ([pose_r_2] of POSE (estado levantado) (individuo robot))
  ([pose_r_3] of POSE (estado brazos_arriba) (individuo robot))
  ([pose_n_1] of POSE (estado sentado) (individuo ninio))
  ([pose_n_2] of POSE (estado levantado) (individuo ninio))
  ([pose_n_3] of POSE (estado brazos_arriba) (individuo ninio))

  ([color_r_1] of COLOR (nombre azul) (individuo robot))
  ([color_r_2] of COLOR (nombre amarillo) (individuo robot))
  ([color_r_3] of COLOR (nombre rojo) (individuo robot))
  ([color_r_3] of COLOR (nombre verde) (individuo robot))
  ([color_n_1] of COLOR (nombre azul) (individuo ninio))
  ([color_n_2] of COLOR (nombre amarillo) (individuo ninio))
  ([color_n_3] of COLOR (nombre rojo) (individuo ninio))
  ([color_n_3] of COLOR (nombre verde) (individuo ninio))

  ([extr_r_1]of EXTREMIDAD (mano derecha)(individuo robot))
  ([extr_r_2]of EXTREMIDAD (pierna derecha)(individuo robot))
  ([extr_r_3]of EXTREMIDAD (pierna izquierda)(individuo robot))
  ([extr_r_4]of EXTREMIDAD (mano izquierda)(individuo robot))
  ([extr_n_5]of EXTREMIDAD (mano derecha)(individuo ninio))
  ([extr_n_6]of EXTREMIDAD (pierna derecha)(individuo ninio))
  ([extr_n_7]of EXTREMIDAD (pierna izquierda)(individuo ninio))
  ([extr_n_8]of EXTREMIDAD (mano izquierda)(individuo ninio))
)



(defrule corregir
  (object (is-a PERSONALIDAD)(ninio ?a)(robot ?b))
  ?game <- (object (is-a JUEGO)(estado empezado)(turno robot)(fase 0))

  =>
  (printout t "El ninio " ?a " entonces el robot " ?b crlf)
)

(defrule iniciar_juego
  ?game <- (object (is-a JUEGO)(nombre ?a)(estado empezado)(turno robot)(fase 0))
  =>
  (modify-instance ?game (estado explicado)  )
  (printout t "El robot saluda al ninio " crlf)
)

(defrule explicar_juego
  ?game <- (object (is-a JUEGO)(nombre ?a)(estado explicado)(turno robot)(fase 0))
  =>
  (modify-instance ?game (estado en_proceso)(fase 1))
  (printout t "El robot explica el juego " ?a " al ninio " crlf)
)

(defrule turno_robot
  ?game <- (object (is-a JUEGO)(nombre ?a)(estado en_proceso)(turno robot)(fase ?b))
  =>
  (modify-instance ?game (turno ninio))
  (printout t "Acaba el turno del robot " crlf)
)

(defrule turno_ninio
  ?game <- (object (is-a JUEGO)(nombre ?a)(estado en_proceso)(turno ninio)(fase ?b))
  =>
  (modify-instance ?game (turno robot)(fase (+ ?b 1)))
  (printout t "Acaba el turno del ninio " crlf)
)

(defrule finalizar_juego
  ?game <- (object (is-a JUEGO)(nombre ?a)(estado en_proceso)(turno robot)(fase 5))
  =>
  (modify-instance ?game (estado finalizado))
  (printout t "El robot finaliza el juego " ?a crlf)
)
