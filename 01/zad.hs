

sumSeq :: Int -> (Int -> Int) -> Int
sumSeq 1 fun = fun 1
sumSeq a fun = fun a + sumSeq (a - 1) fun

tmp :: Int -> Int
tmp a = a


stirling :: Int -> Int -> Int
stirling 0 0 = 1
stirling _ 0 = 0
stirling 0 _ = 0
stirling n k = k * stirling (n - 1) k + stirling (n - 1) (k - 1)


bell :: Int -> Int
bell x = sumSeq x funk
    where funk b = stirling x b

-------------------------------------------------------------
maksimum :: [Int] -> Int
maksimum [a] = a
maksimum [a, b] = if a > b then a else b
maksimum (x:xs) = if x > maksimum xs then x else maksimum xs


sumPosNeg :: [Int] -> (Int,Int)
sumPosNeg [] = (0, 0)
sumPosNeg [a] = if a > 0 then (a, 0) else (0, a)
sumPosNeg (x:xs) = if x > 0 then (fst (sumPosNeg xs) + x, snd (sumPosNeg xs)) else (fst (sumPosNeg xs), snd (sumPosNeg xs) + x)

commonPrefix :: String -> String -> String
commonPrefix _ "" = ""
commonPrefix "" _ = ""
commonPrefix (x:xs) (y:ys) = if x == y then x: commonPrefix xs ys else ""

int2Bin :: Int -> [Int]
int2Bin 0 = [0]
int2Bin 1 = [1]
int2Bin a = int2Bin (a `div` 2) ++ [a `mod` 2]

bin2Int :: [Int] -> Int
bin2Int [0] = 0
bin2Int [1] = 1
bin2Int list = last list + 2 * bin2Int (init list) 

merge :: [Int] -> [Int] -> [Int]
merge [] a = a
merge a [] = a
merge a b = if head a < head b then head a : merge (tail a) b else head b : merge a (tail b) 

mergeSort :: [Int] -> [Int]
mergeSort [] = []
mergeSort [a] = [a]
mergeSort list = merge (mergeSort(take (length list `div` 2) list)) (mergeSort(drop (length list `div` 2) list))

add0And1 :: [[Int]] -> [[Int]]
add0And1 [[]] = [[0],[1]]
add0And1 [] = []
add0And1 (x:xs) = [0:x] ++ [1:x] ++ add0And1 xs
  
funk :: [[Int]] -> Int -> [[Int]]
funk a 0 = a
funk a n = funk (add0And1 a) (n-1) 


allBin :: Int -> [[Int]]
allBin a = funk [[]] a 

-------------

addDiv :: Int -> Int -> Int 
addDiv a 0 = 0
addDiv a b = if a `mod` b == 0 then b + addDiv a (b-1) else addDiv a (b-1)


divisorsSum :: Int -> Int 
divisorsSum a = addDiv a a 