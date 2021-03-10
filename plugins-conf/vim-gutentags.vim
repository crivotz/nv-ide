" ============================================================================
" VIM-GUTENTAGS
" =============================================================================

set tags+=tags,.git/tags
let g:gutentags_enabled = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_resolve_symlinks = 1
let g:gutentags_ctags_tagfile = '.git/tags'
let g:gutentags_project_root = ['.git']
let g:gutentags_ctags_extra_args = ['--fields=+l']
let g:gutentags_add_default_project_roots = 0
let g:gutentags_ctags_executable_ruby = 'ripper-tags'
let g:gutentags_ctags_extra_args = ['--ignore-unsupported-options', '--recursive']
