data ArvBin a = Null
            | No a (ArvBin a) (ArvBin b)

somaA Null=0
somaA (No x esq dir) = x + (somaA esq)+(somaA dir)            
