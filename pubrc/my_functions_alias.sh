# My own .bashrc file
#11111
# If not running interactively, don't do anything
# [ -z "$PS1" ] && return

# alias ls='ls --color=always -F --group-directories-first'
# alias lo="ls -lha --color=always -F --group-directories-first | awk '{k=0;for(i=0;i<=8;i++)k+=((substr(\$1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(\"%0o \",k);print}'"
# alias fact="elinks -dump randomfunfacts.com | sed -n '/^| /p' | tr -d \|"

# if [ -f /etc/bashrc ]; then
#     . /etc/bashrc   # --> Read /etc/bashrc, if present.
# fi

# shopt -s cdspell          # autocorrects cd misspellings
# shopt -s checkwinsize     # update the value of LINES and COLUMNS after each command if altered

# date

# export PS1="\[\e[1;32m\][\t] \u:\$(pwd)\n$ \[\e[m\]"

# .zshrc和.bashrc里面设置pubrc是bash和zsh公用的加载的rc, 可以把公用source的文件, 加载的目录, 都放到这儿
# mypath.sh里面是路径, 自己的脚本放到已经加载的pubkit目录里去
# 这个文件是函数, 自己的函数可以放在这里, 会被source
# 其他要source的文件也放在这里.
# ae修改.zsh/文件夹下面的alias文件
# lae修改pubkit下面的alias文件, 这两个文件都会被source. 但是是在不同的git目录里. 以后考虑合并. 使用submodule形式.
# fe修改本文件, 添加函数
# pubkit进入pubkit, 添加脚本.

function cd_apache(){
    if [[ $OS_NAME == CYGWIN ]]; then
        cd /var/www/html
    elif [[ $OS_NAME == Darwin ]]; then
        cd /Library/WebServer/Documents
    else
        cd /var/www/html
    fi
}
function config_apache(){
    if [[ $OS_NAME == Darwin ]]; then
        sudo subl /etc/apache2/httpd.conf
    # else

    fi
}
function restart_apache(){
    if [[ $OS_NAME == Darwin ]]; then
      sudo  apachectl restart
    fi
}
function cd_nginx(){
    if [[ $OS_NAME == Darwin ]]; then

        cd  /usr/local/Cellar/nginx/1.6.2/html
    fi

}
function config_nginx(){
    if [[ $OS_NAME == Darwin ]]; then
        subl /usr/local/etc/nginx/nginx.conf
    fi

}
function restart_nginx(){
    if [[ $OS_NAME == Darwin ]]; then
        nginx -s stop
        nginx
    fi

}


## =========
function fe(){
    atom ~/.yadr/pubrc/my_functions_alias.sh
}


function aria(){

    if [ $# = 0 ]
    then
        aria2c --conf-path=/Users/lhr/.aria2/aria2.conf -D
    fi


    case $1 in
        start )
            aria2c --conf-path=/Users/lhr/.aria2/aria2.conf -D;;
        s )
            pkill aria2;;
        r )
            pkill aria2
            aria start;;
        f )
            open file:///Users/lhr/_env/software/aria2c/yaaw/index.html;;
        d )
            open file:///Users/lhr/downloads/aria2;;
    esac
}


## ==============

function ask()
{
    echo -n "$@" '[y/n] ' ; read ans
    case "$ans" in
        y*|Y*) return 0 ;;
        *) return 1 ;;
    esac
}

function extract()
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1     ;;
            *.tar.gz)    tar xvzf $1     ;;
            *.bz2)       bunzip2 $1      ;;
            *.rar)       unrar x $1      ;;
            *.gz)        gunzip $1       ;;
            *.tar)       tar xvf $1      ;;
            *.tbz2)      tar xvjf $1     ;;
            *.tgz)       tar xvzf $1     ;;
            *.zip)       unzip $1        ;;
            *.Z)         uncompress $1   ;;
            *.7z)        7z x $1         ;;
            *)           echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

# Creates an archive (*.tar.gz) from given directory.
function maketar() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }

