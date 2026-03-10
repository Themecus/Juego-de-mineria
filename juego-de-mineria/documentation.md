# LOOP DE JUEGO

En principio el juego comenzará en un **valle**. El jugador debe montar en su vehículo para almacenar, transportar y movilizarse a cada punto distinto de minería. Se puede montar y bajar del vehículo para entrar en estas minas, que estarán señalizadas de alguna forma. Al entrar deberemos extraer todos los minerales posibles, llevarlos al carro y seguir a la siguiente.

**Reglas base:**
- Habrá un límite de cuántos minerales podemos cargar antes de no poder recibir más (cada mineral tendrá un tamaño diferente que influirá en el peso).
- Habrá un ciclo de **día y noche**:
  - **Día**: se puede ir a minar.
  - **Noche**: se debe pelear, volviendo a toda prisa al poblado (aquí puedes mejorarte a ti, al pueblo, al vehículo y las herramientas).
- Si se logra sobrevivir ciertos días, se completa la partida.

## MINERO

Será el personaje a manejar. Tendrá:
- Una **pala** para excavar.
- Una **bolsa** para almacenar.

Podrá:
- Interactuar con su vehículo para mover los minerales y a sí mismo.
- Romper los bloques que contengan minerales.
- Interactuar con el pueblo para defenderlo (colocándose en una torre y disparando con un arma).

El minero **no tiene vida**, pero si la vida del pueblo se acaba, termina la partida.

## VEHÍCULO

Será un objeto estático hasta que el jugador lo monte para conducir.
- **Primera idea**: que tenga gravedad para que choque con baches o haga pequeños brincos.
- **Segunda instancia**: que sea una especie de taxi que no controles hasta que encuentre otro punto de extracción.

## ENTORNO

- Cada punto de extracción o cueva se generará de forma **aleatoria** cuando se entre en ellas.
- Cuanto más alejado del pueblo, más compleja será y más minerales tendrá.
- La generación será **vertical hacia abajo**, por lo que se tendrá que interactuar con el sistema de cuevas nuevamente.

## MEJORAS TEMPORALES

Durante la partida, con los minerales se podrá mejorar al personaje y sus alrededores para mayor eficiencia:

- **Personaje**: tamaño de la pala, velocidad de movimiento, velocidad de minado, capacidad de bolsa.
- **Vehículo**: velocidad.
- **Poblado**: armas, vida, reparaciones.

## MEJORAS PERMANENTES

- Si se gana o pierde, se obtendrán puntos para estar más fuerte en la siguiente run.
- Son las mismas mejoras que las temporales, pero un poco más débiles y **no se pierden** tras una run.

## PUNTOS PARA MINAR

Se usarán **blueprints** o **presets** para generar una cueva completa.
- Habrá **3 variaciones de cuevas**: pequeñas, medianas y de evento.
- Las cuevas se construirán con estos presets:
  - **4 presets** para las pequeñas.
  - **6 presets** para las medianas.
  - **1 preset** para las de evento.
- En total: **20 presets + 3 de evento**.

## CONTROLES

- **A S D W** para moverse.
- **Click izquierdo** para la pala / torreta en la ciudad.
- **Click derecho** para la bolsa.
- **Espacio** para interactuar con el vehículo y el poblado.
- **F** (solo en vehículo o ciudad) para abrir el menú de mejoras.

## DIBUJOS

Este apartado se manejará cuando ya exista una base lo suficientemente sólida. Es decir, cuando el vehículo, la generación de minas y el minero funcionen, me pondré a diseñar lo visual.

---

# OBJETIVOS CUMPLIDOS

- [x] Pasar todo esto a **markdown**.

## INVENTARIO, PESO Y TAMAÑO

- Se debe investigar cómo hacer un **inventario en Godot**, ya que se guardarán minerales de diferentes tamaños y valores.
- Si no es posible, se desechará la idea de usar tamaños y todos valdrán lo mismo.

## MECÁNICAS IMPLEMENTADAS

