from queue import Queue as Cola 
def stock_productos (stock_cambios : list[tuple[str,int]]) -> dict[str,tuple[int,int]]: 
    res = {}
    
    for producto, cantidad in stock_cambios: 
        if producto in res: #se utiliza in res ya que queremos trabajar con los valores del diccionario de res, si no hacemos esto es como que nunca lo vimos 
         minimo,maximo = res[producto]
         if cantidad > maximo: 
            maximo = cantidad 
         if cantidad < minimo: 
            minimo = cantidad 
         res[producto] = (minimo,maximo)
        else:
         res[producto] = (cantidad,cantidad)
    return res 


stock = [("manzana",10),("manzana",3),("pera",5),("pera",15)]
print(stock_productos(stock))


""" Para ejercicios donde debamos procesar una lista con elementos dentro de ella (for producto,cantidad), y tenemos que hacer un diccioanrio
a partir de esa lista"""

def son_primos (s  : int) -> bool: 
    if s < 2:
        return False
    for i in range(2,s):
        if s % i == 0:
            return False 
    return True 

def filtrar_codigos_primos(codigos_barra : list[int]) -> list[int]: 
   res = []
   i = 0

   while i < len(codigos_barra): 
      elemento = codigos_barra[i]
      digito = elemento % 1000
      if son_primos(digito): 
         res.append(elemento)
      i += 1 
   return res 

codigos = [1101,1002,2013,3043,5115]
print(filtrar_codigos_primos(codigos))


"""usamos while i < len(codigos_barras) ya que estamos buscando cada elemento de la lista para procesarlo"""


def subsecuencia_mas_larga (tipos_pacientes_atendidos : list[str]) -> int : 
    max_longitud = 0 
    max_inicio = 0 

    actual_longitud = 0 
    actual_inicio = 0 
    i = 0

    while i < len(tipos_pacientes_atendidos): 
        if tipos_pacientes_atendidos[i] == "perro" or tipos_pacientes_atendidos[i] == "gato": 
            if actual_longitud == 0: #empieza con 0  
                actual_inicio = i  #por esto guardamos i como el inicio 
            actual_longitud += 1  
        else:
            if actual_longitud > max_longitud: 
             max_longitud = actual_longitud
             max_inicio = actual_inicio
            actual_longitud = 0 #se reinicia 
        i += 1 

    
    return max_inicio 

            
tipos = ["conejo", "perro", "gato", "perro", "gato", "iguana", "gato", "perro", "perro"]
print(subsecuencia_mas_larga(tipos))



def un_responsable_por_turno (grilla_horaria : list[list[str]]) -> list[tuple[bool,bool]]: 
   res = []

   for dia in range(len(grilla_horaria[0])): #se pone el [0] ya que solo estamos trabajando con las columnas 
         mañana = (grilla_horaria[0][dia] == grilla_horaria[1][dia] == grilla_horaria[2][dia] == grilla_horaria[3][dia])
         tarde = (grilla_horaria[5][dia] == grilla_horaria[6][dia] == grilla_horaria[7][dia] == grilla_horaria[8][dia])
         res.append((mañana,tarde))
   return res  

grilla = [
    ["Ana", "Ana", "Luis"],  # 0 (mañana)
    ["Ana", "Ana", "Luis"],  # 1
    ["Ana", "Ana", "Luis"],  # 2
    ["Ana", "Ana", "Luis"],  # 3
    ["", "", ""],            # 4 (vacío o descanso)
    ["Pepe", "Laura", "Pepe"],  # 5 (tarde)
    ["Pepe", "Laura", "Pepe"],  # 6
    ["Pepe", "Laura", "Pepe"],  # 7
    ["Pepe", "Laura", "Pepe"],  # 8
]

print(un_responsable_por_turno(grilla))

def promedio_de_salas (registro : dict[str,list[int]]) -> dict[str,tuple[int,float]]: 
   res = {} 
  

   for nombre, tiempo in registro.items(): 
      suma = 0 
      total = 0 

      for tiempos in tiempo: 
         if 0 < tiempos< 61: #si el tiempo es valido se suma a la variable de tiempos 
            suma += tiempos
            total += 1 
    
      if total > 0: 
        promedio = suma / total
      else: 
         promedio = 0.0
      res[nombre] = ((total,promedio))
   return res   

registro = {
    "ana": [0, 45, 61, 30],
    "juan": [0, 0, 0],
    "luis": [10, 20, 30]
}

print(promedio_de_salas(registro))


def tiempo_mas_rapido (tiempo_salas : list[int]) -> int: #buen ejercicio para cuando nos piden señalar algun indice en una posicion 
    mayor_tiempo = 61 
    menor_indice = 0

    for i in range (len(tiempo_salas)): 
        tiempo = tiempo_salas[i]
        if 1 <= tiempo <= 60 and tiempo < mayor_tiempo: 
           mayor_tiempo = tiempo
           menor_indice = i #siempre poner asi cuando necesite poner el indice 
    return menor_indice  

lista = [10,78,2,4,69]
print(tiempo_mas_rapido(lista))


def escape_en_solitario (amigos_por_salas : list[list[int]]) -> list[int]: #otro ejercicio donde nos piden los indices 
   res = []
   indice = 0

   for i in range(len(amigos_por_salas)): 
      sala = amigos_por_salas[i]
      if sala[0] == 0 and sala[1] == 0 and sala[3] == 0 and sala[2] != 0: 
         indice = i
         res.append(indice)
   return res 


