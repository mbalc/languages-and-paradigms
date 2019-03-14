import Prelude hiding (Either(..))

-- ZAD 1

data Tree a = Empty | Node a (Tree a) (Tree a) deriving (Ord)

instance Show a => Show (Tree a) where
   show (Node a x y) = "[" ++ show x ++ "]/" ++ show a ++ "\\[" ++ show y ++ "]"
   show Empty = "nil"

instance Eq a => Eq (Tree a) where
   Empty == Empty = True
   Node a x y == Empty = False
   Empty == Node a x y = False
   Node a1 x1 y1 == Node a2 x2 y2 = a1 == a2 && x1 == x2 && y1 == y2

toList :: Tree a -> [a]
toList (Node a x y) = toList x ++ a : (toList y)
toList Empty = []

-- class Functor f where
--    fmap :: (a -> b) -> f a -> f b

instance Functor Tree where
    fmap fn Empty = Empty
    fmap fn (Node a t1 t2) = Node (fn a) (fmap fn t1) (fmap fn t2)



insert :: (Ord a) => a -> Tree a -> Tree a
insert el Empty = Node el Empty Empty
insert el (Node a t1 t2)
   | el < a = Node a (insert el t1) t2
   | otherwise = Node a t1 (insert el t2)

contains :: (Ord a) => a -> Tree a -> Bool
contains el Empty = False
contains el (Node a t1 t2)
   | el < a = contains el t1
   | el > a = contains el t2
   | otherwise = True

--fromList :: (Ord a) => [a] -> Tree a


-- ZAD 2

data Either a b = Left a | Right b

instance Functor (Either e) where
--   fmap :: (a -> b) -> Either e a -> Either e b
    fmap fn (Left e) = Left e
    fmap fn (Right a) = Right (fn a)

reverseList :: [a] -> [a]
reverseList (a : tl) = (reverseList tl) ++ [a]
reverseList [] = []

reverseRightv2 :: Either e [a] -> Either e [a]
reverseRightv2 e = fmap (reverseList) e

fromRight :: b -> Either a b -> b
fromRight a (Right w) = w
fromRight a (Left _) = a
