module Message (main, ex0, ex1, ex2) where

import Text.Read
import System.IO

data Msg = Atom String | Pair Msg Msg | Enc Msg Msg
  deriving (Read, Show, Eq)

data Rule = Ax | PairI | PairEL Msg | PairER Msg | EncI | EncE Msg
  deriving (Read, Show)

type Ctxt = [Msg]

apply :: Ctxt -> Rule -> Msg -> Maybe (Ctxt, [Msg])
apply gamma Ax m = if m `elem` gamma then Just (gamma, []) else Nothing
apply gamma PairI (Pair m n) = Just (gamma, [m, n])
apply gamma (PairEL n) m = Just (gamma, [Pair m n])
apply gamma (PairER m) n = Just (gamma, [Pair m n])
apply gamma EncI (Enc m k) = Just (gamma, [m, k])
apply gamma (EncE k) m = Just (gamma, [Enc m k, k])
apply _ _ _ = Nothing

next = putStrLn "-----------------------------------------------------"

prove :: Ctxt -> Msg -> IO ()
prove gamma m = go gamma [m]
  where
    go :: Ctxt -> [Msg] -> IO ()
    go gamma [] = putStrLn $ "QED"
    go gamma (m : ms) = do
      putStrLn $ "context:\n" ++ concatMap ((\s -> "\t" ++ s ++ "\n") . show) gamma
      putStrLn $ "subgoals:\n" ++ "\t" ++ show m ++ "\n" ++
        concatMap ((\s -> "\t" ++ s ++ "\n") . show) ms
      putStr "apply rule: "
      hFlush stdout
      ruleRaw <- getLine
      case readMaybe ruleRaw of
        Nothing -> do
          putStrLn $ "failed to read rule " ++ ruleRaw
          next
          go gamma (m : ms)
        Just rule ->
          case apply gamma rule m of
            Nothing -> do
              putStrLn $ "failed to apply rule " ++ show rule
              next
              go gamma (m : ms)
            Just (gamma', ns) -> do
              next
              go gamma' (ns ++ ms)

k1 = Atom "k1"
k2 = Atom "k2"
s = Atom "s"
a = Atom "a"
b = Atom "b"
c = Atom "c"

ex0 = prove [Pair k1 k2, Enc(Enc s k1) k2] s
ex1 = prove [k1, Enc k2 k1, Enc s k1] (Enc s k2)
ex2 = prove [Pair a (Pair b c), Enc s (Pair (Pair a b) c)] s
main = do
  putStrLn "Task 0:"
  ex0
  next
  putStrLn "Task 1:"
  ex1
  next
  putStrLn "Task 2:"
  ex2
  next
  putStrLn "Awesome, you proved 'em all!"

