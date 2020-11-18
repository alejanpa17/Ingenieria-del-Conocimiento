(defclass NINIO (is-a USER)
   (slot personalidad
     (type SYMBOL)
     (default atento)
     (allowed-values atento distraido))
   (slot estado (type POSE))
   (slot salida (type SYMBOL)))

(defclass ROBOT (is-a POSE))

(defclass POSE (is-a ACTIVIDAD)
  (slot estado
    (type SYMBOL)
    (default atento)
    (allowed-values sentado levantado brazos_arriba)))

(defclass COLOR (is-a USER)
   (slot nombre
     (type SYMBOL)
     (allowed-values azul amarillo rojo verde)))

(defclass JUEGO (is-a USER)
  (slot nombre
    (type SYMBOL)
    (allowed-values imita_al_robot twister))
  (slot estado
    (type SYMBOL)
    (default empezar)
    (allowed-values empezar explicar en_proceso recordar finalizar))
  (slot turno
    (type SYMBOL)
    (default robot)
    (allowed-values robot ninio))
  (slot fase
    (type INTEGER)
    (range 0 5)
    (default 0)))

(defclass TABLERO (is-a USER)
  (slot estado_1 (type COLOR))
  (slot estado_2 (type EXTREMIDAD)))

(defclass EXTREMIDAD (is-a USER)
  (slot mano
    (type SYMBOL)
    (allowed-values derecha izquierda))
  (slot pierna 
    (type SYMBOL)
    (allowed-values derecha izquierda)))
