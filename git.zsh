
#git clone & cd
gc(){
  git clone ${1};
  DIR=$(echo ${1} | cut -d"/" -f5);
  cd ${DIR};
}


#GIT
#git force commit
gg(){ git add . ; git commit -a -m $1 ; git push -u -f origin master ; }
#push master
gp(){ git push -u -f origin master ; }
#generate this hosts git key
git_key(){ ssh-keygen -t rsa -C "$1" ; cat ~/.ssh/id_rsa.pub; }
#undo last commit
alias git_undo="git reset --hard HEAD~1"
#delete branch by name
git_del_branch(){ git push origin --delete $1 ;  git branch -d $1 ; }
#forgot to add msg to commit
git_add_msg(){ git commit --amend -m "$1" ; }
#removes file from tracking
git_rm(){ git rm --cached $1 ;}
#discard local changes
git_discard(){ git stash save --keep-index; }
#pull overwriting local files and commits
git_pull_hard(){ git fetch --all; git reset --hard origin/master; }
#purges file from history
git_purge(){ git filter-branch --prune-empty -d /dev/shm/scratch --index-filter "git rm --cached -f --ignore-unmatch $1" --tag-name-filter cat -- --all ;}
