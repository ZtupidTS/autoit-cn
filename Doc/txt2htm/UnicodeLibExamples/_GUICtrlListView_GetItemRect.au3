﻿#include <GuiConstantsEx.au3>
#include <GuiListView.au3>
#include <WindowsConstants.au3>

$Debug_LV = False ; 检查传递给 ListView 函数的类名, 设置为真并使用另一控件的句柄可以看出它是否有效

_Main()

Func _Main()
	Local $aRect, $hListView

	GUICreate("ListView Get Item Rectangle", 400, 300)
	$hListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState()

	; 添加列
	_GUICtrlListView_AddColumn($hListView, "Items", 100)

	; 添加项目
	_GUICtrlListView_AddItem($hListView, "Item 1")
	_GUICtrlListView_AddItem($hListView, "Item 2")
	_GUICtrlListView_AddItem($hListView, "Item 3")

	; 获取第二项的矩形
	$aRect = _GUICtrlListView_GetItemRect($hListView, 1)
	MsgBox(4160, "Information", StringFormat("Item 2 Rectangle : [%d, %d, %d, %d]", $aRect[0], $aRect[1], $aRect[2], $aRect[3]))

	; 循环直到用户退出
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
