(define (problem TEST)
(:domain NAO)
(:objects
	PERRO GATO PAJARO - animal
  C1 C2 C3 C4 C5 C6 - posicion
	NAO LUCAS - jugador
	no_mira grita pega - accion
	atiende silencio calma - respuesta

	)
(:init
       (init)
       (= (ronda) 0)
			 (= (num_rondas) 3)
       (= (cartas_emparejadas) 0)
			 (= (num_parejas_cartas) 3)
			 (= (cartas_giradas) 0)
			 (= (interrupcion) 0)
			 (ninio LUCAS)
			 (jugador NAO)
       (= (posicion_carta GATO C1) 0)
       (= (posicion_carta GATO C2) 0)
       (= (posicion_carta PERRO C3) 0)
       (= (posicion_carta PERRO C4) 0)
       (= (posicion_carta PAJARO C5) 0)
       (= (posicion_carta PAJARO C6) 0)
			 (= (posicion_carta PAJARO C1) 1)
       (= (posicion_carta PAJARO C2) 1)
       (= (posicion_carta GATO C3) 1)
       (= (posicion_carta GATO C4) 1)
       (= (posicion_carta PERRO C5) 1)
       (= (posicion_carta PERRO C6) 1)
			 (= (posicion_carta PERRO C1) 2)
       (= (posicion_carta PERRO C2) 2)
       (= (posicion_carta PAJARO C3) 2)
       (= (posicion_carta PAJARO C4) 2)
       (= (posicion_carta GATO C5) 2)
       (= (posicion_carta GATO C6) 2)
)

(:goal (finalizado))

)
