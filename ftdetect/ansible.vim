function! s:isAnsible()
  let filepath = expand("%:p")
  let filename = expand("%:t")
  if filepath =~ '\v/(playbooks|tasks|roles|handlers)/.*\.yml$' | return 1 | en
  if filepath =~ '\v/(group|host)_vars/' | return 1 | en
  if filename =~ '\v(playbook|site|main|local)\.yml$' | return 1 | en

  return 0
endfunction

function! s:setupTemplate()
  if exists("g:ansible_template_syntaxes")
    let filepath = expand("%:p")
    for syntax_name in items(g:ansible_template_syntaxes)
      let s:syntax_string = '\v/'.syntax_name[0]
      if filepath =~ s:syntax_string
        execute 'set ft='.syntax_name[1].'.jinja2'
        return
      endif
    endfor
  endif
  set ft=jinja2
endfunction

au BufNewFile,BufRead * if s:isAnsible() | set ft=yaml.ansible | en
au BufNewFile,BufRead *.j2,*/ansible/*/templates/* call s:setupTemplate()
au BufNewFile,BufRead */ansible/*/README set ft=ansible_readme
au BufNewFile,BufRead hosts set ft=ansible_hosts