- [x] Ya tenemos un sistema de inventario y podemos recoger los minerales.
- [x] Ver si podemos hacer un sistema que guarde el valor diferente de cada mineral recogido (ej. oro de 4,2 de peso).
- [x] Un HUD para controlar y saber cuántos minerales llevamos encima (en consola).
- [x] Que el contador incremente entre diferentes minerales (en consola).
- [x] Expandir el área de recogida del minero (luego se cambiará por la bolsa).
- [x] Crear las 3 variaciones de minerales.
- [x] Colocarle un límite de peso al jugador.
- [x] Vaciarlos en algún sitio.
- [x] Poder agarrar más de uno.
- [x] Darles gravedad a los minerales.
- [x] Tenemos a un minero que se mueve bien.
- [x] Reciclamos la mecánica de la pala para cavar.
- [x] Bloques destruibles.
- [x] Bloques indestructibles que no se rompan.
- [x] Falta el dropeo de minerales.
- [x] Reparar gravedad constante.
- [x] Crear un "ataque" que haga aparecer la bolsa frente a uno (como con la pala).
- [x] Mapear la bolsa al click derecho.
- [x] Los bloques dropean más minerales.
- [x] Los minerales salen en desorden.
- [x] Mejorar la colisión con los minerales para empujarlos.
- [x] Variar el tamaño del mineral (esto no se puede).

## VEHÍCULO

- [x] Crear el vehículo. La idea es que se guarde el jugador dentro del vehículo.
- [x] El vehículo debe contar con su propio inventario (esta vez infinito).
- [x] Carretera infinita.

## GENERACIÓN DE MINAS

- [x] Colocar los puntos donde se minará (bloques de generación).
- [x] Planear ese bloque generador.
- [x] Ajustar la generación del mapa.
- [x] Diseñar el sistema de cuevas.
- [x] Poner en las esquinas y lados bloques indestructibles.
- [x] Colocarle un piso a la mina para que no se mine al infinito.
- [x] Hacer 3 versiones: pequeña, mediana y grande (la idea es volver el código una clase para hacer más versiones de diferentes tamaños).
- [x] Agregar un sistema que, entre más te alejes, mayor sea la probabilidad de que salgan cuevas grandes.
- [x] Balancear la aparición de puntos de minería.
- [x] Mejorar el tamano de los bloques.
- [x] Incrementar el **tamaño de las cuevas** (bloque).
- [x] Preparar **precreados** para las cuevas con las colecciones de escenas.
- [x] Crear **bombas**.
- [x] Plan para las bombas: Primero que al impactar con algo comience su secuencia de explotar, luego desaparece, durante ese proceso debe revisar cuantas hareas hay para romperlas, trata que de primeras el minero lo suelte
- [x] Crear **bombas** taladro.
- [x] Variar los **bloques de cueva** en el generador.
- [x] Implementar una niebla o sombra que me de poca vision de la cueva
- [x] Implementar un equilibrio entre minar rapido y minar moderado (al final fue colocarle poder de minado que lo trataremos en estadisticas)
- [x] Hacer revisiones en el spawn de osbtaculos, menas y tierra, deberiamos aumentarlo confrome sea mas grande la cueva

## INTERFACES
- [x] Hacer un **menú** en la pantalla de inicio.
- [x] Hacer un menu personal para detener el progreso del juego.

---
# OBJETIVOS ACTUALES

- [ ] Planear mejor el **loop de juego**.
- [ ] Sistema de guardado, de momento guardar los datos basicos
- [ ] Ver cómo implementar un **sistema de mejoras**, qué mejorar y qué no.
- [ ] Planear **enemigos**. Una idea es generar cuartos grandes con enemigos presentes.
- [ ] Investigar diferentes resoluciones
- [ ] Organizar las scenes
- [ ] Crea otro item y trata de en el menu de mejoras como cambiarlos

- [ ] Hacer **interfaz** para el sistema de mejoras.
- [ ] Crear una forma de gastar lo que recolectemos
- [ ] Hacer un interfaz que indique cuantos recursos llevo y un limite de eso
