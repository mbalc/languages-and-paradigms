inits :: [Integer] -> [[Integer]]

inits (x : xs) = [[]] ++ map (x:) (inits xs)
inits [] = [[]]


partitions :: [Integer] -> [([Integer], [Integer])]

partitions (x : xs) = ([], x : xs) : [(x : a, b) | (a, b) <- partitions xs]
partitions [] = [([], [])]


permutations :: [Integer] -> [[Integer]]

permutations (x : []) = [[x]]
permutations (x : xs) =
  let parts = map partitions (permutations xs)
    in [a ++ x : b | (a, b) <- concat parts]
--permutations (x : xs) = [a ++ x : b | (a, b) <- parts] where [parts] = [partitions permutat | permutat <- permutations xs]

