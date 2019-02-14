import Html exposing (..)

add : Int -> Int -> Int
add a b = a + b

main = text (String.fromInt (add 5 2))
