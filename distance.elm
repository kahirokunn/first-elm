import Html exposing (..)

square n =
  n^2

hypotenuse a b =
  sqrt (square a + square b)

distance (a,b) (x,y) =
  hypotenuse (a - x) (b - y)

main = text (String.fromFloat (distance (22, 23) (10, 2)))