salas = [
    [0, 0, 5, 0],  # solo el tercero fue → índice 0
    [0, 0, 0, 0],  # nadie fue → no entra
    [0, 0, 3, 0],  # solo el tercero fue → índice 2
    [1, 0, 2, 0]   # más de uno fue → no entra
]

print(escape_en_solitario(salas)) 


def torneo_de_gallina (estrategia : dict[str,str]) -> dict[str,int]: 
    res = {}
    
    for  jugador in estrategia :  #empieza los puntajes en 0
        res[jugador] = 0  

    jugadores = list(estrategia.keys()) #extrae las claves como una lista


    for jugador1 in jugadores: #busca un elemento en jugadores (que son la lista de claves del diccionario)
        for jugador2 in jugadores:  #busca otro elemento 
            if jugador1 < jugador2: #para que no se repitan 
                estrategia1 = estrategia[jugador1] #abrimos una variable de estrategia1 que sea igual a la estrategia del jugador 1 en el diccionario
                estrategia2 = estrategia[jugador2]

                if estrategia1 == "Me desvio siempre" and estrategia2 == "Me la banco y no me desvio": 
                    res[jugador1] -= 15 
                    res[jugador2] += 10
                elif estrategia1 == "Me la banco y no me desvio" and estrategia2 == "Me la banco y no me desvio": 
                    res[jugador1] -= 5
                    res[jugador2] -= 5 
                elif estrategia1 == "Me desvio siempre" and estrategia2 == "Me desvio siempre": 
                    res[jugador1] -= 10
                    res[jugador2] -= 10 
                elif estrategia1 == "Me la banco y no me desvio" and estrategia2 == "Me desvio siempre": 
                    res[jugador1] += 10 
                    res[jugador2] -= 15  
    return res 

estrategias = {
    "Ana": "Me la banco y no me desvio",
    "Beto": "Me desvio siempre",
    "Clara": "Me la banco y no me desvio"
}

print(torneo_de_gallina(estrategias))


def reordenar_cola_priorizando_vips( filaClientes : Cola[tuple[str,str]]) -> Cola[str]: 
   vips = []
   comun = []
   res = Cola()

   while not filaClientes.empty(): 
      nombre,tipo = filaClientes.get()
      if tipo == "vip": 
         vips.get(nombre)
      if tipo == "comun":
         comun.get(nombre)
   for nombre in vips + comun: 
      res.put(nombre)
    
   return res 


def quien_gano_el_tateti_facilito (tablero : list[list[str]]) -> int: 
    hay_x = False
    hay_o = False
    

    for i in range(len(tablero)-2): 
        for j in range(len(tablero[0])): 
            c1 = tablero[i][j]
            c2 = tablero[i+1][j]
            c3 = tablero[i+2][j]

            if c1 == c2 == c3: 
             if c1 == "X": 
                hay_x = True 
             if c1 == "O": 
                hay_o = True 
    
    if hay_x and hay_o: 
        return 3 
    elif hay_x: 
        return 1 
    elif hay_o: 
        return 2
    else:
        return 0 
            
tablero2 = [
    ["X", "O", " "],
    ["X", "O", " "],
    [" ", "O", " "]
]

print(quien_gano_el_tateti_facilito(tablero2))

"""problema orden_de_atencion ( in urgentes: cola⟨Z⟩, in postergables: cola⟨Z⟩) : cola⟨Z⟩ {
  requiere: {no hay elementos repetidos en urgentes}
  requiere: {no hay elementos repetidos en postergables}
  requiere: {la intersección entre postergables y urgentes es vacía}
  requiere: {|postergables| = |urgentes|}
  asegura: {no hay repetidos en res }
  asegura: {res es permutación de la concatenación de urgentes y postergables}
  asegura: {Si urgentes no es vacía, en tope de res hay un elemento de urgentes}
  asegura: {En res no hay dos seguidos de urgentes}
  asegura: {En res no hay dos seguidos de postergables}
  asegura: {Para todo c1 y c2 de tipo "urgente" pertenecientes a urgentes si c1 aparece antes que c2 en urgentes entonces c1 aparece antes que c2 en res}
  asegura: {Para todo c1 y c2 de tipo "postergable" pertenecientes a postergables si c1 aparece antes que c2 en postergables entonces c1 aparece antes que c2 en res}
"""
def orden_de_atencion (urgentes : Cola,  postergables : Cola) -> Cola[int]: #funcion que sirve para intercalar elementos en una cola
   res = Cola()

   while not urgentes.empty() and not postergables.empty():
      res.put(urgentes.get()) #primero urgentes
      res.put(postergables.get()) #luego postergables

      #luego deberia ir otro urgente 
    
   return res 

"""problema empleados_del_mes(horas:dicc⟨Z,seq⟨Z⟩⟩) : seq⟨Z⟩ {
  requiere: {No hay valores en horas que sean listas vacías}
  asegura: {Si ID pertence a res entonces ID pertence a las claves de horas}
  asegura: {Si ID pertenece a res, la suma de sus valores de horas es el máximo de la suma de elementos de horas de todos los otros IDs}
  asegura: {Para todo ID de claves de horas, si la suma de sus valores es el máximo de la suma de elementos de horas de los otros IDs, entonces ID pertences a res}
}"""

