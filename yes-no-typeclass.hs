class YesNo a where
  yesno :: a -> Bool

instance YesNo Int where
  yesno 0 = False
  yesno _ = True

instance YesNo [a] where
  yesno [] = False
  yesno _  = True

instance YesNo Bool where
  yesno = id

instance YesNo (Maybe a) where
  yesno (Just _) = True
  yesno Nothing  = False

data TrafficLight = Red | Yellow | Green

instance YesNo TrafficLight where
  yesno Red = False
  yesno _   = True

yesnoIf :: (YesNo y) => y -> a -> a -> a
yesnoIf yesnoVal yesResult noResult = if yesno yesnoVal then yesResult else noResult

main = do
  print "hello"
  print $ yesno "bang"
  print $ yesno True
  print $ yesno [7]
  print $ yesno []
  print $ yesno Green
  print $ yesno Red
  print $ yesno $ Just 7
  print $ yesno $ Just 0
  print $ yesno $ Nothing
  print $ yesnoIf Nothing "Yes" "No"
  print $ yesnoIf Green "Yes" "No"
  print $ yesno (0 :: Int)
  print $ yesno (9 :: Int)
