--zad 1
bin2Int :: [Int] -> Int
bin2Int list = foldl (\acc y -> 2 * acc + y) 0 list

--zad 2
insertElement :: Ord a => a -> [a] -> [a]
insertElement a [] = [a]
insertElement a (x:xs) = if a < x then a:x:xs else x: insertElement a xs
--foldl (\x y -> x-2*y) 10 [10,20,1,5] = -62

insertionSort :: Ord a => [a] -> [a]
insertionSort list = foldl (\acc y -> insertElement y acc) [] list


--zad3

sums :: [Int] -> [[Int]] -> [[Int]]
sums a [] = [a]
sums a (x:xs) = if sum a == sum x then x:xs else x: sums a xs 

diffsums :: [[Int]] -> [[Int]]
diffsums list = foldl (\acc y -> sums y acc) [] list

--zad 4
--ps "Test" = ["T","Te","Tes","Test","est","st","t"].

pref ::  [String] -> Char -> [String]
pref [] a = [[a]]
pref list a  = pref (init list) a  ++ [a:last list]    

prefix :: [Char] -> [String]
--prefix ch = foldl (\acc y -> pref y acc) [] (init ch)
prefix ch = foldr (\acc y -> pref y acc) [] (init ch)

suf :: Char -> [String] -> [String]
suf a []  = [[a]]
suf a list  = [head list ++ [a]] ++ suf a (init list)

sufix :: [Char] -> [String]
sufix ch = foldl (\acc y -> suf y acc) [] (tail ch)

--foldl (\x y -> x-2*y) 10 [10,20,1,5] = -62
--foldr (\x y -> x-2*y) 10 [10,20,1,5] = 94
--foldr (\x y -> (x+y)/2) 54 [12,4,10,6]

ps :: String -> [String]
ps a = prefix a ++ [a] ++ sufix a


--zad 5



dupa :: Char -> String -> String 
dupa a [] = []
dupa a (x:xs) = if a /= x then x:dupa a xs else []

--sep list element
sep :: Char -> String -> [String]
sep a [] = []
sep a (x:xs) = if a /= x then sep a xs else (dupa a xs) : sep a xs 

sep2 :: Char -> String -> [String]
sep2 a [] = []
sep2 a list = [dupa a list] ++ sep a list


---- 
-- sep :: a b = [tmp a b] ++ (sep (tmp2 a b) b)


--foldl update [[]] list
--update acc x | x==sep = acc ++ [[]]
--              | otherwise = init acc ++ [last acc ++ [x]]

sep3 :: String -> Char -> [String]
sep3 list sepa = foldl (\acc x -> update acc x) [[]] list where
    update acc x
        | x == sepa = acc ++ [[]]
        | otherwise = init acc ++ [last acc ++ [x]]
    
    
