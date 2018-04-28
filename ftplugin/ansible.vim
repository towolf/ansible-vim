" Slow yaml highlighting workaround
if exists('+regexpengine') && ('&regexpengine' == 0)
  setlocal regexpengine=1
endif
set isfname+=@-@
set path+=~/src/ansible/roles
set path+=~/src/ansible/playbooks
set path+=./../templates,./../files,templates,files
set path+=templates/**,files/**,tasks/**,vars/**,handlers/**
set path+=./../vars,./../handlers,./../templates/**,./../files/**
setlocal suffixesadd=.yml,.j2
setlocal indentkeys-=<:>
let g:surround_{char2nr('p')} = "{{ \r }}"
let g:surround_{char2nr('P')} = "{{\r}}"
