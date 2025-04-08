--absoluto: calcula el valor absoluto de un n´umero entero.

absoluto :: Int -> Int 
absoluto n = abs n 

--maximoAbsoluto: devuelve el m´aximo entre el valor absoluto de dos n´ umeros enteros.

maximoAbsoluto :: Int -> Int -> Int 
maximoAbsoluto n m | abs n >  abs m = abs n
                   | otherwise = abs m 

--maximoAbsoluto 4 = 4 

--maximo3: devuelve el m´aximo entre tres n´ umeros enteros.

maximo3 :: Int -> Int -> Int -> Int
maximo3 n m h | n > m && n > h = n 
              | m > n && m > h = m 
              | otherwise = h 

--maximo3 7 5 9 = 9 
--maximo3 8 10 12 = 12 
--maximo3 9 10 1 = 10 

--algunoEsCero: dados dos n´ umeros racionales, decide si alguno es igual a 0 (resolverlo con y sin pattern matching).

algunoEsCero :: Float -> Float -> Bool 
algunoEsCero n m | n == 0 = True
                 | m == 0 = True 
                 | otherwise = False 

--algunoEsCero 1 0 = True
--algunoEsCero 4 5 = False 


--ambosSonCero: dados dos n´ umeros racionales, decide si ambos son iguales a 0 (resolverlo con y sin pattern matching)
ambosSonCero :: Float -> Float -> Bool 
ambosSonCero n m | (n == 0) && (m == 0) = True 
                 | otherwise = False 

--ambosSonCero 0 0 = True
--ambosSonCero 4 5 = False
--ambosSonCero 0 4 = False 

--sumaDistintos: que dados tres n´ umeros enteros calcule la suma sin sumar repetidos (si los hubiera).

sumaDistintos :: Int -> Int -> Int -> Int
sumaDistintos a b c | (a /= b) && (a /= c) = a + b + c 
                    | (a == b) && (a == c) = a 
                    | (b == a) && (b == a) = b 
                    | (c == a) && (c /= b) = c 
                    | otherwise = 0 

-- esMultiploDe: dados dos n´ umeros naturales, decide si el primero es m´ ultiplo del segundo.

esMultiploDe:: Int -> Int -> Bool 
esMultiploDe n m | mod n m == 0 = True 
                 | otherwise = False 

--esMultiploDe 10 5 = True 
--esMultiploDe 10 4 = False 

--digitoUnidades: dado un n´ umero entero, extrae su d´ ıgito de las unidades.

digitoUnidades :: Int -> Int 
digitoUnidades n = mod n 10 

--digitoUnidades 15 = 5
--digitoUnidades 16 = 6 

--digitoDecenas: dado un n´ umero entero mayor a 9, extrae su d´ ıgito de las decenas. 

digitoDecena :: Int -> Int 
digitoDecena n = mod n 100

--digitoDecena 105 = 5 

--Implementar una funci´on estanRelacionados :: Integer-> Integer-> Bool
-- problema estanRelacionados (a : Z,b : Z) : Bool {
-- requiere: {a= 0∧b= 0}
-- asegura: {(res = true) ↔ (a∗a+a∗b∗k = 0 para alg´ un k ∈ Z con k= 0)}
--Por ejemplo:
-- estanRelacionados 8 2 ⇝ True porque existe k = −4 tal que 82 +8×2×(−4) = 0
-- estanRelacionados 7 3 ⇝ False porque no existe un k entero tal que 72 +7×3×k = 0

estanRelacionados :: Int -> Int -> Bool 
estanRelacionados a b | a == 0 = True 
                      | mod (a^2) (a*b) == 0 = True 
                      | otherwise = False

-- productoInterno: calcula el producto interno entre dos tuplas de R × R.

productoInterno :: (Float, Float) -> (Float, Float) -> Float
productoInterno (a,b) (d,e) = a*d + b*e