# Aliases in this file are bash and zsh compatible

# Don't change. The following determines where YADR is installed.
yadr=$HOME/.yadr


alias gfortran-4.2=gfortran
# Get operating system
platform='unknown'
unamestr=$(uname)
if [[ $unamestr == 'Linux' ]]; then
  platform='linux'
elif [[ $unamestr == 'Darwin' ]]; then
  platform='darwin'
fi

# YADR support
alias yav='yadr vim-add-plugin'
alias ydv='yadr vim-delete-plugin'
alias ylv='yadr vim-list-plugin'
alias yup='yadr update-plugins'
alias yip='yadr init-plugins'

# PS
alias psa="ps aux"
alias psg="ps aux | grep "
alias psr='ps aux | grep ruby'

# Moving around
alias cdb='cd -'
alias cls='clear;ls'

# Show human friendly numbers and colors
alias df='df -h'
alias du='du -h -d 2'

if [[ $platform == 'linux' ]]; then
  alias ll='ls -alh --color=auto'
  alias ls='ls --color=auto'
elif [[ $platform == 'darwin' ]]; then
  alias ll='ls -alGh'
  alias ls='ls -Gh'
fi

# show me files matching "ls grep"
alias lsg='ll | grep'

# Alias Editing
TRAPHUP() {
  source $yadr/zsh/aliases.zsh
}

alias ae='vim $yadr/zsh/aliases.zsh' #alias edit
alias ar='source $yadr/zsh/aliases.zsh'  #alias reload
alias gar="killall -HUP -u \"$USER\" zsh"  #global alias reload

# vim using
mvim --version > /dev/null 2>&1
MACVIM_INSTALLED=$?
if [ $MACVIM_INSTALLED -eq 0 ]; then
  alias vim="mvim -v"
fi

# mimic vim functions
alias :q='exit'

# vimrc editing
alias ve='vim ~/.vimrc'

# zsh profile editing
alias ze='vim ~/.zshrc'
alias zr='source ~/.zshrc'

# Git Aliases
alias gs='git status'
alias gstsh='git stash'
# alias gst='git stash'
alias gsp='git stash pop'
alias gsa='git stash apply'
alias gsh='git show'
alias gshw='git show'
alias gshow='git show'
alias gi='vim .gitignore'
alias gcm='git ci -m'
alias gcim='git ci -m'
alias gci='git ci'
alias gco='git co'
alias gcp='git cp'
alias ga='git add -A'
alias gap='git add -p'
alias guns='git unstage'
alias gunc='git uncommit'
alias gm='git merge'
alias gms='git merge --squash'
alias gam='git amend --reset-author'
alias grv='git remote -v'
alias grr='git remote rm'
alias grad='git remote add'
alias gr='git rebase'
alias gra='git rebase --abort'
alias ggrc='git rebase --continue'
alias gbi='git rebase --interactive'
alias gl='git l'
alias glg='git l'
alias glog='git l'
alias co='git co'
alias gf='git fetch'
alias gfch='git fetch'
alias gd='git diff'
alias gb='git b'
alias gbd='git b -D -w'
# Staged and cached are the same thing
alias gdc='git diff --cached -w'
alias gds='git diff --staged -w'
alias gpub='grb publish'
alias gtr='grb track'
alias gpl='git pull'
alias gplr='git pull --rebase'
alias gps='git push'
alias gpsh='git push -u origin `git rev-parse --abbrev-ref HEAD`'
alias gnb='git nb' # new branch aka checkout -b
alias grs='git reset'
alias grsh='git reset --hard'
alias gcln='git clean'
alias gclndf='git clean -df'
alias gclndfx='git clean -dfx'
alias gsm='git submodule'
alias gsmi='git submodule init'
alias gsmu='git submodule update'
alias gt='git t'
alias gbg='git bisect good'
alias gbb='git bisect bad'
alias gdmb='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'

# Common shell functions
alias less='less -r'
alias tf='tail -f'
alias l='ls'
alias lh='ls -alt | head' # see the last modified files
alias screen='TERM=screen screen'
alias cl='clear'

#alias gs=gs


# Zippin
alias gz='tar -zcvf'

# Ruby
alias c='rails c' # Rails 3
alias co='script/console' # Rails 2
alias cod='script/console --debugger'

#If you want your thin to listen on a port for local VM development
#export VM_IP=10.0.0.1 <-- your vm ip
alias ts='thin start -a ${VM_IP:-127.0.0.1}'
alias ms='mongrel_rails start'
alias tfdl='tail -f log/development.log'
alias tftl='tail -f log/test.log'

alias ka9='killall -9'
alias k9='kill -9'

# Gem install
alias sgi='sudo gem install --no-ri --no-rdoc'

# TODOS
# This uses NValt (NotationalVelocity alt fork) - http://brettterpstra.com/project/nvalt/
# to find the note called 'todo'
alias todo='open nvalt://find/todo'

# Forward port 80 to 3000
alias portforward='sudo ipfw add 1000 forward 127.0.0.1,3000 ip from any to any 80 in'

alias rdm='rake db:migrate'
alias rdmr='rake db:migrate:redo'

