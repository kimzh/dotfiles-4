# custom functions, sourced by .zshrc


mkcd() {
    mkdir -p "$1" && cd "$1"
}

# clean build latex
cblatex(){
    rm *.aux *.bbl *.bcf *.blg *.log *.run.xml *.toc
    pdflatex "$1".tex
    biber "$1"
    pdflatex "$1".tex
    pdflatex "$1".tex
}
# build view live latex
bvl(){
    pdflatex "$1".tex
    biber "$1"
    pdflatex "$1".tex
    pdflatex "$1".tex
    evince "$1".pdf
}

#fetch weather
wttr()
{
    local request="wttr.in/"
    [ "$(tput cols)" -lt 125 ] && request+='?n'
    curl -H "Accept-Language: ${LANG%_*}" --compressed "$request"
}

# FUCK MY SCHOOL'S PRINTER, seriously.
# Usage topdfversion somefile.pdf outputfile.pdf 1.5
topdfversion(){
    gs -sDEVICE=pdfwrite -dCompatibilityLevel="$3" -dPDFSETTINGS=/screen -dNOPAUSE -dQUIET -dBATCH -sOutputFile="$2" "$1"
}

#fuck the school printer
ftsp(){
    topdfversion "$1" "$2" 1.5
}

#start program detached from shell
s() {
    nohup $@ </dev/null >/dev/null 2>&1 &
}
sus() {
    s sudo -E $@
}

mntsecusb(){
    sudo cryptsetup open $1 secusb
    sudo mount /dev/mapper/secusb $2
}
umntsecusb() {
    sudo umount $1
    sudo cryptsetup close secusb
}

crypttab_entry_gen() {
    echo luks-`sudo cryptsetup luksUUID $1` UUID=`sudo cryptsetup luksUUID $1` none
}


# git add -u; git commit -m; git push
gucp() {
    git add -u
    git commit -m "$1"
    git push
}

