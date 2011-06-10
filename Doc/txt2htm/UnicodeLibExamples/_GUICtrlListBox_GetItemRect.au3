﻿#include <GUIListBox.au3>
#include <GuiConstantsEx.au3>

$Debug_LB = False ; 检查传递给 ListBox 函数的类名, 设置为真并使用另一控件的句柄可以看出它是否有效

_Main()

Func _Main()
	Local $aRect, $hListBox

	; 创建 GUI
	GUICreate("List Box Get Item Rect", 400, 296)
	$hListBox = GUICtrlCreateList("", 2, 2, 396, 296)
	GUISetState()

	; 添加字符串
	_GUICtrlListBox_BeginUpdate($hListBox)
	For $iI = 1 To 9
		_GUICtrlListBox_AddString($hListBox, StringFormat("%03d : Random string", Random(1, 100, 1)))
	Next
	_GUICtrlListBox_EndUpdate($hListBox)

	; 显示项目矩形
	$aRect = _GUICtrlListBox_GetItemRect($hListBox, 4)
	MsgBox(4160, "Information", "Item 5 Rectangle: " & $aRect[0] & ", " & $aRect[1] & ", " & $aRect[2] & ", " & $aRect[3])

	; 循环直到用户退出
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
