import Network.URI

main = do
    let s = ""
    case parseURI s of
        Nothing  -> error "no URI"
        Just uri -> do
            putStrLn $ uriScheme uri
            case uriAuthority uri of
                Nothing   -> error "no Authority"
                Just auth -> do
                    putStrLn $ uriUserInfo auth
                    putStrLn $ uriRegName auth
                    putStrLn $ uriPort auth
            putStrLn $ uriPath uri
            putStrLn $ uriFragment uri
            putStrLn $ uriQuery uri
