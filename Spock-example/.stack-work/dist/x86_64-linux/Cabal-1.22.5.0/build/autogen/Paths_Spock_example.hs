module Paths_Spock_example (
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
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/data/git/learnYouAHaskell/Spock-example/.stack-work/install/x86_64-linux/lts-6.13/7.10.3/bin"
libdir     = "/data/git/learnYouAHaskell/Spock-example/.stack-work/install/x86_64-linux/lts-6.13/7.10.3/lib/x86_64-linux-ghc-7.10.3/Spock-example-0.1.0.0-0dbUdbqtvXv5qfiCzv8D3y"
datadir    = "/data/git/learnYouAHaskell/Spock-example/.stack-work/install/x86_64-linux/lts-6.13/7.10.3/share/x86_64-linux-ghc-7.10.3/Spock-example-0.1.0.0"
libexecdir = "/data/git/learnYouAHaskell/Spock-example/.stack-work/install/x86_64-linux/lts-6.13/7.10.3/libexec"
sysconfdir = "/data/git/learnYouAHaskell/Spock-example/.stack-work/install/x86_64-linux/lts-6.13/7.10.3/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "Spock_example_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "Spock_example_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "Spock_example_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "Spock_example_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "Spock_example_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
