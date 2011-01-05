#AutoIt3Wrapper_Au3Check_Parameters= -d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#include <GuiRichEdit.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <Color.au3>

Opt('MustDeclareVars', 1)

Global $lblMsg, $hRichEdit

Main()

Func Main()
	Local $hGui, $iMsg, $btnNext, $iStep = 0
	$hGui = GUICreate("Example (" & StringTrimRight(@ScriptName,4) & ")", 320, 350, -1, -1)
	$hRichEdit = _GUICtrlRichEdit_Create($hGui, "", 10, 10, 300, 220, _
			BitOR($ES_MULTILINE, $WS_VSCROLL, $ES_AUTOVSCROLL))
	$lblMsg = GUICtrlCreateLabel("", 10, 235, 300, 60)
	$btnNext = GUICtrlCreateButton("Next", 270, 310, 40, 30)
	GUISetState()

	_GuiCtrlRichEdit_SetText($hRichEdit, "Paragraph 1")
	While True
		$iMsg = GUIGetMsg()
		Select
			Case $iMsg = $GUI_EVENT_CLOSE
				GUIDelete()
				Exit
			Case $iMsg = $btnNext
				$iStep += 1
				Switch $iStep
					Case 1
						Report("1. Initial setting")
					Case 2
						_GuiCtrlRichEdit_SetSel($hRichEdit, 2, 5)
						_GuiCtrlRichEdit_SetCharBkColor($hRichEdit, "304050")
						Report("2. Setting is now")
					Case 3
						_GuiCtrlRichEdit_SetCharBkColor($hRichEdit)
						Report("3. Background of a few characters changed")
					Case 4
						_GuiCtrlRichEdit_SetSel($hRichEdit, 0, -1)
						; Stream all text to the Desktop so you can look at settings in Word
						_GuiCtrlRichEdit_Deselect($hRichEdit)
						_GuiCtrlRichEdit_StreamToFile($hRichEdit, @DesktopDir & "\gcre.rtf")
						Report("4. Saved to File")
						GUICtrlSetState($btnNext, $GUI_DISABLE)
				EndSwitch
		EndSelect
	WEnd
EndFunc   ;==>Main

Func Report($sMsg)
	Local $iBkColor = _GUICtrlRichEdit_GetCharBkColor($hRichEdit)
	Local $sMixed = _Iif(@extended, "+", "~")
	Local $aRet = _ColorGetRGB($iBkColor)
	$sMsg = $sMsg & @CR & @CR & $aRet[0] & ";" & $aRet[1] & ";" & $aRet[2] & " BkColor=0x" & Hex($iBkColor) & ":" & $sMixed
	GUICtrlSetData($lblMsg, $sMsg)
	ControlFocus($hRichEdit, "", "")
EndFunc   ;==>Report