# Zeus
alias zs='zeus server'
alias zc='zeus console'
alias zr='zeus rspec'
alias zrc='zeus rails c'
alias zrs='zeus rails s'
alias zrdbm='zeus rake db:migrate'
alias zrdbtp='zeus rake db:test:prepare'

# Rspec
alias rs='rspec spec'
alias sr='spring rspec'
alias src='spring rails c'
alias srgm='spring rails g migration'
alias srdm='spring rake db:migrate'
alias srdt='spring rake db:migrate'
alias srdmt='spring rake db:migrate db:test:prepare'


# Sprintly - https://github.com/nextbigsoundinc/Sprintly-GitHub
alias sp='sprintly'
# spb = sprintly branch - create a branch automatically based on the bug you're working on
alias spb="git checkout -b \`sp | tail -2 | grep '#' | sed 's/^ //' | sed 's/[^A-Za-z0-9 ]//g' | sed 's/ /-/g' | cut -d"-" -f1,2,3,4,5\`"



# OS X
alias qlf='qlmanage -p '

#alias mplayerx='open -a /Applications/MPlayerX.app --args -name'

alias hpr='hub pull-request'
alias grb='git recent-branches'

# Finder
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

alias dbtp='spring rake db:test:prepare'
alias dbm='spring rake db:migrate'
alias dbmr='spring rake db:migrate:redo'
alias dbmd='spring rake db:migrate:down'
alias dbmu='spring rake db:migrate:up'




# ls in linux
# in yadr/zsh/prezto/modules/utility/init.sh there is a section testing whether dircolor is callable and distinguish osx and unix system's ls aliases.
# in unix dircolor is configed with /etc/DIR_COLORS or ~/.dir_colors with particular syntax
if [[ "$OSTYPE" != darwin* ]]; then
	export LS_COLORS='rs=0:di=38;5;27:ln=38;5;51:mh=44;38;5;15:pi=40;38;5;11:so=38;5;13:do=38;5;5:bd=48;5;232;38;5;11:cd=48;5;232;38;5;3:or=48;5;232;38;5;9:mi=05;48;5;232;38;5;15:su=48;5;196;38;5;15:sg=48;5;11;38;5;16:ca=48;5;196;38;5;226:tw=48;5;10;38;5;16:ow=48;5;10;38;5;21:st=48;5;21;38;5;15:ex=38;5;34:*.tar=38;5;9:*.tgz=38;5;9:*.arj=38;5;9:*.taz=38;5;9:*.lzh=38;5;9:*.lzma=38;5;9:*.tlz=38;5;9:*.txz=38;5;9:*.zip=38;5;9:*.z=38;5;9:*.Z=38;5;9:*.dz=38;5;9:*.gz=38;5;9:*.lz=38;5;9:*.xz=38;5;9:*.bz2=38;5;9:*.tbz=38;5;9:*.tbz2=38;5;9:*.bz=38;5;9:*.tz=38;5;9:*.deb=38;5;9:*.rpm=38;5;9:*.jar=38;5;9:*.rar=38;5;9:*.ace=38;5;9:*.zoo=38;5;9:*.cpio=38;5;9:*.7z=38;5;9:*.rz=38;5;9:*.jpg=38;5;13:*.jpeg=38;5;13:*.gif=38;5;13:*.bmp=38;5;13:*.pbm=38;5;13:*.pgm=38;5;13:*.ppm=38;5;13:*.tga=38;5;13:*.xbm=38;5;13:*.xpm=38;5;13:*.tif=38;5;13:*.tiff=38;5;13:*.png=38;5;13:*.svg=38;5;13:*.svgz=38;5;13:*.mng=38;5;13:*.pcx=38;5;13:*.mov=38;5;13:*.mpg=38;5;13:*.mpeg=38;5;13:*.m2v=38;5;13:*.mkv=38;5;13:*.ogm=38;5;13:*.mp4=38;5;13:*.m4v=38;5;13:*.mp4v=38;5;13:*.vob=38;5;13:*.qt=38;5;13:*.nuv=38;5;13:*.wmv=38;5;13:*.asf=38;5;13:*.rm=38;5;13:*.rmvb=38;5;13:*.flc=38;5;13:*.avi=38;5;13:*.fli=38;5;13:*.flv=38;5;13:*.gl=38;5;13:*.dl=38;5;13:*.xcf=38;5;13:*.xwd=38;5;13:*.yuv=38;5;13:*.cgm=38;5;13:*.emf=38;5;13:*.axv=38;5;13:*.anx=38;5;13:*.ogv=38;5;13:*.ogx=38;5;13:*.aac=38;5;45:*.au=38;5;45:*.flac=38;5;45:*.mid=38;5;45:*.midi=38;5;45:*.mka=38;5;45:*.mp3=38;5;45:*.mpc=38;5;45:*.ogg=38;5;45:*.ra=38;5;45:*.wav=38;5;45:*.axa=38;5;45:*.oga=38;5;45:*.spx=38;5;45:*.xspf=38;5;45:'
	alias ls='ls --group-directories-first -F --color'
	alias du='du -h'
else alias ls='ls -Gh'
fi

# Homebrew
alias brewu='brew update  && brew upgrade --all && brew cleanup && brew prune && brew doctor'
