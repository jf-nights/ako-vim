" 結局global な vitalに
let s:V = vital#of('vital')
let s:Random = s:V.import('Random')

" messages
let s:list = ["おはようございます", "今日も頑張りましょう"]

" JOSHIRYOKU faces
let s:faces = ["(✿╹◡╹)", "٩(*'ω'*)و", "(⋈◍＞◡＜◍)。✧♡", "(*σｖσ*)"]

function! Ohayo()
  let m_length = len(s:list)
  let f_length = len(s:faces)

  let m_index = s:Random.range(0, m_length)
  let f_index = s:Random.range(0, f_length)
  let message = s:list[m_index] . s:faces[f_index]
  echo message
endfunction
