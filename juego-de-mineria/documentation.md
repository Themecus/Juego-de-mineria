# LOOP DE JUEGO

El juego se separara en minar, proteger y recorrer. Minaremos en las cuevas de la 
izquierda o derecha para conseguir recursos, esos recursos los invertiremos 
en el minero para extraer mas, en la carruaje para mejoras de velocidad o extras,
y en la ciudad para protegerla. el Ataque pasara antes de 10 minutos. 
Durante este loop nos encontraremos mas cosas:
portales donde enfrentaremos criaturas y nos daran mas tiempo y minerales
tesoros en formas de mejoras
eventos aleatorios en el carruaje, como enemigos o algo curioso


**Reglas base:**
- Habrá un límite de cuántos minerales podemos cargar antes de no poder recibir más (cada mineral tendrá un tamaño diferente que influirá en el peso).
- Habrá un ciclo de **día y noche**:
  - **Día**: se puede ir a minar.
  - **Noche**: se debe pelear, volviendo a toda prisa al poblado (aquí puedes mejorarte a ti, al pueblo, al vehículo y las herramientas).
- Si se logra sobrevivir ciertos días, se completa la partida.


## MEJORAS TEMPORALES

Durante la partida, con los minerales se podrá mejorar al personaje y sus alrededores para mayor eficiencia:

- **Personaje**: tamaño de la pala, velocidad de movimiento, velocidad de minado, capacidad de bolsa.
- **Vehículo**: velocidad.
- **Poblado**: armas, vida, reparaciones.

## MEJORAS PERMANENTES

- Si se gana o pierde, se obtendrán puntos para estar más fuerte en la siguiente run.
- Son las mismas mejoras que las temporales, pero un poco más débiles y **no se pierden** tras una run.


## DIBUJOS

Este apartado se manejará cuando ya exista una base lo suficientemente sólida. Es decir, cuando el vehículo, la generación de minas y el minero funcionen, me pondré a diseñar lo visual.

---
Tienes toda la razón. Revisando la lista anterior, hay varios elementos que estaban fuera de lugar o en categorías que no les correspondían (por ejemplo, `vida para la ciudad` dentro de Mecánicas, o `Timer` y `Sistema de aturdimiento` sueltos).

Aquí está la lista **corregida y re-categorizada** manteniendo **absolutamente todos los elementos** (sin borrar nada) pero colocados donde realmente pertenecen. También he añadido una categoría nueva llamada **ESTADÍSTICAS / PODER DEL JUGADOR** para alojar conceptos que antes flotaban.

---

# OBJETIVOS CUMPLIDOS

- [x] Pasar todo esto a **markdown**.

## INVENTARIO, PESO Y TAMAÑO

- [x] Se debe investigar cómo hacer un **inventario en Godot**, ya que se guardarán minerales de diferentes tamaños y valores.
- [x] Si no es posible, se desechará la idea de usar tamaños y todos valdrán lo mismo.
- [x] Ya tenemos un sistema de inventario y podemos recoger los minerales.
- [x] Ver si podemos hacer un sistema que guarde el valor diferente de cada mineral recogido (ej. oro de 4,2 de peso).
- [x] Colocarle un límite de peso al jugador.
- [x] Vaciarlos en algún sitio.
- [x] Hacer un interfaz que indique cuantos recursos llevo y un limite de eso (para el personaje).
- [x] Hacer un interfaz que indique cuantos recursos llevo y un limite de eso (para el carro).

## MINERO (PERSONAJE)

- [x] Tenemos a un minero que se mueve bien.
- [x] Será el personaje a manejar. Tendrá:
  - Una **pala** para excavar.
  - Una **bolsa** para almacenar.
- [x] Podrá:
  - Interactuar con su vehículo para mover los minerales y a sí mismo.
  - Romper los bloques que contengan minerales.
  - Interactuar con el pueblo para defenderlo (colocándose en una torre y disparando con un arma).
- [x] Expandir el área de recogida del minero (luego se cambiará por la bolsa).
- [x] Poder agarrar más de uno.
- [x] Crear un "ataque" que haga aparecer la bolsa frente a uno (como con la pala).
- [x] Mapear la bolsa al click derecho.
- [x] El minero **no tiene vida**, pero si la vida del pueblo se acaba, termina la partida.

## VEHÍCULO

- [x] Crear el vehículo. La idea es que se guarde el jugador dentro del vehículo.
- [x] El vehículo debe contar con su propio inventario (esta vez infinito).
- [x] Carretera infinita.
- [x] Coloca que cuando el jugador se ponga en la zona de la vault tambien entrege.
- [x] Será un objeto estático hasta que el jugador lo monte para conducir.
- [x] **Primera idea**: que tenga gravedad para que choque con baches o haga pequeños brincos.
- [x] **Segunda instancia**: que sea una especie de taxi que no controles hasta que encuentre otro punto de extracción.

