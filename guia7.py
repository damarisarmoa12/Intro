from random import randint 

def pertenece (s : list[int], e : int) -> bool: 
 i = 0
 while i < len(s):
  if s[i] == e: 
   return True 
  i += 1 
 return False 


s = [1,2,3]
print(pertenece(s,2))


def divide_a_todos (s : list[int], e : int) -> bool: 
 i = 0 
 while i < len(s):
  if s[i] % e == 0:
   return True 
  return False 
 
s = [4,6,8]
print(divide_a_todos(s,2))


def suma_total (s:list[int]) -> int: 
 i = 0 
 total = 0
 while i < len(s):
  total += s[i]
  i += 1
 return total

s = [1,2,3,4]
print(suma_total(s))


def maximo (s:list[int]) -> int:
 i = 1
 maximo_actual = s[0] #empezamos suponiendo que el primer numero es el mayor 
 while i < len(s):
   if s[i] > maximo_actual:
    maximo_actual = s[i] #lo actualizamos si encontramos uno mas grande
   i += 1 
 return maximo_actual 
 
s = [1,2,3,4,9]
print(maximo(s))


def minimo (s:list[int]) -> int: 
 i = 1 
 minimo_actual = s[0]
 while i < len(s):
  if s[i] < minimo_actual:
   minimo_actual = s[i]
  i += 1
 return minimo_actual

s = [4,2,8,6]
print(minimo(s))

def ordenados (s:list[int])-> bool:
 i = 0 
 while i < len(s)-1:
  if s[i] > s[i+1]:
   return False 
  i += 1 
 return True 

s = [1,2,3,4]
t = [4,2,13]
print(ordenados(t))
 
def pos_maximo (s:list[int]) -> int: 
 i = 1
 posicion = 0
 if len(s) == 0: 
  return -1
 while i < len(s):
  if s[i] > s[posicion]:
   posicion = i 
  i += 1 
 return posicion 
  
s = [4,1,9,3,9]
print(pos_maximo(s))

def pos_minimo (s:list[int]) -> int: 
 i = 1
 posicion = 0 
 if len(s) == 0: 
  return -1
 while i < len(s): 
  if s[i] < s[posicion]:
   posicion = i  
  i += 1 
 return posicion



def long_mayorASiete (s : list[list[str]]) ->  bool: 
 i = 0 
 while i < len(s):
  if len(s[i]) > 7: 
   return True 
  i += 1 
 return False 


s = ["termo", "gato", "tener", "jirafas"]
print(long_mayorASiete(s))


def es_palindromo (s : list[str]) -> bool:
 i = len(s) - 1 #indice del ultimo caracter de la palabra 
 reverso = ""
 while i >= 0: #bucle que recorre la cadena de atras hacia adelante 
  reverso += s[i] #esto agrega el caracter actual (s[i]) al final de la cadena 
  i -= 1 #disminuye para seguir retrocediendo la palabra 
 return s == reverso   #compara la palabra original con su reverso 




def iguales_consecutivos (s:list[str]) -> bool: 
 i = 0 
 while i < len(s)-3: #solo hasta el anteultimo indice 
  if s[i] == s[i+1] == s[i+2]:
   return True 
  i += 1
 return False 

s = [1,1,1,2,3]
print(iguales_consecutivos(s)) 

def vocales_distintias (s : list[str]) -> bool: 
 i = 0 
 while i < len(s) - 3:
  if s[i] == "a" and s[i+1] == "e" and s[i+2] == "i":
   return True 
  i += 1 
 return False 




print(vocales_distintias(["u", "a", "e", "i", "o"]))


def pos_secuencia_ordenada_mas_larga (s:list[int]) -> int: 
 i = 1
 max_longitud = 1 
 max_inicio = 0 

 actual_longitud = 1 
 actual_inicio = 0 

 while i < len(s): 
  if s[i] >= s[i-1]:
   actual_longitud += 1 
  else: 
   if actual_longitud > max_longitud: 
    max_longitud = actual_longitud
    max_inicio = actual_inicio
   actual_inicio = i
   actual_longitud = 1
  i += 1
 
 if actual_longitud > max_longitud: 
  max_inicio = actual_inicio 
 return max_inicio 



