﻿#include <GuiEdit.au3>
#include <GuiConstantsEx.au3>

$Debug_Ed = False ; 检查传递给 Edit 函数的类名, 设置为真并使用另一控件的句柄可以看出它是否有效

_Main()

Func _Main()
	Local $hGUI, $hEdit

	; 创建 GUI
	$hGUI = GUICreate("Edit Destroy", 400, 300)
	$hEdit = _GUICtrlEdit_Create($hGUI, "This is a test" & @CRLF & "Another Line", 2, 2, 394, 268)
	GUISetState()

	_GUICtrlEdit_AppendText($hEdit, @CRLF & "Append to the end?")

	MsgBox(4160, "Information", "Destroy Edit Control")
	_GUICtrlEdit_Destroy($hEdit)

	; 循环直到用户退出
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
