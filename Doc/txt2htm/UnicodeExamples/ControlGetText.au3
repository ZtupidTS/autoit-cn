﻿Run("notepad.exe")
WinWaitActive("[CLASS:Notepad]","")
ControlCommand("[CLASS:Notepad]", "", "Edit1", "EditPaste", "放点文本进去")
Local $var = ControlGetText("[CLASS:Notepad]", "", "Edit1")
MsgBox(32,"返回值",$var)