print(pos_secuencia_ordenada_mas_larga([1, 3, 5, 2, 4, 6, 8])) 


def cantidad_digitos_impares ( s : list[int]) -> int: 
    total = 0
    for numero in s:
        while numero > 0:
            digito = numero % 10
            if digito % 2 == 1: #verifica si el digito es mpar 
                total += 1
            numero //= 10 #elimina el ultirmo digito 
    return total


print(cantidad_digitos_impares([57, 2383, 812, 246]))

#inout se modifica la variable inicial 
def ceros_en_posiciones_pares(s: list[int]) -> None:
    i = 0
    while i < len(s):
        if i % 2 == 0:
            s[i] = 0
        i += 1

lista = [10, 20, 30, 40, 50]
ceros_en_posiciones_pares(lista)
print(lista)

def sin_vocales ( s : list[str]) -> list[str]: 
 i = 0 
 res = []
 while i < len(s): 
  if s[i] not in ["a","e","i","o","u"]:
   res.append(s[i]) 
  i += 1
 return res 


print(sin_vocales(["h", "o", "l", "a"])) 


def reemplaza_vocales (s : list[str]) -> list[str]: 
 i = 0 
 res = []
 while i < len(s): 
  if s[i] in ["a","e","i","o","u"]:
   res.append(" ")
  else: 
   res.append(s[i])
 i += 1 
 return res 
 
s = ['h', 'o', 'l', 'a']
print(reemplaza_vocales(s))

def da_vuelta_str(s: list[str]) -> list[str]:
    i = len(s) - 1
    res = []
    while i >= 0:
        res.append(s[i])
    i -= 1
    return res


s = ["h","o","l","a"]
print(da_vuelta_str(s))



def eliminar_repetidos ( s : list[str]) -> list[str]:
 i = 0 
 res = []
 while i < len(s): 
  if s[i] not in res: 
   res.append(s[i])
  i += 1 
 return res 

s = ["h","h","o","l"]
print(eliminar_repetidos(s))


def resultadoMateria (notas : list[int]) -> int: 
    i = 0 
    total = 0 
    hayDesaprobados = False 
    promedio = total / len(notas)

    while i < len(notas):
        if notas[i] < 4: 
            hayDesaprobados = True 
        total += notas[i]
        i += 1 

    if hayDesaprobados or promedio < 4:
        return 3
    elif promedio >= 7:
        return 1
    else:
        return 2
    

print(resultadoMateria([5, 6, 4]))


#para hablar de todos los elementos de una lista ponemos notas[i]


def saldoActual (movimientos : list[tuple[str,int]]) -> int: 
    i = 0 
    contador = 0 
    while i < len(movimientos):
        tipo,monto = movimientos[i]
        if tipo == "I": 
            contador += monto
        elif tipo == "R":
            contador -= monto
        i += 1      
    return contador 

s = [("I",2000), ("R", 20),("R", 1000),("I", 300)]
print(saldoActual(s))


#[(‘‘I’’,2000), (‘‘R’’, 20),(‘‘R’’, 1000),(‘‘I’’, 300)] = 1280



def pertenece1 (s : list[list[int]], e : int) -> list[bool]: 
    res = [] 
    i = 0 
    while i < len(s): 
        res.append(pertenece(i,e)) 
        i += 1
    return res 

def es_matriz (s : list[list[int]]) -> bool : 
  if len(s) == 0: 
    return False 
  if len(s[0]) == 0:
    return False 
  for fila in s: 
    if len(fila) != len(s[0]): #si 0 ≤ i < |s| → |s[i]| = |s[0]|
      return False 
  return True  


def filas_ordenadas (m : list[list[int]]) -> list[bool]: 
  res = []
  for i in range(m): 
    res.append(ordenados(i))
  return res 

