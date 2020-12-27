(define (domain NAO)
(:requirements :typing :fluents :equality)
(:types animal posicion jugador accion respuesta)

(:predicates  (init)
              (empezar)
              (explicar)
              (saludar)
              (en_proceso)
              ;(interrupcion)
              (recordar)
              (finalizado)
              (turno ?j - jugador)
              (ninio ?j - jugador)
              (jugador ?j - jugador)
              (cambiar_turno)
              (memorizar_carta ?a - animal ?p - posicion)
              (carta_girada ?a - animal ?p - posicion)
              (accion_respuesta ?c - accion ?r - respuesta)
)

(:functions (ronda) (cartas_emparejadas) (cartas_giradas) (posicion_carta ?a - animal ?p - posicion) (interrupcion))


(:action identificar_ninio
	 :parameters (?j - jugador)
	 :precondition (and (init) (ninio ?j))
	 :effect
		(and  (saludar)
          (jugador ?j)
          (not (init)))
)

(:action saludar_ninio
	 :parameters (?j - jugador)
	 :precondition (and (saludar) (ninio ?j))
	 :effect
		(and  (explicar)
          (not (saludar)))
)

(:action explicar_juego
	 :parameters ()
	 :precondition (explicar)
	 :effect
		(and  (empezar)
          (not (explicar)))
)

(:action empezar_ronda
	 :parameters (?j - jugador)
	 :precondition (and (empezar) (jugador ?j))
	 :effect
		(and  (en_proceso)
          (turno ?j)
          (not (empezar)))
)

(:action girar_carta_nueva
	 :parameters (?j - jugador ?a - animal ?p - posicion )
	 :precondition
    (and  (en_proceso)
          (turno ?j)
          (= (ronda) (posicion_carta ?a ?p))
          (not (carta_girada ?a ?p))
          (not (memorizar_carta ?a ?p))
          (not (cambiar_turno))
          (< (cartas_giradas) 2))
	 :effect
		(and  (increase (cartas_giradas) 1)
          (memorizar_carta ?a ?p)
          (carta_girada ?a ?p))
)

(:action girar_carta_conocida
	 :parameters (?j - jugador ?a - animal ?p1 - posicion ?p2 - posicion )
	 :precondition
    (and  (en_proceso)
          (turno ?j)
          (= (ronda) (posicion_carta ?a ?p1))
          (carta_girada ?a ?p1)
          (= (ronda) (posicion_carta ?a ?p2))
          (memorizar_carta ?a ?p2)
          (not (carta_girada ?a ?p2))
          (not (cambiar_turno))
          (< (cartas_giradas) 2))
	 :effect
		(and  (increase (cartas_giradas) 1)
          (carta_girada ?a ?p2))
)

(:action finalizar_ronda
	 :parameters (?j - jugador)
	 :precondition (and (en_proceso) (cambiar_turno) (turno ?j) (>= (cartas_emparejadas) 3))
	 :effect
		(and  (empezar)
          (increase (ronda) 1)
          (decrease (cartas_emparejadas) 3)
          (not (en_proceso))
          (not (cambiar_turno))
          (not (turno ?j))
        )
)

(:action interrupcion_accion
	 :parameters (?j1 - jugador ?c - accion ?j2 - jugador ?r - respuesta)
	 :precondition (and (ninio ?j1) (jugador ?j2)(accion_respuesta ?c ?r))
	 :effect (and (not (accion_respuesta ?c ?r))
                (increase (interrupcion) 1))
)


(:action cambiar_turno
	 :parameters (?j1 ?j2 - jugador)
	 :precondition (and (en_proceso) (turno ?j1) (jugador ?j2) (not (= ?j1 ?j2)) (cambiar_turno))
	 :effect
		(and  (turno ?j2)
          (not (turno ?j1))
          (not (cambiar_turno)))
)

(:action comprobar_cartas
	 :parameters (?a1 - animal ?p1 - posicion ?a2  - animal ?p2 - posicion)
	 :precondition (and (carta_girada ?a1 ?p1) (carta_girada ?a2 ?p2) (not (= ?p1 ?p2)) (= (cartas_giradas) 2) )
	 :effect
		(and  (decrease (cartas_giradas) 2)
          (not (carta_girada ?a1 ?p1))
          (not (carta_girada ?a2 ?p2))

          (when (= ?a1 ?a2)
            (and (cambiar_turno)
            (increase (posicion_carta ?a1 ?p1) 99)
            (increase (posicion_carta ?a2 ?p2) 99)
            (not (memorizar_carta ?a1 ?p1))
            (not (memorizar_carta ?a2 ?p2))
            (increase (cartas_emparejadas) 1))))
)



(:action finalizar_juego
	 :parameters ()
	 :precondition (and (empezar) (>= (ronda) 2) (>= (interrupcion) 3))
	 :effect
		(and  (finalizado)
          (not (empezar)))
)
)
