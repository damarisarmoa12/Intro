{- problema mediaMovilN (lista: seq⟨Z⟩, n: Z) : Float {
--   requiere: {|lista| > 0}
--   requiere: {n > 0 ∧ n ≤ |lista|}
--   asegura: {res es el promedio de los últimos n elementos de lista}
-- }-}

{-mediaMovilN [1,2,3,4,5] 2 = 4.5-}

mediaMovilN :: [Int] -> Int -> Float 
mediaMovilN [] _ = 0.0
mediaMovilN (x:xs) n | n > 0 && n <= (x:xs) = promedio (ultimo n xs)

--hago una funcion para sacar los ultimos elementos de una lista 

ultimo :: [Int] -> Int
ultimo [x] = x 
ultimo (x:xs) = ultimo xs

--promero calculo el promedio entre dos numeros

promedio :: Int -> Int -> Float
promedio a b = (fromIntegral a) / (fromIntegral b)