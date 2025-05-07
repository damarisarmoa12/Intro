{- problema mediaMovilN (lista: seq⟨Z⟩, n: Z) : Float {
--   requiere: {|lista| > 0}
--   requiere: {n > 0 ∧ n ≤ |lista|}
--   asegura: {res es el promedio de los últimos n elementos de lista}
-- }-}

{-mediaMovilN [1,2,3,4,5] 2 = 4.5-}
mediaMovilN :: [Int] -> Int -> Float 
mediaMovilN [] _ = 0.0
mediaMovilN (x:xs) n = promedio (ultimoN xs n)

ultimoN :: [Int] -> Int -> [Int]
ultimoN [] _ = []
ultimoN (x:xs) n | n >= longitud (x:xs) = (x:xs) 
                 | otherwise = ultimoN xs n

promedio :: [Int] -> Float
promedio xs = fromIntegral (suma xs) / fromIntegral (longitud xs) 

longitud :: [Int] -> Int 
longitud [] = 0 
longitud (x:xs) = 1 + longitud xs 

suma :: [Int] -> Int 
suma [] = 0 
suma (x:xs) = x + suma xs 


{-problema esAtractivo (n: Z) : Bool {
--   requiere: {n > 0}
--   asegura: {res = true <=> la cantidad de factores primos de n (distintos o no) es también un número primo.}
-- }
-- Aclaración: los factores primos de 30 son [5,3,2]. Los factores primos de 9 son [3,3].-}

esAtractivo :: Int -> Bool 
esAtractivo n = esPrimo (longitud (descomponer n 2))

esPrimo :: Int -> Bool 
esPrimo n = esPrimoDesde n 2

esPrimoDesde :: Int -> Int -> Bool  
esPrimoDesde n m | m*m > n = True 
                 | n `mod` m == 0 = False 
                 | otherwise = esPrimoDesde n (m+1)

descomponer :: Int -> Int -> [Int]
descomponer 1 _ = []
descomponer n m | n `mod` m == 0 = m : descomponer (n `div` m) m 
                | otherwise = descomponer n (m+1)


{-problema palabraOrdenada (palabra: seq⟨Char⟩) : Bool {
--   requiere: {True}
--   asegura: {res = true <=> cada uno de los elementos no blancos de palabra es mayor o igual al anterior caracter no blanco, si existe alguno.}
-- }
-- Aclaración: 'a' < 'b' es True.-}

palabraOrdenada :: [Char] -> Bool 
palabraOrdenada [] = True 
palabraOrdenada (x:xs) = palabraOrdenadaAux (quitarBlancos xs)

palabraOrdenadaAux :: [Char] -> Bool 
palabraOrdenadaAux [] = True
palabraOrdenadaAux (x:y:xs) | x <= y = palabraOrdenadaAux (y:xs)
                            |   otherwise = False 


quitarBlancos :: [Char] -> [Char] 
quitarBlancos [] = []
quitarBlancos (x:xs) | x == ' ' =  quitarBlancos  xs
                     | otherwise = x : quitarBlancos xs  

{-problema similAnagrama (palabra1: seq⟨Char⟩, palabra2: seq⟨Char⟩) : Bool⟩{
--   requiere: {True}
--   asegura: {res = true <=> (para todo caracter no blanco, la cantidad de apariciones de ese caracter en palabra1 es igual a la cantidad de apariciones en palabra2, y además existe al menos un caracter en palabra1 que tiene una posición distinta en palabra2)}
-- }-}

similAnagrama :: [Char] -> [Char] -> Bool 
similAnagrama palabra1 palabra2 = mismasApariciones palabra1 palabra2 && distintasPosiciones palabra1 palabra2

mismasApariciones :: [Char] -> [Char] -> Bool
mismasApariciones [] _ = True
mismasApariciones (x:xs) ys
  | cantidadAparicionesPalabras (x:xs) x == cantidadAparicionesPalabras ys x = 
      mismasApariciones (quitarTodas x xs) ys
  | otherwise = False

cantidadAparicionesPalabras :: [Char] -> Char -> Int 
cantidadAparicionesPalabras [] _ = 0 
cantidadAparicionesPalabras (x:xs) n 
  | x == n    = 1 + cantidadAparicionesPalabras xs n
  | otherwise = cantidadAparicionesPalabras xs n
  {-banana "a" = 3-}

distintasPosiciones :: [Char] -> [Char] ->Bool
distintasPosiciones [] [] = False 
distintasPosiciones (x:xs) (y:ys) | x /= y = False 
                                  | otherwise = distintasPosiciones xs ys 

quitarTodas :: Char -> [Char] -> [Char]
quitarTodas _ [] = []
quitarTodas n (x:xs) | n == x = quitarTodas n xs
                     | otherwise = x : quitarTodas n xs 

{-Implementar la funci´on maximo :: Tablero->Int
problema maximo (t: Tablero) : Z {
requiere: {El tablero t es un tablero bien formado, es decir, la longitud de todas las filas es la misma, y tienen al
menos un elemento}
requiere: {Existe al menos una columna en el tablero t }
requiere: {El tablero t no es vac´ ıo, todos los n´ umeros del tablero son positivos, mayor estricto a 0}
asegura: {res es igual al n´ umero m´as grande del tablero t}-}

maximo :: [[Int]] -> Int 
maximo [] = 0 
maximo (x:xs) = comparar (maximoElemento x) (maximo xs)

maximoElemento :: [Int] -> Int 
maximoElemento [] = 0 
maximoElemento [x] = x
maximoElemento (x:y:xs) | x > y = x  
                        | otherwise = maximoElemento xs
comparar :: Int -> Int -> Int
comparar a b | a > b = a 
             | otherwise = b

{- problema masRepetido (t: Tablero) : Z {
 requiere: {El tablero t es un tablero bien formado, es decir, la longitud de todas las filas es la misma, y tienen al
 menos un elemento}
 requiere: {Existe al menos una columna en el tablero t }
 requiere: {El tablero t no es vac´ ıo, todos los n´ umeros del tablero son positivos, mayor estricto a 0}
 asegura: {res es igual al n´ umero que m´as veces aparece en un tablero t. Si hay empate devuelve cualquiera de ellos}-}

masRepetido :: [[Int]] -> Int 
masRepetido [] = 0 
masRepetido (x:xs) = masRepetidoAux (aplanar (x:xs))

masRepetidoAux :: [Int] -> Int 
masRepetidoAux [] = 0 
masRepetidoAux (x:y:xs) | contarVeces x (x:y:xs) >= contarVeces y (x:y:xs) = masRepetidoAux (x:xs) 
                        | otherwise = masRepetidoAux xs 

contarVeces :: Int -> [Int] -> Int 
contarVeces _ [] = 0 
contarVeces n (x:xs) | n == x = 1 + contarVeces n xs 
                     | otherwise = contarVeces n xs 

aplanar :: [[Int]] -> [Int]
aplanar [] = []
aplanar (x:xs) = x ++ aplanar xs 
