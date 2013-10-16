module Paths_haskell_typescript (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,1,0,1], versionTags = []}
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/dmj/Desktop/haskell-typescript/.hsenv/cabal/bin"
libdir     = "/Users/dmj/Desktop/haskell-typescript/.hsenv/cabal/lib/x86_64-osx-ghc-7.6.3/haskell-typescript-0.1.0.1"
datadir    = "/Users/dmj/Desktop/haskell-typescript/.hsenv/cabal/share/x86_64-osx-ghc-7.6.3/haskell-typescript-0.1.0.1"
libexecdir = "/Users/dmj/Desktop/haskell-typescript/.hsenv/cabal/libexec"
sysconfdir = "/Users/dmj/Desktop/haskell-typescript/.hsenv/cabal/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "haskell_typescript_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "haskell_typescript_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "haskell_typescript_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "haskell_typescript_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "haskell_typescript_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
