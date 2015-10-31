
#RUBY AND PYTHON
export PATH=~/anaconda/bin:$HOME/.rvm/bin:/usr/local/bin:$PATH
export PATH=~/.local/bin:$PATH

# zsh下面脚本无效, 手动加
export PATH=/Users/lhr/.rvm/rubies/ruby-2.2.3/bin:$PATH
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# ON GOING PROJECT
# export PATH=/Users/lhr/bak/lhrkits/labkit/bin:$PATH
# export PYTHONPATH=/Users/lhr/_action/\@vagrant/cluster/node1/labkit:$PYTHONPATH


# 加载lhrkits里面所有kit的目录
source $HOME/lhrkits/init_kits.sh

#ANSIBLE
# export ANSIBLE_INVENTORY=~/_env/ansible/hosts
# export ANSIBLE_ROLES=~/_env/ansible/centos/roles
