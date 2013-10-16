module Main where

import           TypeScript.Bindings

config :: TypeScript
config = TypeScript Nothing -- If tsc is in your $PATH, Nothing should be used as default settings

main :: IO ()
main = typeScriptCompile ["sample.ts"] (Just "js") config >>= print
