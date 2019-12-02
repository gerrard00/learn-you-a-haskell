-- data TrafficLight = Red | Yellow | Green deriving (Eq)
data TrafficLight = Red | Yellow | Green

instance Eq TrafficLight where
  -- with a custom instance we can override the equality logic to Say Red /= Red
  -- Red == Red = False
  Red == Red = True
  Green == Green = True
  Yellow == Yellow = True
  _ == _ = False

instance Show TrafficLight where
  show Red = "Red light says stop"
  show Green = "Green light says go"
  show Yellow = "hol up"
  show _ = "I dunno"

main = do
  print "hello"
  print (Red == Red)
  print (Red == Green)
  print [Red, Yellow, Green]
