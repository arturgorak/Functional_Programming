data Calkowite = Zero | Poprzednik Calkowite | Nastepnik Calkowite deriving Show

toInt :: Calkowite -> Int
toInt Zero = 0
toInt (Poprzednik a) = (-1) + toInt a
toInt (Nastepnik a) = 1 + toInt a

--toInt (Nastepnik(Nastepnik(Nastepnik Zero)))

intToCalkowite :: Int -> Calkowite
intToCalkowite 0 = Zero
intToCalkowite a = if a > 0 then Nastepnik (intToCalkowite (a-1)) else Poprzednik (intToCalkowite (a+1))
 --intToCalkowite 3