def empleados_del_mes (horas : dict[int,list[int]]) -> list[int]: 
   res = []
    
   mayor = 0

   for empleado in horas: 
      total = 0 
      for hora in horas[empleado]: #con esto nos metemos dentro de los valores de horas 
         total += hora
      if total > mayor: 
         mayor = total
   for empleado in horas:
      total = 0 
      for hora in horas[empleado]:
         total += hora
      if total == mayor:
         res.append(empleado)
   return res 

horas = {
    1: [8, 8, 8],     # 24
    2: [10, 10, 4],   # 24
    3: [7, 7, 7]      # 21
}

print(empleados_del_mes(horas)) 
      
      

"""Queremos saber qué porcentaje de ocupación de camas hay en el hospital. El hospital se representa por una matriz en donde las filas son los pisos, y las columnas son las camas. Los valores de la matriz son booleanos que indican si la cama está ocupada o no. Si el valor es verdadero (True) indica que la cama está ocupada. Se nos pide programar en Python una función que devuelve una secuencia de enteros, indicando la proporción de camas ocupadas en cada piso.

problema nivel_de_ocupacion(camas_por_piso:seq⟨seq⟨Bool⟩⟩) : seq⟨R⟩ {
  requiere: {Todos los pisos tienen la misma cantidad de camas.}
  requiere: {Hay por lo menos 1 piso en el hospital.}
  requiere: {Hay por lo menos una cama por piso.}
  asegura: {|res| = |camas|}
  asegura: {Para todo 0<= i < |res| se cumple que res[i] es igual a la cantidad de camas ocupadas del piso i dividido el total de camas del piso i)}
}""" 
def nivel_de_ocupacion (camas_por_piso : list[list[bool]]) -> list[float]: 
   res = []

   for piso in camas_por_piso: 
      ocupada = 0 
      cantidad_camas = 0 
      for camas in piso:  #debemos usar doble for ya que nos dieron una lista de listas y llegar al elemento interno (los bool)
         cantidad_camas += 1 
         if camas: 
            ocupada += 1 
      proporcion = ocupada / cantidad_camas 
      res.append(proporcion)
   return res 


def acomodar (s : list[str]) -> list[str]: #poner un elemento primero que el otro en una lista 
   res = []

   for elemento in s: 
      if elemento == "LLA": 
         res.append(elemento)
   for elemento1 in s:
         
      if elemento1 == "UP":
         res.append(elemento1)
   return res 


s = ["LLA", "UP", "LLA", "LLA", "UP"]
print(acomodar(s))


def pos_umbral (s : list[int], u : int) -> int: 
   i = 0 
   res = 0

   while i < len(s): 
      elemento = s[i]
      if elemento > u: 
         res = -1 
      else: 
         res = s[i]
      i += 1
   return res 

s = [1,-2,0,5,-7,3]
u = 5
print(pos_umbral(s,u))




