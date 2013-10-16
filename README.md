# Haskell-TypeScript

Simple Haskell bindings to the TypeScript compiler, pull requests welcome

```text
cabal update && cabal install haskell-typescript
```

```text
cat examples/test.ts
```

```typescript
interface Person {
    firstname: string;
    lastname: string;
}

function greeter(person : Person) {
    return "Hello, " + person.firstname + " " + person.lastname;
}

var user = {firstname: "Jane", lastname: "User"};

document.body.innerHTML = greeter(user);
```


```haskell
module Main where

import TypeScript.Bindings

config :: TypeScript 
config = TypeScript Nothing -- If tsc is in your $PATH, Nothing should be used as default settings

main :: IO ()
main = typeScriptCompile ["test.ts"] (Just "js") config
```

```text
$ ghc Main.hs && ./Main
[1 of 1] Compiling Main             ( Main.hs, Main.o )
Linking Main ...
ExitSuccess
$ cat js/test.js
```

```javascript
function greeter(person) {
    return "Hello, " + person.firstname + " " + person.lastname;
}

var user = { firstname: "Jane", lastname: "User" };

document.body.innerHTML = greeter(user);
```