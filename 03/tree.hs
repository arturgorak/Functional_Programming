data Tree a = Empty | Node a (Tree a) (Tree a)

isEmpty :: Tree a -> Bool
isEmpty Empty = True
isEmpty _ = False 

size :: Tree a -> Int
size Empty = 0
size (Node a b c) = 1 + size b + size c

depth :: Tree a -> Int
depth Empty = 0
depth (Node a b c) = if depth b > depth c then 1 + depth b else 1 + depth c

--depth  (Node 1 (Node 2 Empty (Node 3 Empty Empty)) Empty)
