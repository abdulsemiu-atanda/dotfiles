function git_delete_merged_branch() {
  printf "\n"
  echo 'DELETING MERGED BRANCHES'
  ref=$(command git branch --merged | grep -v "\*" | grep -v master | grep -v dev | xargs -n 1 git branch -d )
  echo '################################################################################'
  echo 'DELETED MERGED BRANCHES'
  printf "\n"
  echo ${ref}
  echo '################################################################################'
}

function pushme() {
  current=$(command git rev-parse --abbrev-ref HEAD)
  echo '################################################################################'
  echo 'pushing to ' ${current}
  printf "\n"

  if [[ $# -eq 0 ]]; then
    command git push origin ${current}
  else
    command git push origin $1
  fi
  echo '################################################################################'
}
