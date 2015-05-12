
function scr() {ssh -t $1'@'$2 screen -R;}
#Handy function to use gnu screen and ssh

function md2pdf() { md2latex $1 && xelatex $1.tex && xelatex $1.tex }
#md2pdf: compile markdown as latex then convert to pdf
function md2latex() { pandoc -f markdown -t latex $1.md -s -o $1.tex }
#md2latex: compile markdown as latex 
function smd2pdf() { md2latex $1 && manysed "$@" && xelatex $1.tex && xelatex $1.tex }
#smd2pdf: compile markdown as latex, then convert to pdf with extra packages (eg add \usepackage{$2} to line 2)

#This is called in the smd2pdf function
function manysed() {s='\\\'"usepackage{" ; for i in {2..${#}} ; sed -i "2i "$s${@:$i:1}"}" $1.tex }
