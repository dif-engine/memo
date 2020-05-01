module Main where

import Foreign.C.String

-- const char*  freshName();
foreign import ccall "foo.h freshName" cFreshName :: IO CString 

freshName :: IO String 
freshName = do 
              x <- cFreshName :: IO CString
              y <- peekCString x :: IO String
              return y

main :: IO ()
main = do 
        x1 <- freshName :: IO String 
        putStrLn x1 
        x2 <- freshName :: IO String 
        putStrLn x2 
        x3 <- freshName :: IO String 
        putStrLn x3 
        x4 <- freshName :: IO String 
        putStrLn x4
        return () 
