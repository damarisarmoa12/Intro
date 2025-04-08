"problema duplicar (x: Z) : Z {
 requiere: {True}
 asegura: {resultado es el doble de x}"

4 = 8 

"problema raizCuadrada (x: Z) : R {
 requiere: {x es positivo}
 asegura: {resultado es la ra´ ız cuadrada de x}"

4 = 2 

" problema enteroMasCercanoPositivo (x: R) : Z {
 requiere: {True}
 asegura: {resultado es el entero m´as cercano de x}
 asegura: {resultado es positivo}"

0.5 = 1 

"problema raicesCuadradasUno (s: seq⟨Z⟩) : seq⟨R⟩ {
 requiere: {Todos los elementos de s son positivos}
 requiere: {No hay elementos repetidos en s}
 asegura: {resultado tiene la misma cantidad de elementos que s}
 asegura: {Los elementos de resultado son la salida de aplicar el problema raizCuadrada a todos los elementos de la
 secuencia s}
 asegura: {El orden de la secuencia resultado es el mismo que en la secuencia s, luego de aplicar el problema
 raizCuadrada}"

[4,9,16] = [2.0,3.0,4.0]

"problema raicesCuadradasDos (s: seq⟨Z⟩) : seq⟨R⟩ {
 requiere: {Todos los elementos de s son positivos}
 requiere: {No hay elementos repetidos en s}
 asegura: {resultado tiene la misma cantidad de elementos que s}
 asegura: {Los elementos de resultado son la salida de aplicar el problema raizCuadrada a todos los elementos de la
 secuencia s}"

 [4,9,16] = [2.0, 3.0, 4.0]
 [4,9,16] = [3.0, 2.0, 4.0] 
 [4,9,16] = [4.0, 3.0, 2.0] el asegura no especifica un orden

"problema raicesCuadradasTres (s: seq⟨Z⟩) : seq⟨R⟩ {
 requiere: {Todos los elementos de s son positivos}
 requiere: {No hay elementos repetidos en s}
 asegura: {resultado tiene la misma cantidad de elementos que s}
 asegura: {Los elementos de resultado son la salida de aplicar el problema raizCuadrada a uno o varios elementos de
 la secuencia s}"

 [4,9,16] = [2.0,9,16]
 [4,9,16] = [2.0,3.0,16]

"problema raicesCuadradasCuatro (s: seq⟨Z⟩) : seq⟨R⟩ {
 requiere: {Existen elementos de s que son positivos}
 requiere: {No hay elementos repetidos en s}
 asegura: {Los elementos de resultado son la salida de aplicar el problema raizCuadrada a todos los elementos de s
 que son positivos}"

 [4,9,16] = [2.0,3.0,4.0]

" problema raicesCuadradasCinco (s: seq⟨Z⟩) : seq⟨R⟩ {
 requiere: {Todos los elementos de s son positivos}
 asegura: {Cada posici´on de resultado, donde la posici´on es menor o igual a las de s, es igual a la salida de aplicar
 raizCuadrada al elemento que se encuentra en esa posici´on en s}"

 [4,9,16] = [2.0, 3.0, 4.0]

" problema raicesCuadradasSeis (s: seq⟨Z⟩) : seq⟨R⟩ {
 requiere: {Todos los elementos de s son positivos}
 asegura: {La longitud de resultado es como m´aximo la misma que s}
 asegura: {Cada posici´on de resultado, donde la posici´on es menor o igual a las de s, es igual a la salida de aplicar
 raizCuadrada al elemento que se encuentra en esa posici´on en s}"

 [4,9,16] = [2.0, 3.0, 4.0]

"problema ordenar (s: seq⟨Z⟩) : seq⟨Z⟩ {
 requiere: {True}
 asegura: {resultado es una secuencia en la cual cada elemento es estrictamente mayor que el anterior}
 }"

 "Dada s = ⟨4,3,5⟩ como secuencia de entrada, ¿es resultado = ⟨3,4,5⟩ una soluci´on v´alida seg´ un la especificaci´on?"
 Si es 

 " Dado s = ⟨4,3,3,5⟩ como secuencia de entrada, ¿es resultado = ⟨3,3,4,5⟩ una soluci´on v´alida seg´ un la especificaci´on?
 Corregir la especificaci´on modificando el requiere."
 No es, No hay elementos repetidos 

 "Si tomamos s = ⟨4,3,5⟩ como secuencia de entrada, ¿es resultado = ⟨3,4⟩ una soluci´on v´alida seg´ un la especificaci´on?
 Corregir la especificaci´on modificando el asegura."
 No es, el asegura debe decir que todos los elementos de el res es igual a la longitud s 

 "Si tomamos s = ⟨4,3,5⟩ como secuencia de entrada, ¿es resultado = ⟨3,4,5,6⟩ una soluci´on v´alida seg´ un la especificaci´on?
 Corregir la especificaci´on modificando el asegura"
 No, el asegura debe decir que todos los elementos de res deben ser igual a la longitud de s 

 "Dada s = ⟨8,5,7⟩ como secuencia de entrada, ¿es resultado = ⟨1,2,3⟩ una soluci´on v´alida seg´ un la especificaci´on?"

 Si, ya que es una secuencia donde cada elemento es mayor que el anterior 

 "Escribir una especificaci´on que permita recibir cualquier secuencia de enteros s como par´ametro y garantice que resultado
 contiene el resultado de ordenar correctamente los elementos s de menor a mayor."

 requiere: {True}
 asegura: {res es una secuencia en la cual cada es menor o igual que el siguiete
 y contiene todos los elementos de s en el mismo orden (sin repeticiones)}


"Se desea especificar el problema de reemplazar cada elemento de una secuencia de enteros por su doble y se cuenta
 con la siguiente especificaci´on:
 problema duplicarTodos (s: seq⟨Z⟩) : seq⟨Z⟩ {
 requiere: {True}
 asegura: {resultado tiene la misma cantidad de elementos que s}"

"¿Qu´e problemas tiene la especificaci´on dada? Dar ejemplos de valores para resultado que satisfagan la especificaci´on pero no
 sean respuestas correctas."

 [4,5,6] = [4,5,6] no especifica que deben ser duplicados, solo tener la misma cantidad
 [4,5,6] = [7,9,3]

 " Indicar cu´al/es de los siguientes asegura deber´ ıa/n ser agregado/s a la especificaci´on. Justificar en cada caso por qu´e deber´ıan
 o no ser agregados."

  asegura: {En cada posici´on de resultado, el valor es igual a la salida de aplicar duplicar al valor en esa misma posici´on
 de s}


 