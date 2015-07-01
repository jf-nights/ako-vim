" 結局global な vitalに
let s:V = vital#of("vital")
let s:Random = s:V.import("Random")

function! akosan#NewLine()
  echom "改行しました"
endfunction

function! akosan#WelcomeBack()
   let t =  str2nr(strftime("%H"))
   if 0 <= t && t < 5
     let message = "こんな時間に起きていて大丈夫ですか……？"
   elseif 5 <= t && t < 10
      let message = "おはようございます"
   elseif 10 <= t && t < 12
      let message = "もうすぐお昼ですよ"
   elseif 12 <= t && t < 14
      let message = "お昼は食べましたか"
   elseif 14 <= t && t < 16
      let message = "お昼寝してます……...zzZZ"
   elseif 16 <= t && t < 18
      let message = "そろそろお腹が空いてきました"
   elseif 18 <= t && t < 20
      let message = "晩ご飯のお時間です！"
   elseif 20 <= t && t < 22
      let message = "夜も更けてまいりました"
   elseif 22 <= t && t <= 24
      let message = "そろそろおやすみの時間です おやすみなさい"
   endif
   echo "阿古 < おかえりなさい ".strftime("%H")."時ですか\n"."       ".message
endfunction

" a:maxByteバイト以上だったら警告してくれる関数
function! akosan#CheckLineByte(maxByte)
  let all = getline(1,"$")
  let overline = []
  for line in all
    if a:maxByte < strlen(line)
      call add(overline, index(all, line)+1)
    endif
  endfor
  if len(overline) > 0
    echo "[warning] ".join(overline, ",")." 行目が".a:maxByte."byteを超えています！"
  else
    echo "いい感じですよ。"
  endif
endfunction

" ---------------------------------------------------------
"  関数を呼ぶコマンドを定義
command! Ohayo :call akosan#Ohayo()
command! Nyan :call akosan#Nyan()


" ---------------------------------------------------------
" messages
let s:messages = ["おはようございます", "今日も頑張りましょう"]

" JOSHIRYOKU faces
let s:faces = ["(✿╹◡╹)", "٩(*'ω'*)و", "(⋈◍＞◡＜◍)。✧♡", "(*σｖσ*)",
      \ "+。:.ﾟ٩(๑＞◡＜๑)۶:.｡+ﾟ"]

function! akosan#Ohayo()
  let m_length = len(s:messages)
  let f_length = len(s:faces)

  let m_index = s:Random.range(0, m_length)
  let f_index = s:Random.range(0, f_length)
  let message = s:messages[m_index] . s:faces[f_index]
  echo message
endfunction

function! akosan#Nyan()
  echo "阿古 < にゃーん (ΦωΦ*)"
endfunction
