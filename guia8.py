from queue import LifoQueue as Pila 
from queue import Queue as Cola 
import random

def generar_nros_al_azar (cantidad: int, desde: int, hasta: int) -> Pila[int]: 
    pila :  Pila[int] = Pila()


    for i in range(cantidad): 
        numero_random = random.randint(desde,hasta)
        pila.put(numero_random)
    return pila


p = generar_nros_al_azar(5, 10, 20)
while not p.empty():
    print(p.get())


def cantidad_elementos (p : Pila) -> int: 
    lista = Pila()

    contador = 0 

    while not p.empty(): #mientras p no este vacio
        elem = p.get() #tomamos un elemento de p
        lista.put(elem) #lo metemos a la pila auxiliar
        contador += 1 #contamos 


    while  lista.empty(): #mientras la lista auxiliar no este vacia
        p.put(lista.get()) #tomamos un elemento de lista y lo metemos a la pila original
        
    return contador 

p.put(1)
p.put(2)
print(cantidad_elementos(p))

def buscar_el_maximo (p : Pila ) -> int: 
    lista = Pila()

    maximo = p.get()

    while not p.empty(): 
        elem = p.get()
        if elem > maximo:
         maximo = elem
         lista.put(maximo)

    while not lista.empty(): 
        p.put(lista.get())
    
    return maximo

p.put(4)
p.put(7)
print(buscar_el_maximo(p)) 


def buscar_nota_maxima (p : Pila) -> list[str,int]:
     res = Pila()
     maximo = p.get()

     while not p.empty(): 
         actual = p.get()
         if actual[1] > maximo[1]: 
             actual = maximo 
         res.put(actual)
    
     while not res.empty():
         p.put(res.get())

     return maximo 
    

p.put(["Maria",5])
p.put(["Jose",8])
print(buscar_nota_maxima(p))

def esta_bien_balanceada (s : list[str]) -> bool : 
    pila = Pila

    for c in s: 
        if c == '(': 
            pila.put('(')
        elif c == ')': 
            if pila.empty(): #si la pila esta vacia en este punto, no cumple 
                return False 
            pila.get()  
    return pila.empty()


def intercalar (p1 : Pila, p2 : Pila) -> Pila: 
    res1 = Pila()
    res2 = Pila()
    respuesta = Pila()

    while not p1.empty(): #invertir ambas filas 
        res1.put(p1.get())
    while not p2.empty(): 
        res2.put(p2.get())
    
    while not res1.empty() and not res2.empty(): #intercalar respetando el orden
        respuesta.put(res1.get()) #primero un elemento de p1
        respuesta.put(res2.get()) #luego uno de p2 

    return respuesta


#Colas 

def generar_nros_al_azar_1 (cantidad : int, desde : int, hasta : int) ->  Cola : 
    res = Cola()

    for i in range(cantidad):
        elem = random.randint(desde,hasta)
        res.put(elem)
    return res 

cola = generar_nros_al_azar_1(5, 10, 20)

while not cola.empty():
    print(cola.get())



def cantidad_elementos_1 (c : Cola) -> int: 
    res = Cola()
    contador = 0 

    while not c.empty(): 
        elem = c.get()
        res.put(elem)
        contador += 1 
    
    while not res.empty(): 
        c.put(res.get())
    return contador 


c = Cola()
c.put(10)
c.put(20)
c.put(30)
print(cantidad_elementos_1(c))


def buscar_el_maximo (c : Cola) -> int: 
    res = Cola()
    maximo = c.get()

    while not c.empty(): 
        elem = c.get()
        if elem > maximo: 
            maximo = elem
        res.put(elem)
    
    while not res.empty(): 
        c.put(res.get())

    return maximo


c = Cola()
c.put(7)
c.put(12)
c.put(2)

print(buscar_el_maximo(c))


def buscar_nota_minima(c : Cola) -> list[str,int]: 
    res = Cola()
    minima = c.get()

    while not c.empty(): 
        elem = c.get()
        if elem[1] < minima[1]:
             minima = elem
        res.put(elem)

    while not res.empty(): 
        c.put(res.get())

    return minima  

c = Cola()
c.put(["Maria", 12]) 
c.put(["Jose",4])
c.put(["Uriel",10])

print(buscar_nota_minima(c))


def intercalar (c1 : Cola, c2 : Cola) -> Cola: 
    res1 = Cola()
    res2 = Cola() 

    res = Cola()

    while not c1.empty(): 
        res1.put(c1.get())
    while not c2.empty(): 
        res2.put(c2.get())

    while not res1.empty() and not res2.empty():
        res.put(res1.get())
        res.put(res2.get())

    while not res1.empty(): 
        res.put(res1.get())
    while not res2.empty(): 
        res.put(res2.get())

    return res

c1 = Cola()
c2 = Cola()

c1.put(1)
c1.put(7)
c1.put(8)

c2.put(6)
c2.put(12)
c2.put(2)
    
resultado = (intercalar(c1,c2))

while not resultado.empty():
    print(resultado.get(), end=" ")




def armar_secuencia_de_bingo() -> Cola: 
    res = Cola()
    numero = []

    while len(numero) < 100:
        elem = random.randint(0, 99)
        if elem not in numero:
            numero.append(elem)
            res.put(elem)
    
    return res  # Este return debe estar FUERA del while

