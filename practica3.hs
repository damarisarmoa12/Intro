import GHC.Base (BCO)
{- Implementar la funcion parcial f:: Int -> Int definida por extension de la siguiente manera 

f(1) = 8
f(4) = 131
f(16)= 16

cuya especificacion es 

problema f (n: Z) : Z {
requiere: {n = 1 ∨ n = 4 ∨ n = 16}
asegura: {(n = 1 → result = 8) ∧ (n = 4 → result = 131) ∧ (n = 16 → result = 16)}
}
-}

f :: Int -> Int 
f 1 = 8 
f 4 = 131
f 16 = 16 

{- Ejercicio 2 

Absoluto : calculo el valor absoluto de un numero-}

absoluto :: Int -> Int 
absoluto n | n >= 0 = n 
           | n < 0 = -n 
--si n es mayor o igual a 0 la funcion devolvera n como el mayor absoluto, si n es menor que 0 devuelve su numero negativo

--maximoabsoluto : devuelve el maximo entre el valor abnsoluto de dos numeros enteros 

maximoAbsoluto :: Int -> Int -> Int 
maximoAbsoluto x y | absoluto x >= absoluto y = absoluto x 
                   | absoluto x <= absoluto y = absoluto y 

--maximo3 : devuelve el maximo entre tres numeros enteros 

maximo3 :: Int -> Int -> Int -> Int
maximo3 x y z | x >= y && x >= z = x 
              | y >= x && y >= z = y 
              | z >= y && z >= x = z 

--algunoEs0: dados dos n´umeros racionales, decide si alguno de los dos es igual a 0 (hacerlo dos veces, una usando pattern matching y otra no)

algunoEs0 :: Float -> Float -> Bool
algunoEs0 x y | x == 0 = True
              | y == 0 = True 
              | otherwise = False 

--mismoIntervalo: dados dos n´umeros reales, indica si est´an relacionados considerando la relaci´on de equivalencia en R
--cuyas clases de equivalencia son: (−∞, 3],(3, 7] y (7, ∞), o dicho de otra forma, si pertenecen al mismo intervalo.

mismoIntervalo :: Int -> Int -> Bool
mismoIntervalo x y | x <= 3 && y <= 3 = True 
                   | x > 3 && y <= 7 = True 
                   | x > 7 && y > 7 = True 
                   | otherwise = False 

--sumaDistintos:  que dados tres n´umeros enteros calcule la suma sin sumar repetidos (si los hubiera)

sumaDistintos :: Int -> Int -> Int -> Int 
sumaDistintos x y z | x /= y && x /= z = x + y + z 
                    | x == y && x /= z = x + z 
                    | x == z && x /= y = x + y
                    | y == x && y /= z = y + z 
                    | otherwise = 0 

-- esMultiploDe:  dados dos n´umeros naturales, decidir si el primero es m´ultiplo del segundo 

esMultiploDe :: Int -> Int -> Bool
esMultiploDe x y | x `mod` y == 0 = True 
                 | otherwise = False 

-- digitoUnidades: dado un numero entero, extrae su digito de las unidades 

digitoUnidades :: Int -> Int 
digitoUnidades x = x `mod` 10 

--digitoDecenas: dado un numero entero, extrae su digito de decenas 

digitoDecenas :: Int -> Int 
digitoDecenas x = digitoUnidades (x `div` 10) 

{- Ejercicio 4

prodInt : calcula el producto interno entre dos tuplas R x R-}

prodInt :: (Float, Float) -> (Float, Float) -> Float
prodInt (a,b)(c,d) = a * c + b * d 

-- todoMenor :  dadas dos tuplas R×R, decide si es cierto que cada coordenada de la primera tupla es menor a la coordenada correspondiente de la segunda tupla

todoMenor :: (Float, Float) -> (Float, Float) -> Bool
todoMenor (a,b) (c,d) | a < c && b < d = True
                      | otherwise = False 

-- distanciaPuntos : calcula la distancia entre dos puntos de R2 

distanciaPuntos :: (Float, Float) -> (Float, Float) -> Float
distanciaPuntos (a,b) (c,d) = sqrt ((a - b)^2 + (c - d)^2)

-- sqrt es la raiz cuadrada 

--sumaTerna : dada una terna de enteros, calcula la suma de sus tres elementos 

sumaTerna :: (Int, Int, Int) -> Int 
sumaTerna (a,b,c) = a + b + c 

-- posPrimerPar : dada una terna de enteros, devuelve la posicion del primer numero par si es que hay alguno , y devuelve 4 si son todos pares 

posPrimerPar :: (Int, Int, Int) -> Int 
posPrimerPar (x,y,z) | mod x 2 == 0 = 0 
                     | mod y 2 == 0 = 1 
                     | mod z 2 == 0 = 2 
                     | otherwise = 4

--crearPar :: a -> b - (a,b): crea un par a partir de sus dos componentes dadas pos separado 

crearPar :: a -> b -> (a,b) 
crearPar a b = ((a),(b))

-- invertir ::  (a,b) -> (b,a): invierte los elementos del par pasado como parametro 

invertir :: (a,b) -> (b,a) 
invertir (a,b) = (b,a)

{- ejercicio 5

problema todosMenores (t : Z × Z × Z) : Bool {
requiere: {T rue}
asegura: {(res = true) ↔ ((f(t0) > g(t0)) ∧ (f(t1) > g(t1)) ∧ (f(t2) > g(t2)))}
}
-}

todosMenores :: (Int, Int, Int) -> Bool
todosMenores (a,b,c) = f(a) > g(a) && f(b) > g(b) && f(c) > g(c)

{-problema f (n: Z) : Z {
requiere: {T rue}
asegura: {(n ≤ 7 → res = n
2
) ∧ (n > 7 → res = 2n − 1)}
}-}

f3 :: Int -> Int
f3 n | n <= 7 = n^2
    | n > 7 = 2*n -1

{-problema g (n: Z) : Z {
requiere: {T rue}
asegura: {Si n es un n´umero par, entonces res = n/2, en caso contrario, res = 3n + 1}
}
-} 

g :: Int -> Int 
g n | n `mod` 2 == 0 = n `div` 2
    | otherwise = 3*n + 1 

{-Ejercicio 6. Programar una funci´on bisiesto :: Integer ->Bool seg´un la siguiente especificaci´on:
problema bisiesto (a˜no: Z) : Bool {
requiere: {T rue}
asegura: {res = f alse ↔ a˜no no es m´ultiplo de 4 o a˜no es m´ultiplo de 100 pero no de 400}
}-}

bisiesto :: Int -> Bool
bisiesto año | mod año 100 == 0 && mod año 400 == 0 = True
             | mod año 4 == 0 && mod año 100 /= 0 = True 
             | otherwise = False 

