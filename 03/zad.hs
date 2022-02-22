--zad1

remove :: (Ord a) => a -> [a] -> [a]
remove _ [] = []
remove a (x:xs) = if a == x then remove a xs else x:remove a xs

pivot :: (Ord a) => a -> [a] -> [a]
pivot a [] = [a]
pivot a (x:xs) = if x < a then x : pivot a xs else pivot a xs ++ [x]

qsort :: (Ord a) => [a] -> [a]
qsort [] = []
qsort [a] = [a]
qsort (x:xs) = pivot x (qsort xs)

--zad2


