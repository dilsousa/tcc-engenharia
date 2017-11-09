#!/bin/sh

rm -f monografia.pdf

cd tex

docker run -it -v "$PWD":/data -w /data andreformento/latex pdflatex -synctex=1 -interaction=nonstopmode monografia.tex
docker run -it -v "$PWD":/data -w /data andreformento/latex bibtex monografia
docker run -it -v "$PWD":/data -w /data andreformento/latex pdflatex -synctex=1 -interaction=nonstopmode monografia.tex

docker run -it -v "$PWD":/data -w /data andreformento/latex pdflatex -synctex=1 -interaction=nonstopmode monografia.tex
docker run -it -v "$PWD":/data -w /data andreformento/latex bibtex monografia
docker run -it -v "$PWD":/data -w /data andreformento/latex pdflatex -synctex=1 -interaction=nonstopmode monografia.tex

mv monografia.pdf ../

cd ..
./clear.sh
