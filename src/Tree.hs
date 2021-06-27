
module Tree where

data Tree a = Tip a | a :&: [Tree a]

tree = 1 :&: []
