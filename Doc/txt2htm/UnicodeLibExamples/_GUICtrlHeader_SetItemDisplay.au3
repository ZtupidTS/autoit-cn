﻿#include <GuiConstantsEx.au3>
#include <GuiHeader.au3>
#include <GuiImageList.au3>
#include <WinAPI.au3>

$Debug_HDR = False ; 检查传递给函数的类名, 设置为真并使用另一控件的句柄可以看出它是否有效

Global $iMemo

_Main()

Func _Main()
	Local $hGUI, $hHeader, $hImage

	; 创建 GUI
	$hGUI = GUICreate("Header", 400, 300)
	$hHeader = _GUICtrlHeader_Create($hGUI)
	$iMemo = GUICtrlCreateEdit("", 2, 24, 396, 274, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; 创建含图像的图像列表
	$hImage = _GUIImageList_Create(11, 11)
	_GUIImageList_Add($hImage, _WinAPI_CreateSolidBitmap($hGUI, 0xFF0000, 11, 11))
	_GUIImageList_Add($hImage, _WinAPI_CreateSolidBitmap($hGUI, 0x00FF00, 11, 11))
	_GUIImageList_Add($hImage, _WinAPI_CreateSolidBitmap($hGUI, 0x0000FF, 11, 11))
	_GUICtrlHeader_SetImageList($hHeader, $hImage)

	; 添加列
	_GUICtrlHeader_AddItem($hHeader, "Column 1", 100, 0)
	_GUICtrlHeader_AddItem($hHeader, "Column 2", 100, 0, 1)
	_GUICtrlHeader_AddItem($hHeader, "Column 3", 100, 0, 2)
	_GUICtrlHeader_AddItem($hHeader, "Column 4", 100)

	; 设置首列的位图
	_GUICtrlHeader_SetItemBitmap($hHeader, 0, _WinAPI_CreateSolidBitmap($hGUI, 0xFF00FF, 11, 11))

	; 设置首列显示方式
	_GUICtrlHeader_SetItemDisplay($hHeader, 0, 1 + 2 + 8)

	; 显示首列的显示方式
	MemoWrite("Column 1 display: " & _GUICtrlHeader_GetItemDisplay($hHeader, 0))

	; 循环直到用户退出
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>_Main

; 写入一行到 memo 控件
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
