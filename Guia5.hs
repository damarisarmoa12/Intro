longitud :: [t] -> Int 
longitud [] = 0 
longitud (x:xs) = 1 + longitud xs

{-Longitud [1,2,3] = 3-}

{- ultimo :: [t]-> t seg´ un la siguiente especificaci´on:
 problema ultimo (s: seq⟨T⟩) : T {
 requiere: { |s| > 0 }
 asegura: { resultado = s[|s| − 1] }
 }-}

ultimo :: [t] -> t 
ultimo [x] = x 
ultimo (x:xs) = ultimo xs 

{-ultimo [1,2,4] = 4-}

{-
s = secuencia o lista 
|s| = longitud de la lista
s[i] = elemento en la posicion i 
s[|s|-1] = ultimo elemento de la lista 
-}

{- principio :: [t]-> [t] seg´ un la siguiente especificaci´on:
 problema principio (s: seq⟨T⟩) : seq⟨T⟩ {
 requiere: { |s| > 0 }
 asegura: { resultado = subseq(s,0,|s| − 1) }
 }-}

principio :: [t] -> [t]
principio [_] = []
principio (x:xs) = x : principio xs 


{-principio [1,2,3,4] = [1,2,3] -}

{-reverso :: [t]-> [t] seg´ un la siguiente especificaci´on:
 problema reverso (s: seq⟨T⟩) : seq⟨T⟩ {
 requiere: { True }
 asegura: { resultado tiene los mismos elementos que s pero en orden inverso.}-}

reverso :: [t] -> [t] 
reverso [] = []
reverso (x:xs) = reverso xs ++ [x]

{-reverso [1,2,3] = [3,2,1] -}

{-¿Por que usar [x]? 

x = un solo elemento de tipo x 
[x] = una lista con un solo elemento x 

para poder usar ++ ambos deben ser listas 
-}

{-pertenece :: (Eq t) => t-> [t]-> Bool seg´ un la siguiente especificaci´on:
 problema pertenece (e: T, s: seq⟨T⟩) : B {
 requiere: { True }
 asegura: { resultado = true ↔ e ∈ s }-}

pertenece :: (Eq t) => t -> [t] -> Bool 
pertenece _ [] = False 
pertenece a (x:xs) | a == x = True 
                   | otherwise = pertenece a xs 


{-pertenece 1 [1,2,3] = True -}

{- todosIguales :: (Eq t) => [t]-> Bool, que dada una lista devuelve verdadero s´ ı y solamente s´ ı todos sus ele
mentos son iguales.-}

todosIguales :: (Eq t) => [t] -> Bool 
todosIguales [] = True
todosIguales [_] = False
todosIguales (x:y:xs) = x == y && todosIguales (y:xs)

{-todosIguales [2,2,2] = True 
  todosIguales [2,2,1] = False

  todosIguales (y:xs) = verifica que el segundo elemento y el resto de la lista sean iguales 
-}

{-todosDistintos :: (Eq t) => [t]-> Bool seg´ un la siguiente especificaci´on:
 problema todosDistintos (s: seq⟨T⟩) : B {
 requiere: { True }
 asegura: { resultado = false ↔ existen dos posiciones distintas de s con igual valor }-}

todosDistintos :: (Eq t) => [t] -> Bool 
todosDistintos [] = False 
todosDistintos [_] = True 
todosDistintos (x:xs) | (pertenece x xs) = False 
                      | otherwise = todosDistintos xs 

{-
si x pertenece al resto de la lista (son iguales) entonces da False , y luego seguimos iterando en el resto de la list a
-}

{-todosDistintos [1,2,3] = True 
 todosDistintos-}

{-hayRepetidos :: (Eq t) => [t]-> Bool seg´ un la siguiente especificaci´on:
 problema hayRepetidos (s: seq⟨T⟩) : B {
 requiere: { True }
 asegura: { resultado = true ↔ existen dos posiciones distintas de s con igual valor }-}

hayRepetidos :: (Eq t) => [t] -> Bool 
hayRepetidos [] = False
hayRepetidos [_] = False 
hayRepetidos (x:xs) | (pertenece x xs) = True 
                    | otherwise = hayRepetidos xs  

{-compara x con el resto de la lista xs 
si x esta en xs, hay repetidos asi que devuelve true 
si no sigue iterando-}

{-
hayRepetidos [1,2,2] = True 
hayRepetidos [1,2,3] = False
-}

{-quitar :: (Eq t) => t-> [t]-> [t], que dados un entero x y una lista xs, elimina la primera aparici´on de x en
 la lista xs (de haberla).-}

quitar :: (Eq t) => t -> [t] -> [t] 
quitar _ [] = []
quitar e (x:xs) | e == x = xs 
                | otherwise = x : quitar e xs 

{-quitar [1,1,2,3] = [1,2,3] -}

{-quitarTodos :: (Eq t ) => t-> [t]-> [t], que dados un entero x y una lista xs, elimina todas las apariciones
 de x en la lista xs (de haberlas). Es decir:
 problema quitarTodos (e: T, s: seq⟨T⟩) : seq⟨T⟩ {
 requiere: { True }
 asegura: { resultado es igual a s pero sin el elemento e. }-}

quitarTodos :: (Eq t) => t -> [t] -> [t]
quitarTodos _ [] = []
quitarTodos e (x:xs) | e == x = quitarTodos e xs 
                     | otherwise = x : quitarTodos e xs 

{-quitarTodos [1,1,1,2,3] = [2,3]
  quitarTodos [1,2,2,3] = [1,3]-}

{- eliminarRepetidos :: (Eq t) => [t]-> [t] quedeja en la lista una ´unica aparici´on de cada elemento, eliminando
 las repeticiones adicionales.-}

eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos [] = []
eliminarRepetidos (x:xs) = x : eliminarRepetidos (quitarTodos x xs) 

{-eliminarRepetidos [1,2,2,3] = [1,2,3] -}

{-mismosElementos :: (Eq t) => [t]-> [t]-> Bool, que dadas dos listas devuelve verdadero s´ ı y solamente s´ ı
 ambas listas contienen los mismos elementos, sin tener en cuenta repeticiones, es decir:
 problema mismosElementos (s: seq⟨T⟩, r: seq⟨T⟩) : B {
 requiere: { True }
 asegura: { resultado = true ↔ todo elemento de s pertenece r y viceversa-}


mismosElementos :: (Eq t) => [t] -> [t] -> Bool 
mismosElementos [] [] = True 
mismosElementos [] _ = False 
mismosElementos _ [] = False 
mismosElementos (x:xs) ys | pertenece x ys = mismosElementos (quitarTodos x xs) (quitarTodos x ys) 
                          | otherwise = False 

{- ¿Por que hay que usar (x:xs) ys en vez de (x:xs) (y:ys)? 

 al poner (x:xs) (y:ys) obliga a que amvas listas tenga al menos un elemento, si alguna de las dos esta vacia no va a cubrir
 ese caso y puede fallar o dar error , ademas no es necesario para resolver el problema, por que no necesitamos ver el primer
 elemento de la segunda lista directamente 

 solo necesitas extrar el primero elemento de la primera lista (x) por que vas a ir viendo si x esta en la segunda lista
 completa (ys) 
 -}

{-no importa las posiciones-}

{-mismosElementos [1,2,3] [1,2,3] = True
 mismosElementos [1,2,3] [4,5,6] = False -}

 {-capicua :: (Eq t) => [t]-> Bool seg´ un la siguiente especificaci´on:
 problema capicua (s: seq⟨T⟩) : B {
 requiere: { True }
 asegura: { (resultado = true) ↔ (s = reverso(s)) } -}

capicua :: (Eq t) => [t] -> Bool 
capicua [] = True 
capicua xs = xs == reverso xs  

{- capicua [a,b,c,c,b,a] = True -}

{- sumatoria :: [Integer]-> Integer seg´ un la siguiente especificaci´on:
 problema sumatoria (s: seq⟨Z⟩) : Z {
 requiere: { True }
 asegura: { resultado = |s|−1
 i=0 s[i] }-}

sumatoria :: [Int] -> Int 
sumatoria [] = 0 
sumatoria (x:xs) = x + sumatoria xs 

{-sumatoria [1,2,3] = 6-
 sumatoria  [4,4,5] = 13}

{- productoria :: [Integer]-> Integer seg´ un la siguiente especificaci´on:
 problema productoria (s: seq⟨Z⟩) : Z {
 requiere: { True }
 asegura: { resultado = |s|−1
 i=0 s[i] }-} 
-}

productoria :: [Int] -> Int 
productoria [] = 1
productoria (x:xs) = x * productoria xs 

{- maximo :: [Integer]-> Integer seg´ un la siguiente especificaci´on:
 problema maximo (s: seq⟨Z⟩) : Z {
 requiere: { |s| > 0 }
 asegura: { resultado ∈ s ∧ todo elemento de s es menor o igual a resultado }
 }-}

maximo :: [Int] -> Int 
maximo [] = 0 
maximo [x] = x 
maximo (x:y:xs) | x > y = x 
                | otherwise = maximo xs 


{-maximo [1,2,3] = 3 
  maximo [4,5,6] = 6-}

{-sumarN :: Integer-> [Integer]-> [Integer] seg´ un la siguiente especificaci´on:
 problema sumarN (n: Z, s: seq⟨Z⟩) : seq⟨Z⟩ {
 requiere: { True }
 asegura: {|resultado| = |s| ∧ cada posici´on de resultado contiene el valor que hay en esa posici´on en s sumado
 n }-}

sumarN :: Int -> [Int] -> [Int]
sumarN _ [] = []
sumarN e (x:xs) = (e + x) : sumarN e xs 


{-sumarN 1 [1,2,3] = [2,3,4]
  sumarN 2 [1,2,3] = [3,4,5]-}

{-sumarElPrimero :: [Integer]-> [Integer] seg´ un la siguiente especificaci´on:
 problema sumarElPrimero (s: seq⟨Z⟩) : seq⟨Z⟩ {
 requiere: { |s| > 0 }
 asegura: {resultado = sumarN(s[0],s) }-}

sumarElPrimero :: [Int] -> [Int] 
sumarElPrimero [] = []
sumarElPrimero (x:xs) = sumarN x (x:xs)

{-sumarElPrimero [1,2,3,4] = [2,3,4,5]
  sumarElPrimero [2,3,4] = [4,5,6]-}

{-poner el (x:xs) es que vas a sumarle el primero a TODOS los elementos de la lista, tambien al primero,
si ponemos solo xs solo sumaremos al resto de la lista -}

{- sumarElUltimo :: [Integer]-> [Integer] seg´ un la siguiente especificaci´on:
 problema sumarElUltimo (s: seq⟨Z⟩) : seq⟨Z⟩ {
 requiere: { |s| > 0 }
 asegura: {resultado = sumarN(s[|s| − 1],s) }-}

sumarElUltimo :: [Int] -> [Int] 
sumarElUltimo [] = []
sumarElUltimo (x:xs) = sumarN (ultimo xs ) (x:xs)

{--sumarElUltimo [1,2,3] = [4,5,6]
  sumarElUltimo [4,5,6] = [10,11,12]}

{- pares :: [Integer]-> [Integer] seg´ un la siguiente especificaci´on:
 problema pares (s: seq⟨Z⟩) : seq⟨Z⟩ {
 requiere: { True }
 asegura: {resultado s´olo tiene los elementos pares de s en el orden dado, respetando las repeticiones}-}

-}

pares :: [Int] -> [Int]
pares [] = []
pares (x:xs) | paresAux x = x : pares xs 
             | otherwise = pares xs 

paresAux :: Int -> Bool 
paresAux n = n `mod` 2 == 0

{-agregar x al principio de la lista que devuelve pares xs -}
{-pares [1,2,3,4] =  [2,4] -}

{-multiplosDeN :: Integer-> [Integer]-> [Integer] que dado un n´ umero n y una lista xs, devuelve una lista
 con los elementos de xs m´ ultiplos de n.-}

multiplosDeN :: Int -> [Int] -> [Int]
multiplosDeN _ [] = []
multiplosDeN e (x:xs) | multiplosDeNDesde x e = x : multiplosDeN e xs  
                      | otherwise = multiplosDeN e xs 

multiplosDeNDesde :: Int -> Int -> Bool 
multiplosDeNDesde n m = n `mod` m == 0 

{-MUY IMPORTANTE LA POSICION DE CADA ELEMENTO-}
{-multiplosDeN 2 [1,2,3,4,5,6] = [1,2,4,6]-}

{-ordenar :: [Integer]-> [Integer] que ordena los elementos de la lista en forma creciente. Sugerencia: Pensar
 c´omo pueden usar la funci´on m´ınimo para que ayude a generar la lista ordenada necesaria.-}

ordenar :: [Int] -> [Int]
ordenar [] = [] 
ordenar xs = minimo xs : ordenar (quitar (minimo xs)xs )
              
minimo :: [Int] -> Int
minimo [x] = x 
minimo (x:y:xs) | x < y = minimo (x:xs)
                | otherwise = minimo (y:xs)


{- se pone solamente xs ya que no necesitamos un elemento de la lista, necesitamos trabajar con toda la lista-}

{-ordenar [7,4,5,9,3] = [3,4,5,7,9]-}

{- Definir las siguientes funciones sobre listas de caracteres, interpretando una palabra como una secuencia de
 caracteres sin blancos:
 a) sacarBlancosRepetidos :: [Char]-> [Char], que reemplaza cada subsecuencia de blancos contiguos de la pri
mera lista por un solo blanco en la lista resultado.-}

sacarBlancosRepetidos :: [Char] -> [Char] 
sacarBlancosRepetidos [] = []
sacarBlancosRepetidos (x:y:xs) | x == ' ' && y == ' ' = sacarBlancosRepetidos (y:xs)
                               | otherwise = x : sacarBlancosRepetidos (y:xs)


{-sacarBlancosRepetidos ["Hola", "listo", "como  estas"] -}

{- palabras :: [Char]-> [[Char]], que dada una lista arma una nueva lista con las palabras de la lista original.-}

palabras :: [Char] -> [[Char]]
palabras [] = []
palabras xs = tomarPrimeraPalabra xs : palabras (sacarBlancosRepetidos (sacarPalabra xs))

tomarPrimeraPalabra :: [Char] -> [Char]
tomarPrimeraPalabra [] = []
tomarPrimeraPalabra (x:xs) | x == ' ' = [] 
                           | otherwise = x : tomarPrimeraPalabra xs 

sacarPalabra :: [Char] -> [Char]
sacarPalabra [] = [] 
sacarPalabra (x:xs) | x == ' ' = xs
                    | otherwise = sacarPalabra xs 

{-palabras ["Hola Chau"] = [["Hola","Chau"]] -}

{- palabraMasLarga :: [Char]-> [Char], que dada una lista de caracteres devuelve su palabra m´as larga.-}

palabraMasLarga :: [Char] -> [Char]
palabraMasLarga [] = []
palabraMasLarga xs = masLarga (palabras xs)


masLarga :: [[Char]] -> [Char]
masLarga [] = []
masLarga [x] = x 
masLarga (x:y:xs) | longitud x > longitud y = masLarga (x:xs) 
                  | otherwise = masLarga (y:xs) 


{-aplanar :: [[Char]]-> [Char], que a partir de una lista de palabras arma una lista de caracteres concaten´ando
las.-}

aplanar :: [[Char]] -> [Char]
aplanar [] = []
aplanar (x:xs) = x ++ aplanar xs 


{-aplanar [["Hola,"como],["estas"]] = ["Hola", "como", "estas"] -}

{-probar en la terminal 

aplanar ["hola","","como","","estas"] = "Hola como estas"-}

{-aplanarConBlancos :: [[Char]]-> [Char], que a partir de una lista de palabras, arma una lista de caracteres
 concaten´andolas e insertando un blanco entre cada palabra-}

aplanarConBlancos :: [[Char]] -> [Char]
aplanarConBlancos [] = []
aplanarConBlancos [x] = x 
aplanarConBlancos (x:xs) = x ++ " " ++ aplanarConBlancos xs 

{- aplanarConNBlancos :: [[Char]]-> Integer-> [Char], que a partir de una lista de palabras y un entero n,
 arma una lista de caracteres concaten´andolas e insertando n blancos entre cada palabra (n debe ser no negativo)-}

aplanarConNBlancos :: [[Char]] -> Int -> [Char] 
aplanarConNBlancos [] _ = []
aplanarConNBlancos [x] _ = x
aplanarConNBlancos (x:xs) n = x ++ espacios n ++ aplanarConNBlancos xs n

espacios :: Int -> [Char]
espacios 0 = []
espacios n = ' ' : espacios (n-1)

{-aplanarConNBlancos ["Hola", "como", "estas"] 2 = "Hola  como  estas"-}

{- sumaAcumulada :: (Num t) => [t]-> [t] seg´ un la siguiente especificaci´on:
 problema sumaAcumulada (s: seq⟨T⟩) : seq⟨T⟩ {
 requiere: {T es un tipo num´erico}
 requiere: {cada elemento de s es mayor estricto que cero}
 asegura: {|s| = |resultado| ∧ el valor en la posici´on i de resultado es i
 k=0 s[k]}
 }
 Por ejemplo sumaAcumulada [1, 2, 3, 4, 5] es [1, 3, 6, 10, 15]-}


sumaAcumulada :: (Num t) => [t] -> [t]
sumaAcumulada [] = []
sumaAcumulada (x:xs)  =x : suma x xs

suma :: (Num t) => t -> [t] -> [t]
suma _ [] = []
suma t (x:xs)=(t+x) : suma (t+x) xs 

{-suma 1 [2,3,4,5]
t = 1, x = 2

(1 + 2) = 3

Resultado parcial: 3 : suma 3 [3,4,5]

Ahora evaluamos suma 3 [3,4,5] 

1 : (3 : (6 : (10 : (15 : []))))
-}

{-descomponerEnPrimos :: [Integer]-> [[Integer]] seg´ un la siguiente especificaci´on:
 problema descomponerEnPrimos (s: seq⟨Z⟩) : seq⟨seq⟨Z⟩⟩ {
 requiere: { Todos los elementos de s son mayores a 2 }
 asegura: { |resultado| = |s| }
 asegura: {todos los valores en las listas de resultado son n´ umeros primos}
 asegura: {multiplicar todos los elementos en la lista en la posici´on i de resultado es igual al valor en la posici´on
 i de s}
 }
 Por ejemplo descomponerEnPrimos [2, 10, 6] es [[2], [2, 5], [2, 3]]-}


descomponerEnPrimos :: [Int] -> [[Int]] 
descomponerEnPrimos [] = []
descomponerEnPrimos (x:xs) = descomponer x 2 : descomponerEnPrimos xs 

descomponer :: Int -> Int -> [Int]
descomponer 1 _ = []
descomponer n m | n `mod`m == 0 = m : descomponer (n `div`m ) m 
                | otherwise = descomponer n (m+1) 

{-descomponer 10 2
→ 10 mod 2 == 0 → agregamos 2
→ descomponer (10/2 = 5) 2
→ 5 mod 2 ≠ 0 → probamos 3
→ 5 mod 3 ≠ 0 → probamos 4
→ 5 mod 4 ≠ 0 → probamos 5
→ 5 mod 5 == 0 → agregamos 5
→ descomponer (5/5=1) 5
→ llegamos a 1 → []
Resultado: [2,5]-}

{-Implementar una funci´on que me diga si una persona aparece en mi lista de contactos del tel´ efono: enLosContactos ::
 Nombre->ContactosTel->Bool-}

type Texto = [Char]
type Nombre = Texto
type Telefono = Texto
type Contacto = (Nombre, Telefono)
type ContactosTel = [Contacto]


enLosContactos :: Nombre -> ContactosTel -> Bool
enLosContactos nombre [] = False 
enLosContactos nombre ((n,_):xs)
  | nombre ==n = True
  | otherwise   = enLosContactos nombre xs

{-Implementar una funci´on que agregue una nueva persona a mis contactos, si esa persona est´a ya en mis contactos entonces
 actualiza el tel´efono. agregarContacto :: Contacto->ContactosTel->ContactosTel-}

agregarContacto :: Contacto -> ContactosTel -> ContactosTel 
agregarContacto (nombre,telefono) [] = [(nombre,telefono)]
agregarContacto (nombre,telefono) ((n,t):xs) | n == nombre = (nombre,telefono) : xs --reeemplazamos el contacto con uno nuevo actualizado, y dejamos el resto como esta (no seguimos buscando)
                                             | otherwise = (n,t) : agregarContacto (nombre, telefono) xs --si el nombre no coincide, dejamos el contacto como esta y seguimos bsucando en el resto de la lista con recursion 

{- Implementar una funci´on que dado un nombre, elimine un contacto de mis contactos. Si esa persona no est´a no hace
 nada. eliminarContacto :: Nombre->ContactosTel->ContactosTel-}

eliminarContacto :: Nombre -> ContactosTel -> ContactosTel 
eliminarContacto nombre [] = []
eliminarContacto nombre ((n,t):xs) | n == nombre = xs --si n es igual a nombre lo elimina y solo ponemos el resto de la lista 
                                   | otherwise = (n,t) : eliminarContacto nombre xs                                             



type Identificacion = Integer
type Ubicacion = Texto
type Estado = (Disponibilidad, Ubicacion)
type Locker = (Identificacion, Estado)
type MapaDeLockers = [Locker]
type Disponibilidad = Bool


{- Implementar existeElLocker :: Identificacion->MapaDeLockers->Bool, una funci´on para saber si un locker
 existe en la facultad.-}

existeElLocker :: Identificacion -> MapaDeLockers -> Bool 
existeElLocker _ [] = False 
existeElLocker n ((m,t):xs) | n == m = True 
                            | otherwise = existeElLocker n xs 

{- Implementar ubicacionDelLocker :: Identificacion->MapaDeLockers->Ubicacion, una funci´on que dado un
 locker que existe en la facultad, me dice la ubicaci´on del mismo.-}

ubicacionDelLocker :: Identificacion -> MapaDeLockers -> Ubicacion 
ubicacionDelLocker _ [] = ""
ubicacionDelLocker n ((id,(dis, ubi)):xs) | n == id = ubi
                                          | otherwise =  ubicacionDelLocker n xs  

{-Implementar estaDisponibleElLocker :: Identificacion->MapaDeLockers->Bool, una funci´on que dado un
 locker que existe en la facultad, me devuelve Verdadero si esta libre.-}

estaDisponibleElLocker :: Identificacion -> MapaDeLockers -> Bool 
estaDisponibleElLocker _ [] = False 
estaDisponibleElLocker n ((id, (dis,ubi)):xs) | n == id = dis 
                                              | otherwise = estaDisponibleElLocker n xs 

{- Implementar ocuparLocker :: Identificacion->MapaDeLockers->MapaDeLockers, una funci´on que dado un loc
ker que existe en la facultad, y est´a libre, lo ocupa.-}

ocuparLocker :: Identificacion -> MapaDeLockers -> MapaDeLockers 
ocuparLocker _ [] = []
ocuparLocker n ((id,(True,ubi)):xs) | n == id = (id,(False,ubi)) : xs
                                    | otherwise = (id,(True,ubi)) : ocuparLocker n xs 