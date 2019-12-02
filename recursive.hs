infixr 5 :-:

-- data List a = Empty | Cons a (List a) deriving (Show, Read, Eq, Ord)
data List a = Empty | a :-: (List a) deriving (Show, Read, Eq, Ord)

infixr 5 .++
(.++) :: List a -> List a -> List a
Empty .++ ys = ys
(x :-: xs) .++ ys = x :-: (xs .++ ys)

main = do
  print "Hello world"
  let x = (8 :-: 6 :-: Empty)
  let y = (7 :-: 5 :-: Empty)
  print (x .++ y)

