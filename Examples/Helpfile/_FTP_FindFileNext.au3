#include <FTPEx.au3>

Local $server = 'ftp.csx.cam.ac.uk'
Local $username = ''
Local $pass = ''

Local $Open = _FTP_Open('MyFTP Control')
Local $Conn = _FTP_Connect($Open, $server, $username, $pass)

Local $h_Handle
Local $aFile = _FTP_FindFileFirst($Conn, "/pub/software/programming/pcre/", $h_Handle)
ConsoleWrite('$Filename = ' & $aFile[10] & ' attribute = ' & $aFile[1] & '  -> Error code: ' & @error & @crlf)

$aFile = _FTP_FindFileNext($h_Handle)
ConsoleWrite('$FilenameNext1 = ' & $aFile[10] & ' attribute = ' & $aFile[1] & '  -> Error code: ' & @error & @crlf)

$aFile = _FTP_FindFileNext($h_Handle)
ConsoleWrite('$FilenameNext2 = ' & $aFile[10] & ' attribute = ' & $aFile[1] & '  -> Error code: ' & @error & @crlf)

$aFile = _FTP_FindFileNext($h_Handle)
ConsoleWrite('$FilenameNext3 = ' & $aFile[10] & ' attribute = ' & $aFile[1] & '  -> Error code: ' & @error & @crlf)

Local $FindClose = _FTP_FindFileClose($h_Handle)
Local $Ftpc = _FTP_Close($Open)
