(deffacts personalidades
    (personalidad distraido)
    (personalidad agresivo)
)

(definstances sesion
  ([game_1] of SESION (nombre imita_al_robot))
  ([game_2] of SESION (nombre twister))
)

(definstances personalidad
  ([ninio_1] of PERSONALIDAD (personalidad distraido) (ninio no_mira) (robot atiende))
  ([ninio_2] of PERSONALIDAD (personalidad agresivo) (ninio grita) (robot silencio))
  ([ninio_3] of PERSONALIDAD (personalidad agresivo) (ninio pega) (robot calma))
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
