#Region AutoIt3Wrapper 预编译参数(常用参数)
#AutoIt3Wrapper_Icon= 										;图标,支持EXE,DLL,ICO
#AutoIt3Wrapper_Outfile=									;输出文件名
#AutoIt3Wrapper_Outfile_Type=exe							;文件类型
#AutoIt3Wrapper_Compression=4								;压缩等级
#AutoIt3Wrapper_UseUpx=y 									;使用压缩
#AutoIt3Wrapper_Res_Comment= 								;注释
#AutoIt3Wrapper_Res_Description=							;详细信息
#AutoIt3Wrapper_Res_Fileversion=							;文件版本
#AutoIt3Wrapper_Res_FileVersion_AutoIncrement=p				;自动更新版本
#AutoIt3Wrapper_Res_LegalCopyright= 						;版权
#AutoIt3Wrapper_Change2CUI=N                   				;修改输出的程序为CUI(控制台程序)
;#AutoIt3Wrapper_Res_Field=AutoIt Version|%AutoItVer%		;自定义资源段
;#AutoIt3Wrapper_Run_Tidy=                   				;脚本整理
;#AutoIt3Wrapper_Run_Obfuscator=      						;代码迷惑
;#AutoIt3Wrapper_Run_AU3Check= 								;语法检查
;#AutoIt3Wrapper_Run_Before= 								;运行前
;#AutoIt3Wrapper_Run_After=									;运行后
#EndRegion AutoIt3Wrapper 预编译参数(常用参数)
#cs ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿
	
	Au3 版本:
	脚本作者:
	Email:
	QQ/TM:
	脚本版本:
	脚本功能:
	
#ce ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿脚本开始＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿

;worked
;~ BOOL WINAPI DeleteVolumeMountPoint(
;~   __in  LPCTSTR lpszVolumeMountPoint
;~ );

Func _DeleteVolumeMountPoint($str)
	$ret = DllCall("Kernel32.dll", "hwnd", "DeleteVolumeMountPointW", "wstr", $str)
	If $ret[0] <> 0 Then
		Return 1
	Else
		Return 0
	EndIf
EndFunc   ;==>_DeleteVolumeMountPoint



;worked
;~ HANDLE WINAPI FindFirstVolume(
;~   __out  LPTSTR lpszVolumeName,
;~   __in   DWORD cchBufferLength
;~ );

Func _FindFirstVolume()
	$lpszVolumeName = DllStructCreate("wchar[250]")
	$ret = DllCall("Kernel32.dll", "hwnd", "FindFirstVolumeW", "ptr", DllStructGetPtr($lpszVolumeName), "dword", 250)
	SetError(DllStructGetData($lpszVolumeName, 1))
	Return $ret[0]
EndFunc   ;==>_FindFirstVolume


;~ HANDLE WINAPI FindFirstVolumeMountPoint(
;~   __in   LPTSTR lpszRootPathName,
;~   __out  LPTSTR lpszVolumeMountPoint,
;~   __in   DWORD cchBufferLength
;~ );

