data State = S0 | S1 | S2 | S3 | S4 | S5 | S6 | S7 | S8 | S9 |S10


percorrer :: State -> String -> Bool
percorrer S0 ('a':xs) = percorrer S1 xs
percorrer S0 ('b':xs) = percorrer S2 xs
percorrer S1 ('a':xs) = percorrer S2 xs
percorrer S1 ('c':xs) = percorrer S0 xs
percorrer S2 ('c':xs) = percorrer S3 xs
percorrer S3 ('c':xs) = percorrer S4 xs
percorrer S4 ('b':xs) = percorrer S3 xs
percorrer S4 ('c':xs) = percorrer S5 xs
percorrer S5 ('b':xs) = percorrer S8 xs
percorrer S5 ('c':xs) = percorrer S6 xs
percorrer S6 ('a':xs) = percorrer S8 xs
percorrer S6 ('b':xs) = percorrer S7 xs
percorrer S7 ('b':xs) = percorrer S9 xs
percorrer S8 ('b':xs) = percorrer S10 xs
percorrer S9 ('c':xs) = percorrer S8 xs
percorrer S10 ('b':xs) = percorrer S2 xs



percorrer S10 _       = True
percorrer S4 _        = True
percorrer _ _         = False


tracarRota :: String -> Bool
tracarRota = percorrer S0
