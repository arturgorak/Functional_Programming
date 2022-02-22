--zad 1
-- f = filter (\x -> x >5)
-- f = filter (\x -> (>5) x)
-- f = filter (>5)

-- g = map (/5)
-- g list = map (x -> x/5) list
-- g = map (x -> x/5)
-- g = map (/x -> (/5) x)
-- g = map (/5)

--zad 2
-- nonZero :: [Int] -> Int
-- nonZero list = length((filter (\x -> x /= 0)) list)
-- nonZero list = length(filter (/= 0) list)
-- nonZero  = length.filter (/= 0)

-- zad 3
-- m x list = map (\y->y*x) list
-- m x = map (\y -> y * x)
-- m x = map (\y -> (*x) y)
-- m x = map (*x)
-- m x = (map.(*)) x
-- m = map.(*) 

 -- zad 4
-- d :: [Double] -> Double -> [Double]
-- d list x = map (\y->y/x) list
-- d list x = map (\y -> (/) y x) list
-- d list x = flip g list x 
--     where g x list = map (\y -> (/) y x) list
-- d = flip g
--     where g x = map (\y -> (/) y x)
-- d = flip g
--      where g x = map (\y -> flip (/) x y)
-- d = flip g
--      where g x = map (flip (/) x)
-- d = flip g
--      where g x = map (/ x)
-- d = flip g
--      where g x = map (flip (/) x)
-- d = flip g
--      where g x = (map.(flip (/))) x
-- d = flip (map.flip (/))

-- zad 5 
-- wiekszeod l a =[x | x<-l,x>a]
-- wiekszeod l a = filter (> a) l
-- wiekszeod l a = flip g l a
--     where g a l =  filter (> a) l  
-- wiekszeod l = flip g l
--     where g a = filter (flip (>) a)
-- wiekszeod  = flip g
--     where g  = filter.flip (>)
-- wiekszeod = flip (filter . flip (>))

-- zad 6
-- f :: Ord a=>[(a,a)]->[(a,a)]    
-- f (x:xs) = if uncurry (<) x then x : f xs else []