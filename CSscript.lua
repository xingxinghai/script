--toast("暂未放置任何脚本，请等待作者添加")
-- 脚本名称:(示例)简单媒体播放器
-- 脚本描述:演示UI函数和声音播放函数
----------------------------------------------------
toast("远程启动")

function play()
UI=getText(DEFAULT_WINDOW_NAME,"U")
	toast("开始播放"..UI)
	startMediaPlayer(UI)
	
	--脚本精灵内置声音
	--toast("开始播放")
	--startMediaPlayer(SCRIPTELF_SOUND_1)
	--startMediaPlayer(SCRIPTELF_SOUND_2)
	--startMediaPlayer(SCRIPTELF_SOUND_3)
end

function pause()
if UI~=nil then
toast("暂停播放"..UI)
	pauseMediaPlayer()
else
toast("你还没有播放过音乐")
end
end

function stop()
--UI_path = getText(DEFAULT_WINDOW_NAME,"UI_path")
if UI~=nil then
toast("停止播放"..UI)
	pauseMediaPlayer()
else
toast("你还没有播放过音乐")
end
end

function createUI()
	showLoopSetting(false)
local html=[[ <!DOCTYPE HTML>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>远程音乐脚本</title>
</head>
<body>
<html>
</fieldset></legend><center><div id="timeA">正在加载中…</div></center>
<he></legend><body bgcolor=pink>
<marquee style="width:320px;height:120px;font-size:12px;border:1px solid #C1DFFF;" direction="up" scrollamount="3" scrolldelay=150" onMouseOver="this.scrollDelay=350" onMouseOut="this.scrollDelay=300">

软件说明:<br>
3月28日增加动态说明
<br>
<a href="http://dwz.cn/BD-shangqiao">反馈</a>
</marquee>
<script>
var mytoday=setInterval (function(){todayTime();},20)

function todayTime(){
var today=new Date()
var H=today.getHours()
var m=today.getMinutes()
var s=today.getSeconds()
var M=timeSet(m)
var S=timeSet(s)
//scriptelf.doString("toast('"+S+"')")
Time=document.getElementById("timeA")
Time.innerHTML="<center><font color=#f00ff0>现在时间是 "+H+":"+M+":"+S+"</font></center>"
}
function timeSet(i){
   if(i<10){
    i="0"+i
    }
return i
}
</script>
</body>
</html>
]]

createWebView("HTML",html)
newLine(windowName)

	createTextView("UIuu","文件路径")
	--createEditText("UI_path","/sdcard/burning.mp3",EDIT_TYPE_NUMBER,MATCH_PARENT,WRAP_CONTENT)
	createEditText("U",getSDCardPath().."/ScriptElf/runtime/assets/滑雪大冒险.mp3",0,MATCH_PARENT,WRAP_CONTENT)
	newLine()
newLine(windowName)
	createButton("UIplay","播放","play")
	createTextView("UI_tv1","  ",WRAP_CONTENT,WRAP_CONTENT)
	createButton("UIpause","暂停","pause")
	createTextView("UI_tv2","  ",WRAP_CONTENT,WRAP_CONTENT)
	createButton("UIstop","停止","stop")
	



end

function main()

	toast("请在UI界面执行")
	
end

if getScriptElfVersion() < 200 then
   main()
end
