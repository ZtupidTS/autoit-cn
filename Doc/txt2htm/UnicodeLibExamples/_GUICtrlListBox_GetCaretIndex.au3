﻿#include <GUIListBox.au3>
#include <GuiConstantsEx.au3>

$Debug_LB = False ; 检查传递给 ListBox 函数的类名, 设置为真并使用另一控件的句柄可以看出它是否有效

_Main()

Func _Main()
	Local $iIndex, $hListBox

	; 创建 GUI
	GUICreate("List Box Get Caret Index", 400, 296)
	$hListBox = GUICtrlCreateList("", 2, 2, 396, 296)

	GUISetState()

	; 添加字符串
	_GUICtrlListBox_BeginUpdate($hListBox)
	For $iI = 1 To 9
		_GUICtrlListBox_AddString($hListBox, StringFormat("%03d : Random string", Random(1, 100, 1)))
	Next
	_GUICtrlListBox_EndUpdate($hListBox)

	; 设置加字索引
	_GUICtrlListBox_SetCaretIndex($hListBox, 2)

	; 读取加字索引
	$iIndex = _GUICtrlListBox_GetCaretIndex($hListBox)
	_GUICtrlListBox_SetCurSel($hListBox, $iIndex)

	; 循环直到用户退出
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
