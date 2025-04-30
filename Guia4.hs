
{-Implementar la funci´on fibonacci:: Integer->Integer que devuelve el i-´ esimo n´ umero de Fibonacci.
 Recordar que la secuencia de Fibonacci se define como:
 
 
 
 fib(n) =
 problema fibonacci (n: Z) : Z {
 requiere: { n ≥ 0 }
 asegura: { resultado = fib(n) }
 }
 
 
 0
 1
 si n = 0
 si n = 1
 fib(n −1)+fib(n−2) en otro caso-}

fibonacci :: Int -> Int 
fibonacci n | n == 0 = 0 
            | n == 1 = 1 
            | otherwise = fibonacci (n-1) + fibonacci (n-2)

{-EJEMPLOS-}

{-
fib 4 = fib(3) + fib(2) -> fib(2) + fib(1) + fib(2) + fib(0) -> fib(1) + fib(0) + 1 + fib(1) + fib(0) + 0 -> 1 + 0 + 1 + 1 + 0 = 3
-}


{- Implementar una funci´on parteEntera :: Float->Integer seg´ un la siguiente especificaci´on:
 problema parteEntera (x: R) : Z {
 requiere: { x ≥ 0 }
 asegura: { resultado ≤ x < resultado+1 }-}

parteEntera :: Float -> Int 
parteEntera n | n < 1 = 0 
              | otherwise = parteEntera (n-1) + 1


{-EJEMPLOS-}

{-
parteEntera 8.1 -> parteEntera 7.1 + 1 -> 7 + 1 -> 8
parteEntera 9.5 -> parteEntera 8.5 + 1 -> 8  + 1 -> 9
-}

{-Especificar e implementar la funci´on esDivisible :: Integer->Integer->Bool que dados dos n´umeros
 naturales determinar si el primero es divisible por el segundo. No est´a permitido utilizar las funciones mod ni div-}

esDivisible :: Int-> Int -> Bool 
esDivisible n m | n == 0 = True 
                | n < 0 = False 
                | otherwise = esDivisible (n-m) m 

{-EJEMPLOS-} 

{-
esDivisible 8 4 -> esDivisible 4 4 -> esDivisible 0 4 comom n llego a ser 0 vale
esDivisible 10 8 -> esDivisible 2 8 -> esDivisible -6 8, como n es negativo da false 
-}


{- Especificar e implementar la funci´on sumaImpares :: Integer->Integer que dado n ∈ N sume los primeros
 n n´ umeros impares. Por ejemplo: sumaImpares 3 
1+3+5 ⇝ 9.-}

sumaImpares :: Int -> Int 
sumaImpares n | n == 0 = 0
              | otherwise = (2*n - 1) + sumaImpares (n-1)

{-EJEMPLOS-}

{-
sumaImpares 9 = (2*9-1) + sumaImpares (9-1) -> 17 + sumaImpares 8 -> 17 + 15 + sumaImpares (8-1) -> 17 + 15 + 13 
-}

{-Implementar la funci´on medioFact :: Integer->Integer que dado n ∈ N calcula n!! = n(n−2)(n−4)···.
 problema medioFact (n: Z) : Z {
 requiere: { n ≥ 0 }
 ⌊n−1
 2 ⌋
 asegura: { resultado =
 }
 Por ejemplo:
 medioFact 10 
i=0
 (n −2i) }
 10 ∗8∗6∗4∗2 3840.
 medioFact 9 
medioFact 0 
9 ∗7∗5∗3∗1 945.
 1.-}

medioFact :: Int -> Int 
medioFact n | n <= 1 = 1
            | otherwise = n * medioFact (n-2)


{-EJEMPLOS-}

{-
medioFact 10 = 10 * medioFact 8 -> 10 * 8 * medioFact 6 -> 10 * 8 * 6 + medioFact 4 = 3840

-}

{-Implementar la funci´on todosDigitosIguales :: Integer->Bool que determina si todos los d´ ıgitos de un
 n´ umero natural son iguales, es decir:
 problema todosDigitosIguales (n: Z) : B {
 requiere: { n > 0 }
 asegura: { resultado = true ↔ todos los d´ ıgitos de n son iguales }-}

todosDigitosIguales :: Int -> Bool 
todosDigitosIguales n | n < 10 = True 
                      | otherwise = (n `mod` 10 == (n `div` 10) `mod` 10) && todosDigitosIguales (n `div` 10)

{-EJEMPLOS-}

{-
todosDigitosIguales 22 = (2 == 2) && todosDigitosIguales 2 = True 
todosDigitosIguales 10 = (1 == 0) && todosDigitosIguales 0 = False 
-}

{- Implementar la funci´on iesimoDigito :: Integer->Integer->Integer que dado un n ∈ Z mayor o igual
 a 0 y un i∈Z mayor o igual a 1 y menor o igual a la cantidad de d´ ıgitos de n, devuelve el i-´ esimo d´ ıgito de n.
 problema iesimoDigito (n: Z, i: Z) : Z {
 requiere: { n ≥ 0∧1 ≤i ≤cantDigitos(n) }
 asegura: { resultado = (n div 10cantDigitos(n)−i) mod 10 }
 }
 P´agina 1 de 3
 Compilado el 2025/04/12
problema cantDigitos (n: Z) : N {
 requiere: { n ≥ 0 }
 asegura: { n = 0 →resultado = 1}
 asegura: { n= 0 →(n div 10resultado−1 > 0∧n div 10resultado = 0) -}

eliminarPrimerDigito :: Int -> Int 
eliminarPrimerDigito n = n `mod`10 -- 10 = 0 

eliminarUltimoDigito :: Int -> Int 
eliminarUltimoDigito n = n `div`10 -- 10 = 1 

iesimoDigito :: Int -> Int -> Int 
iesimoDigito n m | m == cantDigitos n = eliminarPrimerDigito n 
                 | otherwise = iesimoDigito (eliminarUltimoDigito n) m 


cantDigitos :: Int -> Int 
cantDigitos n | n < 10 = 1 --si n tiene un solo digito para la recursion
              | otherwise = 1 + cantDigitos (n `div` 10)

{-EJEMPLOS-}

{-
cantDigitos  10 = 1 + cantDigitos 0 -> 1 + 1 = 2 
cantDigitos 123 = 1 + cantDigitos 12 -> 1 + 1 + cantDigitos 2 -> 1 + 1 + 1 -> 3 

-}

{- Especificar e implementar la funci´on sumaDigitos :: Integer->Integer que calcula la suma de d´ ıgitos de
 un n´ umero natural. Para esta funci´on pueden utilizar div y mod.-}

sumaDigitos :: Int -> Int 
sumaDigitos n | n == 0 = 0 
              | otherwise = (n `mod` 10) + sumaDigitos (n `div`10)

{-EJEMPLOS-}

{-
sumaDigitos 123 -> 3 + sumaDigitos 12 -> 3 + 2 + sumaDigitos 1 -> 3 + 2 + 1 = 6 
sumaDigitos 15 -> 5 + sumaDigitos 1 -> 5 + 1 = 6 

-}

{- Especificar e implementar una funci´on sumaPotencias :: Integer->Integer->Integer->Integer que
 dados tres naturales q,n,m sume todas las potencias de la forma qa+b con 1 ≤ a ≤ n y 1 ≤ b ≤ m-}

sumaPotencia :: Int -> Int -> Int -> Int 
sumaPotencia q n m | n == 0 = 0 
                   | m == 0 = 0 
                   | otherwise = sumaPotencia q (n-1) m + sumaPotenciasM q n m 

sumaPotenciasM :: Int -> Int -> Int -> Int
sumaPotenciasM q n m | m == 0 = 0 
                     | otherwise = q^(n+m) + sumaPotenciasM q n (m-1) 

{- Implementar una funci´on sumaRacionales :: Integer->Integer->Float que dados dos naturales n,m
 sume todos los n´ umeros racionales de la forma p/q con 1 ≤ p ≤ n y 1 ≤ q ≤ m, es decir:
 problema sumaRacionales (n : N, m : N) : R {
 requiere: { True}-}

sumaRacionales :: Int -> Int -> Float
sumaRacionales n m | n == 0 = 0 
                   | m == 0 = 0 
                   | otherwise = sumaRacionales (n-1) m + sumaRacionalesM n m 

sumaRacionalesM :: Int -> Int -> Float 
sumaRacionalesM n m | m == 0 = 0 
                    | otherwise =  sumaRacionalesM n (m-1) + (fromIntegral n / fromIntegral m)

{-Implementar menorDivisor :: Integer->Integer que calcule el menor divisor (mayor que 1) de un natural n pasado
 como par´ametro.-}

menorDivisor :: Int -> Int 
menorDivisor n = divisorDesde n 2


divisorDesde :: Int -> Int -> Int 
divisorDesde n m | n `mod`m == 0 = m 
                 | otherwise = divisorDesde n (m+1)

{-EJEMPLOS-}

{-
divisorDesde 8 4 = 8 mod 4 = 4 
divisordesde 11 5 = divisoresDesde 11 (5+1) y va probando hasta llegar al 11 11 donde 11 es el unico divisor de 11

menorDivisor 10 -> divisorDesde 10 2 = 2 (2 es el menor que divide a 10) 

-}


{-Implementar la funci´on esPrimo :: Integer->Bool que indica si un n´ umero natural pasado como par´ametro es primo-}

esPrimo :: Int -> Bool 
esPrimo n = esPrimoDesde n 2

esPrimoDesde :: Int -> Int -> Bool 
esPrimoDesde n m | m*m > n = True -- 4 2 -> 4*4 > 2 = True 
                 | mod n m == 0 = False --4 2 = son divisores, false ya que el numero solo debe dividirse por 1 y por si mismo
                 | otherwise = esPrimoDesde n (m+1) 

{-EJEMPLO-}

{-
esPrimoDesde 4 2 -> esPrimoDesde 4 (2+1) -> esPrimoDesde 4 (3+1) -> esPrimoDesde 4 4 -> False
esPrimo 3 -> esPrimoDesde 3 2 -> esPrimoDesde 3 3 -> True 
-}

{-Implementar la funci´on sonCoprimos :: Integer->Integer->Bool que dados dos n´ umeros naturales indica si no
 tienen alg´ un divisor en com´ un mayor estricto que 1.-}


coprimos :: Int -> Int -> Bool 
coprimos n m = mcd n m == 1


mcd :: Int -> Int -> Int
mcd n m | m == 0 = n 
        | otherwise = mcd m (n `mod` m)


{-Implementar una funci´on mayorDigitoPar :: Integer->Integer seg´ un la siguiente especificaci´on:
 problema mayorDigitoPar (n: N) : N {
 requiere: { True }
 asegura: { resultado es el mayor de los d´ ıgitos pares de n. Si n no tiene ning´ un d´ıgito par, entonces resultado es-1.
 }-}

mayorDigitoPar :: Int -> Int 
mayorDigitoPar n | n < 10 && esPar n = n 
                 | n < 10 = -1
                 | esPar (n `mod` 10) && (n `mod` 10) > mayorDigitoPar (n `div` 10) = (n `mod` 10)
                 | otherwise = mayorDigitoPar (n `div` 10)

esPar :: Int -> Bool 
esPar n = n `mod` 2 == 0 

{-Implementar la funci´on esSumaInicialDePrimos :: Integer->Bool seg´ un la siguiente especificaci´on:
 problema esSumaInicialDePrimos (n: Z) : B {
 requiere: { n ≥ 0 }
 asegura: { resultado = true ↔ n es igual a la suma de los m primeros n´ umeros primos, para alg´ un m.-}

{-n es la suma de los primeros m primos, para algun m 
esSumaInicialDePrimos 10 = True (2 + 3 + 5 = 10)
-}




{- Especificar e implementar la funci´on tomaValorMax :: Integer->Integer->Integer que dado un n´umero
 entero n1 ≥ 1 y un n2 ≥ n1 devuelve alg´ un m entre n1 y n2 tal que sumaDivisores(m) = m´ax{sumaDivisores(i) | n1 ≤
 i ≤n2}-}

tomarValorMax :: Int -> Int -> Int 
tomarValorMax n m = tomarValorMaxAux n n (sumaDivisores n) m 

tomarValorMaxAux :: Int -> Int -> Int -> Int -> Int 
tomarValorMaxAux a b c d | a > d = b 
                         | sumaDivisores a > c = tomarValorMaxAux (a + 1) a (sumaDivisores a) d 
                         | otherwise = tomarValorMaxAux (a + 1) b c d 




{-
devuelve el numero entre n y m con la mayor suma de divisores 
EXPLIACAION DE TOMARVALORMAX 

n1 = numero a evaluar primero
 tomarValorMaxAux n1 = mejor numero que encontre hasta ahora 
 sumaDivisores n1 = la mayor suma de divisores encontrada 
 n2 = el limite 


EXPLICACION DE TOMARVALORMAXAUX 

a = el numero a evaluar  , n1 
b = numero con la mejor suma 
c = valor de esa mejor suma de divisores
e = el umtimo numero a evaluar , osea n2 

-}

sumaDivisores :: Int -> Int 
sumaDivisores n   = sumaDivisoresDesde n 1

sumaDivisoresDesde :: Int -> Int -> Int 
sumaDivisoresDesde n m | m > n = 0
                       | n `mod` m == 0 = m + sumaDivisoresDesde n (m+1) -- si m es divisor, lo sumo
                       | otherwise = sumaDivisoresDesde n (m+1) -- sigo buscando divisores 

{-
sumaDivisoresDesde 8 4 = 8 mod 4 == 0 = 4 + sumaDivisoresDesde 8 5 -> 4 + 8 

n = numero del que queremos divisores
m = divisor que estamos probando, por ejemplo empieza desde 1
-}

