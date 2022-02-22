--zad 4


horner :: [Int] -> Int -> Int
horner list x0 = foldl (\acc y -> x0 * acc + y) 0 list

--horner [1,3,0,1,(-3)] (-2)

--zad 5

dodaj::(Ord a) => a -> [(a, Int)] -> [(a, Int)]
dodaj a [] = [(a, 1)]
dodaj a (x:xs) = if a == fst x then [(a, (snd x) + 1)] ++ xs else x: dodaj a xs


freq :: (Ord a) => [a] -> [(a,Int)]
freq xs = foldr dodaj [] xs

-- freq "alamakota" =
-- [(’a’,4),(’l’,1),(’m’,1),(’k’,1),(’o’,1),(’t’,1)].
--[('a',4),('t',1),('o',1),('k',1),('m',1),('l',1)]

--zad 6
insertElement :: Ord a => a -> [a] -> [a]
insertElement a [] = [a]
insertElement a (x:xs) = if a < x then a : x : xs else x: insertElement a xs

insertionSort :: Ord a => [a] -> [a]
insertionSort list = foldl (\acc y -> insertElement y acc) [] list

--foldr (\x y -> x-2*y) 10 [10,20,1,5] = 94

--zad domowe
data Complex = Complex Double Double 

instance Show Complex 
    where show (Complex a i) = show a ++ "+" ++ show i ++ "*I"

instance Num Complex where
    (Complex a b) + (Complex c d) = Complex (a+c) (b+d)
    (Complex a b) - (Complex c d) = Complex (a-c) (b-d)
    (Complex a b) * (Complex c d) = Complex (a * c - b * d) (a * d - b * c)
    signum (Complex a b) = Complex (signum a) 0
    abs (Complex a b) = Complex (sqrt (a * a + b * b)) 0
    fromInteger a = Complex (fromIntegral a) 0


--data Complex = Complex Double Double

 
