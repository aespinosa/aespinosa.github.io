--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
import           Data.Monoid (mappend)
import           Hakyll


--------------------------------------------------------------------------------
main :: IO ()
main = hakyll $ do
    match "images/*" $ do
        route   idRoute
        compile copyFileCompiler

    match "css/*.less" $ do
        compile getResourceBody

    d <- makePatternDependency "css/*.less"
    rulesExtraDependencies [d] $ create ["css/main.css"] $ do
        route idRoute
        compile $ loadBody "css/main.less"
            >>= makeItem
            >>= withItemBody (unixFilter "lessc" ["-", "--yui-compress", "-O2"])

    match "index.html" $ do
        route idRoute
        compile copyFileCompiler
