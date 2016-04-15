--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
import           Data.Monoid (mappend, (<>))
import           Hakyll
import           Data.Time (getCurrentTime)
import           Data.Time.Format (formatTime, defaultTimeLocale)


--------------------------------------------------------------------------------
main :: IO ()
main = do
  buildDate <- formatTime defaultTimeLocale "%Y %B %e" <$> getCurrentTime
  hakyll $ do
    let templateContext = constField "buildDate" buildDate 
            `mappend` defaultContext

    match "images/*" $ do
        route   idRoute
        compile copyFileCompiler

    match "CNAME" $ do
        route   idRoute
        compile copyFileCompiler

    match "css/*.less" $ do
        compile getResourceBody

        d <- makePatternDependency "css/*.less"
        rulesExtraDependencies [d] $ create ["css/main.css"] $ do
            route idRoute
            compile $ loadBody "css/main.less"
                >>= makeItem
                >>= withItemBody (unixFilter "lessc" ["-"])
                >>= return . fmap compressCss

    match "index.html" $ do
        route idRoute
        compile $ do
            posts <- fmap (take 5) . recentFirst =<< loadAll "blog/*.md"
            let indexContext =
                  listField "posts" postContext (return posts) <>
                  templateContext
            getResourceBody
                >>= applyAsTemplate indexContext
                >>= loadAndApplyTemplate "templates/default.html" indexContext
                >>= relativizeUrls

    match "templates/*" $ compile templateCompiler

    match "*.html" $ do
        route idRoute
        compile $ do
            getResourceBody
                >>= applyAsTemplate defaultContext
                >>= loadAndApplyTemplate "templates/default.html"
                        templateContext

    match "blog/*.md" $ do
        route $ setExtension ".html"
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "templates/post.html" postContext
            >>= loadAndApplyTemplate "templates/default.html" templateContext

    create ["blog/index.html"] $ do
        route idRoute
        compile $ do
            posts <- recentFirst =<< loadAll "blog/*.md"
            let postsContext = constField "title" "Blog" <>
                  listField "posts" postContext (return posts) <>
                  defaultContext
            makeItem ""
                >>= loadAndApplyTemplate "templates/archive.html" postsContext
                >>= loadAndApplyTemplate "templates/default.html"
                        templateContext

postContext :: Context String
postContext = 
    dateField "date" "%Y %B %e" `mappend`
    defaultContext
