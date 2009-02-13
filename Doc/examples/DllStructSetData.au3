;=========================================================
;	建立 struct
;	struct {
;		int				var1;
;		unsigned char	var2;
;		unsigned int	var3;
;		char			var4[128];
;	}
;=========================================================
$str		= "int;ubyte;uint;char[128]"
$a			= DllStructCreate($str)
if @error Then
	MsgBox(0,"","写入 DllStructCreate 错误" & @error);
	exit
endif

;=========================================================
;	在 struct 中设定数据
;	struct.var1	= -1;
;	struct.var2	= 255;
;	struct.var3	= INT_MAX; -1 will be typecasted to (unsigned int)
;	strcpy(struct.var4,"Hello");
;	struct.var4[0]	= 'h';
;=========================================================
DllStructSetData($a,1,-1)
DllStructSetData($a,2,255)
DllStructSetData($a,3,-1)
DllStructSetData($a,4,"Hello")
DllStructSetData($a,4,Asc("h"),1)

;=========================================================
;	显示写入 struct 的信息
;=========================================================
MsgBox(0,"DllStruct","Struct Size: " & DllStructGetSize($a) & @CRLF & _
		"Struct pointer: " & DllStructGetPtr($a) & @CRLF & _
		"Data:" & @CRLF & _
		DllStructGetData($a,1) & @CRLF & _
		DllStructGetData($a,2) & @CRLF & _
		DllStructGetData($a,3) & @CRLF & _
		DllStructGetData($a,4))

;=========================================================
;	如果需要，释放为 struct 分派的内存
;=========================================================
$a = 0
