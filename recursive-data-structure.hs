
infixr 5 :-:

-- data List a = Empty | Cons a (List a) deriving (Show, Read, Eq, Ord)
data List a = Empty
  | a :-: (List a)
  deriving (Show, Read, Eq, Ord)

infixr 5 .++
(++) :: [a] -> [a] -> [a]
[]      ++ ys = ys
(x:xs)  .++ ys = x : (xs .++ ys)

main = do
  putStrLn "Hello World"
  let foo = 8 :-: Empty
  let bar = 6 :-: Empty
  let baz = foo .++ bar

  print baz
