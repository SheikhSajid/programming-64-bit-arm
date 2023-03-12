if [[ $# -ne 1 ]]; then
    echo "Usage: $0 chapterN/prog.s"
    exit 1
fi

filePath=$1

if [[ ${filePath: -2} != ".s" ]]; then
    echo "Usage: $0 chapterN/prog.s"
    exit 1
fi

basePath=${filePath%.*}
as -o $basePath.o $basePath.s
ld -o $basePath $basePath.o

# run the program
$basePath
