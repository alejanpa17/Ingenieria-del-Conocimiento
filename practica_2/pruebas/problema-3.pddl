(define (problem TEST)
(:domain NAO)
(:objects
	PERRO GATO PAJARO PEZ - animal
  C1 C2 C3 C4 C5 C6 C7 C8 - posicion
	NAO LUCAS - jugador
	no_mira grita pega - accion
	atiende silencio calma - respuesta

	)
(:init
       (init)
       (= (ronda) 0)
			 (= (num_rondas) 2)
       (= (cartas_emparejadas) 0)
			 (= (num_parejas_cartas) 4)
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
			 (= (posicion_carta PEZ C7) 0)
			 (= (posicion_carta PEZ C8) 0)

			 (= (posicion_carta PAJARO C1) 1)
       (= (posicion_carta PAJARO C2) 1)
       (= (posicion_carta GATO C3) 1)
       (= (posicion_carta GATO C4) 1)
			 (= (posicion_carta PEZ C5) 1)
			 (= (posicion_carta PEZ C6) 1)
       (= (posicion_carta PERRO C7) 1)
       (= (posicion_carta PERRO C8) 1)

)

(:goal (finalizado))

)
