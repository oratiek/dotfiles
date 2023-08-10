" quit when a syntax file was already loaded.
if exists("b:current_syntax")
    finish
endif

syn keyword txtComment コメント
syn keyword txtConstant 定数
syn match txtString /文字列/
syn match txtIdentifier /何これ/
syn match txtError /エラー/

syn keyword todo Todo
syn keyword Done done
syn keyword Check Check
syn match Header "#.*$"
syn match One "1.*$"
syn match Two "2.*$"
syn match Three "3.*$"
syn match Four "4.*$"
syn match Five "5.*$"
syn match Six "6.*$"
syn match Seven "7.*$"
syn match Eight "8.*$"
syn match Nine "9.*$"
syn match Ten "10.*$"

hi link txtComment Comment
hi link txtConstant Constant
hi link txtString String
hi link txtIdentifier Identifier
hi link txtError Error
hi link test SpellCap
hi link Header SpellCap
hi link Check Todo
hi One ctermfg=22 guifg=#005f00
hi Two ctermfg=23 guifg=#005f5f
hi Three ctermfg=24 guifg=#005f87
hi Four ctermfg=25 guifg=#005faf
hi Five ctermfg=26 guifg=#005fd7
hi Six  ctermfg=27 guifg=#005fff
hi Seven ctermfg=28 guifg=#008700
hi Eight ctermfg=29 guifg=#00875f
hi Nine ctermfg=30 guifg=#008787
hi Ten ctermfg=31 guifg=#0087af
