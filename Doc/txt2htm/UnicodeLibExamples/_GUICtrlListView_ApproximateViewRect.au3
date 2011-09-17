﻿#include <GuiConstantsEx.au3>
#include <GuiListView.au3>
#include <Constants.au3>

$Debug_LV = False ; 检查传递给 ListView 函数的类名, 设置为真并使用另一控件的句柄可以看出它是否有效

_Main()

Func _Main()
	Local $aXY, $hListView

	GUICreate("ListView Approximate View Rect", 400, 300)
	$hListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState()

	; 添加列
	_GUICtrlListView_InsertColumn($hListView, 0, "Column 1", 100)

	; 添加项目
	For $iI = 0 To 9
		_GUICtrlListView_AddItem($hListView, "Row " & $iI)
	Next

	MsgBox(4096, "Information", "Approximate View Rect")
	; 重设视图大小
	$aXY = _GUICtrlListView_ApproximateViewRect($hListView)
	_WinAPI_SetWindowPos(GUICtrlGetHandle($hListView), 0, 2, 2, $aXY[0], $aXY[1], $SWP_NOZORDER)
	; 循环直到用户退出
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main