module BinarySearch
(
  Tree,
  singleton,
  treeInsert,
  treeElem,
) where

data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show, Read, Eq)

singleton :: a -> Tree a
singleton x = Node x EmptyTree EmptyTree

treeInsert :: (Ord a) => a -> Tree a -> Tree a
treeInsert x EmptyTree = singleton x
treeInsert x (Node a left right)
  | x == a = Node x left right
  | x < a = Node a (treeInsert x left) right
  | x > a = Node a left (treeInsert x right)


-- make a backwards version of treeInsert for use with our foldl
insertTree t x = treeInsert x t
listToTree = foldl (insertTree) EmptyTree

treeElem :: (Ord a) => a -> Tree a -> Bool
treeElem x EmptyTree = False
treeElem x (Node a left right)
  | x == a = True
  | x < a = treeElem x left
  | x > a = treeElem x right

main = do
  let foo = singleton 8
  let bar = treeInsert 6 foo
  let baz = treeInsert 7 bar
  let result = treeInsert 5 baz
  let jennyTree = (listToTree [8, 6, 7, 5, 3, 0, 9, 100])
  -- print jennyTree
  print $ treeElem 7 jennyTree
  print $ treeElem 23 jennyTree
