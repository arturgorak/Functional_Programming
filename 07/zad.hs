-- zad 1
-- powers :: Int -> Int
-- powers 1 = 1
-- powers n = (n * n) + powers (n - 1)

-- main :: IO ()
-- main = do
--          putStrLn "Proszę podać liczbę: "
--          str<-getLine
--          putStrLn (show( powers (read str::Int) ))

-- zad 2

-- displayList :: [Integer] -> IO ()
-- displayList [] = return ()
-- displayList (x:xs) = do
--                         putStrLn (show(x * x))
--                         displayList xs
-- main :: IO ()
-- main = do
--     putStrLn "Podaj liczbe: "
--     str<-getLine
--     displayList [1..(read str)]

-- zad 3
-- import System.IO
-- import System.Environment    -- importujemy ten modul po to, aby skorzystac z funkcji getArgs
 
-- linecount :: Handle -> IO Int
-- linecount handle = do
--         eof<-hIsEOF handle
--         if eof then return 0 
--         else 
--             do
--             line<-hGetLine handle
--             n <- linecount handle
--             return (n+1)
 
-- main :: IO ()        
-- main = do
--            (firstArg:_) <-getArgs
--            fileHandle <-openFile firstArg ReadMode
--            n <- linecount fileHandle
--            print n
--            hClose fileHandle  

-- zad 4
-- import System.Environment
-- import System.IO

-- allTexts 0 = []
-- allTexts 1 = ["a", "b"]
-- allTexts n = ['a' : x | x <- shorter] ++ ['b' : x | x <- shorter]
--     where
--         shorter = allTexts (n - 1)

-- palindromes n = filter (\x -> x == reverse x) (allTexts n)

-- write :: Handle -> [String] -> IO ()
-- write file [] = return ()
-- write file (x : xs) = do
--     hPutStrLn file x
--     write file xs

-- palin :: Int -> String -> IO ()
-- palin n file = do
--     file <- openFile file WriteMode
--     write file (palindromes n)
--     hClose file
--     return ()

-- main :: IO ()
-- main = do
-- (n : fileName : _) <- getArgs
-- palin (read n) fileName

-- zad domowe 1 
-- import System.IO ()
-- import System.Environment ()


-- addNum :: Int -> IO Int
-- addNum n = do
--     a <- getLine
--     if (read a :: Int) == 0 then return n else addNum (n + (read a :: Int))

-- main :: IO ()
-- main = do
--   --  addNum 0 >>= print
--     n <- addNum 0
--     print n
   