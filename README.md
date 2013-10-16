# Haskell-TypeScript

Simple Haskell bindings to the TypeScript compiler, pull requests welcome

```text
cabal update && cabal install haskell-typescript
```

```haskell
module Main where

import TypeScript.Bindings

config :: TypeScript 
config = TypeScript Nothing -- If tsc is in your $PATH, Nothing should be used as default settings

main :: IO ()
main = typeScriptCompile ["test.tsc"] (Just "js") config

```
