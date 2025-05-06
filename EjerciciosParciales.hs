import Data.Kind (FUN)
import GHC.Event.Windows (HandleData(_handleCallback))


{-Una reconocida empresa de comercio electr´onico nos pide desarrollar un sistema de stock de mercader´ ıa. La mercader´ ıa de
 la empresa va a ser representada como una secuencia de nombres de los productos, donde puede haber productos repetidos.
 El stock va a ser representado como una secuencia de tuplas de dos elementos, donde el primero es el nombre del producto y
 el segundo es la cantidad que hay en stock (en este caso no hay nombre de productos repetidos). Tambi´ en se cuenta con una
 lista de precios de productos representada como una secuencia de tuplas de dos elementos, donde el primero es el nombre
 del producto y el segundo es el precio.
 Para implementar este sistema nos enviaron las siguientes especificaciones y nos pidieron que hagamos el desarrollo
 enteramente en Haskell, utilizando los tipos requeridos y solamente las funciones que se ven en la materia Introducci´on a la
 Programaci´on / Algoritmos y Estructuras de Datos I (FCEyN-UBA).
 Ejercicio 1. Implementar la funci´on generarStock :: [String]->[(String, Int)]
 problema generarStock (mercader´ ıa: seq⟨String⟩) : seq⟨String × Z⟩ {
 requiere: {True}
 asegura: { La longitud de res es igual a la cantidad de productos distintos que hay en mercader´ ıa}
 asegura: {Para cada producto que pertenece a mercader´ ıa, existe un i tal que 0 ≤ i < |res| y res[i]0=producto y
 res[i]1 es igual a la cantidad de veces que aparece producto en mercader´ ıa}
 }
 -}

{-
mercaderia = [Int] 
stock = [(producto,cantidad)]
lista de precios = [(producto, precio)]

-}

generarStock :: [String] -> [(String, Int)]
generarStock [] = []
generarStock (x:xs) = (x , cantidadDeVeces x (x:xs)) : generarStock (quitarTodos x xs)

{-Como laburamos con tuplas, x representa el producto, mientras que la segunda tupla representa la cantidad de veces 
que aparece x en el resto de la lista, la cual debemos agregar a la lista de generar stock quitando los duplicados 

¿como sabemos que habia que eliminar duplicados? 

en el requiere nos aparece que res es igual a la cantidad de productos DISTINTOS que hay en mercarderia-}

cantidadDeVeces :: String -> [String] -> Int 
cantidadDeVeces _ [] = 0 
cantidadDeVeces e (x:xs) | e == x = 1 +cantidadDeVeces e xs 
                         | otherwise = cantidadDeVeces e xs 

quitarTodos :: String -> [String] -> [String]
quitarTodos _ [] = []
quitarTodos e (x:xs) | e == x = quitarTodos e xs 
                     | otherwise = x : quitarTodos e xs 

{-generarStock ["pan", "leche", "pan", "huevos", "leche", "leche"] = [("pan", 2), ("leche", 3), ("huevos", 1)]
-}

{- Ejercicio 2. Implementar la funci´on stockDeProducto :: [(String, Int))]->String
 problema stockDeProducto (stock: seq⟨String × Z⟩, producto: String ) : Z {
 requiere: {No existen dos nombres de productos (primeras componentes) iguales en stock}
 requiere: {Todas las cantidades (segundas componentes) de stock son mayores a cero}
 asegura: {si no existe un i tal que 0 ≤ i < |stock| y producto = stock[i]0 entonces res es igual a 0 }
 asegura: {si existe un i tal que 0 ≤ i < |stock| y producto = stock[i]0 entonces res es igual a stock[i]1 }
 } --}

stockDelProducto :: [(String, Int)] -> String -> Int
stockDelProducto [] _ = 0
stockDelProducto ((prod, cant):xs) nombre
  | prod == nombre = cant
  | otherwise = stockDelProducto xs nombre


{-Ejercicio 3. Implementar la funci´on dineroEnStock :: [(String, Int))]->[(String, Float)]->Float
 problema dineroEnStock (stock: seq⟨String × Z⟩, precios: seq⟨String × R⟩ ) : R {
 requiere: {No existen dos nombres de productos (primeras componentes) iguales en stock}
 requiere: {No existen dos nombres de productos (primeras componentes) iguales en precios}
 requiere: {Todas las cantidades (segundas componentes) de stock son mayores a cero}
 requiere: {Todos los precios (segundas componentes) de precios son mayores a cero}
 requiere: {Todo producto de stock aparece en la lista de precios}
 asegura: {res es igual a la suma de los precios de todos los productos que est´an en stock multiplicado por la cantidad
 de cada producto que hay en stock}-}