;~ Func _FindFirstVolumeMountPoint()
;~ 	$lpszRootPathName= DllStructCreate("wchar lpszRootPathName;")
;~ 					DllStructSetData($lpszRootPathName,1,"c:\")
;~ 	$lpszVolumeMountPoint 	= DllStructCreate("wchar lpszVolumeMountPoint;")
;~ 	$ret=DllCall("Kernel32.dll","hwnd","FindFirstVolumeMountPointW","wstr",$lpszRootPathName,"wstr",$lpszVolumeMountPoint,"dword","250")
;~ 	MsgBox(32,"xxx",$lpszVolumeMountPoint)
;~ 	Return $ret[0]
;~ EndFunc


;worked
;~ BOOL WINAPI FindNextVolume(
;~   __in   HANDLE hFindVolume,
;~   __out  LPTSTR lpszVolumeName,
;~   __in   DWORD cchBufferLength
;~ );

Func _FindNextVolume($hFindVolume)
	$lpszVolumeName = DllStructCreate("wchar[250]")
	$ret = DllCall("Kernel32.dll", "int", "FindNextVolumeW", "hwnd", $hFindVolume, "ptr", DllStructGetPtr($lpszVolumeName), "dword", "250")
	;MsgBox(32,"",DllStructGetData($lpszVolumeName,1))
	If $ret[0] <> 0 Then
		SetError(0)
		Return DllStructGetData($lpszVolumeName, 1)
	Else
		SetError(1)
		Return 0
	EndIf
EndFunc   ;==>_FindNextVolume

;worked
;~ UINT WINAPI GetDriveType(
;~   __in_opt  LPCTSTR lpRootPathName
;~ );


;~ DRIVE_UNKNOWN
;~ 0 The drive type cannot be determined.
;~
;~ DRIVE_NO_ROOT_DIR
;~ 1 The root path is invalid; for example, there is no volume mounted at the specified path.
;~
;~ DRIVE_REMOVABLE
;~ 2 The drive has removable media; for example, a floppy drive, thumb drive, or flash card reader.
;~
;~ DRIVE_FIXED
;~ 3 The drive has fixed media; for example, a hard drive or flash drive.
;~
;~ DRIVE_REMOTE
;~ 4 The drive is a remote (network) drive.
;~
;~ DRIVE_CDROM
;~ 5 The drive is a CD-ROM drive.
;~
;~ DRIVE_RAMDISK
;~ 6 The drive is a RAM disk.


Func _GetDriveType($drv)
	$ret = DllCall("Kernel32.dll", "int", "GetDriveTypeW", "wstr", $drv)
	Return $ret[0]
EndFunc   ;==>_GetDriveType

; maybe worked
;~ DWORD WINAPI GetLogicalDrives(void);
;~ If the function succeeds, the return value is a bitmask representing the currently available disk drives. Bit position 0 (the least-significant bit) is drive A, bit position 1 is drive B, bit position 2 is drive C, and so on.

;~ If the function fails, the return value is zero. To get extended error information, call GetLastError.

Func _GetLogicalDrives()
	$ret = DllCall("Kernel32.dll", "int", "GetLogicalDrives")
	Return $ret[0]
EndFunc   ;==>_GetLogicalDrives

;worked
;~ DWORD WINAPI GetLogicalDriveStrings(
;~   __in   DWORD nBufferLength,
;~   __out  LPTSTR lpBuffer
;~ );

Func _GetLogicalDriveStrings()
	$lpBuffer = DllStructCreate("wchar[250]")
	$ret = DllCall("Kernel32.dll", "long", "GetLogicalDriveStringsW", "dword", 250, "ptr", DllStructGetPtr($lpBuffer))
	Return StringLeft(DllStructGetData($lpBuffer, 1), $ret[0])
EndFunc   ;==>_GetLogicalDriveStrings

;worked
;~ BOOL WINAPI GetVolumeNameForVolumeMountPoint(
;~   __in   LPCTSTR lpszVolumeMountPoint,
;~   __out  LPTSTR lpszVolumeName,
;~   __in   DWORD cchBufferLength
;~ );

Func _GetVolumeNameForVolumeMountPoint($lpszVolumeMountPoint)
	$lpszVolumeName = DllStructCreate("wchar[50]")
	$ret = DllCall("Kernel32.dll", "int", "GetVolumeNameForVolumeMountPointW", "wstr", $lpszVolumeMountPoint, "Ptr", DllStructGetPtr($lpszVolumeName), "dword", 50)
	Return DllStructGetData($lpszVolumeName, 1)
EndFunc   ;==>_GetVolumeNameForVolumeMountPoint

;worked
;~ BOOL WINAPI GetVolumePathName(
;~   __in   LPCTSTR lpszFileName,
;~   __out  LPTSTR lpszVolumePathName,
;~   __in   DWORD cchBufferLength
;~ );

Func _GetVolumePathName($lpszFileName)
	$lpszVolumePathName = DllStructCreate("wchar[255]")
	$ret = DllCall("Kernel32.dll", "int", "GetVolumePathNameW", "wstr", $lpszFileName, "Ptr", DllStructGetPtr($lpszVolumePathName), "dword", 255)
	Return DllStructGetData($lpszVolumePathName, 1)
EndFunc   ;==>_GetVolumePathName

;worked
;~ BOOL WINAPI SetVolumeLabel(
;~   __in_opt  LPCTSTR lpRootPathName,
;~   __in_opt  LPCTSTR lpVolumeName
;~ );

Func _SetVolumeLabel($path, $name)
	$ret = DllCall("Kernel32.dll", "int", "SetVolumeLabelW", "wstr", $path, "wstr", $name)
	Return $ret[0]
EndFunc   ;==>_SetVolumeLabel

;worked
;~ BOOL WINAPI SetVolumeMountPoint(
;~   __in  LPCTSTR lpszVolumeMountPoint,
;~   __in  LPCTSTR lpszVolumeName
;~ );

Func _SetVolumeMountPoint($lpszVolumeMountPoint, $lpszVolumeName)
	$ret = DllCall("Kernel32.dll", "int", "SetVolumeMountPointW", "wstr", $lpszVolumeMountPoint, "wstr", $lpszVolumeName)
	Return $ret[0]
EndFunc   ;==>_SetVolumeMountPoint