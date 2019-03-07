triples :: Int -> [(Int,Int,Int)]
triples n = [(x,y,z) | x<-[1..n], y<-[1..n], z<-[1..n]]

sortedTriples :: Int -> [(Int,Int,Int)]
sortedTriples n = [(x,y,z) | x<-[1..n], y<-[x..n], z<-[y..n]]

triads :: Int -> [(Int, Int, Int)]
triads n = [(x,y,z) | (x,y,z) <- (sortedTriples n), (x * x) + (y * y) == z * z]

indexOf :: Char -> String -> Maybe Int
indexOf _ "" = Nothing
indexOf ch (hd : tl) = if ch == hd then
                         Just 0
                       else case indexOf ch tl of
                         Just out -> Just (out + 1)
                         Nothing -> Nothing

positions :: Char -> String -> [Int]
positions c s = offsetedPositions c s 0

offsetedPositions :: Char -> String -> Int -> [Int]
offsetedPositions _ "" _ = []
offsetedPositions c (hd : tl) n
  | c == hd = n : olds
  | otherwise = olds
  where olds = offsetedPositions c tl (n + 1)

showInt :: Int -> String
showInt n
  | n < 10 = [ff]
  | otherwise =showInt (div n 10) ++ [ff]
  where ff = showDigit (mod n 10)

showDigit :: Int -> Char
showDigit n
  | n == 0 = '0'
  | n < 10 = succ (showDigit (n - 1))
  | otherwise = 'p'

incAll :: [[Int]] -> [[Int]]
incAll = foldr (\p q -> (foldr (\x y -> (x+1) : y) [] p) : q) []


