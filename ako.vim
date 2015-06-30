" 結局global な vitalに
let s:V = vital#of('vital')
let s:Random = s:V.import('Random')

" Insertモードで改行したとき
inoremap <CR> <Esc>:call NewLine()<CR>i<CR>

" start vim
autocmd VimEnter * echom 'おかえりなさい'

" 保存した時
autocmd BufWritePost * echom 'お疲れ様です'

function NewLine()
  echom '改行したわ'
endfunction


" messages
let s:messages = ["おはようございます", "今日も頑張りましょう"]

" JOSHIRYOKU faces
let s:faces = ["(✿╹◡╹)", "٩(*'ω'*)و", "(⋈◍＞◡＜◍)。✧♡", "(*σｖσ*)",
      \ "+。:.ﾟ٩(๑＞◡＜๑)۶:.｡+ﾟ"]

function! Ohayo()
  let m_length = len(s:messages)
  let f_length = len(s:faces)

  let m_index = s:Random.range(0, m_length)
  let f_index = s:Random.range(0, f_length)
  let message = s:messages[m_index] . s:faces[f_index]
  echo message
endfunction
