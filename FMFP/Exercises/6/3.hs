data FSEntry = Folder String [FSEntry] | File String String deriving Show

-- (a)

fFSE :: (String -> [a] -> a) -> (String -> String -> a) -> FSEntry -> a
fFSE _ mapFile (File name contents) = mapFile name contents
fFSE mapFolder mapFile (Folder name contents) = mapFolder name $ map (fFSE mapFolder mapFile) contents

-- (b)

-- i.

number :: FSEntry -> Int
number = fFSE (const $ (+1) . sum) (const $ const 1)

count :: Char -> FSEntry -> Int
count char = fFSE (const sum) (const $ length . filter (==char))

paths :: FSEntry -> [String]
paths = fFSE (\name -> map ((name++) . ('/':)) . concat) (const . (:[])) 


test = Folder "Home"
        [Folder "Work"
            [File "students.txt" "Alice, Bob",
             File "hint"         "You can use fFSE!"],
         File "Fun" "FMFP"]
