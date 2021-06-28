
module Tree where

import Control.Applicative (Alternative, empty, (<|>))

data Tree a = Tip | a :&: [Tree a]

tree :: Tree Int
tree = 1 :&: [2 :&: [5 :&: [9 :&: []
                           , 10 :&: []]
                    , 6 :&: []]
             , 3 :&: []
             , 4 :&: [7 :&: [11 :&: []
                            , 12 :&: []]
                     , 8 :&: []]]

dfe :: Tree a -> [a]
dfe Tip = []
dfe (x :&: xs) = [x] ++ choices dfe xs

choices :: Alternative f => (a -> f b) -> [a] -> f b
choices f [] = empty
choices f (x:xs) = f x <|> choices f xs
