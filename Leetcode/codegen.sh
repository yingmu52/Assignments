dir="Sources/$1.swift"
touch $dir
content="import Foundation\n\nclass $1 {\n\n}\n"
echo $content > $dir