def columna (m : list[list[int]], c : int) -> list[int]: 
  res = []
  for i in range(len(m[0])): 
    res.append(m[i][c])
  return res 

def columnas_ordenadas ( m : list[list[int]]) -> list[bool] : 
  res = []
  for i in range(len(m[0])): 
    res.append(ordenados(columna(m,i)))
  return res 

def transponer (m:list[list[int]]) -> list[list[int]]: 
  res = []
  for i in range (len[m(0)]): 
    res.append(columna(m,i))
  return res 

def tres_iguales (a : str, b : str, c : str) -> bool: 
    return a == b == c and a!= ""

def quien_gana_ta_te_ti (m : list[list[str]]) -> int: 
    for fila in m:
        if tres_iguales (fila[0],fila[1],fila[2]): #se utiliza for fila in m porque cada elemento de m es una fila
            if fila[0] == "X":
                return 1
            else:
                return 0
    for i in range(3):  #se utiliza for i in range porque las columnas no estan explicitas en la estructura, estan repartidas en cada fila 
        if tres_iguales(m[0][i], m[1][i],m[2][i]): 
            if m[0][i] == "X":
                return 1
            else:
                0
    if tres_iguales (m[0][0],m[1][1],m[2][2]): #revisar diagonales 
        if m[0][0] == "X":
            return 1
        else:
            return 0
    if tres_iguales (m[0][2],m[1][1],m[2][0]):
        if m[0][2] == "X":
            return 1
        else:
            return 0
    return 2  

def lista_estudiantes () -> list[str]: 
    res = []
    while True: 
        n = input("Insertar nombres de estudiantes (al terminar insertar listo): ")
        if n == "listo" or n == "":
            break 
        res.append(n)
    return res 
        
lista = lista_estudiantes()        
print("Estudiantes", lista)

def monedero_electronico () -> list[tuple[str,int]]: 
    historial = []
    saldo = 0
    while True: 
        operacion = input("Ingrese operacion ( C = Cargar, D = Descontar, X = Salir): ")

        if operacion == "X" or operacion == "x": 
            break
        if operacion == "C" or operacion == "c": 
            monto = int(input("Ingresa el monto a cargar: "))
            if monto > 0: 
                historial.append(("C",monto))
                saldo += monto
            else:
                print("Monto invalido")
        elif operacion == "D" or operacion == "d":
            monto = int(input("Ingresa un monto a descontar: "))
            if 0 < monto <= saldo:  
                historial.append(("D",monto))
                saldo -= monto 
            else: 
                print("Monto invalido o saldo insuficiente") 
        else: 
            print("Operacion no valida") 



def siete_y_medio () -> list[str]: 
    historial = []
    suma = 0 

    while True: 
        numero_random = randint(1,12)
        while numero_random == 8 or numero_random == 9: 
            numero_random = randint (1,12)

        historial.append(numero_random)

        if numero_random in (10,11,12): 
            suma += 0.50
        else: 
            suma += numero_random

        print(f"Has sacado la carta {numero_random}") 
        print(f"Puntaje total: {suma}")

        if suma >= 7.5:
            print("Has  perdido")
            break 

        pregunta = input("¿Queres otra carta? Si/No ")

        if pregunta != "Si":
         break 

      
    print(f"Historial de cartas : {historial}")

    return historial 

print(siete_y_medio())



def contraseña_fuerte (contraseña : str) -> str: 

    tiene_minuscula = False 
    tiene_mayuscula = False 
    tiene_digito = False 
 
    for c in contraseña:  #es una forma de recorrer caracter por caracter de un string, como debemos analizar cada caracter debemos usarlo 
        if "a" <= c <= "z": 
            tiene_minuscula = True 
        elif "A" <= c <= "Z": 
            tiene_mayuscula = True 
        elif 0 <= c <= 9: 
            tiene_digito = True 
        
    if len(contraseña) < 5: 
        return "Roja"
    elif len(contraseña) > 8 and tiene_minuscula and tiene_mayuscula and tiene_digito: 
        return "Verde"
    else: 
        return "Amarilla "