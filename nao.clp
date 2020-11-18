(defclass NINIO (is-a USER)
   (slot personalidad
     (type SYMBOL)
     (default atento)
     (allowed-values atento distraido))
   (slot salida (type SYMBOL)))


(defclass POSE (is-a ACTIVIDAD)
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
    (default empezar)
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