{-dineroEnStock :: [(String,Int)] -> [(String,Float)] -> Float 
dineroEnStock [] _ = 0.0
dineroEnStock ((prod,cant):xs) precio = fromIntegral cant (buscarProducto prod precio) + dineroEnStock xs precio 
-}

buscarProducto :: String -> [(String, Float)] -> Float 
buscarProducto _ [] = 0.0
buscarProducto e ((prod,precio):xs) | e == prod = precio  
                                    | otherwise = buscarProducto e xs 


{-dineroEnStock [["Leche", 12),("Yerba", 15)] [("Leche",2),("Yerba", 2)] = 54-}

{-Implementar la funci´on aplicarOferta :: [(String, Int)]->[(String, Float)]->[(String,Float)]
 problema aplicarOferta (stock: seq⟨String × Z⟩, precios: seq⟨String × R⟩ ) : seq⟨String × R⟩ {
 requiere: {No existen dos nombres de productos (primeras componentes) iguales en stock}
 requiere: {No existen dos nombres de productos (primeras componentes) iguales en precios}
 requiere: {Todas las cantidades (segundas componentes) de stock son mayores a cero}
requiere: {Todos los precios (segundas componentes) de precios son mayores a cero}
 requiere: {Todo producto de stock aparece en la lista de precios}
 asegura: {|res| = |precios|}
 asegura: {Para todo 0 ≤ i < |precios|, si stockDeProducto(stock, precios[i]0) > 10, entonces res[i]0 = precios[i]0 y
 res[i]1 = precios[i]1∗ 0,80}
 asegura: {Para todo 0 ≤ i < |precios|, si stockDeProducto(stock, precios[i]0) ≤ 10, entonces res[i]0 = precios[i]0 y
 res[i]1 = precios[i]1 }-}

aplicarOferta :: [(String,Int)] -> [(String,Float)] -> [(String,Float)]
aplicarOferta [] _ = []
aplicarOferta stock ((prod,precio):xs) | stockDelProducto stock prod > 10 = (prod,precio*0.80) : aplicarOferta stock xs
                                       | stockDelProducto stock prod <= 10 = (prod,precio) : aplicarOferta stock xs 
                                       | otherwise = aplicarOferta stock xs 



{-Implementar la funci´on maximo :: Tablero->Int
 problema maximo (t: Tablero) : Z {
 requiere: {El tablero t es un tablero bien formado, es decir, la longitud de todas las filas es la misma, y tienen al
 menos un elemento}
 requiere: {Existe al menos una columna en el tablero t }
 requiere: {El tablero t no es vac´ ıo, todos los n´ umeros del tablero son positivos, mayor estricto a 0}
 asegura: {res es igual al n´ umero m´as grande del tablero t}-}

maximo :: [[Int]] -> Int 
maximo [] = 0
maximo (x:xs) = comparar (maximoFila x) (maximo xs)

{-   
maximo [[1,2,3],[4,5,6]] = comparar [1,2,3] [4,5,6]
                        = comparar 3 6
                       = 6 -}


maximoFila :: [Int] -> Int  
maximoFila [] = 0 
maximoFila [x] = x 
maximoFila (x:y:xs) | x > y = x 
                    | otherwise = maximoFila xs 

comparar :: Int -> Int -> Int
comparar a b | a  > b = a 
             | otherwise = b 

{- Implementar la funci´on valoresDeCamino :: Tablero->Camino->[Int]
 problema valoresDeCamino (t: Tablero, c: Camino) : seq⟨Z⟩ {
 requiere: {El tablero t es un tablero bien formado, es decir, la longitud de todas las filas es la misma, y tienen al
 menos un elemento}
 requiere: {Existe al menos una columna en el tablero t }
 requiere: {El tablero t no es vac´ ıo, todos los n´ umeros del tablero son positivos, mayores estrictos a 0}
 requiere: {El camino c es un camino v´alido, es decir, secuencia de posiciones adyacentes en la que solo es posible
 desplazarse hacia la posici´on de la derecha o hacia abajo y todas las posiciones est´an dentro de los limites del tablero
 t}
 asegura: {res es igual a la secuencia de n´ umeros que est´an en el camino c, ordenados de la misma forma que aparecen
 las posiciones correspondientes en el camino.}-}

valoresDeCamino :: [[Int]] -> [(Int,Int)] -> [Int]
valoresDeCamino _ [] = []
valoresDeCamino m (x:xs) = obtenerValor m x : valoresDeCamino m xs  

obtenerValor :: [[Int]] -> (Int,Int) -> Int 
obtenerValor (x:xs) (0,i) = obtenerElemento x i 
obtenerValor (x:xs) (j,i) = obtenerValor xs (j-1,i)


obtenerElemento :: [Int] -> Int -> Int --funcion para señalar que elemento esta en determinada posicion
obtenerElemento (x:xs) 0 = x 
obtenerElemento (x:xs) j = obtenerElemento xs (j-1)

{-tablero = [[1, 2, 3],
           [4, 5, 6],
           [7, 8, 9]]
           
 camino = [(0,0), (0,1), (1,1), (2,1), (2,2)]
 = [1, 2, 5, 8, 9]
-}

{-El Departamento de Matem´atica (DM) de la FCEyN-UBA nos ha encargado que desarrollemos un sistema para el
 tratamiento de n´ umeros naturales. Espec´ ıficamente les interesa conocer cu´ando un n´umero es perfecto y cu´ando dos n´ umeros
 son amigos. Aunque por ah´ ı no lo sab´ ıas, estos conceptos existen y se definen como:
 Un n´ umero natural es perfecto cuando la suma de sus divisores propios (n´umeros que lo dividen menores a ´el) es igual
 al mismo n´umero. Por ejemplo, 6 es un n´ umero perfecto porque la suma de sus divisores propios (1,2 y 3) es igual a 6.
 Dos n´ umeros naturales distintos son amigos si cada uno de ellos se obtiene sumando los divisores propios del otro.
 Por ejemplo, 220 y 284 son amigos porque los divisores propios de 220 son 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 y 110 que
 sumados dan 284 y los divisores propios de 284 son 1, 2 , 4, 71, 142 que sumados dan 220.-}


{- Implementar la funci´on divisoresPropios :: Int->[Int]
 problema divisoresPropios (n: Z) : seq⟨Z⟩ {
 requiere: {n > 0}
 asegura: {res contiene a todos los divisores propios de n, ordenados de menor a mayor}
 asegura: {res no tiene elementos repetidos}
 asegura: {res no contiene a ning´ un elemento que no sea un divisor propio de n}-}

{-6 = [1,2,3,6]-}

divisoresPropios :: Int -> [Int]
divisoresPropios n = divisorPropioDesde n 1

{-divisoresPropios 6 = [1,2,3,6]-}

divisorPropioDesde :: Int -> Int -> [Int] 
divisorPropioDesde n m  | m >= n = []
                        | n `mod` m == 0 = m : divisorPropioDesde n (m+1)
                        | otherwise = divisorPropioDesde n (m+1)

{-divisorPropioDesde 12 2 = [2,3,4,6,12]-}

{- Implementar la funci´on sonAmigos :: Int->Int->Bool
 problema sonAmigos (n,m: Z) : Bool {
 requiere: {n > 0}
 requiere: {m > 0}
 requiere: {m= n}
 asegura: {res = True ⇔ n y m son n´ umeros amigos}-}

--son numeros amigos si cada uno de ellos se obtiene sumando los divisores propios del otro, 220 y 284 son numeros amigos 
-- 220 = 1 2 4 5 10 11 20 22 44 55 110 sumados dan 284 y 284 = 1 2 4 71 142 sumados dan 220 

sonAmigos :: Int -> Int -> Bool 
sonAmigos n m = sumarDivisoresPropios n == sumarDivisoresPropios m

sumarDivisoresPropios :: Int -> Int 
sumarDivisoresPropios n = suma (divisoresPropios n)

suma :: [Int] -> Int
suma [] = 0 
suma (x:xs) = x + suma xs 


{- Implementar la funci´on losPrimerosNPerfectos :: Int->[Int]
 problema losPrimerosNPerfectos (n: Z) : seq⟨Z⟩ {
 requiere: {n > 0}
 asegura: {|res| = n}
 asegura: {res es la lista de los primeros n n´ umeros perfectos, de menor a mayor}
 }-}

{-Un n´ umero natural es perfecto cuando la suma de sus divisores propios (n´umeros que lo dividen menores a ´el) es igual
 al mismo n´umero. Por ejemplo, 6 es un n´ umero perfecto porque la suma de sus divisores propios (1,2 y 3) es igual a 6.-}



--necesitamos un contador para ir guardando los n perfectos que vamos encontrando 
losPrimerosNPerfectos :: Int -> [Int]
losPrimerosNPerfectos n = buscarPerfectos n 2 --el dos es el primer numero que puede ser perfectos 

buscarPerfectos :: Int -> Int -> [Int]
buscarPerfectos 0 _ = []
buscarPerfectos n m | esPerfecto m = m : buscarPerfectos (n-1) (m+1) --si es perfecto agregamos ese m y bajamos un n y subimos un m 
                    | otherwise = buscarPerfectos n (m+1)

{-losPrimerosNPerfectos 6 = [1,2,6]-}

esPerfecto :: Int -> Bool
esPerfecto n = sumarDivisoresPropios n == n

{- Implementar la funci´on listaDeAmigos :: [Int]->[(Int,Int)]
 problema listaDeAmigos (lista: seq⟨Z⟩) : seq⟨Z × Z⟩ {
 requiere: {Todos los n´ umeros de lista son mayores a 0}
 requiere: {Todos los n´ umeros de lista son distintos}
 asegura: {res es una lista de tuplas sin repetidos, que contiene a todos los pares de n´ umeros que pertenecen a lista
 y son amigos entre s´ ı}
 asegura: {|res| es igual a la cantidad de pares de n´ umeros amigos que hay en lista.}-}

listaDeAmigos :: [Int] -> [(Int,Int)]
listaDeAmigos [] = []
listaDeAmigos (x:xs) = agregarAmigos x xs ++ listaDeAmigos xs --se usa el concatenar ya que ambos son una lista 

agregarAmigos :: Int -> [Int] -> [(Int,Int)]
agregarAmigos _ [] = []
agregarAmigos x (y:ys) | sonAmigos x y = (x,y) : agregarAmigos x ys --para que no hayan repetidos  
                       | otherwise = agregarAmigos x ys 

{-lista = [220, 284, 6, 28, 1184, 1210, 500]
  res = [(220,284),(1184,1210)]
-}


{-problema mediaMovilN (lista: seq⟨Z⟩, n: Z) : Float {
--   requiere: {|lista| > 0}
--   requiere: {n > 0 ∧ n ≤ |lista|}
--   asegura: {res es el promedio de los últimos n elementos de lista}-}


{-mediaMovilN [1,2,3,4,5] 2 = 4.5-}

{-¿Como saco el promedio? 


-}

mediaMovilN :: [Int] -> Int -> Float 
mediaMovilN [] _ = 0.0
mediaMovilN (x:xs) n | n <= 0 && longitud (x:xs) > n = 0.0
                     | otherwise = promedio (obtenerUltimosNumeros xs n)

obtenerUltimosNumeros :: [Int] -> Int -> [Int]
obtenerIltimosNumeros [] _ = []
obtenerUltimosNumeros (x:xs) n | n >= longitud(x:xs) = (x:xs) --   [1,2,3,4] 5 = [1,2,3,4]
                               | otherwise = obtenerUltimosNumeros xs n 

promedio :: [Int] -> Float
promedio xs = fromIntegral (suma xs) / fromIntegral (longitud xs)

longitud :: [Int] -> Int 
longitud [] = 0 
longitud (x:xs) = 1 + longitud xs 

{-problema esAtractivo (n: Z) : Bool {
--   requiere: {n > 0}
--   asegura: {res = true <=> la cantidad de factores primos de n (distintos o no) es también un número primo.}
-- }
-- Aclaración: los factores primos de 30 son [5,3,2]. Los factores primos de 9 son [3,3].-}

{-
30 = [5,3,2] = False 


-}
esAtractivo :: Int -> Bool 
esAtractivo n = esPrimo (longitud(descomponer n 2))


esPrimo :: Int -> Bool 
esPrimo n = esPrimoDesde n 2

esPrimoDesde :: Int -> Int -> Bool 
esPrimoDesde n m | m*m > n = True 
                 | n `mod` m == 0 = False 
                 | otherwise = esPrimoDesde n (m+1)

descomponer :: Int ->  Int -> [Int]
descomponer 1 _ = []
descomponer n m | n `mod` m == 0 = m : descomponer (n `div` m) m 
                | otherwise = descomponer n (m+1)

{-EJERCICIO 3 (2 puntos)
-- problema palabraOrdenada (palabra: seq⟨Char⟩) : Bool {
--   requiere: {True}
--   asegura: {res = true <=> cada uno de los elementos no blancos de palabra es mayor o igual al anterior caracter no blanco, si existe alguno.}
-- }
-- Aclaración: 'a' < 'b' es True.-}

{- a b c d = True 
   b c a d = False -}

palabraOrdenada :: [Char] -> Bool 
palabraOrdenada [] = True 
palabraOrdenada [x] = True
palabraOrdenada palabra = palabraOrdenadaAux (quitarBlancos palabra)
                            
palabraOrdenadaAux :: [Char] -> Bool 
palabraOrdenadaAux [] = False
palabraOrdenadaAux (x:y:xs) | x <= y = palabraOrdenadaAux (y:xs)
                            | otherwise = False

quitarBlancos :: [Char] -> [Char] 
quitarBlancos [] = []
quitarBlancos (x:xs) | x == ' '  = quitarBlancos (x:xs)
                       |otherwise = x : quitarBlancos (x:xs)  

                      
{-problema relacionesValidas (relaciones: seq⟨String × String⟩) : Bool {
--requiere: {True}
--asegura: {(res = true) ↔ no hay tuplas en relaciones con ambas componentes iguales ni tuplas repetidas (sin considerar
--el orden)}

--defino una función auxiliar que me dice si dos relaciones son iguales-}

{-
relacionesValidas [(C,C)] = False 
relacionesValidas [(C,A) (E,O)] = True 
-}

relacionesValidas :: [(String,String)] -> Bool 
relacionesValidas [] = True 
relacionesValidas relaciones | hayTuplasRepetidas relaciones = False 
                             | tieneTuplasIguales relaciones = False 
                             | otherwise = relacionesValidas relaciones 

hayTuplasRepetidas :: [(String,String)] -> Bool 
hayTuplasRepetidas [] = False 
hayTuplasRepetidas (x:xs) = x `pertenece` xs || hayTuplasRepetidas xs 

pertenece :: (String,String) ->  [(String,String)] -> Bool 
pertenece _ [] = False 
pertenece e (x:xs) | e == x = True
                   | otherwise = pertenece e xs 
                                  
tieneTuplasIguales :: [(String,String)] -> Bool 
tieneTuplasIguales [] = True 
tieneTuplasIguales ((a,b):ys) | a == b = True 
                              | otherwise = tieneTuplasIguales ys                                 
                            
{-roblema personas (relaciones: seq⟨String × String⟩) : seq⟨String⟩ {
--requiere: {relacionesValidas(relaciones)}
--asegura: {resu tiene exactamente los elementos que figuran en alguna tupla de relaciones en cualquiera de las dos
--posiciones, sin repetir}

--defino una función pertenece para cualquier tipo-}

personas :: [(String,String)] -> [String]
personas [] = []
personas xs = sinRepetidos (aplanarElem xs )

aplanarElem :: [(String,String)] -> [String]
aplanarElem [] = []
aplanarElem ((x,y):xs)  =  x : y : aplanarElem xs 


sinRepetidos :: [String] -> [String]
sinRepetidos [] = []
sinRepetidos (x:xs) | perteneceElemento x xs = sinRepetidos xs 
                    | otherwise = x : sinRepetidos xs 

perteneceElemento :: String -> [String] -> Bool 
perteneceElemento _ [] = False
perteneceElemento e (y:ys) | e == y = True 
                           | otherwise = perteneceElemento e ys 
                            
{-problema amigosDe (personas: String, relaciones: seqhStringxStringi) :seqhStringi {
--requiere: { relacionesValidas(relaciones) }
--asegura: { res tiene exactamente los elementos que figuran en las tuplas de relaciones en las que una de sus componentes es persona} 

--mi función amigosDe toma un string (n, el nombre de la persona que quiero saber cuántos amigos tiene), una lista de tuplas (relaciones)
--y devueve una lista de strings (los amigos de n). Para esto, primero compara si n es igual a a (el primer elemento de la tupla). Si es
--igual, o sea que n es parte de la relación, devuelve b (el segundo elemento de la tupla) ya que este es su amigo y lo añade a la lista 
--que devuelve mi función al terminar de ejecutarse. Si n no es igual a a, compara n con b y hace lo mismo que cuando comparó con a. Si
--n no es igual a a y tampoco a b (o sea, que n no pertenece en la primera tupla de la lista de tuplas), entonces mi función hace recursión
--para seguir comparando con el resto de las tuplas.-}

{-amigosDe = a [("a,b)"] = [a,b] -}

amigosDe :: String -> [(String,String)] -> [String]
amigosDe _ [] = []
amigosDe n ((a,b):xs) | n == a = b : amigosDe n xs 
                      | n == b = a : amigosDe n xs
                      | otherwise = amigosDe n xs 


{-amigosDe "a" [("a", "b"), ("c", "a"), ("d", "e")] 
-- Resultado: ["b", "c"]-}


{-problema mediaMovilCentral (lista: seq⟨Z⟩) : seq⟨Float⟩

requiere: |lista| > 2

asegura: ⟦res⟧ = [ (promedio(lista[i], lista[i+1], lista[i+2])) para todo i que cumple 0 ≤ i < |lista| - 2 ]

Hint: la función fromIntegral permite convertir enteros en números flotantes-}

{-
promedio [1,2,3,4] = [1, 2 , 5 , 6 ] = promdio de esos numeros sumados 
-}

mediaMovilCentral :: [Int] -> [Float] 
mediaMovilCentral (x:y:z:xs) = promedio3 x y z : mediaMovilCentral (y:z:xs)
mediaMovilCentral _ = []

promedio3 :: Int -> Int -> Int -> Float
promedio3 a b c = fromIntegral (a+b+c) / 3.0 --diviendo por la cantidad de numeros 


{- Ejercicio 2 [2.5 puntos]
problema sumaFactoresPrimo (n: Z) : Bool

requiere: (n > 0)

asegura: (res = true ⟺ la suma de los factores primos (distintos o no) de n es también un número primo.)

Aclaración: los factores primos de 30 son [5, 3, 2]. Los factores primos de 9 son [3, 3].

-}

sumaFactoresPrimos :: Int -> Bool 
sumaFactoresPrimos n = esPrimo2 (sumaDescomponer (descomponer2 n 2))

sumaDescomponer :: [Int] -> Int 
sumaDescomponer [] = 0 
sumaDescomponer (x:xs) = x + sumaDescomponer xs  

esPrimo2 :: Int -> Bool 
esPrimo2 n = esPrimoDesde2 n 2

esPrimoDesde2 :: Int -> Int -> Bool 
esPrimoDesde2 n m | m*m > n = True
                  | n `mod` m == 0 = False
                  | otherwise = esPrimoDesde2 n(m+1)

descomponer2 :: Int -> Int -> [Int]
descomponer2 1 _ = []
descomponer2 n m | n `mod` m == 0 = m : descomponer2 (n `div` m) m 
                 | otherwise = descomponer2 n (m+1)

                 

{-3) Ejercicio 3 [2.5 puntos]
problema vocalDominante (texto: seq⟨Char⟩) : Char

requiere: (Si existe una letra vocal en texto, esta no lleva tilde, diéresis, ni ningún otro símbolo, pero puede ser minúscula o mayúscula.)

requiere: (Existe al menos una vocal en texto.)

asegura: (res es alguna de las vocales que más aparece en texto.)

Aclaración: La vocal A es distinta de a.

-}
{-vocalDominante ["palangana"]= a -}

--elegir vocal con mayor cantidad 

vocalDominante :: [Char] -> Char 
vocalDominante [] = '_'
vocalDominante texto = vocalConMasApariciones (contarCadaVocal (filtrarVocales texto))

--primero podemos definir que es una vocal

esVocal :: Char -> Bool 
esVocal n = n == 'a' || n == 'e' || n == 'i' || n == 'o' || n == 'u' ||
            n == 'A' || n == 'E' || n == 'I' || n == 'O' || n == 'U' 

--como debemos solo agarrar las vocales, filtramos las vocales 

filtrarVocales :: [Char] -> [Char]
filtrarVocales [] = []
filtrarVocales (x:xs) | esVocal x = x : filtrarVocales xs 
                      | otherwise = filtrarVocales xs 

contarCadaVocal :: [Char] -> [(Char,Int)]
contarCadaVocal [] = []
contarCadaVocal (x:xs) = (x, 1 + contar x xs) : contarCadaVocal (eliminar x xs)

         
--contar cuantas veces aparece  una vocal especifica 
contar :: Char ->[Char] -> Int
contar _ [] = 0 
contar c (x:xs) | c == x = 1 + contar c xs 
                | otherwise = contar c xs 
 
--eliminar caracteres repetidos
eliminar ::  Char -> [Char] -> [Char] 
elminar _ [] = []
eliminar c (x:xs) | c == x = eliminar c xs 
                  | otherwise= x : eliminar c xs 

-- encontrar vocal con mas apariciones 

vocalConMasApariciones :: [(Char,Int)] -> Char 
vocalConMasApariciones [(c,_)] = c 
vocalConMasApariciones ((c1,n1):(c2,n2):xs) | n1 >= n2 = vocalConMasApariciones ((c1,n1):xs)
                                            | otherwise = vocalConMasApariciones ((c2,n2):xs)





{-


4) Ejercicio 4 [2 puntos]
problema caracteresEnComun (palabra1: seq⟨Char⟩, palabra2: seq⟨Char⟩) : seq⟨Char⟩

requiere: (true)

asegura: (res es una secuencia de caracteres sin repetidos, que tiene todos los caracteres que palabra1 y palabra2 tienen en común.)-}

--}

{-caracteresEnComun ["Hola Chau"] = ["a"]-}

caracteresEnComun :: [Char] -> [Char] -> [Char]
caracteresEnComun [] _ = []
caracteresEnComun (x:xs) palabra2 | pertenece2 x palabra2 && not (pertenece2 x (caracteresEnComun xs palabra2)) = x : caracteresEnComun xs palabra2
                                  | otherwise = caracteresEnComun xs palabra2

pertenece2 :: Char -> [Char] -> Bool 
pertenece2 _ [] = False 
pertenece2 e (x:xs) | x == e = True 
                   | otherwise = pertenece2 e xs 

{-pertenece x palabra2: ¿el carácter x aparece en la segunda palabra?

not (pertenece x (caracteresEnComun xs palabra2)): ¿ya fue agregado en el resultado?

Si sí está en la segunda palabra y no está en el resto del resultado, entonces lo agregamos.

Si no, simplemente seguimos la recursión con el resto de la palabra1-}


{-la codificacion por sustitucion es una de las tecnicas de cifrado mas simples, en el que un caracter en el texto original
es reemplazado por otro caracter dependiendo de un mapteo. Este mapeo puede representarse con una secuencia de tuplas de 
dos caracteres, donde la primera componente de la tupla representa el caracter  original y la segunda componente
el caracter por el cual se va a sustituir. Por simplicidad, en este progrma codificaremos solo los caracteres
que aparecen en el mapeo dado. Todos los restantes caracteres quedan inalterados en el mensaje codificado -}

{-problema hayQueCodificar (c:Char,mapeo: seq(Char x Char)) : Bool {
  requiere:{No hay elementos repetidos entre las primeras componentes de mapeo
  requiere:{No hay elementos repetidos entre las segundas componentes de mapeo
  asegura:{res = true <=> c es igual a la primera componente de alguna tupla de mapeo }-}

{-mapeo = [(caracter original, caracter a sustituir)]-}

{-mapeo a [("a,h","b,h")] = true -}

hayQueCodificar :: Char -> [(Char,Char)] -> Bool 
hayQueCodificar _ [] = False 
hayQueCodificar e ((primera,segunda):xs) | e == primera = True
                                         | otherwise = hayQueCodificar e xs  

{-problema cuantasVecesHayQueCodificar (c:Char, frase: seq(Char), mapeo:seq(Char x Char)) : Z- {
  requiere:{No hay elementos repetidos entre las primeras componentes de mapeo}
  requiere:{No hay elementos repetidos entre las segundas componentes de mapeo}
  requiere: {|frase| > 0}
  requiere: {c pertenece a frase}
  asegura:{res = 0 y hayQueCodificar (c,mapeo) = false) o (res = cantidad de veces que c aparece en frase y hayQueCodificar(c,mapeo) = true)}
}                                        -}

{-cuantasVecesHayQueCodificar "a" ["barco"] [(a,h),(h,g)] = 1 -}

cuantasVecesHayQueCodificar :: Char -> [Char] -> [(Char,Char)] -> Int 
cuantasVecesHayQueCodificar _ [] [] = 0 
cuantasVecesHayQueCodificar c frase mapeo | hayQueCodificar c mapeo = cantidadDeVeces4 c frase 
                                          | otherwise = 0 

cantidadDeVeces4 :: Char -> [Char] -> Int 
cantidadDeVeces4 _ [] = 0 
cantidadDeVeces4 a (x:xs) | a == x = 1 + cantidadDeVeces4 a xs 
                          | otherwise = cantidadDeVeces4 a xs


{-problema aproboMasDeNMaterias (registro: seq⟨seq⟨Char⟩ x seq⟨Z⟩⟩, alumno:seq⟨Char⟩, n: Z) : Bool {
  requiere: {No hay nombres de alumnos repetidos en registro}
  requiere: {Las notas de registro son todas iguales o mayores a cero y menores o iguales a 10}
  requiere: {n > 0}
  requiere: {El alumno se encuentra en el registro }
  asegura: {res = true <=> el alumno tiene más de n notas de finales mayores o iguales a 4 en el registro}
}-}

{-registro = [ ("Julian", [4, 2]), ("Roman", [6, 7, 4]) ]
alumno = "Roman"
n = 2 -}

aproboMasDeNMaterias :: [(String,[Int])] -> String -> Int -> Bool 
aproboMasDeNMaterias registro alumno n | n < materiasAprobadas (darSuNota registro alumno) = True 
                                       | otherwise = False 

materiasAprobadas :: [Int] -> Int 
materiasAprobadas [] = 0 
materiasAprobadas (x:xs) | x >= 4 = 1 + materiasAprobadas xs 
                         | otherwise = materiasAprobadas xs 

darSuNota :: [(String,[Int])] -> String -> [Int]
darSuNota [] _ = []
darSuNota ((nombre,notas):xs) alumno | nombre == alumno = notas 
                                     | otherwise = darSuNota xs alumno 

{-problema buenosAlumnos (registro: seq⟨seq⟨Char⟩ x seq⟨Z⟩⟩) : seq⟨seq⟨Char⟩⟩ {
  requiere: {No hay nombres de alumnos repetidos en registro}
  requiere: {Las notas de registro son todas iguales o mayores a cero y menores o iguales a 10}
  asegura: {res es la lista de los nombres de los alumnos que están en registro cuyo promedio de notas es mayor o igual a 8 y no tiene aplazos (notas menores 
  que 4)}
}
Para resolver el promedio pueden utilizar la función del Preludio de Haskell fromIntegral que dado un valor de tipo Int devuelve su equivalente de tipo Float.-}

{-buenosAlumnos [("Julian",[4,5,6])] = 5-}

buenosAlumnos :: [(String,[Int])] -> [String]
buenosAlumnos [] = []
buenosAlumnos ((nombre,notas):xs) | promedioDeNotas notas >= 8 && noTieneAplazos notas  = nombre  : buenosAlumnos xs  
                                  | otherwise = buenosAlumnos xs      

promedioDeNotas :: [Int] -> Float 
promedioDeNotas [] = 0.0
promedioDeNotas xs = fromIntegral (sumarNotas xs) / fromIntegral (longitud xs )

sumarNotas :: [Int] -> Int 
sumarNotas [] = 0 
sumarNotas (x:xs) = x + sumarNotas xs 



noTieneAplazos :: [Int] -> Bool 
noTieneAplazos [] = True 
noTieneAplazos (x:xs) = x>=4 && noTieneAplazos xs


{-problema mejorPromedio (registro: seq⟨seq⟨Char⟩ x seq⟨Z⟩⟩) : seq⟨Char⟩ {
  requiere: {No hay nombres de alumnos repetidos en registro}
  requiere: {Las notas de registro son todas iguales o mayores a cero y menores o iguales a 10}
  requiere: {|registro| > 0 }
  asegura: {res es el nombre del alumno cuyo promedio de notas es el más alto; si hay más de un 
  alumno con el mismo promedio de notas, devuelve el nombre de alumno que aparece primero en registro}
}-}

mejorPromedio :: [(String,[Int])] -> String
mejorPromedio [x] = fst x 
mejorPromedio ((x1,x2):(y1,y2):xs) | promedioDeNotas (darSuNota ((x1,x2):(y1,y2):xs) x1) >= promedioDeNotas (darSuNota ((x1,x2):(y1,y2):xs) y1) = mejorPromedio ((x1,x2):xs)
                                   | otherwise = mejorPromedio  ((x1,x2):xs)