def columnas_repetidas (mat : list[list[int]]) -> bool: 
   
   for i in range(len(mat)): 
      for j in range(len(mat[0])//2): 
         if mat[i][j] != mat[i][j+(len(mat[0])//2)]: 
            return False 
   return True 

m = [[1,2,1,2],[-5,6,-5,6],[0,1,0,1]]
print(columnas_repetidas(m))


def cuenta_posiciones_por_nacion (naciones : list[str], torneos : dict[int,list[str]]) -> dict[str,list[int]]: 
   res = {}

   for nacion in naciones: 
      res[nacion] = [0] * len(naciones)
   
   for año in torneos: 
      posicion = torneos[año]
      for i in range(len(posicion)): 
         nacion = posicion[i]
         res[nacion][i] += 1 
   return res 


def mejor_resultado_de_ana (examenes : Cola[bool]) -> list[int]: 
   res = []

   for examen in examenes: 
      cant_True = 0 
      cant_False = 0 

      for respuesta in examen: 
         if respuesta == True: 
            cant_True += 1 
         if respuesta == False:
            cant_False += 1 
         
      
      if cant_True < cant_False: 
         correcta = 2 * cant_True 
      else: 
         correcta = 2*cant_False 
      
      return correcta 
   

def ultima_aparicion (s: list[int], e : int) -> int:
   res = 0 

   for i in range (len(s)): 
      if s[i] == e: 
         res = i
   return res 


s = [1,4,2,3,5]
e = 4 
print(ultima_aparicion(s,e))

def elementos_exclusivos (s: list[int], t :list[int]) -> list[int]: 
   res = []

   for elemento in s:
      if elemento not in t and elemento not in res: #el not in res es para que no eesten repetidos
         res.append(elemento)
   for elemento1 in t:
      if elemento1 not in s and elemento not in res:
         res.append(elemento1)
   return res 

s = [1,12,3,5]
t = [1,45,32,5]
print(elementos_exclusivos(s,t))


def contar_traducciones (ing : dict[tuple[str,str]], ale : dict[tuple[str,str]]) -> int: 
   res = 0 

   for palabra in ing: 
      traduccion1 = ing[palabra]
      for palabra in ale:
         traduccion2 = ale[palabra]
         if traduccion1 == traduccion2: 
            res += 1
   return res  


aleman = {"Mano": "Hand", "Pie": "Fuss", "Dedo": "Finger", "Cara": "Gesicht"}
inglés = {"Pie": "Foot", "Dedo": "Finger", "Mano": "Hand"}
print(contar_traducciones(inglés, aleman))


def convertir_a_diccionario (lista : list[int]) -> dict[tuple[int,int]]: 
   res = {}
   n = 0

   for elemento in lista: 
      if elemento not in res:
         res[elemento] = 1 
      else:
         res[elemento] += 1
   return res  

lista = [-1,0,4,100,100,-1,-1]
print(convertir_a_diccionario(lista))

""" problema gestion_ventas (in ventas_empleado_producto:
 seq⟨(String x String x Z)) : dict⟨String, seq⟨(String x Z)⟩⟩
 {
 requiere: { Las primeras componentes de
 ventas_empleado_producto tienen longitud mayor estricto
 a cero}
 requiere: { Las segundas componentes de
 ventas_empleado_producto tienen longitud mayor estricto
 a cero}
 requiere: { Las terceras componentes de
 ventas_empleado_producto son mayores estricto que 1 }
 requiere: { No hay 2 tuplas en
 ventas_empleado_producto que tengan la primera y
 segunda componente iguales (mismo empleado y mismo
 producto) }
 asegura: {res tiene como claves solo los primeros
 elementos de las tuplas de ventas_empleado_producto (o
 sea, un empleado)}
 asegura: {El valor en res de un empleado es una lista de
 tuplas donde cada tupla contiene como primera
 componente el nombre del producto y como segunda
 componente la cantidad vendida por el empleado de ese
producto según ventas_empleado_producto}
 asegura: { Para toda clave (empleado) en res, en su
 valor (lista de tuplas) no hay 2 tuplas que tengan la misma
 primera componente (producto) }
 }"""

def gestion_ventas (ventas_empleado_producto : list[tuple[str,str,int]]) -> dict[str,list[tuple[str,int]]]: 
   res = {}

   for empleado, producto,cantidad in ventas_empleado_producto: 
      if empleado not in res: 
         res[empleado] = [] #si no hacemos esto  luego no podemos agregar elementos a la lista, la especificacion dice, a cada empleado le corresponde una lista de pares 

      for prod in res[empleado]:
        if producto == prod: 
         break 
      else: 
         res[empleado].append((producto,cantidad))
         
   return res 
ventas = [("Maria", "Banana", 12),("Jose","Manzana",31),("Matias","Banana",78)]
print(gestion_ventas(ventas))
         
"""problema cantidad_digitos_impares (in numeros: seq⟨Z⟩)
 : Z {
 requiere:{Todos los elementos de numeros son mayores
 iguales a 0}
 asegura: {res es la cantidad total de digitos impares que
 aparecen en cada uno de los elementos de numeros}
 }"""
def cantidad_digitos_impares(numeros : list[int]) -> int: 
   res = 0 

   for numero in numeros: 
      while numero != 0: 
         digito = numero % 10 
         if digito % 2 != 0: 
            res += 1 
         numero //= 10 #se usa para eliminar el ultimo digito 
   return res 

lista = [57,2383,812,246]
print(cantidad_digitos_impares(lista))

""" problema reordenar_cola_primero_numerosas(in
 carpetas: Cola⟨(String x Z)⟩, in umbral:Z): Cola⟨(String x
 Z)⟩{
 requiere: {no hay repetidos en las primeras
 componentes (Ids) de carpetas}
 requiere: {todos las segundas componentes (número de
 páginas) de carpetas son mayores estricto a cero}
 requiere: {umbral es mayor o igual a cero}
 asegura: {los elementos de res son exactamente los
 mismos que los elementos de carpetas}
 asegura: {|res| = |carpetas|}
 asegura: {no hay un elemento en res, cuyo número de
 páginas sea menor o igual que el umbral, que aparezca
 primero que otro elemento en res cuyo número de páginas
 sea mayor que el umbral)}
 asegura: {Para toda carpeta c1 y carpeta c2 cuyas
número de páginas son menores o iguales que el umbral y
 pertenecen a carpetas, si c1 aparece primero que c2 en
 carpetas entonces c1 aparece primero que c2 en res}
 asegura: {Para toda carpeta c1 y carpeta c2 cuyas
 número de páginas son mayores que el umbral y
 pertenecen a carpetas, si c1 aparece primero que c2 en
 carpetas entonces c1 aparece primero que c2 en res}
 }"""

def reordenar_cola_primero_numerosas (carpetas : Cola[str,int], umbral = int) -> Cola[str,int]: 
   res = Cola()
   res1 = Cola()
   res2 = Cola()

   while not carpetas.empty(): 
      carpeta = carpetas.get()
      if carpeta[1] > umbral: #si els egundo elemento de la cola carpetas es mayor al umbral
         res1.put(carpeta) #se agrega a una primer cola
      else:
         res2.put(carpeta) #si no se agrega a la segunda 
   
   while not res1.empty(): 
      res.put(res1.get())
   while not res2.empty(): 
      res.put(res2.get())
   return res          

c = Cola()
c.put(("A", 10))
c.put(("B", 5))
c.put(("C", 20))
c.put(("D", 3))

print(reordenar_cola_primero_numerosas(c,8))

"""Se desea verificar si una matriz es cuasi decreciente por
 columnas. Esto es que el máximo de cada columna sea
 mayor estricto que el máximo de la columna siguiente
 Para ello se pide desarrollar una función en Python que
 implemente esta idea respetando la siguiente
 especificación:
 matriz_cuasi_decreciente (in matriz: seq⟨seq⟨Z⟩⟩): Bool {
 requiere: {|matriz| > 0}
 requiere: {|matriz[0]| > 0}
 requiere: {todos los elementos de matriz tienen la misma
 longitud}
 asegura: {res es igual a True <=> para todo
 0<=i<|matriz[0]|-1, el máximo de la columna i de matriz > el
 máximo de la columna i + 1 de matriz }
 }"""

def matriz_cuasi_decreciente (matriz : list[list[int]]) -> bool: 

   for j in range(len(matriz[0])-1): #esto si o si debe estar dentro de las columnas
      maximo_actual = matriz[0][j]
      maximo_siguiente = matriz[0][j+1]

      for i in range(len(matriz)): 
         if matriz[i][j] > maximo_actual: 
            maximo_actual = matriz[i][j]
         if matriz[i][j+1] > maximo_siguiente:
            maximo_siguiente = matriz[i][j+1] 

      if maximo_actual < maximo_siguiente:
         return False
   return True 
        

lista = [[5,9,10],[6,2,1],[8,12,13]]
print(matriz_cuasi_decreciente(lista))

"""
problema ind_nesima_aparicion (in s: seq⟨Z⟩, in n: Z, in elem: Z) : Z {
 requiere: {n>0}
 asegura: {Si el elemento aparece menos de n veces en la secuencia, res= -1 }
 asegura: {Si el elemento aparece al menos n veces en la secuencia, s[res] = elem }
 asegura: {Si el elemento aparece al menos n veces en la secuencia, elem aparece n-1 
 veces en s entre las posiciones 0 y res-1 }
}"""

def ind_nesima_apariciom (s : list[int], n : int, elem : int) -> int: 
   res = 0 

   for i in range(len(s)):   
      if s[i] == elem: 
         res += 1 
         if res == n: #si el contador es  igual a n 
            return i  #me da el indice (ya que n reperesenta el indice)
   return -1

lista = [10,12,2,3,2,42]
n = 2
elem = 2
print(ind_nesima_apariciom(lista,n,elem))

"""
problema mezclar (in s1: seq⟨Z⟩, in s2: seq⟨Z⟩) : seq⟨Z⟩ {
requiere: {|s1| = |s2| }
asegura: {|res| = 2 * |s1|}
asegura: {res[2*i] = s1[i] y res[2*i+1] = s2[i], para i entre 0 y |s1|-1}"""

def mezclar (s1 : list[int], s2 : list[int]) -> list[int] : 
   res = []

   for i in range (len(s1)): 
      res.append(s1[i]) #posicion 2*i
      res.append(s2[i]) #posicion 2*i + 1
   return res 



s1 = [1,2,3,4]
s2 = [4,5,6,7]
print(mezclar(s1,s2))

"""
problema frecuencia_posiciones_por_caballo(in caballos: seq⟨String⟩, in carreras: 
dict⟨String,seq⟨String⟩⟩: dict⟨String,seq⟨Z⟩⟩ {
requiere: {caballos no tiene repetidos}
requiere: {Los valores del diccionario carreras son permutaciones de la lista 
caballos (es decir, tienen exactamente los mismos elementos que caballos, en 
cualquier orden posible)}
asegura: {res tiene como claves los elementos de caballos}
asegura: {El valor en res de un caballo es una lista que indica en la posición i 
cuántas veces salió ese caballo en la i-ésima posición.}"""

def frecuencia_posiciones_por_caballo (caballo : list[str], carreras : dict[str,list[str]]) -> dict[str,list[int]]: 
   res = {}

   for caballos in caballo: 
      res[caballo] = [0] * len(caballos) #inicializamos con una lista de 0 ya que queremos contar cuantas veces cada caballo aparece en cada posicion 
   
   for carrera in carreras(): 
      for i in range(len(carrera)):
         caballo = carrera[i] #nombre del caballo que quedo en posicion i 
         res[caballo][i] += 1  #sumamos 1 en esa posicion para el caballo 
   
   return res 

"""
problema matriz_capicua(in m:seq⟨seq⟨Z⟩⟩ ) : Bool {
requiere: {todos los elementos de m tienen igual longitud (los elementos de m son secuencias)}
asegura: {(res = true) <=> todos los elementos de m son capicúa}
}"""


def es_capicua (fila : list[int]) -> bool: 
   i = 0 
   j = len(fila)-1

   while i < j: #devuelve la cantidad de elementos hasta el ultimo indice 
     if fila[i] != fila[j]: 
        return False
     i +=1 
     j -= 1

   return True  

def matriz_capicua (m : list[list[int]]) -> bool:

   for fila in m: 
      if es_capicua(fila): 
         return True 
   return False




lista = [[1,3,4],[2,2,3],[2,2,3],[1,3,4]]
print(matriz_capicua(lista))

"""problema verificar_transacciones(in s: String) : Z{
# requiere: {|s|>0}
# requiere: {s sólo puede contener los caracteres "r", "x", "v" o "s"}
# asegura {res >= 0}
# asegura: {res = ($350 * #ap_antes_corte("r", s)) - ($56 * #ap_antes_corte("v", s))}
# }

# problema #ap_antes_corte(in c: char, in s: String) : z{
# requiere: {True}
# asegura: {res = cantidad de veces que aparece c desde el inicio hasta que: aparece una x, o que el 
# cálculo del saldo se hace negativo}
# }"""



def ap_antes_corte (c : str, s : str) -> int: 
   res = 0 
   i = 0
   saldo = 0 

   while i < len(s): 
      if s[i] == "r": 
         saldo += 350
      if s[i] == "v": 
         saldo -= 56
      if s[i] == c: 
         res += 1 
      if s[i] == "x" or saldo < 0:
         break
      i += 1
      
   return res 

def verificar_transacciones ( s  : str) -> int: 
   res = 0

   for i in range(len(s)): 
      if s[i] == "r": 
         res += 350
      elif s[i] == "v": 
         res -= 56
      elif s[i] == "s": 
         return res 
      elif s[i] == "x": 
         return 350*ap_antes_corte("r",s) - 56*ap_antes_corte("v",s)
      if res < 0: 
         return res 
   return res 
   
s = "rvvvvsvvsvvv"
print(verificar_transacciones(s))

"""El cambio climático es innegable. En las últimas décadas hemos registrado aumentos en las
# temperaturas medias del planeta, lo que está generando una gran cantidad de efecto en la climatología
# de todo el mundo: lluvias más caudalosas, temperaturas más extremas, etc. Las ciencias de la atmósfera
# vienen estudiando estos cambios hace muchos años, y la conclusión con amplio consenso científico es
# que este cambio es producto de la actividad humana: lo que se llama "cambio climático antropogénico".
# Un grupo de estudiantes de la Licenciatura en Ciencias de la Atmósfera (carrera que se estudia en esta
# Facultad) cuenta con una lista de tuplas de las temperaturas mínimas y máximas diarias de los últimos
# años en la Ciudad de Buenos Aires. Implementar la función valor_minimo() que dado este listado de
# tuplas devuelva el valor mínimo, entre las mínimas alcanzadas.

# problema valor_minimo(in s: seq<(R,R)>): R{
# requiere: {|s| > 0}
# requiere: {En cada tupla de s el primero valor es menor que el segundo}
# asegura: {res pertenece a alguna tupla de s, en la primera posición}
# asegura: {No existe ningún valor en las primeras posiciones de las tuplas de s que sea menor que res}
# }"""

def valor_minimo ( s : list[tuple[float,float]]) -> float : 
   res = s[0][0] #se toma el primer valor de la primera tupla 

   for i in range(len(s)): 
      if s[i][0] < res:  #accede al primer elemento de la tupla 
         res = s[i][0]
   return res 

#s[0][0] : 
#s[0] = accede a la primera tupla  
#s[0][0] = accede al primer elemento de la primeta tupla 

#s[i][0] = el i sirve para ir de indice a indice 


s = [(1.0, 5.2), (10.4, 15.1), (19.7, 28.9), (25.4, 35.6), (-3.1, 1.3)]
print(valor_minimo(s))

""" problema valores_extremos(in cotizaciones_diarias: dict⟨String,seq⟨(Z x R)⟩⟩): dict⟨String,(R x R)⟩ {
requiere: {Cada valor de cotizaciones_diarias es una secuencia de tuplas, donde los primeros
elementos de dichas tuplas son enteros del 1 al 31}
requiere: {Cada valor de cotizaciones_diarias es una secuencia de tuplas, de longitud mayor estricto
que 0}
asegura: {res tiene como claves exactamente las mismas claves que cotizaciones_diarias}
asegura: {Cada valor de res es una tupla de (mínimo, máximo), donde mínimo y máximo son los valores
extremos alcanzados por las cotizaciones de cada empresa}
}"""


def valores_extremos(cotizaciones_diarias : dict[str,tuple[int,float]]) -> dict[str,tuple[float,float]] : 
   res = {}

   for empresa in cotizaciones_diarias: 
      cotizacion = cotizaciones_diarias[empresa] #acceedemos al valor de esa empresa 

      minimo = cotizacion[0][1] #accede a la primera tupla con [0] y al valor com [1]
      maximo = cotizacion[0][1]

      for i in range(len(cotizacion)): 
       valor = cotizacion[i][1]   #recorre cada valor 
       if valor < minimo: 
         minimo = valor
       elif valor > maximo: 
         maximo = valor
      
      res[empresa] = (minimo,maximo)
   
   return res 
      
cotizaciones_diarias = {"YPF" : [(1,10),(15, 3), (31,100)], "ALUA" : [(1,0), (20, 50), (31,30)]}
print(valores_extremos(cotizaciones_diarias))

"""problema es_sudoku_valido(in m:seq⟨seq⟨Z⟩⟩ ) : Bool {
requiere: {todos los elementos de m tienen longitud 9}
requiere: {|m| = 9}
requiere: {todos los elementos en todas las secuencias de m son números del 0 al 9}
asegura: {(res = true) <=> en cada fila de m no se repiten números del 1 al 9}
asegura: {(res = true) <=> en cada columna de m no se repiten números del 1 al 9}
}"""



   



"""Necesitamos detectar la aparición de posibles epidemias. Para esto contamos con un lista de enfermedades infecciosas
 y los registros de atención por guardia dados por una lista expedientes. Cada expediente es una tupla con ID paciente
y enfermedad que motivó la atención. Debemos devolver un diccionario cuya clave son las enfermedades infecciosas y su valor 
es la proporción de pacientes que se atendieron por esa enfermedad. En este diccionario deben aparecer solo aquellas enfermedades
infecciosas cuya proporción supere cierto umbral.

problema alarma_epidemiologica (registros: seq⟨ZxString⟩, infecciosas: seq⟨String⟩, umbral: R) : dict⟨String,R⟩ {
  requiere: {0 < umbral < 1}
  asegura: {claves de res pertenecen a infecciosas}
  asegura: {Para cada enfermedad perteneciente a infecciosas, si el porcentaje de pacientes que se atendieron por esa enfermedad 
  sobre el total de registros es mayor o igual al umbral, entonces res[enfermedad] = porcentaje}
  asegura: {Para cada enfermedad perteneciente a infecciosas, si el porcentaje de e pacientes que se atendieron por esa enfermedad 
  sobre el total de registros es menor que el umbral, entonces enfermedad no aparece en res}
}"""


"""i = 0 
 res = []
 while i < len(s): 
  if s[i] not in res: -> escencial para eliminar repetidos  
   res.append(s[i])
  i += 1 

   for i in range (len(s1)): -> para mezclar listas  
      res.append(s1[i]) #posicion 2*i
      res.append(s2[i])
  

  """


"""problema promedio_de_aprobados(in notas: dict⟨str, seq⟨Z⟩⟩) → dict⟨str, ⟨Z × R⟩⟩ {
  requiere: {notas tiene al menos un estudiante}
  requiere: {Todas las listas de notas tienen al menos una nota}
  requiere: {Todas las notas están entre 0 y 10 inclusive}
  asegura: {res tiene las mismas claves que notas}
  asegura: {res[nombre][0] es la cantidad de notas mayores o iguales a 4 de ese estudiante}
  asegura: {res[nombre][1] es el promedio de esas notas, o 0.0 si no tiene ninguna ≥ 4}
}"""

def promedio_de_aprobados (notas : dict[str,list[int]]) -> dict[str,tuple[int,float]]: 

   res = {}

   for estudiante in notas:
      nota = notas[estudiante] #accedemos a las claves ya que debemos trabajar con elementos de las claves del diccionario 

      cantidad_aprobados = 0 
      total = 0 

      for n in nota: 
       if n >= 4: 
         cantidad_aprobados += 1
         total += 1 
   
      if cantidad_aprobados > 0: 
        promedio = cantidad_aprobados/total
      else: 
        promedio = 0.0
   
      res[estudiante] = (cantidad_aprobados,promedio)
   return res 

registro = {
    "ana": [4,10,3],
    "juan": [8,10,8],
    "luis": [3,2,1]
}

print(promedio_de_aprobados(registro))


"""problema materia_con_mas_ausentes(in ausentes: seq⟨seq⟨Z⟩⟩) → Z {
  requiere: {ausentes tiene al menos una materia}
  requiere: {Cada sublista tiene al menos un elemento}
  requiere: {Todos los números en ausentes son ≥ 0}
  asegura: {res es el índice de la materia con mayor suma de ausencias}
  asegura: {Si hay más de una con la misma suma máxima, res es la de menor índice}
}"""

def materia_con_mas_ausentes (ausentes : list[list[int]]) -> int: 
   max_suma = 0 
   indice = 0 

   for i in range(len(ausentes)): 
      suma = 0 
      for materia in ausentes[i]: 
         suma += materia 
         if suma > max_suma: #si las sumas de las materias es mayor que la maxima suma
            max_suma = suma  #se actualiza 
            indice = i  #y da el indice de esa maxima suma 
   return indice 


ausentes = [
    [1, 2, 3],  # total 6
    [4, 4],     # total 8
    [3, 2, 1]   # total 6
]

print(materia_con_mas_ausentes(ausentes))


"""problema mayor_diferencia_temperaturas(in temps: seq⟨Z⟩) → ⟨Z × Z⟩ {
  requiere: {temps tiene al menos un elemento}
  asegura: {res[0] es el índice de la temperatura mínima en temps}
  asegura: {res[1] es el índice de la temperatura máxima en temps}"""

def mayor_diferencia_temperaturas (temps : list[int]) -> tuple[int,int]: 

   maxima = temps[0]
   minima = temps[0]
   indice_min = 0 
   indice_max = 0 

   for i in range(len(temps)): 
      elemento = temps[i]

      if elemento < minima: 
         minima = elemento
         indice_min = i 
      if elemento > maxima: 
         maxima = elemento
         indice_max = i 
      res = ((indice_min,indice_max))
   return res  

temps = [15, 22, 18, 10, 30, 25]
print(mayor_diferencia_temperaturas(temps))


"""problema sin_aprobados(in notas: dict⟨str, seq⟨Z⟩⟩) → seq⟨str⟩ {
  requiere: {notas tiene al menos un estudiante}
  requiere: {Cada lista de notas tiene al menos una nota}
  requiere: {Todas las notas están entre 0 y 10 inclusive}
  asegura: {res contiene los nombres de los estudiantes que no tienen ninguna nota ≥ 4}
  asegura: {El orden de los nombres en res es el mismo en que aparecen en notas}
}"""

def sin_aprobados (notas : dict[str,list[int]]) -> list[str]: 
   res = []

   for estudiantes in notas: 
      nota = notas[estudiantes]
      aprobo = False

      for n in nota: 
         if n >= 4: 
            aprobo = True
      if not aprobo: 
         res.append(estudiantes)
   return res 

notas = {
    "Ana": [3, 2, 1],
    "Luis": [4, 5],
    "Caro": [0, 2],
    "Pedro": [6, 7],
    "Marta": [1, 1, 1]
}
print(sin_aprobados(notas))

"""problema filas_desordenadas(in m: seq⟨seq⟨Z⟩⟩) : seq⟨Z⟩ {
  requiere: {m tiene al menos una fila}
  requiere: {Todas las filas de m tienen igual longitud}
  asegura: {res contiene los índices de todas las filas que no están ordenadas crecientemente}
}"""

def filas_desordenadas (m : list[list[int]]) -> list[int]: 
   res = []

   for i in range(len(m)): 
      fila = m[i]
      desordenada = False 

      for j in range(len(m)-1):  #recorremos los elementos de la fila, usamos len(m)-1 para no salirnos de la lista cuando hacemos fila[j+1]
         if fila[j] > fila[j+1]: #si un numero es mayor que el siguiente, sabemos que la fila esta desordenada
            desordenada = True 
      if desordenada: 
         res.append(i) #si esta desordenada agregamos el indice a res 
   return res 
            
"""problema estudiante_con_todas_aprobadas(in notas: dict⟨String, seq⟨Z⟩⟩): String {
  requiere: {notas no vacío}
  requiere: {Cada lista tiene al menos una nota}
  asegura: {res es el nombre del primer estudiante que aprobó todos los exámenes (nota >= 4)}
  asegura: {Si ningún estudiante aprobó todo, res es "" (cadena vacía)}
}"""

def estudiante_con_todas_aprobadas (notas : dict[str,list[int]]) -> str: 
   for estudiante in notas: 
      nota = notas[estudiante]
      aprobo = False

      for n in nota:
         if n >= 4: 
            aprobo = True 
         if aprobo: 
            return estudiante 
   return "" 

notas = {
    "Ana": [4, 7, 10],
    "Luis": [2, 8, 9],
    "Juan": [5, 5, 6]
}
print(estudiante_con_todas_aprobadas(notas))

"""problema promedio_por_franja(in temperaturas: seq⟨seq⟨Z⟩⟩) : seq⟨float⟩ {
  requiere: {temperaturas tiene al menos una fila}
  requiere: {todas las filas tienen la misma longitud}
  asegura: {res tiene longitud igual al número de columnas de temperaturas}
  asegura: {res[i] es el promedio de la i-ésima columna de temperaturas}
}"""

def promedio_por_franja (temperaturas : list[list[int]]) -> list[float]: 
   res = []

   columna = len(temperaturas[0])

   for i in range(columna):
      suma = 0 
      for j in range(len(temperaturas)): 
         suma += temperaturas[i][j] #sumo el valor de la columna en cada fila 
      promedio = suma / len(temperaturas)
      res.append(promedio)
   return res 


"""problema contar_visitas_animales(in cola_visitas: cola<str × str>) → dict<str, Z> {
    requiere: {cola_visitas no está vacía}
    asegura: {res[tipo] es la cantidad de veces que se atendió un animal de tipo tipo}
}"""

def contar_visitas_animales (cola_visitas : Cola[str]) -> dict[str,int]: 
   res = {}


   while not cola_visitas.empty(): 
      animal = cola_visitas.get()
      if animal in res: #para agregar elementos al diccionario 
         res[animal] += 1 
      else: 
         res[animal] = 1 
   
   return res 

cola = Cola()
cola.put("perro")
cola.put("gato")
cola.put("perro")
cola.put("loro")

print(contar_visitas_animales(cola))


"""problema resumen_asistencias(in asistencia: list[list[int]]) → dict<int, int> {
    requiere: {|asistencia| > 0}
    requiere: {Todas las filas tienen la misma longitud y contienen solo 0 o 1}
    asegura: {res[i] = cantidad de 1s en la fila i}
}"""

def resumen_asistencias (asistencia : list[list[int]]) -> dict[int,int]:
   res = {}

   for i in range(len(asistencia)):
      contador = 0
      for j in range(len(asistencia[0])): 
         if asistencia[i][j] == 1: 
            contador += 1 
         res[i] = contador
   return res 
   
lista = [[1,2,3],[1,1,5],[1,1,2]]
print(resumen_asistencias(lista))

"""problema suma_matriz_dispersa(in matriz: list<int × int × int>) → int {
    requiere: {matriz puede estar vacía}
    asegura: {res = suma de todos los valores en la lista de tuplas}
}"""

def suma_matriz_dispersa (matriz : list[tuple[int,int,int]]) -> int: 
   res = 0 

   for _,_,valor in matriz: 
      res += valor 
   return res

"""problema contador_hasta_corte(in c: char, in s: String) : Z {
  requiere: {True}
  asegura: {res = cantidad de apariciones de c desde el inicio hasta corte}
}"""


def contador_hasta_corte (c: str, s : str) -> int: 
   res = 0
   contador = 0 

   for i in range(len(s)):
      if s[i] == '.': 
         break
      if s[i] == c: 
         contador += 1 
      return res 
   