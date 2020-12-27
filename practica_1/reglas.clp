(defrule iniciar_sesion
  ?game <- (object (is-a SESION)(nombre ?a)(estado empezado)(turno robot)(fase 0))
  ?game2 <- (object (is-a SESION)(nombre ?b)(estado empezado)(turno robot)(fase 0))
  (personalidad ?p)
  (test (neq ?a ?b))
  =>
  (modify-instance ?game (estado explicado) (personalidad ?p))
  (printout t "El robot saluda al ninio " crlf)
  (printout t "La personalidad del ninio es " ?p crlf)
)

(defrule iniciar_juego
  ?game <- (object (is-a SESION)(nombre ?a)(estado explicado)(turno robot)(fase 0))
  =>
  (modify-instance ?game (estado en_proceso)(fase 1))
  (printout t "El robot explica el juego " ?a " al ninio " crlf)
)

(defrule turno_robot_imita
  ?game <- (object (is-a SESION)(nombre imita_al_robot)(estado en_proceso)(turno robot)(fase ?f))
  ?move <-(object (is-a JUEGOS)(nombre imita_al_robot)(pose ?p)(individuo none))
  =>
  (modify-instance ?game (turno ninio))
  (make-instance of JUEGOS (nombre imita_al_robot)(pose ?p)(individuo robot))
  (printout t " " crlf)
  (printout t "TURNO " ?f crlf)
  (printout t "El robot hace la pose " ?p crlf)
)

(defrule turno_robot_twister
  ?game <- (object (is-a SESION)(nombre twister)(estado en_proceso)(turno robot)(fase ?f))
  ?move <-(object (is-a JUEGOS)(nombre twister)(color ?c)(extremidad ?e)(individuo none))
  =>
  (modify-instance ?game (turno ninio))
  (make-instance of JUEGOS (nombre twister)(color ?c)(extremidad ?e)(individuo robot))
  (printout t " " crlf)
  (printout t "TURNO " ?f crlf)
  (printout t "El robot elige " ?e " en el color " ?c  crlf)
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
  ?pers <-(object (is-a PERSONALIDAD)(personalidad ?p)(ninio ?a)(robot ?b))
  ?game <- (object (is-a SESION)(estado explicado)(personalidad ?p))
  =>
  (unmake-instance ?pers)
  (make-instance of PERSONALIDAD (personalidad ?p)(ninio ?a)(robot ?b))
  (printout t "El ninio " ?a " entonces el robot le pide " ?b crlf)
)

(defrule corregir_recordar
  ?pers <-(object (is-a PERSONALIDAD)(personalidad ?p)(ninio ?a)(robot ?b))
  ?game <- (object (is-a SESION)(estado en_proceso)(turno ninio)(personalidad ?p))
  =>
  (unmake-instance ?pers)
  (make-instance of PERSONALIDAD (personalidad ?p)(ninio ?a)(robot ?b))
  (modify-instance ?game (estado recordado))
  (printout t "El ninio " ?a " entonces el robot le pide " ?b crlf)
)

(defrule recordar_imita
  ?game <- (object (is-a SESION)(nombre imita_al_robot )(estado recordado))
  ?move_robot <-(object (is-a JUEGOS)(nombre imita_al_robot)(pose ?x)(individuo robot))
  =>
  (modify-instance ?game (estado en_proceso))
  (printout t "El robot le recuerda al ninio que la pose es " ?x crlf)
)

(defrule recordar_twister
  ?game <- (object (is-a SESION)(nombre twister)(estado recordado))
  ?move_robot <-(object (is-a JUEGOS)(nombre twister)(color ?x) (extremidad ?y) (individuo robot))
  =>
  (modify-instance ?game (estado en_proceso))
  (printout t "El robot le recuerda al ninio que el color es " ?x " y la extremidad es " ?y crlf)
)


(defrule finalizar_juego
  (declare (salience 100))
  ?game <- (object (is-a SESION)(nombre ?a)(estado en_proceso)(turno robot)(fase ?f))
  (test (> ?f 5))
  =>
  (modify-instance ?game (estado finalizado))
  (printout t " " crlf)
  (printout t "El robot finaliza el juego " ?a crlf)
)