# Create a ZIP archive of a file or folder.
function makezip() { zip -r "${1%%/}.zip" "$1" ; }

function my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,time,command,ppid ; }
function pp() { my_ps f | awk '!/awk/ && $0~var' var=${1:-".*"} ; }
function killps()   # kill by process name
{
    local pid pname sig="-TERM"   # default signal
    if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
        echo "Usage: killps [-SIGNAL] pattern"
        return;
    fi
    pattern=$1
    if [ $# = 2 ]; then sig=$1 pattern=$2; fi
    for pid in $(my_ps| awk '!/awk/ && $0~pat { print $1 }' pat=$pattern )
    do
        pname=$(my_ps | awk '$1~var { print $5 }' var=$pid )
        if ask "Kill process $pid <$pname> with signal $sig?"
            then kill $sig $pid
        fi
    done
}

function dataurl()
{
    local mimeType=$(file -b --mime-type "$1")
    if [[ $mimeType == text/* ]]; then
        mimeType="${mimeType};charset=utf-8"
    fi
    echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')"
}


#### ff command

[ $(uname -s | grep -c CYGWIN) -eq 1 ] && OS_NAME="CYGWIN" || OS_NAME=`uname -s`
function pclip() {
    if [[ $OS_NAME == CYGWIN ]]; then
        putclip $@;
    elif [[ $OS_NAME == Darwin ]]; then
        pbcopy $@;
    else
        if [ -x /usr/bin/xsel ]; then
            xsel -ib $@;
        else
            if [ -x /usr/bin/xclip ]; then
                xclip -selection c $@;
            else
                echo "Neither xsel or xclip is installed!"
            fi
        fi
    fi
}

function ff()
{
    local fullpath=$*
    local filename=${fullpath##*/} # remove "/" from the beginning
    filename=${filename##*./} # remove  ".../" from the beginning
    echo file=$filename
    #  only the filename without path is needed
    # filename should be reasonable
    local cli=`find $PWD -not -iwholename '*/target/*' -not -iwholename '*.svn*' -not -iwholename '*.git*' -not -iwholename '*.sass-cache*' -not -iwholename '*.hg*' -type f -iwholename '*'${filename}'*' -print | percol`
    echo ${cli}
    echo -n ${cli} |pclip;
}


# alias percol='percol --match-method regex'

# alias percol='percol --eval="percol.view.prompt_on_top=False" --initial-index=last --reverse'
alias percol='percol --result-bottom-up --prompt-bottom'
# because percol can switch search method dynamicly, this alias is not needed now.

# #### zsh version of ppgrep and ppkill

function ppgrep() {
    if [[ $1 == "" ]]; then
        PERCOL=percol
    else
        PERCOL="percol --query $1"
    fi
    ps aux | eval $PERCOL | awk '{ print $2 }'
}

function ppkill() {
    if [[ $1 =~ "^-" ]]; then
        QUERY=""            # options only
    else
        QUERY=$1            # with a query
        [[ $# > 0 ]] && shift
    fi
    ppgrep $QUERY | xargs kill $*
}

### zsh history search

function exists { which $1 &> /dev/null }

if exists percol; then
    function percol_select_history() {
        local tac
        exists gtac && tac="gtac" || { exists tac && tac="tac" || { tac="tail -r" } }
        BUFFER=$(fc -l -n 1 | eval $tac | percol --query "$LBUFFER")
        CURSOR=$#BUFFER         # move cursor
        zle -R -c               # refresh
    }

    zle -N percol_select_history
    bindkey '^R' percol_select_history  # great binding keys from zsh to percol
fi


### tmux pattach

function pattach() {
    if [[ $1 == "" ]]; then
        PERCOL=percol
    else
        PERCOL="percol --query $1"
    fi

    sessions=$(tmux ls)
    [ $? -ne 0 ] && return

    session=$(echo $sessions | eval $PERCOL | cut -d : -f 1)
    if [[ -n "$session" ]]; then
        tmux att -t $session
    fi
}
