﻿#include <GuiConstantsEx.au3>
#include <GDIPlus.au3>

Opt('MustDeclareVars', 1)

_Main()

Func _Main()
	Local $hGUI, $hGraphic, $hPen, $hEndCap, $iInset

	; Create GUI
	$hGUI = GUICreate("GDI+", 400, 300)
	GUISetState()

	; Create resources
	_GDIPlus_Startup ()
	$hGraphic = _GDIPlus_GraphicsCreateFromHWND ($hGUI)
	$hPen = _GDIPlus_PenCreate (0xFF000000, 4)
	$hEndCap = _GDIPlus_ArrowCapCreate (3, 6)

	; Draw arrow 1
	$iInset = 0.5
	_GDIPlus_ArrowCapSetMiddleInset ($hEndCap, $iInset)
	_GDIPlus_PenSetCustomEndCap ($hPen, $hEndCap)
	_GDIPlus_GraphicsDrawLine ($hGraphic, 10, 120, 390, 120, $hPen)

	; Draw arrow 2
	$iInset = _GDIPlus_ArrowCapGetMiddleInset ($hEndCap) + 0.5
	_GDIPlus_ArrowCapSetMiddleInset ($hEndCap, $iInset)
	_GDIPlus_PenSetCustomEndCap ($hPen, $hEndCap)
	_GDIPlus_GraphicsDrawLine ($hGraphic, 10, 150, 390, 150, $hPen)

	; Draw arrow 3
	$iInset = _GDIPlus_ArrowCapGetMiddleInset ($hEndCap) + 0.5
	_GDIPlus_ArrowCapSetMiddleInset ($hEndCap, $iInset)
	_GDIPlus_PenSetCustomEndCap ($hPen, $hEndCap)
	_GDIPlus_GraphicsDrawLine ($hGraphic, 10, 180, 390, 180, $hPen)

	; Loop until user exits
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; Clean up resources
	_GDIPlus_ArrowCapDispose ($hEndCap)
	_GDIPlus_PenDispose ($hPen)
	_GDIPlus_GraphicsDispose ($hGraphic)
	_GDIPlus_Shutdown ()
EndFunc   ;==>_Main