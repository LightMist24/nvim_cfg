"======================================================
"   Plugin: Auto-Pairs
"   Description: This is a simple patch that could
"                let you be youself when coding.
"                And its creations most come form
"                --Visual Studio Code--.
"   Author: LightMist
"   Version: v1.0
"======================================================

" This is for Arrow to get a pair.
function! ArrowPair(start, end)
    if getline('.')[col('.') - 1] == a:end
        return a:start
    elseif (getline('.') == '#include' || getline('.') == '#include ') && (&filetype ==# 'c' || &filetype ==# 'cpp')
        return a:start . a:end . "\<Left>"
    elseif (&filetype ==# 'html' || &filetype ==# 'md') 
        return a:start . a:end . "\<Left>"
    else
        return a:start
    endif
endfunction

" And this is forPairsation to be pairs.
function! QuotationPair(char)
    let open = getline('.')[col('.') - 2]
    let close = getline('.')[col('.') - 1]
    if getline('.')[col('.') - 2] == a:char && getline('.')[col('.') - 1] == a:char
        return a:char . a:char . "\<Left>"
    " Just let the Error disappear, actually this ' if get..."\<Left>" ' could
    " just delete, it's no more help.
    elseif open == a:char && close != a:char || close == a:char && open != a:char
        return a:char
    elseif a:char == '"' && (len(substitute(getline('.'), '[^"]', '', 'g'))) % 2 != 0
        return a:char
    elseif a:char == '\'' && (len(substitute(getline('.'), "[^']", '', 'g'))) % 2 != 0
        return a:char
    elseif col('.') - 1 < 2
        return a:char
    else
        return a:char . a:char . "\<Left>"
    endif
endfunction

" Making the pairs be nice to write down. 
function! AutoPair(start, end)
    if getline('.')[col('.') - 2] == a:start && getline('.')[col('.') - 1] == a:end
        return a:start . a:end ."\<Left>"
    elseif len(substitute(getline('.'), '[^(]', '', 'g')) < len(substitute(getline('.'), '[^)]', '', 'g'))
        if getline('.')[col('.') - 1] == ')'
            return a:start . a:end . "\<Left>"
        else
            return a:start
        endif
    else
        return a:start . a:end . "\<Left>"
    endif
endfunction

" Cheak the next char after the cursor and do the function.
function! CheakPair(end)
    if len(substitute(getline('.'), '[^(]', '', 'g')) != len(substitute(getline('.'), '[^)]', '', 'g'))
        return a:end
    elseif getline('.')[col('.') - 1] == a:end
        return "\<Right>"
    else
        return a:end
    endif
endfunction

inoremap <silent> < <c-r>=ArrowPair('<', '>')<CR>
inoremap <silent> > <c-r>=CheakPair('>')<CR>
inoremap <silent> ' <c-r>=QuotationPair("'")<CR>
inoremap <silent> " <c-r>=QuotationPair('"')<CR>
inoremap <silent> ( <c-r>=AutoPair('(', ')')<CR>
inoremap <silent> ) <c-r>=CheakPair(')')<CR>
inoremap <silent> [ <c-r>=AutoPair('[', ']')<CR>
inoremap <silent> ] <c-r>=CheakPair(']')<CR>
inoremap <silent> { <c-r>=AutoPair('{', '}')<CR>
inoremap <silent> } <c-r>=CheakPair('}')<CR>
"inoremap <Tab> <c-r>=AutoComplete()<CR>

if has('nvim')
    finish
endif

function! On_backspace()
    let cnt = strpart(getline('.'), 0, col('.') - 1) =~# '^\s*$' ? len(strpart(getline('.'), 0, col('.') - 1)) : 0
    if pumvisible()
        return "\<Backspace>"
    elseif cnt != 0
        if cnt % 4 == 0
            return repeat("\<Backspace>", 4)
        else
            return repeat("\<Backspace>", cnt % 4)
        endif
    else
        return "\<Backspace>"
    endif
endfunction

"This function make the key '<Enter>' smart
function! BetterEnter()
    let tab_count = indent('.') / &shiftwidth
    if &filetype ==# 'vim' && getline('.')[col('.') - 2] == '{'
        return "\<Enter>"
    elseif getline('.')[col('.') - 2] == '{' && getline('.')[col('.') - 1] == '}'
        return repeat("\<Enter>", 2) . "\<Up>" . repeat("\<Tab>", tab_count + 1)
    elseif getline('.')[col('.') - 2] == '(' && getline('.')[col('.') - 1] == ')'
        return repeat("\<Enter>", 2) . "\<Up>" . repeat("\<Tab>", tab_count + 1)
    elseif getline('.')[col('.') - 2] == '[' && getline('.')[col('.') - 1] == ']'
        return repeat("\<Enter>", 2) . "\<Up>" . repeat("\<Tab>", tab_count + 1)
    else
        return "\<Enter>"
    endif
endfunction

function! ShiftEnter()
    if pumvisible() != 0
        return "\<C-y>"
    else
        return "\<Enter>"
    endif
endfunction

inoremap <silent> <Backspace> <c-r>=On_backspace()<CR>
inoremap <silent> <Enter> <c-r>=BetterEnter()<CR>
inoremap <silent> <S-Enter> <c-r>=ShiftEnter()<CR>

