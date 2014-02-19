#include <GUIConstantsEx.au3>
#include <GuiRichEdit.au3>
#include <WindowsConstants.au3>

Global $lblMsg, $hRichEdit

Example()

Func Example()
	Local $hGui, $iMsg, $btnNext, $iStep = 0
	$hGui = GUICreate("Example (" & StringTrimRight(@ScriptName, 4) & ")", 320, 350, -1, -1)
	$hRichEdit = _GUICtrlRichEdit_Create($hGui, "This is a test.", 10, 10, 300, 220, _
			BitOR($ES_MULTILINE, $WS_VSCROLL, $ES_AUTOVSCROLL))
	$lblMsg = GUICtrlCreateLabel("", 10, 235, 300, 60)
	$btnNext = GUICtrlCreateButton("Next", 270, 310, 40, 30)
	GUISetState(@SW_SHOW)

	_GUICtrlRichEdit_SetText($hRichEdit, "First paragraph")
	Report("Para with default indent settings")

	While True
		$iMsg = GUIGetMsg()
		Select
			Case $iMsg = $GUI_EVENT_CLOSE
				_GUICtrlRichEdit_Destroy($hRichEdit) ; needed unless script crashes
				; GUIDelete() 	; is OK too
				Exit
			Case $iMsg = $btnNext
				$iStep += 1
				Switch $iStep
					Case 1
						_GUICtrlRichEdit_AppendText($hRichEdit, @CRLF & "Second paragraph")
						Report("Added second paragraph")
					Case 2
						_GUICtrlRichEdit_SetParaIndents($hRichEdit, 0.25, .1)
						Report("Changed indent settings of second paragraph")
					Case 3
						_GUICtrlRichEdit_SetSel($hRichEdit, 10, 26)
						_GUICtrlRichEdit_SetParaIndents($hRichEdit, Default, 0, .2)
						Report("Change settings of both paragraphs")
					Case 4
						; Stream all text to the Desktop so you can look at Indents settings in Word
						_GUICtrlRichEdit_Deselect($hRichEdit)
						_GUICtrlRichEdit_StreamToFile($hRichEdit, @DesktopDir & "\gcre.rtf")
						GUICtrlSetState($btnNext, $GUI_DISABLE)
				EndSwitch
		EndSelect
	WEnd
EndFunc   ;==>Example

Func Report($sMsg)
	$sMsg = $sMsg & @CRLF & @CRLF & "Get function returns " & @CRLF & _GUICtrlRichEdit_GetParaIndents($hRichEdit)
	GUICtrlSetData($lblMsg, $sMsg)
EndFunc   ;==>Report
