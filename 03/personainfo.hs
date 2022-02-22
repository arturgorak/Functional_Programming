data PersonalInfo = PI String String Integer

-- typ przechowyjacy informacje nt. osoby: imie nazwisko oraz rok urodzenia.

instance Eq PersonalInfo where
  (==) (PI name1 surname1 age1) (PI name2 surname2 age2) = if name1 == name2 && surname1 == surname2 && age1 == age2 then True else False 



instance Show PersonalInfo where 
  show (PI name1 surname1 age1) = "Imie: " ++ show name1 ++ " Nazwisko: " ++ show surname1 ++ " Wiek: " ++ show age1 
