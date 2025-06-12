import math

def imprimir_hola_mundo() -> None :
    print("Hola Mundo")

imprimir_hola_mundo()

def raizDe2() -> int:
 return round(math.sqrt(2),4)

def factorial_de_dos() -> int: 
   res = math.factorial(2)
   return res 

print(factorial_de_dos())

def perimetro() -> float:
   res = 2*math.pi

print(perimetro())

def imprimir_saludo(nombre : str) -> None:
   print(f"Hola {nombre}")

imprimir_saludo("Ana")

def raiz_cuadrada_de(numero : int) -> int:
   res = math.sqrt(numero)
   return res 

print(raiz_cuadrada_de(4))

def es_multiplo_de(n : int, m = int) -> bool: 
   res = n % m == 0 
   return res 

print(es_multiplo_de(4,2))



def es_par(numero : int) -> bool:
   res = es_multiplo_de(numero,2)
   return res 

print(es_par(4))


def cantidad_de_pizzas(comensales : int, min_cant_de_porciones : int) -> int:
   porciones = comensales * min_cant_de_porciones
   return (porciones + 8-1) // 8 

print(cantidad_de_pizzas(5,3)) 

def alguno_es_0(numero1 : float, numero2 : float) -> bool: 
   res = numero1 == 0 or numero2 == 0 
   return res 

print(alguno_es_0(0,1))

def ambos_son_0 (numero1 : int, numero2 : int) -> bool: 
   res = numero1 == 0 and numero2 == 0 
   return res 

print(ambos_son_0(0,0))


def longitud (lista : str) -> int:
   contador = 0 
   for _ in lista:
      contador += 1 
   return contador 
    
def es_nombre_largo (nombre = str) -> bool:
   res = 3 <= longitud(nombre) <= 8
   return res 

print(es_nombre_largo("ana"))



def es_bisiesto(año : int) -> bool: 
   res = es_multiplo_de (año, 400)
   return res 

print(es_bisiesto(400))



def devolver_el_doble_si_es_par(numero : int) -> int: 
   if es_par(numero):
      return numero * 2 
   else: return numero 

print(devolver_el_doble_si_es_par(4))

def devolver_el_valor_si_es_par_si_no_el_que_sigue (numero : int) -> int: 
   if es_par(numero):
      return numero 
   else: 
      return numero + 1 
   
print(devolver_el_valor_si_es_par_si_no_el_que_sigue(5))

def lindo_nombre(nombre : str) -> str: 
   if longitud(nombre) >= 5: 
      return ("tu nombre tiene muchas letras!")
   else: 
      return ("tu nombre tiene menos de 5 caracteres")

print(lindo_nombre("ana"))

def elRango (numero : int) -> str: 
   if numero < 5:
      return ("Menor a 5")
   if 10 <= numero <= 20:
      return ("Entre 10 y 20")
   if numero > 20:
      return ("Mayor a 20")

print(elRango(30))

def que_te_toca (sexo : int, edad: int) -> str: 
   if edad < 18: 
      print("Anda de vacaciones")
   elif sexo == "F" and edad <= 60:
      print("Anda de vacaciones")
   elif sexo == "M" and edad <= 65:
      print("Anda de vacaciones")
   else: 
      print("Trabajas")


def numero_1_al_10 (numero : int): 
   numero = 1
   while numero <= 10:
      print(numero)
   numero += 1

def numeros_pares_entre_10_40(numero : int):
   numero = 10
   while numero <= 40: 
      print(numero)
      numero += 1 

def imprimir_palabra (palabra : str): 
   contador = 0 
   while contador < 10: 
      print(palabra)
      contador += 1 

imprimir_palabra("eco") 

def lanzar_cohete (n : int) -> str:
   while n > 0: 
      print(n)
      n -= 1
   print("Despegue")

lanzar_cohete(3)

def viaje_en_el_tiempo (añoPartida : int, añollegada : int): 
   while añoPartida > añollegada:
      añoPartida -= 1 
      print(f"Viajo un año al pasado, estamos en el año: {añoPartida}")



viaje_en_el_tiempo(2025,2020)



def numero_1_al_10_2 (n : int) -> int:
   for n in range (1,11):
      print(n)


numero_1_al_10_2(1)

def pares_entre_10_40_2 (n : int) -> int: 
   for n in range (10,41):
      if n % 2 == 0:
       print(n)

pares_entre_10_40_2(10)


def palabra_eco (palabra : str) -> str:
   for _ in range (10):
      print(palabra)

palabra_eco ("Eco")





