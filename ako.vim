" 結局global な vitalに
let s:V = vital#of('vital')
let s:Random = s:V.import('Random')

" Insertモードで改行したとき

" start vim
autocmd VimEnter * :call WelcomeBack()

" 保存した時
autocmd BufWritePost * echom '保存しました! お疲れ様です'

function NewLine()
  echom '改行しました'
endfunction

function WelcomeBack()
   let t =  str2nr(strftime("%H"))
   if 0 <= t && t < 5
     let message = 'こんな時間に起きていて大丈夫ですか……？'
   elseif 5 <= t && t < 10
      let message = 'おはようございます'
   elseif 10 <= t && t < 12
      let message = 'もうすぐお昼ですよ'
   elseif 12 <= t && t < 14
      let message = 'お昼は食べましたか'
   elseif 14 <= t && t < 16
      let message = 'お昼寝してます……...zzZZ'
   elseif 16 <= t && t < 18
      let message = 'そろそろお腹が空いてきました'
   elseif 18 <= t && t < 20
      let message = '晩ご飯のお時間です！'
   elseif 20 <= t && t < 22
      let message = '夜ですね'
   elseif 22 <= t && t <= 24
      let message = 'そろそろおやすみの時間です おやすみなさい'
   endif
   let message = strftime("%H") . "時ですか " . message
   echo message
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

function! Nyan()
  echo '阿古 < にゃーん (ΦωΦ*)'
endfunction