## MECÁNICAS DE MINERÍA Y RECOLECCIÓN

- [x] Reciclamos la mecánica de la pala para cavar.
- [x] Bloques destruibles.
- [x] Bloques indestructibles que no se rompan.
- [x] Falta el dropeo de minerales.
- [x] Los bloques dropean más minerales.
- [x] Los minerales salen en desorden.
- [x] Darles gravedad a los minerales.
- [x] Reparar gravedad constante.
- [x] Mejorar la colisión con los minerales para empujarlos.
- [x] Variar el tamaño del mineral (esto no se puede).
- [x] Un HUD para controlar y saber cuántos minerales llevamos encima (en consola).
- [x] Que el contador incremente entre diferentes minerales (en consola).
- [x] Crear las 3 variaciones de minerales.

## GENERACIÓN DE MINAS Y CUEVAS

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
- [x] Variar los **bloques de cueva** en el generador.
- [x] Implementar una niebla o sombra que me de poca vision de la cueva.
- [x] Hacer revisiones en el spawn de obstaculos, menas y tierra, deberiamos aumentarlo conforme sea mas grande la cueva.

## PUNTOS PARA MINAR o PRESETS

- [x] Se usarán **blueprints** o **presets** para generar una cueva completa.
- [x] Habrá **3 variaciones de cuevas**: pequeñas, medianas y de evento.
- [x] Las cuevas se construirán con estos presets:
  - **4 presets** para las pequeñas.
  - **6 presets** para las medianas.
  - **1 preset** para las de evento.
- En total: **20 presets + 3 de evento**.
- [x] Planear portales.
- [x] Destruir portal tras cruzarlo de vuelta.

## OBJETOS

- [x] Crear **bombas**.
- [x] Plan para las bombas: Primero que al impactar con algo comience su secuencia de explotar, luego desaparece, durante ese proceso debe revisar cuantas areas hay para romperlas, trata que de primeras el minero lo suelte.
- [x] Crear **bombas** taladro.
- [x] Hacer que las bombas interactuen bien con los bloques.
- [x] Arreglar el sistema de colisiones para las bombas.

## ESTADÍSTICAS

- [x] Implementar un equilibrio entre minar rapido y minar moderado (al final fue colocarle poder de minado que lo trataremos en estadisticas).
- [x] Timer.
- [x] Sistema de aturdimiento.

## CIUDAD Y DEFENSA

- [x] vida para la ciudad.
- [x] Planear la ciudad.
- [x] (El minero puede) Interactuar con el pueblo para defenderlo (colocándose en una torre y disparando con un arma).

## ENTORNO Y EXPLORACIÓN

- [x] lista de entorno:
  - Cada punto de extracción o cueva se generará de forma **aleatoria** cuando se entre en ellas.
  - Cuanto más alejado del pueblo, más compleja será y más minerales tendrá.
  - La generación será **vertical hacia abajo**, por lo que se tendrá que interactuar con el sistema de cuevas nuevamente.

## INTERFACES Y MENÚS

- [x] Hacer un **menú** en la pantalla de inicio.
- [x] Hacer un menu personal para detener el progreso del juego.
- [x] Ver cómo implementar un **sistema de mejoras**, qué mejorar y qué no.
- [x] Hacer **interfaz** para el sistema de mejoras.
- [x] Crear una forma de gastar lo que recolectemos.
- [x] Crea otro item y trata de en el menu de mejoras como cambiarlos.
- [x] Investigar diferentes resoluciones (se modifico dentro de las configuraciones de proyecto).

## CONTROLES

- [x] Lista de tareas.
- [x] **A S D W** para moverse.
- [x] **Click izquierdo** para la pala / torreta en la ciudad.
- [x] **Click derecho** para la bolsa.
- [x] **Espacio** para interactuar con el vehículo y el poblado.
- [x] **F** (solo en vehículo o ciudad) para abrir el menú de mejoras.

## ENEMIGOS

- [x] Hacer un enemigo basico.

## EXTRAS / SISTEMA DE GUARDADO

- [x] Sistema de guardado, de momento guardar los datos basicos.
- [x] Planear mejor el **loop de juego**.
-------------------

# OBJETIVOS ACTUALES
- [ ] Planear **enemigos**. Una idea es generar cuartos grandes con enemigos presentes.


- [ ] Sistema de defensa
- [ ] Eventos aleatorios
- [ ] Darle una barra de vida a la ciudad

- [ ] ver si se pueden solapar enemigos entre sis


- [ ] Organizar las scenes

- [ ] Mejorar el sistemas de sombras, haciendo que al romper un bloque toda la sombra desaparezca
- [ ] Mejora la interfaz visualmente
- [ ] Usar las funciones de guardado para colocarlo en un tabla de clasificaciones y guardar las mejoras permanentes

- [ ] Agregar preseet de evento, pudiendo ser mejoras gratis o minerales varios o cosas curiosas 
