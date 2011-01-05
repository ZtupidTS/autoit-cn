#AutoIt3Wrapper_Au3Check_Parameters= -d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#include <GuiRichEdit.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Global $lblMsg, $hRichEdit

Main()

Func Main()
	Local $hGui, $iMsg, $btnNext, $iStep = 0
	$hGui = GUICreate("Example (" & StringTrimRight(@ScriptName,4) &")", 320, 350, -1, -1)
	$hRichEdit = _GUICtrlRichEdit_Create($hGui, "This is a test.", 10, 10, 300, 220, _
			BitOR($ES_MULTILINE, $WS_VSCROLL, $ES_AUTOVSCROLL))
	$lblMsg = GUICtrlCreateLabel("", 10, 235, 300, 60)
	$btnNext = GUICtrlCreateButton("Next", 270, 310, 40, 30)
	GUISetState()

	_GuiCtrlRichEdit_AppendText($hRichEdit, "First paragraph")
	Report("First paragraph: default attributes")

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
						_GuiCtrlRichEdit_AppendText($hRichEdit, @CR & "Second paragraph")
						_GUICtrlRichEdit_SetParaAttributes($hRichEdit, "-hyp")
						Report("Second paragraph: hyphenation off")
					Case 2
						_GuiCtrlRichEdit_SetSel($hRichEdit, 10, -1)
						_GUICtrlRichEdit_SetParaAttributes($hRichEdit, "-hyp;+fpg;+kpn")
						Report("Attributes of first paragraph in selection")
					Case 3
						; Stream all text to the Desktop so you can look at attributes in Word
						_GuiCtrlRichEdit_Deselect($hRichEdit)
						_GuiCtrlRichEdit_StreamToFile($hRichEdit, @DesktopDir & "\gcre.rtf")
						GUICtrlSetState($btnNext, $GUI_DISABLE)
				EndSwitch
		EndSelect
	WEnd
EndFunc   ;==>Main

Func Report($sMsg)
	$sMsg = $sMsg & @CR & @CR & "Get function returns " & @CR & _GUICtrlRichEdit_GetParaAttributes($hRichEdit)
	GUICtrlSetData($lblMsg, $sMsg)
	ControlFocus($hRichEdit, "", "")
EndFunc   ;==>Report