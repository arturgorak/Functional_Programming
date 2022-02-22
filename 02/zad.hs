--zad1
allSeq :: Int -> [[Int]]
allSeq n = allSeqPreq n [[]]
    where
        allSeqPreq 0 list = list
        allSeqPreq n list = allSeqPreq (n-1) (ones list ++ zeros list)
        zeros list = map (\x -> 0:x) list
        ones list = map (\x -> 1:x) list



-- allSeq :: Int -> [[Int]]
-- allSeq 1 = [[1], [0]]
-- allSeq n = addZero ++ addOne
--     where
--         addZero = map (\x -> 1:x) (allSeq (n-1))
--         addOne = map (\x -> 0:x) (allSeq (n-1))

--zad2

--x2 − 2y2 = z5

--solve :: Int -> [(Int,Int,Int)] 
--solve n = [(x,y,z) |x <- [1..n], y <- [1..n], z <- [1..n], x * x + 2 * y * y == z * z * z * z * z, even x, even y, even z]

--zad3
divisors :: Int -> [Int]
divisors n = [x | x <- [1..n], n `mod` x == 0]

-- perfects :: Int -> [Int]
-- perfects  = []
-- perfects n = if sum (divisors n) == 2 * n then n : perfects (n-1) else perfects (n-1)

--zad4

dupa :: Int -> Int -> [Int] -> [[Int]]
dupa (-1) a list = []
dupa len a list = (take len list ++ [a] ++ drop len list) : dupa (len - 1) a list


tmp :: [[Int]] ->[[Int]]
tmp [[]] = [[1]]
tmp [] = []
tmp (x:xs) = dupa (length x) (length x + 1) x ++ tmp xs

perm :: Int -> [[Int]]
perm 1 = [[1]]
perm n = tmp (perm (n-1))

-- perm :: Int -> [[Int]]
-- perm 1 = [[1]]
-- perm n = [take (x-1) list ++ [n] ++ drop (x-1) list | x<-[1..n], list<-listOfLists]
--     where listOfLists = perm (n-1)

--zad 5

delDevs :: Int -> [Int] -> [Int]
delDevs _ [] = []
delDevs a (x:xs) = if x `mod` a == 0 then delDevs a xs else x : delDevs a xs

erast :: [Int] -> [Int]
erast [] = []
erast (x:xs) = x:erast (delDevs x xs) 

prime :: Int -> [Int]
prime n = erast [2..n]

--zad domowe
--a - liczba 
-- e - dokładność

--iterate f x0
--squareRoot :: Double -> Double -> Double

--x0 = a
-- xn+1 = 0.5 * (xn + a/xn)

dokladnosc :: Double -> [Double] -> Double
dokladnosc _ [a] = a
dokladnosc a (x:xs) = if abs (x - head xs) < a then head xs else dokladnosc a xs  

squareRoot :: Double -> Double -> Double
squareRoot a e = dokladnosc e (iterate tmp2 a) 
    where tmp2 x = 0.5 * (x + a/x)


----------------
h :: String -> String 
h "" = ""
h "a" = "ab"
h "b" = "ba"
h (x:xs) = h [x] ++ h xs

--aktualna
--oczekiwana
h2 :: Int -> Int -> String -> String 
h2 a b str = if 2 * a < b then h2 (2 * a) b (h str) else str

thueMorse :: Int -> String 
thueMorse n = h2 1 n "a" 
