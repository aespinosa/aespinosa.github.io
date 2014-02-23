--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
import           Data.Monoid (mappend, (<>))
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
      compile $ do
        getResourceBody
          >>= applyAsTemplate defaultContext
          >>= loadAndApplyTemplate "templates/default.html" defaultContext

    match "templates/*" $ compile templateCompiler

    match "blog/*.md" $ do
      route $ setExtension ".html"
      compile $ pandocCompiler
        >>= loadAndApplyTemplate "templates/post.html" postContext
        >>= loadAndApplyTemplate "templates/default.html" postContext

    create ["blog/index.html"] $ do
      route idRoute
      compile $ do
        posts <- recentFirst =<< loadAll "blog/*.md"
        let postsContext = constField "title" "Blog" <>
                  listField "posts" postContext (return posts) <>
                  defaultContext
        makeItem ""
          >>= loadAndApplyTemplate "templates/archive.html" postsContext
          >>= loadAndApplyTemplate "templates/default.html" postsContext

postContext :: Context String
postContext = 
    dateField "date" "%Y %B %e" `mappend`
    defaultContext