def jugar_carton_de_bingo(carton: list[int], bolillero: Cola) -> int: 
    jugadas = 0 
    encontrados = 0 
    marcados = []

    while encontrados < 12: 
        numero = bolillero.get()
        jugadas += 1 
        if numero in carton and numero not in marcados:  # Este if debe estar dentro del while
            marcados.append(numero)
            encontrados += 1 

    return jugadas

carton = [3, 15, 27, 34, 42, 50, 61, 68, 73, 81, 90, 97]
bolillero = armar_secuencia_de_bingo()

print("Jugadas necesarias para completar el cartón:", jugar_carton_de_bingo(carton, bolillero))


def pacientes_urgentes(c : Cola[(int,str,str)]) -> int: 
    cola = Cola()
    urgentes = 0 
    

    while not c.empty():
        cliente = c.get()
        if cliente[0] < 4: 
            urgentes += 1 
        cola.put(cliente)

    while not cola.empty():
        c.put(cola.get())
    
    return urgentes 
    

def atencion_a_clientes(c : Cola[tuple[str,int,bool,bool]]) -> Cola[tuple[str,int,bool,bool]]: 
    cola = Cola()
    tipo_cuenta = Cola()
    tiene_prioridad = Cola()
    resto = Cola()


    while not c.empty():
        cliente = c.get()
        nombre, dni,tipo_de_cuenta , prioridad= cliente
        cola.put(cliente)

    if prioridad: 
        tiene_prioridad.put(cliente)
    elif tipo_de_cuenta:
        tipo_cuenta.put(cliente)
    else: 
        resto.put(cliente)

    while not cola.empty(): 
        c.put(cola.get())
    
    return 


def calcular_promedio_por_estudiante( notas : list[tuple[str,float]]) -> dict[str,float]: 
    sumas = {}
    cantidades = {}

    for nombre, nota in notas: 
        if nombre in sumas: 
            sumas[nombre] += nota
            cantidades[nombre] += 1
        else: 
            sumas[nombre] = nota
            cantidades[nombre] = 1
    
    res = {}
    for nombre in sumas:
        res[nombre] = sumas[nombre] / cantidades[nombre]
    
    return res 

notas = {
    ("Maria",10.0),
    ("Federico",4.0),
    ("Maria",6.0)

}

print(calcular_promedio_por_estudiante(notas))


def historiales (usuario : str, pagina : str) -> None: 
    if usuario not in historiales: 
        historiales[usuario] = []
    
    historiales[usuario].append(pagina)


def visitar_sitio (historiales : dict[str], usuario : str, sitio : str) -> None: 

    if usuario not in historiales: 
        historiales[usuario] = [sitio]
    else: 
        historiales[usuario].append(sitio)


def navegar_atras (historiales : dict[str], usuario : str) -> str:
    sitio = historiales[usuario].pop
    return sitio 

historiales = {}
visitar_sitio(historiales, "Usuario1", "google.com")
visitar_sitio(historiales, "Usuario1", "facebook.com")
navegar_atras(historiales, "Usuario1")
visitar_sitio(historiales, "Usuario2", "youtube.com")

print(historiales)


def agregar_producto (inventario : dict[str,dict[str,float]], nombre : str , precio : float, cantidad : int) -> None : 

    nuevo_inventario = {}
    nuevo_inventario["precio"] = precio 
    nuevo_inventario["cantidad"] = cantidad 

    inventario[nombre] = nuevo_inventario #diccionario[clave] = valor

def actualizar_stock (inventario : dict[str,dict[str,float]], nombre : str, cantidad : float) -> None : 

    producto = inventario[nombre] #obetenemos el producto en inventario 

    producto["cantidad"] = cantidad 
    inventario[nombre] = producto 

inventario = {
    "manzana": {"precio": 1.0, "cantidad": 50},
    "banana" : {"precio": 0.5, "cantidad": 30}
}

(actualizar_stock(inventario, "manzana",1.0))
(actualizar_stock(inventario, "banana",0.5))
print(inventario)


def actualizar_precio (inventario : dict[str,dict[str,float]], nombre : str, precio : float) -> None: 
    producto = inventario[nombre]

    producto["precio"] = precio 
    inventario[nombre] = producto 


inventario = {
    "manzana": {"precio": 1.0, "cantidad": 50},
    "banana" : {"precio": 0.5, "cantidad": 30}
}

(actualizar_precio(inventario, "manzana",1.0))
(actualizar_precio(inventario, "banana",0.5))
print(inventario)

def calcular_valor_inventario (inventario : dict[str,dict[str,float]]) -> float: 
    res = 0.0
    for producto in inventario:
        precio = inventario[producto]["precio"] #inventario[producto]["precio"] = 1.0
        cantidad = inventario[producto]["cantidad"] #inventario[producto]["cantidad"] = 50
        res += precio*cantidad #1.0 * 50 = 50.0
    return res 
         
inventario = {
    "manzana" : {"precio": 1.0, "cantidad" : 50},
    "banana" : {"precio" : 0.5, "cantidad" : 30}
}

valor = calcular_valor_inventario(inventario)
print(valor)

