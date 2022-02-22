import System.IO
import System.Environment


-- func :: Handle -> [Integer] -> IO [Integer]
-- func handle list = do
--         eof<-hIsEOF handle
--         if eof then return list
--           else do
--             line<-hGetLine handle
--             func handle (list ++ [read line :: Integer])

-- readFileToList :: Handle -> IO [Integer]
-- readFileToList handle = func handle []

readFileToList :: Handle -> IO [Integer]
readFileToList fileHandle = do
   eof <- hIsEOF fileHandle
   if eof then return []
          else do line <- hGetLine fileHandle
                  rest <- readFileToList fileHandle
                  let num = read line ::Integer
                  return (num:rest)




writeListToFile :: [Integer] -> Handle->IO ()
writeListToFile [] handle = return ()
writeListToFile (x:xs) handle = do
  hPrint handle x
  writeListToFile xs handle




main = do
          (inFileName:outFileName:rest) <-getArgs
          inFileHandle <-openFile inFileName ReadMode
          outFileHandle <-openFile outFileName WriteMode
          list<-readFileToList inFileHandle
          writeListToFile (qsort list) outFileHandle
          hClose inFileHandle
          hClose outFileHandle


qsort :: [Integer] -> [Integer]
qsort [] = []
qsort (x:xs) = qsort left ++ [x]++ qsort right
  where
     left = [y|y<-xs,y<=x]
     right = [y|y<-xs,y>x]
     
     
--Funkcja zapisujaca liste do pliku





          