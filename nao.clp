(defclass PERSONALIDAD (is-a USER)
   (slot personalidad
     (type SYMBOL)
     (allowed-values distraido agresivo))
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
    (allowed-values empezado explicado en_proceso recordado finalizado))
  (slot turno
    (type SYMBOL)
    (default robot)
    (allowed-values robot ninio))
  (slot personalidad
    (type SYMBOL)
    (allowed-values distraido agresivo))
  (slot fase
    (type INTEGER)
    (default 0)))
