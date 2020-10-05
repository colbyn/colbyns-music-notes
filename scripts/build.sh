function errorlog {
    echo "\033[1;31m\033[4m$1\033[0m"
}

mkdir -p output
cd source

xelatex --interaction=batchmode -output-directory ../output main.tex >/dev/null
STATUS=$?

if [ "$STATUS" -ne "0" ]; then
    errorlog "BUILD FAILED:"
    xelatex --interaction=nonstopmode -output-directory ../output main.tex
    errorlog "END OF ERROR MESSAGE"
fi