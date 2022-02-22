data BST a = Empty | Node a (BST a) (BST a) deriving Show

insertElement :: Ord a => a -> BST a -> BST a
insertElement a Empty = Node a Empty Empty
insertElement a (Node b c d) = if a < b then Node b (insertElement a c) d else Node b c (insertElement a d)

makeTree :: Ord a => [a] -> BST a
makeTree [] = Empty
makeTree [a] = Node a Empty Empty
makeTree list = foldl (\acc y -> insertElement y acc) Empty list

--makeTree [3,21,4,5,2,1]

--horner f x0


fullSize :: Ord a => BST a -> Int 
fullSize Empty = 0
fullSize (Node a b c) = 1 + fullSize b + fullSize c


subSize :: Ord a => a -> BST a -> Int
subSize _ Empty = 0
subSize a (Node b c d)
    | a < b = subSize a c 
    | a > b = subSize a d
    | otherwise = fullSize c + fullSize d + 1
