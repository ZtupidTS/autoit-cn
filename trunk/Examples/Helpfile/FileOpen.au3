;================================================
;示例 1 官方默认例子
;================================================
Local $file = FileOpen("test.txt", 0)

; 检查打开的文件是否可读
If $file = -1 Then
	MsgBox(0, "错误", "不能打开文件.")
	Exit
EndIf

FileClose($file)

;================================================
;示例 2 官方默认例子
;================================================
; 自动创建目录结构的另外一个例子.
$file = FileOpen("test.txt", 10) ; 等同 2 + 8 (清除 + 创建目录)

If $file = -1 Then
	MsgBox(0, "错误", "不能打开文件.")
	Exit
EndIf

FileClose($file)

;================================================
;示例 3 ACN例子
;================================================
;脚本目录创建一个名字叫file的文件夹，并且在文件夹内创建一个LOG.TXT文本.
FileClose(FileOpen("file\LOG.TXT",10))
