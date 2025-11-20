setlocal spell
set spelllang=en_gb
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

"vim.keymap.set('i', '<C-f>', function()
"    local filename = vim.fn.expand("%")
"    if filename:match("%.tex$") then
"    else 
"        if filename:match("%.typ$") then
"            vim.cmd('silent exec ".!/Users/dobbikov/Desktop/coding/projects/inkscape-figures/inkscapefigures/main.py create \\"" .. vim.fn.getline(".") .. "\\" \\"" .. vim.b.vimtex.root .. "/figures/\\""')
"        end
"    end
"    vim.cmd('w')
"end, { noremap = true, silent = true })
"
"vim.keymap.set('n', '<C-f>', function()
"  vim.cmd('silent exec "!inkscape-figures edit \\"" .. vim.b.vimtex.root .. "/figures/\\" > /dev/null 2>&1 &"')
"  vim.cmd('redraw!')
"end, { noremap = true, silent = true })


function! InTypstMathZone() abort
  let l:syntax_group = synIDattr(synID(line('.'), col('.'), 1), 'name')
  return l:syntax_group =~? 'typstMath'
endfunction
