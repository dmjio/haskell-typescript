-- | A simple TypeScript library.

module TypeScript.Bindings
       ( TypeScript(..)
       , typeScriptCompile
       , typeScriptVersion
       , typeScriptPrint
       ) where

import           Control.Applicative ((<$>))
import           Data.Maybe          (fromMaybe)
import           System.Exit         (ExitCode (..))
import           System.Process      (rawSystem, readProcess)

-- | The TypeScript data structure
data TypeScript = TypeScript
    { customCompiler :: Maybe FilePath -- ^ Custom compiler path, set to Nothing for default
    }

-- | Compile .ts file(s)
typeScriptCompile :: [FilePath] -- ^ List of .ts files to compile
              -> Maybe FilePath -- ^ Output directory, Nothing for default
              -> TypeScript     -- ^ TypeScript structure for more options
              -> IO ExitCode    -- ^ Exit code
typeScriptCompile [] _ _ = return $ ExitFailure 1
typeScriptCompile files output typeScript =
    rawSystem (getCompiler typeScript) args
  where args = outputPath output ++ [] ++ files

-- | Get the version of the typescript binary
typeScriptVersion :: TypeScript -> IO String
typeScriptVersion t = head . lines <$> typeScriptRead t ["-v"]

-- | Print the TypeScript output
typeScriptPrint :: FilePath -> TypeScript -> IO String
typeScriptPrint file t = typeScriptRead t $ ["-v", file]

outputPath :: Maybe FilePath -> [FilePath]
outputPath (Just path) = ["-outDir", path]
outputPath Nothing     = []

getCompiler :: TypeScript -> FilePath
getCompiler = fromMaybe "tsc" . customCompiler

typeScriptRead :: TypeScript -> [String] -> IO String
typeScriptRead typeScript args = readProcess (getCompiler typeScript) args []
