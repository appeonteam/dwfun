$PBExportHeader$n_supermenu.sru
$PBExportComments$super menu!(³¬¼¶²Ëµ¥)
forward
global type n_supermenu from nonvisualobject
end type
type ust_menuinfo from structure within n_supermenu
end type
type tagrect from structure within n_supermenu
end type
type measureitemstruct from structure within n_supermenu
end type
type logfont from structure within n_supermenu
end type
type textmetric from structure within n_supermenu
end type
type zdrawitemstruct from structure within n_supermenu
end type
type us_bitmap from structure within n_supermenu
end type
type textsize from structure within n_supermenu
end type
type menuiteminfoa from structure within n_supermenu
end type
end forward

type ust_menuinfo from structure
	unsignedlong		itemid
	string		itemname
	string		shortcutkey
	menu		menupt
	unsignedlong		hicon
	integer		level
end type

type tagrect from structure
	long		left
	long		top
	long		right
	long		bottom
end type

type measureitemstruct from structure
	long		ctltype
	long		ctlid
	long		itemid
	long		itemwidth
	long		itemheight
	long		itemdata
end type

type logfont from structure
	long		lfHeight
	long		lfWidth
	long		lfEscapement
	long		lfOrientation
	long		lfWeight
	character		lfItalic
	character		lfUnderline
	character		lfStrikeOut
	character		lfCharSet
	character		lfOutPrecision
	character		lfClipPrecision
	character		lfQuality
	character		lfPitchAndFamily
	string		lfFaceName
end type

type textmetric from structure
	long		tmheight
	long		tmascent
	long		tmdescent
	long		tminternalleading
	long		tmexternalleading
	long		tmavecharwidth
	long		tmmaxcharwidth
	long		tmweight
	long		tmoverhang
	long		tmdigitizedaspectx
	long		tmdigitizedaspecty
	character		tmfirstchar
	character		tmlastchar
	character		tmdefaultchar
	character		tmbreakchar
	character		tmitalic
	character		tmunderlined
	character		tmstruckout
	character		tmpitchandfamily
	character		tmcharset
end type

type zdrawitemstruct from structure
	long		ctltype
	long		ctlid
	long		itemid
	long		itemaction
	long		itemstate
	long		hwnditem
	long		hdc
	tagrect		rcitem
	long		itemdata
end type

type us_bitmap from structure
	long		bmtype
	long		bmwidth
	long		bmheight
	long		bmwidthbytes
	long		bmplanes
	long		bmbitspixel
	blob		bmbits
end type

type textsize from structure
	integer		l_cx
	integer		l_cy
end type

type menuiteminfoa from structure
	unsignedlong		cbsize
	unsignedlong		fmask
	unsignedlong		ftype
	unsignedlong		fstate
	unsignedlong		wid
	unsignedlong		hsubmenu
	unsignedlong		hbmpchecked
	unsignedlong		hbmpunchecked
	unsignedlong		dwitemdata
	long		dwtypedata
	unsignedlong		cch
end type

global type n_supermenu from nonvisualobject autoinstantiate
end type

type prototypes
//´ÓÖ¸¶¨´°¿ÚµÄ½á¹¹ÖÐÈ¡µÃÐÅÏ¢
//FUNCTION uLong GetWindowLong(uLong  hwnd, uLong nIndex) Alias For GetWindowLongA LIBRARY "USER32.DLL"
//ÔÚ´°¿Ú½á¹¹ÖÐÎªÖ¸¶¨µÄ´°¿ÚÉèÖÃÐÅÏ¢
//FUNCTION uLong SetWindowLong(uLong  hwnd, uLong nIndex,uLong dwNewLong) Alias For SetWindowLongA LIBRARY "USER32.DLL"
//½«ÏûÏ¢ÐÅÏ¢´«ËÍ¸øÖ¸¶¨µÄ´°¿Ú¹ý³Ì
//FUNCTION ulong CallWindowProc(ulong lpPrevWndFunc,ulong hWnd,ulong Msg,ulong wParam,ulong lParam) LIBRARY "user32.dll" ALIAS FOR "CallWindowProcA"
//ÔÚÖ¸¶¨´°¿ÚµÄÊôÐÔ±íÖÐÔö¼ÓÒ»¸öÐÂÏî£¬»òÕßÐÞ¸ÄÒ»¸öÏÖÓÐÏî¡£Èç¹ûÖ¸¶¨µÄ×Ö·û´®²»ÔÚÊôÐÔ±íÖÐ£¬ÄÇÃ´¾ÍÔö¼Ó¸ÃÐÂµÄÏî£¬ÐÂÏîÖÐ°üº¬¸Ã×Ö·û´®ºÍ¾ä±ú£¬·ñÔò¾ÍÓÃÖ¸¶¨µÄ¾ä±úÌæ»»¸Ã×Ö·û´®µÄÈ«Ç°¾ä±ú
//FUNCTION ulong SetProp(ulong hwnd,ref string lpString,ulong hData) LIBRARY "user32.dll" ALIAS FOR "SetPropA"
//´Ó¸ø¶¨´°¿ÚµÄÊôÐÔÁÐ±íÖÐ¼ìË÷Êý¾Ý¾ä±ú¡£¸ø¶¨µÄ×Ö·û´®±êÊ¶ÁËÒª¼ìË÷µÄ¾ä±ú¡£¸Ã×Ö·û´®ºÍ¾ä±ú±ØÐëÔÚÇ°Ò»´Îµ÷ÓÃSetPropº¯ÊýÊ±ÒÑ¾­¼Óµ½ÊôÐÔ±íÖÐ
//FUNCTION ulong GetProp(ulong hwnd,ref string lpString) LIBRARY "user32.dll" ALIAS FOR "GetPropA"
//·µ»ØÎ»ÓÚ²Ëµ¥ÖÐÖ¸¶¨Î»ÖÃ´¦µÄÌõÄ¿µÄ²Ëµ¥ID
FUNCTION ulong GetMenuItemID(ulong hMenu,ulong nPos) LIBRARY "user32.dll"
//È¡µÃ·ÖÅä¸øÖ¸¶¨´°¿ÚµÄ²Ëµ¥µÄ¾ä±ú
FUNCTION ulong GetMenu(ulong hwnd) LIBRARY "user32.dll"
//È¡µÃ±»Ö¸¶¨²Ëµ¥¼¤»îµÄÏÂÀ­Ê½²Ëµ¥»ò×Ó²Ëµ¥µÄ¾ä±ú
FUNCTION ulong GetSubMenu(ulong hMenu,ulong nPos) LIBRARY "user32.dll"
//½«Ö¸¶¨²Ëµ¥ÏîµÄÕýÎÄ×Ö·û´®¿½±´µ½Ö¸¶¨»º³åÇø
FUNCTION ulong GetMenuString(ulong hMenu,ulong wIDItem,ref string lpString,ulong nMaxCount,ulong wFlag) LIBRARY "user32.dll" ALIAS FOR "GetMenuStringA;Ansi"
//¸Ä±ä²Ëµ¥ÌõÄ¿
FUNCTION ulong ModifyMenu(ulong hMenu,ulong nPosition,ulong wFlags,ulong wIDNewItem,string lpString) LIBRARY "user32.dll" ALIAS FOR "ModifyMenuA;Ansi"
//ÎÄ±¾»æÍ¼º¯Êý
//FUNCTION ulong TextOut(ulong hdc,ulong x,ulong y,ref string lpString,ulong nCount) LIBRARY "gdi32.dll" ALIAS FOR "TextOutA"
//ÄÚ´æ¿½±´
SUBROUTINE CopyMemory(ref measureitemstruct pDesc, ulong pSource,ulong size) LIBRARY "kernel32" ALIAS FOR "RtlMoveMemory;Ansi"
SUBROUTINE CopyMemory(ref zdrawitemstruct pDesc, ulong pSource,ulong size) LIBRARY "kernel32" ALIAS FOR "RtlMoveMemory;Ansi"
SUBROUTINE CopyMemory(ulong pDesc, ref measureitemstruct pSource, ulong size) LIBRARY "kernel32" ALIAS FOR "RtlMoveMemory;Ansi"
SUBROUTINE CopyMemory(ulong pDesc, ref zdrawitemstruct pSource,ulong size) LIBRARY "kernel32" ALIAS FOR "RtlMoveMemory;Ansi"
//ÓÃÖ¸¶¨µÄË¢×ÓÌî³äÒ»¸ö¾ØÐÎ
FUNCTION ulong FillRect(ulong hdc,ref tagrect lpRect,ulong hBrush) LIBRARY "user32.dll" alias for "FillRect;Ansi"
//ÓÃ´¿É«´´½¨Ò»¸öË¢×Ó
FUNCTION ulong CreateSolidBrush(ulong crColor) LIBRARY "gdi32.dll"
//ÎªÈÎºÎÒ»ÖÖ±ê×¼ÏµÍ³ÑÕÉ«È¡µÃÒ»¸öË¢×Ó 
FUNCTION ulong GetSysColorBrush(ulong nIndex) LIBRARY "user32.dll"
//ÅÐ¶ÏÖ¸¶¨windowsÏÔÊ¾¶ÔÏóµÄÑÕÉ«
FUNCTION ulong GetSysColor(ulong nIndex) LIBRARY "user32.dll"
//Ö¸¶¨ÒõÓ°Ë¢×Ó¡¢ÐéÏß»­±ÊÒÔ¼°×Ö·ûÖÐµÄ¿ÕÏ¶µÄÌî³ä·½Ê½
FUNCTION ulong SetBkMode(ulong hdc,ulong nBkMode) LIBRARY "gdi32.dll"
//ÎªÖ¸¶¨µÄÉè±¸³¡¾°ÉèÖÃ±³¾°ÑÕÉ«¡£±³¾°ÑÕÉ«ÓÃÓÚÌî³äÒõÓ°Ë¢×Ó¡¢ÐéÏß»­±ÊÒÔ¼°×Ö·û£¨Èç±³¾°Ä£Ê½ÎªOPAQUE£©ÖÐµÄ¿ÕÏ¶¡£Ò²ÔÚÎ»Í¼ÑÕÉ«×ª»»ÆÚ¼äÊ¹ÓÃ
FUNCTION ulong SetBkColor(ulong hdc,ulong crColor) LIBRARY "gdi32.dll"
//ÉèÖÃµ±Ç°ÎÄ±¾ÑÕÉ«¡£ÕâÖÖÑÕÉ«Ò²³ÆÎª¡°Ç°¾°É«¡± 
FUNCTION ulong SetTextColor(ulong hdc,ulong crColor) LIBRARY "gdi32.dll"
//½«Ò»·ùÎ»Í¼´ÓÒ»¸öÉè±¸³¡¾°¸´ÖÆµ½ÁíÒ»¸ö¡£Ô´ºÍÄ¿±êDCÏà»¥¼ä±ØÐë¼æÈÝ¡£Õâ¸öº¯Êý»áÔÚÉè±¸³¡¾°ÖÐ¶¨ÒåÒ»¸öÄ¿±ê¾ØÐÎ£¬²¢ÔÚÎ»Í¼ÖÐ¶¨ÒåÒ»¸öÔ´Í¼Ïó¡£Ô´¾ØÐÎ»á¸ù¾ÝÐèÒª½øÐÐÉìËõ£¬ÒÔ±ãÓëÄ¿±ê¾ØÐÎµÄ´óÐ¡Ïà·û
//FUNCTION ulong StretchBlt(ulong hdc,ulong x,ulong y,ulong nWidth,ulong nHeight,ulong hSrcDC,ulong xSrc,ulong ySrc,ulong nSrcWidth,ulong nSrcHeight,ulong dwRop) LIBRARY "gdi32.dll"
//½«ÎÄ±¾Ãè»æµ½Ö¸¶¨µÄ¾ØÐÎÖÐ
FUNCTION ulong DrawText(ulong hdc,string lpStr,ulong nCount,ref tagrect lpRect,ulong wFormat) LIBRARY "user32.dll" ALIAS FOR "DrawTextA;Ansi"
//ÓÃÖ¸¶¨µÄÑùÊ½Ãè»æÒ»¸ö¾ØÐÎµÄ±ß¿ò
FUNCTION boolean DrawEdge(ulong hdc,ref tagrect qrc,ulong edge,ulong grfFlags) LIBRARY "user32.dll" alias for "DrawEdge;Ansi"
//ÊÍ·ÅÓÉµ÷ÓÃGetDC»òGetWindowDCº¯Êý»ñÈ¡µÄÖ¸¶¨Éè±¸³¡¾°¡£Ëü¶ÔÀà»òË½ÓÐÉè±¸³¡¾°ÎÞÐ§£¨µ«ÕâÑùµÄµ÷ÓÃ²»»áÔì³ÉËðº¦£©
FUNCTION ulong ReleaseDC(ulong hwnd,ulong hdc) LIBRARY "user32.dll"
//É¾³ý×¨ÓÃÉè±¸³¡¾°»òÐÅÏ¢³¡¾°£¬ÊÍ·ÅËùÓÐÏà¹Ø´°¿Ú×ÊÔ´
FUNCTION ulong DeleteDC(ulong hdc) LIBRARY "gdi32.dll"
//Ã¿¸öÉè±¸³¡¾°¶¼¿ÉÄÜÓÐÑ¡ÈëÆäÖÐµÄÍ¼ÐÎ¶ÔÏó¡£ÆäÖÐ°üÀ¨Î»Í¼¡¢Ë¢×Ó¡¢×ÖÌå¡¢»­±ÊÒÔ¼°ÇøÓòµÈµÈ¡£Ò»´ÎÑ¡ÈëÉè±¸³¡¾°µÄÖ»ÄÜÓÐÒ»¸ö¶ÔÏó¡£Ñ¡¶¨µÄ¶ÔÏó»áÔÚÉè±¸³¡¾°µÄ»æÍ¼²Ù×÷ÖÐÊ¹ÓÃ¡£ÀýÈç£¬µ±Ç°Ñ¡¶¨µÄ»­±Ê¾ö¶¨ÁËÔÚÉè±¸³¡¾°ÖÐÃè»æµÄÏß¶ÎÑÕÉ«¼°ÑùÊ½
FUNCTION ulong SelectObject(ulong hdc,ulong hObject) LIBRARY "gdi32.dll"
//ÓÃÕâ¸öº¯ÊýÉ¾³ýGDI¶ÔÏó£¬±ÈÈç»­±Ê¡¢Ë¢×Ó¡¢×ÖÌå¡¢Î»Í¼¡¢ÇøÓòÒÔ¼°µ÷É«°åµÈµÈ¡£¶ÔÏóÊ¹ÓÃµÄËùÓÐÏµÍ³×ÊÔ´¶¼»á±»ÊÍ·Å
FUNCTION ulong DeleteObject(ulong hObject) LIBRARY "gdi32.dll"
//ÓÃÖ¸¶¨µÄÑùÊ½¡¢¿í¶ÈºÍÑÕÉ«´´½¨Ò»¸ö»­±Ê 
FUNCTION ulong CreatePen(ulong nPenStyle,ulong nWidth,ulong crColor) LIBRARY "gdi32.dll"
//ÎªÖ¸¶¨µÄÉè±¸³¡¾°Ö¸¶¨Ò»¸öÐÂµÄµ±Ç°»­±ÊÎ»ÖÃ¡£Ç°Ò»¸öÎ»ÖÃ±£´æÔÚlpPointÖÐ
FUNCTION ulong MoveToEx(ulong hdc,ulong x,ulong y,ulong lpPoint) LIBRARY "gdi32.dll"
//ÓÃµ±Ç°»­±Ê»­Ò»ÌõÏß£¬´Óµ±Ç°Î»ÖÃÁ¬µ½Ò»¸öÖ¸¶¨µÄµã¡£Õâ¸öº¯Êýµ÷ÓÃÍê±Ï£¬µ±Ç°Î»ÖÃ±ä³Éx,yµã
FUNCTION ulong LineTo(ulong hdc,ulong x,ulong y) LIBRARY "gdi32.dll"
//Ð£Ñé´°¿ÚµÄÈ«²¿»ò²¿·Ö¿Í»§Çø¡£ÕâÑù±ã¿É¸æÖ®windowsÖ¸¶¨µÄÇøÓò²»ÐèÒªÖØ»­ 
//FUNCTION ulong ValidateRect(ulong hwnd,ref tagrect lpRect) LIBRARY "user32.dll"
//È¡»ØÓëÄ³Ò»Éè±¸³¡¾°Ïà¹ØµÄ´°¿ÚµÄ¾ä±ú
//FUNCTION ulong WindowFromDC(ulong hdc) LIBRARY "user32.dll"
//»ñÈ¡Ö¸¶¨´°¿ÚµÄÉè±¸³¡¾°
FUNCTION ulong GetDC(ulong hwnd) LIBRARY "user32.dll"
//ÔØÈëÒ»¸öÎ»Í¼¡¢Í¼±ê»òÖ¸Õë
FUNCTION ulong LoadImage(ulong hInst,string lpsz,ulong un1,ulong n1,ulong n2,ulong un2) LIBRARY "user32.dll" ALIAS FOR "LoadImageA;Ansi"
//ÔÚÖ¸¶¨µÄÎ»ÖÃ»­Ò»¸öÍ¼±ê
//FUNCTION ulong DrawIcon(ulong hdc,ulong x,ulong y,ulong hIcon) LIBRARY "user32.dll"
FUNCTION boolean DrawIconEx(ulong hdc,ulong xLeft,ulong yTop,ulong hIcon,ulong cxWidth,ulong cyWidth,ulong istepIfAniCur,ulong hbrFlickerFreeDraw,ulong diFlags) LIBRARY "user32.dll"
//´´½¨Ò»·ùÓëÉè±¸ÓÐ¹ØÎ»Í¼£¬ËüÓëÖ¸¶¨µÄÉè±¸³¡¾°¼æÈÝ
//FUNCTION ulong CreateCompatibleBitmap(ulong hdc,ulong nWidth,ulong nHeight) LIBRARY "gdi32.dll"
//ÔÚÖ¸¶¨µÄÉè±¸³¡¾°ÖÐÉèÖÃÒ»¸öÏñËØµÄRGBÖµ
//FUNCTION ulong SetPixel(ulong hdc,ulong x,ulong y,ulong crColor) LIBRARY "gdi32.dll"
 
//Function Long GetMenuItemRect (long hWnd,long hMenu, long uItem, tagrect lprcItem)Library "user32"

FUNCTION ulong GetTextFace(ulong hdc,ulong nCount,ref string lpFacename) LIBRARY "gdi32.dll" ALIAS FOR "GetTextFaceA;Ansi"
FUNCTION ulong GetTextMetrics(ulong hdc,ref TEXTMETRIC lpMetrics) LIBRARY "gdi32.dll" ALIAS FOR "GetTextMetricsA;Ansi"
FUNCTION ulong CreateFontIndirect(ref LOGFONT lpLogFont) LIBRARY "gdi32.dll" ALIAS FOR "CreateFontIndirectA;Ansi"
FUNCTION boolean DrawState(ulong hDC,ulong hBrush,ulong lpDrawStateProc,ulong lParam,ulong wParam,ulong n1,ulong n2,ulong n3,ulong n4,ulong un) LIBRARY "user32.dll" ALIAS FOR "DrawStateA"
FUNCTION ulong DestroyIcon(ulong hIcon) LIBRARY "user32.dll"

//Added by ÍõÎÞµÐ
FUNCTION ulong Rectangle(ulong hdc,ulong X1,ulong Y1,ulong X2,ulong Y2) LIBRARY "gdi32.dll" 
//Added by bluetlck
//computes the width and height of the specified string of text
FUNCTION ulong GetTextExtentPoint32(ulong hdc,ref string lpsz,ulong cbString,ref TEXTSIZE lpSize) LIBRARY "gdi32.dll" ALIAS FOR "GetTextExtentPoint32A;Ansi"
//changes information about a menu item
FUNCTION boolean SetMenuItemInfo(ulong hMenu,ulong un,boolean bool,ref MENUITEMINFOA lpcMenuItemInfo) LIBRARY "user32.dll" ALIAS FOR "SetMenuItemInfoA;Ansi"
//retrieves information about a menu item. 
FUNCTION boolean GetMenuItemInfo(ulong hMenu,ulong un,boolean b,ref MENUITEMINFOA lpMenuItemInfo1) LIBRARY "user32.dll" ALIAS FOR "GetMenuItemInfoA;Ansi"
FUNCTION ulong GetMenuItemCount(ulong hMenu) LIBRARY "user32.dll"
FUNCTION ulong GetSystemMetrics(ulong nIndex) LIBRARY "user32.dll"  
FUNCTION ulong GetSystemMenu(ulong hwnd,boolean bRevert) LIBRARY "user32.dll"
FUNCTION ulong DeleteMenu(ulong hMenu,ulong nPosition,ulong wFlags) LIBRARY "user32.dll"


function long LoadLibrary( ref string lpLibFileName2 ) LIBRARY "KERNEL32"  Alias For "LoadLibraryA;Ansi"
function long FreeLibrary( long hinstance ) LIBRARY "KERNEL32"
FUNCTION ulong LoadBitmap(ulong hInstance, long lpBitmapName) LIBRARY "user32.dll" ALIAS FOR "LoadBitmapA"

FUNCTION ulong CreateDC(string lpDriverName,string lpDeviceName, string lpOutput, long lpInitData) LIBRARY "gdi32.dll" ALIAS FOR "CreateDCA;Ansi"
FUNCTION ulong CreateCompatibleDC(ulong hdc) LIBRARY "gdi32.dll"
FUNCTION ulong GetPixel(ulong hdc,ulong x,ulong y) LIBRARY "gdi32.dll"
FUNCTION ulong LoadImage(ulong hInst,long lpsz,ulong un1,ulong n1,ulong n2,ulong un2) LIBRARY "user32.dll" ALIAS FOR "LoadImageA"
//if it's use in other version ,please modify by hand.
FUNCTION long FN_ResGetIconID(string lpLibFileName) LIBRARY "PBVM80.dll" alias for "FN_ResGetIconID;Ansi" 
FUNCTION long FN_ResGetBitmapID(string lpLibFileName) LIBRARY "PBVM80.dll" alias for "FN_ResGetBitmapID;Ansi" 
FUNCTION string FN_ResGetBitmapName(long lpLibFileName) LIBRARY "PBVM80.dll" alias for "FN_ResGetBitmapName;Ansi" 
Function Long ImageList_Create (Long MinCx , Long MinCy , Long flags ,Long cInitial ,Long cGrow) Library "PBVM80.dll" ALIAS FOR "PBImageList_Create"
Function Long ImageList_AddMasked(Long hImageList ,Long hbmImage , Long crMask ) Library "PBVM80.dll" ALIAS FOR "PBImageList_AddMasked"
Function Long ImageList_GetIcon(Long hImageList , Long ImgIndex , Long hbmMask ) Library "PBVM80.dll" ALIAS FOR "PBImageList_GetIcon"
Function Long ImageList_Destroy(Long hImageList) Library "PBVM80.dll" ALIAS FOR "PBImageList_Destroy"
//ImageList º¯Êý
//Function Long ImageList_Create (Long MinCx , Long MinCy , Long flags ,Long cInitial ,Long cGrow) Library "COMCTL32.DLL"
//Function Long ImageList_AddMasked(Long hImageList ,Long hbmImage , Long crMask ) Library "COMCTL32.DLL"
//Function Long ImageList_GetIcon(Long hImageList , Long ImgIndex , Long hbmMask ) Library "COMCTL32.DLL"

FUNCTION ulong RoundRect(ulong hdc,ulong X1,ulong Y1,ulong X2,ulong Y2,ulong X3,ulong Y3) LIBRARY "gdi32.dll"
FUNCTION ulong GetStockObject(ulong nIndex) LIBRARY "gdi32.dll"
end prototypes

type variables
//------------------------------------------------------------------
		Public:
//------------------------------------------------------------------

Integer MenuStyle = 1
CONSTANT INTEGER STYLE_NORMAL = 1
CONSTANT INTEGER STYLE_OFFICE2K    = 2
CONSTANT INTEGER STYLE_STYLE3   = 3

CONSTANT INTEGER STYLE_GRADIENT = 4
CONSTANT INTEGER STYLE_VGRADIENT = 5
CONSTANT INTEGER STYLE_VHEADERGRADIENT = 6
CONSTANT INTEGER STYLE_VEDGEGRADIENT = 7

CONSTANT INTEGER STYLE_OFFICEXP = 8
CONSTANT INTEGER STYLE_OFFICEXP2 = 9
CONSTANT INTEGER STYLE_TERMINAL_XP = 10
CONSTANT INTEGER STYLE_COLOR_INFOBK = 11
//background style:
//============= bluetlck add. =========================
Integer MenuBKStyle = 0
CONSTANT INTEGER STYLE_BKNORMAL = 0
CONSTANT INTEGER STYLE_BKWhite  = 1
CONSTANT INTEGER STYLE_BKGRAY  = 2
CONSTANT INTEGER STYLE_BKGRAY_XP  = 3
CONSTANT INTEGER STYLE_BKAMB = 4
//Gradient style:
//============= rjh add. =========================
LONG COLOR_START	= 0
LONG COLOR_END		= 0

//------------------------------------------------------------------
		Private:
//------------------------------------------------------------------
MENUITEMINFOA lpMenuItemInfo
long	il_winhandle
window	iw_win
ust_menuinfo	ist_menuinfo[]
integer ii_num

//=========== Constant ============

//SetBkMode
CONSTANT ulong  TRANSPARENT = 1
//DrawEdge
CONSTANT uLong BDR_RAISEDOUTER = 1
CONSTANT uLong BDR_SUNKENOUTER = 2
CONSTANT uLong BDR_RAISEDINNER = 4
CONSTANT uLong BDR_SUNKENINNER = 8
CONSTANT uLong BDR_OUTER =  3
CONSTANT uLong BDR_INNER =  12

CONSTANT uLong BF_LEFT = 1
CONSTANT uLong BF_RIGHT = 4
CONSTANT uLong BF_TOP = 2
CONSTANT uLong BF_BOTTOM = 8
CONSTANT uLong BF_RECT = 1
//GetSysColor GetSysColorBrush
CONSTANT uLong COLOR_BACKGROUND=1 
CONSTANT uLong COLOR_HIGHLIGHT= 13
CONSTANT uLong COLOR_HIGHLIGHTTEXT  =  14
CONSTANT uLong COLOR_MENU = 4
CONSTANT uLong COLOR_WINDOW = 5 
CONSTANT uLong COLOR_MENUTEXT = 7
CONSTANT uLong COLOR_WINDOWTEXT = 8
CONSTANT uLong COLOR_ACTIVECAPTION = 2
CONSTANT uLong COLOR_BTNFACE = 15
CONSTANT uLong COLOR_INFOBK = 24
Constant integer COLOR_BTNHIGHLIGHT = 20
Constant integer COLOR_BTNSHADOW = 16
//ModifyMenu,Get
CONSTANT uLong MF_BITMAP = 4
CONSTANT uLong MF_BYCOMMAND = 0
CONSTANT uLong MF_BYPOSITION = 1024
CONSTANT uLong MF_CHECKED = 8
CONSTANT uLong MF_DISABLED = 2
CONSTANT uLong MF_ENABLED = 0
CONSTANT uLong MF_GRAYED = 1
CONSTANT uLong MF_MENUBARBREAK = 32
CONSTANT uLong MF_MENUBREAK = 64
CONSTANT uLong MF_OWNERDRAW = 256
CONSTANT uLong MF_POPUP = 16
CONSTANT uLong MF_SEPARATOR = 2048
CONSTANT uLong MF_STRING = 0
CONSTANT uLong MF_UNCHECKED = 0
//LoadImage
CONSTANT uLong IMAGE_BITMAP = 0
CONSTANT uLong IMAGE_ICON = 1
CONSTANT uLong IMAGE_CURSOR = 2
CONSTANT uLong IMAGE_ENHMETAFILE = 3

CONSTANT uLong LR_DEFAULTCOLOR = 0
CONSTANT uLong LR_MONOCHROME = 1
CONSTANT uLong LR_COLOR = 2
CONSTANT uLong LR_COPYRETURNORG = 4
CONSTANT uLong LR_COPYDELETEORG = 8
CONSTANT uLong LR_LOADFROMFILE = 16
CONSTANT uLong LR_LOADTRANSPARENT = 32
CONSTANT uLong LR_DEFAULTSIZE = 64
CONSTANT uLong LR_VGACOLOR = 128
CONSTANT uLong LR_LOADMAP3DCOLORS = 4096
CONSTANT uLong LR_CREATEDIBSECTION = 8192
CONSTANT uLong LR_COPYFROMRESOURCE = 16384
CONSTANT uLong LR_SHARED = 32768
//CreatePen
CONSTANT uLong PS_SOLID = 0
//
CONSTANT uLong SRCCOPY = 13369376

//DrawText
CONSTANT uLong DT_LEFT = 0
CONSTANT uLong DT_CENTER = 1
CONSTANT uLong DT_RIGHT = 2
CONSTANT uLong DT_VCENTER = 4
CONSTANT uLong DT_SINGLELINE = 32
CONSTANT uLong DT_CALCRECT =  1024


Constant integer DST_ICON = 3
Constant integer DST_BITMAP =4
Constant integer DSS_NORMAL =0
Constant integer DSS_DISABLED = 32



Constant int SM_CYMENU = 15
Constant int SM_CXMENUCHECK = 71

//use in GetStockObject
Constant int WHITE_BRUSH=0
Constant int GRAY_BRUSH =1
Constant int LTGRAY_BRUSH=2
Constant int  DKGRAY_BRUSH=3
Constant int  BLACK_BRUSH=4
Constant int  NULL_BRUSH=5
Constant int  WHITE_PEN=6
Constant int  BLACK_PEN=7
Constant int  NULL_PEN=8
Constant int  OEM_FIXED_FONT=10
Constant int  ANSI_FIXED_FONT=11
Constant int  ANSI_VAR_FONT=12
Constant int  SYSTEM_FONT=13


end variables

forward prototypes
public subroutine of_color2rgb (long lg_color, ref integer r, ref integer g, ref integer b)
public function long of_getstockicon (string as_stockbitmap, ref integer ai_imagetype)
private function unsignedlong of_getmenufont (long hdc)
public subroutine of_xprect (unsignedlong hdc, tagrect rect, long al_pencolor, long al_brushcolor)
public function long of_geticonhandle (string as_iconname)
private function integer of_find_bymenuid (string as_itemname)
private function integer of_find_byid (long al_itemid)
private function integer of_find_byname (string as_itemname)
public subroutine of_setmenuicon (string as_type, string as_itemname, string as_icon)
public function long of_getmaskcolor (long al_bitmaphandle)
private function integer of_add (long al_itemid, string as_text, ref menu am_menu, integer ai_level)
public subroutine of_registermenu (integer ai_level, long al_hmenu, long al_hsysmenu)
public subroutine of_drawitem (ref unsignedlong childid, ref long drawitemstruct)
private subroutine of_drawtext (unsignedlong hdc, string as_text, string as_shortcutkey, tagrect ast_rect, boolean ab_enabled)
public subroutine of_registermenu (ref menu am_menu, integer ai_level, long al_hmenu, long al_hsysmenu)
public subroutine of_drawchecked (long hdc, ref tagrect rect)
private function unsignedlong of_createverticalfont (long hdc)
public function boolean of_containselement (long al_src, long al_exponent)
public subroutine of_fillwithgradient (unsignedlong hdc, tagrect rect, long colorfrom, long colorto)
private subroutine of_drawfirstlevelmenu (ref zdrawitemstruct ast_drawitemstruct, ref ust_menuinfo ast_menuinfo)
private subroutine of_drawnormalitem (integer ai_menubkstyle, long hdc, ref tagrect ast_rect, ref ust_menuinfo ast_menuinfo)
public function decimal of_getshortcutkeyrate (menu am_menu)
public subroutine of_setvisible (menu am_menu, boolean ab_visible)
public subroutine of_registerwindow (readonly window aw_win)
public function boolean of_iswhitespace (string as_source)
public subroutine of_measureitem (ref unsignedlong childid, ref long measureitemstruct)
private subroutine of_drawselectitem (integer ai_menustyle, long hdc, ref tagrect ast_rect, ref ust_menuinfo ast_menuinfo)
end prototypes

public subroutine of_color2rgb (long lg_color, ref integer r, ref integer g, ref integer b);//³¤ÕûÐÍÑÕÉ«Öµ£¬×ªÎªRGBÐÍ£¬ÐèÒªÈý¸öref²ÎÊý

b	=	lg_color	/	65536
g	=	(lg_color - b	*	65536)	/	256
r	=	lg_color - g * 256 - b * 65536


end subroutine

public function long of_getstockicon (string as_stockbitmap, ref integer ai_imagetype);//////////////////////////////////////////////////////////////////////////////
//
//	º¯ÊýÃû³Æ:      Of_getstockicon
//	·ÃÎÊ¼¶±ð:  		Public
//	²ÎÊý:          as_stockbitmap             stockÎ»Í¼Ãû³Æ
//                ai_imagetype               Î»Í¼ or Í¼±ê±êÊ¾ 
//	·µ»ØÖµ:        Long
//	¹¦ÄÜÃèÊö:      µÃµ½ÏµÍ³stockÎ»Í¼ÏàÓ¦µÄ±êÊ¶·û
// ²¹³äËµÃ÷:
//
//////////////////////////////////////////////////////////////////////////////
//	ÐÞ¸Ä¼ÇÂ¼£º2001-11-15
// Éè¼Æ£ººÎÈñ
// ±àÂë£ººÎÈñ
// ÉóºË£ººÎÈñ
////////////////////////////////////////////////////////////////////////////
Long  ll_Identifier

//¼ì²é²ÎÊý
If IsNull(as_StockBitmap) Or as_StockBitmap="" Then Return -1

 ll_Identifier = FN_ResGetBitmapID(as_stockbitmap)
 
 if ll_Identifier<=0 then 
 	ll_Identifier = FN_ResGetIconID(as_stockbitmap)
	ai_imagetype= IMAGE_ICON
 else  //Î»Í¼ 
	ai_imagetype = IMAGE_BITMAP
 end if
 return ll_Identifier
end function

private function unsignedlong of_getmenufont (long hdc);//-------------------------------------------------------*
//	FUNCTION:		of_getmenufont									*
//	Description:														*
//-------------------------------------------------------*
// Arguments:	
//
//	long hdc
//															*
//-------------------------------------------------------*
//	Author(s)		Date			Remark							*
//	Rain				2003.03.10										*
//-------------------------------------------------------*
long	ll_menufont
long	ll_textlen = 255
string	ls_text = space(255)
LOGFONT ltLF_FONT
TEXTMETRIC ltTM

//IF	il_menufont = 0	THEN
	
	ll_textlen = GetTextFace(hdc, ll_TextLen, ls_Text)
	GetTextMetrics(hdc,ltTm)
	
	ltLF_FONT.lfFaceName = Left(ls_text, ll_textlen+1 )
	ltLF_FONT.lfHeight = ltTM.tmHeight
	ltLF_FONT.lfWeight = ltTM.tmWeight 
	
	ll_menufont = CreateFontIndirect(ltLF_FONT)
//END	IF

RETURN	 ll_menufont
end function

public subroutine of_xprect (unsignedlong hdc, tagrect rect, long al_pencolor, long al_brushcolor);//--------------------------------------------------------------------
// The function was added By: ÍõÎÞµÐ		Date: 2003.03.02
// Modified By: ÍõÎÞµÐ                    Date: 2003.03.16
//--------------------------------------------------------------------



uLong hOldPen, hPen
uLong xp1,yp1,xp2,yp2
uLong hNewBrush,hOldBrush
xp1 = rect.Left
yp1 = rect.top
xp2 = rect.Right
yp2 = rect.bottom
hPen = CreatePen(PS_SOLID, 1, al_PenColor)
hOldPen = SelectObject(hdc, hPen)
hNewBrush =CreateSolidBrush(al_BrushColor)
hOldBrush =SelectObject(hdc, hNewBrush)
rectangle(hdc,xp1,yp1,xp2,yp2)
SelectObject(hdc, hOldPen)
DeleteObject(hPen)
SelectObject(hdc, hOldBrush)
DeleteObject(hNewBrush)

end subroutine

public function long of_geticonhandle (string as_iconname);//====================================================================
// Function: of_geticonhandle()
//--------------------------------------------------------------------
// Description: Get the handle of icon from the toolbaritemname of the menu
//--------------------------------------------------------------------
// Arguments: 
//		value	string	as_iconname		
//--------------------------------------------------------------------
// Returns:  long  IconHandle
//--------------------------------------------------------------------
// Author:	Dale Zheng		Date: 2003.05.07
//--------------------------------------------------------------------
// Modify History: 
//	
//====================================================================

Long ll_BitmapHandle , ll_IconHandle , ll_Library , ll_Index=-1
Environment env
Integer rtn,li_imagetype
String ls_File
Long ll_identier
long ll_hIml

if pos(lower(as_iconname),'.ico')>0 then 
	ll_IconHandle= LoadImage(0,as_iconname,IMAGE_ICON,0,0,LR_LOADFROMFILE + LR_DEFAULTSIZE)
elseif pos(lower(as_iconname),'.bmp')>0 then 	
	ll_BitmapHandle = LoadImage(0,as_iconname,IMAGE_BITMAP,16,16,LR_LOADFROMFILE)
	ll_hIml = ImageList_Create (16 , 16 , 33, 4, 4)
 	ll_Index = ImageList_AddMasked(ll_hIml , ll_BitmapHandle ,  Of_GetMaskColor(ll_BitmapHandle))
 	ll_IconHandle= ImageList_GetIcon( ll_hIml , ll_Index , 1)
  	//DeleteObject(ll_hIml)
	ImageList_Destroy(ll_hIml)
	DeleteObject(ll_BitmapHandle)
elseif pos(as_iconname,'!')>0 then 
	rtn = GetEnvironment(env)
   IF rtn <> 1 THEN
		MessageBox("TIP","Get the value is wrrong in the PowerBuilder Environment.",StopSign!,Ok!)
		Return -1
	End If
		
	ls_File = "PBVM" + String(env.PBMajorRevision) + "0.DLL"
	ll_Library = LoadLibrary(ls_File)
	ll_identier = Of_GetStockicon(as_iconname,li_imagetype)
	If ll_identier >0 and li_imagetype = IMAGE_BITMAP Then
	  		ll_BitmapHandle =  LoadBitmap ( ll_Library , ll_identier)
     		ll_hIml = ImageList_Create (16 , 16 , 33, 4, 4)
			ll_Index = ImageList_AddMasked(ll_hIml , ll_BitmapHandle ,  Of_GetMaskColor(ll_BitmapHandle))
			ll_IconHandle= ImageList_GetIcon( ll_hIml , ll_Index , 1)
 			//DeleteObject(ll_hIml)
			ImageList_Destroy(ll_hIml)
			DeleteObject(ll_BitmapHandle)
	elseIf ll_identier >0 and li_imagetype = IMAGE_ICON Then	
			ll_IconHandle= LoadImage(ll_Library,ll_identier,IMAGE_ICON,0,0, LR_DEFAULTSIZE )
	Else
			ll_index = -1
	End If
		
	FreeLibrary ( ll_Library )
else
	return 0
end if

return ll_IconHandle

end function

private function integer of_find_bymenuid (string as_itemname);INTEGER	li_loop,li_ret = 0

FOR	li_loop	=	1	TO	UpperBound(ist_menuinfo)
	IF isvalid(ist_menuinfo[li_loop].Menupt) then
		IF	ist_menuinfo[li_loop].Menupt.classname() = as_ItemName	THEN
			li_ret = li_loop
			EXIT
		END	IF
	end if	
NEXT

RETURN	li_ret
end function

private function integer of_find_byid (long al_itemid);INTEGER	li_loop,li_upper,li_ret = 0
if al_ItemID <= 0 then return 0

li_upper = UpperBound(ist_menuinfo)

IF	li_upper>al_ItemID  then //Ò»°ãÇé¿öÏÂ£¬Êý×éÖÐÎ»ÖÃºÍal_ItemIDÒ»ÖÂ
 if ist_menuinfo[al_ItemID].ItemID = al_ItemID	THEN return al_ItemID
end if 

FOR	li_loop	=	1	TO	li_upper
	IF	ist_menuinfo[li_loop].ItemID = al_ItemID	THEN
		li_ret = li_loop
		EXIT
	END	IF
NEXT

RETURN	li_ret
end function

private function integer of_find_byname (string as_itemname);INTEGER	li_loop,li_pos,li_ret = 0
string ls_menuText

li_pos = POS(as_ItemName,"~t")
IF li_pos > 0 THEN
	as_ItemName= LEFT(as_ItemName,li_pos - 1)
END IF

FOR	li_loop	=	1	TO	UpperBound(ist_menuinfo)
	ls_menuText =ist_menuinfo[li_loop].ItemName

	IF	trim(ls_menuText) = trim(as_ItemName)	THEN
		li_ret = li_loop
		EXIT
	END	IF
NEXT

RETURN	li_ret
end function

public subroutine of_setmenuicon (string as_type, string as_itemname, string as_icon);//-------------------------------------------------------*
//	FUNCTION:		of_setmenuicon									*
//	Description:														*
//-------------------------------------------------------*
//	Parameters:		string	as_type								*
//						string	as_itemname							*
//						string	as_icon								*
//-------------------------------------------------------*
//	Author(s)		Date			Remark							*
//	¼ú¿ÍÎÞÃû			2003.02.27	Develop							*
//	Rain				2003.03.10	load icon immediately,		*
//										add item by 'ID' or 'TEXT'	*
//-------------------------------------------------------*

integer li_menupos

IF	Upper(as_type)='BYID'	OR	upper(as_type) = 'ID'	THEN
	li_menupos = of_find_bymenuid(as_itemname)
ELSE
	li_menupos = of_find_byname(as_itemname)
END	IF

IF	li_menupos <>0	THEN
	IF	ist_menuinfo[li_menupos].hIcon= 0	THEN
		//ist_menuinfo[li_menupos].hIcon = LoadImage(0,as_icon,IMAGE_ICON,16,16,LR_LOADFROMFILE + LR_DEFAULTSIZE)
		ist_menuinfo[li_menupos].hIcon=of_GetIconHandle(as_icon)
//	else
//		DestroyIcon(ist_menuinfo[li_menupos].hIcon)
//		ist_menuinfo[li_menupos].hIcon=of_GetIconHandle(as_icon)
	END	IF
END	IF
end subroutine

public function long of_getmaskcolor (long al_bitmaphandle);//////////////////////////////////////////////////////////////////////////////
//	º¯ÊýÃû³Æ:      Of_GetMaskColor
//	·ÃÎÊ¼¶±ð:  		Public
//	²ÎÊý:          al_BitmapHandle          Î»Í¼¾ä±ú
//	·µ»ØÖµ:        Long
//	¹¦ÄÜÃèÊö:      »ñµÃÖ¸¶¨Î»Í¼ÎÄ¼þµÄMaskÑÕÉ«£¬·µ»ØÖµÎªMaskÑÕÉ«
// ²¹³äËµÃ÷:
//
//////////////////////////////////////////////////////////////////////////////
//	
//	ÐÞ¸Ä¼ÇÂ¼£º2001-11-15
//
//////////////////////////////////////////////////////////////////////////////
// ±àÂë£ººÎÈñ
////////////////////////////////////////////////////////////////////////////
String ls_Null
Long ll_Hdc,ll_HDCTemp,ll_HbmpTemp
Long ll_MaskColor = -1

ll_HDC = CreateDC("DISPLAY",ls_Null,ls_Null,0)

If ll_HDC<>0 Then
   //´´½¨Ò»¸öÓëÖ¸¶¨Éè±¸¼æÈÝµÄÄÚ´æÉÏÏÂÎÄ»·¾³
   ll_HDCTemp = CreateCompatibleDC(ll_HDC)
   If ll_HDCTemp<>0 Then
      //Ñ¡ÔñÒ»¸ö¶ÔÏóµ½Ö¸¶¨µÄÉè±¸ÉÏÏÂÎÄ»·¾³
      ll_HbmpTemp = SelectObject(ll_HDCTemp, al_BitMapHandle)
		//»ñµÃÎ»Í¼×ø±ê(0,0)ÑÕÉ«Öµ
      ll_MaskColor = GetPixel(ll_HDCTemp,0,0)

      SelectObject(ll_HDCTemp,ll_HbmpTemp)

		DeleteDC(ll_HDCTemp)
   End If
	
   DeleteDC(ll_HDC)
End If

Return ll_MaskColor
end function

private function integer of_add (long al_itemid, string as_text, ref menu am_menu, integer ai_level);//-------------------------------------------------------*
//	FUNCTION:		of_add											*
//	Description:	register a menuitem							*
//-------------------------------------------------------*
//	Parameters:		long		al_itemid							*
//						string	as_text								*
//						menu		am_menu								*
//-------------------------------------------------------*
//	Author(s)		Date			Remark							*
//	Rain				2003.03.10	Develop					      *
//-------------------------------------------------------*
//Modify History: Add:Get the icon by Dale Zheng.

int	li_newpos,li_pos
string ls_shortcutkey

li_pos = POS(as_text,"~t")
IF li_pos > 0 THEN
	ls_shortcutkey = MID(as_text,li_pos + 1)
	as_text			= LEFT(as_text,li_pos - 1)
END IF

li_newpos = upperbound(ist_menuinfo) + 1
ist_menuinfo[li_newpos].ItemID = al_Itemid
ist_menuinfo[li_newpos].ItemName = as_text
ist_menuinfo[li_newpos].ShortcutKey = ls_ShortcutKey
ist_menuinfo[li_newpos].menupt = am_menu
ist_menuinfo[li_newpos].level = ai_level
if am_menu.ToolbarItemName<>'' then ist_menuinfo[li_newpos].hIcon=of_GetIconHandle(am_menu.ToolbarItemName)


RETURN	li_newpos

end function

public subroutine of_registermenu (integer ai_level, long al_hmenu, long al_hsysmenu);//-------------------------------------------------------*
//	FUNCTION:		of_registermenu								*
//	Description:	×¢²áÎ´ÖªÃûµÄ²Ëµ¥													*
//-------------------------------------------------------*
//	Parameters:										*
//						int	ai_level									*
//						long	al_hmenu	
//                long  al_hsysmenu  
//-------------------------------------------------------*
//	Author(s)		Date			Remark							*
// bluetlck			
//-------------------------------------------------------*

Constant int MIIM_STATE = 1
Constant int MIIM_ID = 2
Constant int MIIM_SUBMENU = 4
Constant int MIIM_CHECKMARKS = 8
Constant int MIIM_TYPE = 16
Constant int MIIM_DATA = 32
Constant int MFS_CHECKED = 8
//Constant int MF_DISABLED = 2
//Constant int MF_GRAYED = 1
Integer li_index,li_row,li_count
uLong hSubMenu

if al_hmenu<=0 then return

li_count= GetMenuItemCount(al_hmenu)

string ls_menuText
ls_menuText=space(255)
For li_index = 1 to li_count
	hSubMenu = GetSubMenu(al_hmenu,li_index - 1)
	if  al_hsysmenu = hSubMenu then 
		li_index ++
		hSubMenu = GetSubMenu(al_hmenu,li_index - 1)
	end if	
	if  ai_level > 0 then
	lpMenuItemInfo.cbsize=44
	lpMenuItemInfo.fMask = MIIM_TYPE +MIIM_DATA +MIIM_STATE  
	GetMenuItemInfo(al_hmenu,li_index - 1,true,lpMenuItemInfo)
     //not ownerdraw menuitem
	  If lpMenuItemInfo.dwItemData=0 or not of_containselement(lpMenuItemInfo.fType,MF_OWNERDRAW)then
			GetMenuString(al_hmenu,li_index - 1,ls_menuText,255,MF_BYPOSITION	)	
			lpMenuItemInfo.fMask = MIIM_TYPE	+MIIM_DATA
			lpMenuItemInfo.fType=  lpMenuItemInfo.fType+MF_OWNERDRAW

			if lpMenuItemInfo.dwItemData >0 then
				li_row = of_find_byid(lpMenuItemInfo.dwItemData)
			else	
				li_row = of_find_byname(ls_menuText)
			end if	
			if li_row>0 then
				lpMenuItemInfo.dwItemData = ist_menuinfo[li_row].ItemID 
				if ist_menuinfo[li_row].menupt.text<>"-" then ist_menuinfo[li_row].menupt.text=ls_menuText
				if of_containselement(lpMenuItemInfo.fstate,MFS_CHECKED) then 
					ist_menuinfo[li_row].menupt.checked = true
				else
					ist_menuinfo[li_row].menupt.checked = false
				end if
				if  of_containselement(lpMenuItemInfo.fstate,MF_GRAYED) then 
					ist_menuinfo[li_row].menupt.enabled = false
				else
					ist_menuinfo[li_row].menupt.enabled = true
				end if
				SetMenuItemInfo(al_hmenu,li_index - 1,true,lpMenuItemInfo)
         else
				ii_num++
				menu m_temp

				m_temp=create menu
         	if ls_menuText="" then
					m_temp.enabled =false
					m_temp.text="-"
		   	else 	
					m_temp.text=ls_menuText
					if of_containselement(lpMenuItemInfo.fstate,MFS_CHECKED)  then 
						m_temp.checked = true
					else
						m_temp.checked = false
					end if
				 if  of_containselement(lpMenuItemInfo.fstate,MF_GRAYED) then 
						m_temp.enabled = false
					else
						m_temp.enabled = true
					end if

            end if
				of_add(ii_num,ls_menuText,m_temp,ai_level)
				lpMenuItemInfo.dwItemData = ii_num
				SetMenuItemInfo(al_hmenu,li_index - 1,true,lpMenuItemInfo)
			end if
		else
			li_row = of_find_byid(lpMenuItemInfo.dwItemData)
			if li_row>0 then
				if of_Containselement(lpMenuItemInfo.fstate,MFS_CHECKED)  then 
					ist_menuinfo[li_row].menupt.checked = true
				else
					ist_menuinfo[li_row].menupt.checked = false
				end if
				if of_containselement(lpMenuItemInfo.fstate,MF_GRAYED)  then  
	
					ist_menuinfo[li_row].menupt.enabled = false
				else
					ist_menuinfo[li_row].menupt.enabled = true
				end if

		end if	
	end if
		
 end if
		if hSubMenu>0 then of_registermenu(ai_level + 1,hsubMenu,al_hsysmenu)
next
end subroutine

public subroutine of_drawitem (ref unsignedlong childid, ref long drawitemstruct);//-------------------------------------------------------*
//	FUNCTION:		of_drawitem										*
//	Description:	draw menuitem									*
//-------------------------------------------------------*
//	Parameters:		ulong	childid									*
//						long	drawitemstruct							*
//-------------------------------------------------------*
//	Author(s)		Date			Remark							*
//	¼ú¿ÍÎÞÃû			2003.02.27	Develop							*
//	Addison	lu		2003.03.03										*
//	Rain				2003.03.10	Draw disalbed state	
// Bluetlck       2003.05     modify
//-------------------------------------------------------*

zDrawItemStruct tDrawItemStruct
uLong hdc,hIcon
Integer li_row,li_level
tagrect rTmp

CopyMemory(tDrawItemStruct,drawitemstruct,48)

hdc = tDrawItemStruct.hdc
rTmp = tDrawItemStruct.rcItem

li_row = of_find_byid(tDrawItemStruct.itemdata)

if li_row<= 0 then return
li_level = ist_menuinfo[li_row].level

//if MenuBKStyle = STYLE_BKWhite and ls_ItemName<>"-" then ls_ItemName=" "+ls_ItemName

IF of_containselement(tDrawItemStruct.ItemState,1) then
	//selected state
   if ist_menuinfo[li_row].menupt.enabled  then
		of_drawselectitem(Menustyle,hdc,rTmp,ist_menuinfo[li_row])
	end if	
else 
	of_drawnormalitem(MenuBKStyle,hdc,rTmp,ist_menuinfo[li_row])
End If

end subroutine

private subroutine of_drawtext (unsignedlong hdc, string as_text, string as_shortcutkey, tagrect ast_rect, boolean ab_enabled);//-------------------------------------------------------*
//	FUNCTION:		of_drawtext										*
//	Description:														*
//-------------------------------------------------------*
//	Parameters:		ulong		hdc									*
//						string	as_text								*
//						tagrect		ast_rect								*
//						boolean	ab_enabled							*
//-------------------------------------------------------*
//	Author(s)		Date			Remark							*
//	Rain				2003.03.10										*
//-------------------------------------------------------*
SetBkMode(hdc,TRANSPARENT)
long	lhdc_temp,MenuFont,OldFont

IF	ab_enabled	THEN
		SetTextColor(hdc,GetSysColor(COLOR_MENUTEXT))
	   DrawText(hdc,as_text,Len(as_text),ast_rect,DT_LEFT)
		ast_rect.Right =ast_rect.Right - 12
		DrawText(hdc,as_shortcutkey,Len(as_shortcutkey),ast_rect,DT_RIGHT)
ELSE
		SetTextColor( hdc , GetSysColor( COLOR_BTNHIGHLIGHT))				
		ast_rect.Left = ast_rect.Left + 1
		ast_rect.Top = ast_rect.Top  + 1
		DrawText( hdc , as_text , len(as_text) , ast_rect,  DT_VCENTER)		
		SetTextColor( hdc,GetSysColor( COLOR_BTNSHADOW ) )		
		ast_rect.Left = ast_rect.Left -1
		ast_rect.Top = ast_rect.Top  -1		
		DrawText( hdc , as_text , len(as_text) , ast_rect , DT_VCENTER)

////	rjh added.
		SetTextColor( hdc , GetSysColor( COLOR_BTNHIGHLIGHT))				
		//ast_rect.Left = (ast_rect.Right - 22) * ad_rate + 22 + 1
		ast_rect.Right =ast_rect.Right - 12
		ast_rect.Top += 1
		DrawText( hdc , as_shortcutkey , len(as_shortcutkey) , ast_rect,  DT_RIGHT)		
		SetTextColor( hdc,GetSysColor( COLOR_BTNSHADOW ) )		
		ast_rect.Left = ast_rect.Left - 1
		ast_rect.Top = ast_rect.Top  -1		
		DrawText( hdc , as_shortcutkey , len(as_shortcutkey) , ast_rect , DT_RIGHT)
END	IF

end subroutine

public subroutine of_registermenu (ref menu am_menu, integer ai_level, long al_hmenu, long al_hsysmenu);//-------------------------------------------------------*
//	FUNCTION:		of_registermenu								*
//	Description:	×¢²áÖªÃûµÄ²Ëµ¥													*
//-------------------------------------------------------*
//	Parameters:		menu	am_menu									*
//						int	ai_level									*
//						long	al_hmenu	
//                long  al_hsysmenu
//-------------------------------------------------------*
//	Author(s)		Date			Remark							*
//	¼ú¿ÍÎÞÃû			2003.02.27	Develop							*
//	Rain				2003.03.10	use array instead of ds	
// bluetlck			2003.04.25  use SetMenuItemInfo instead of ModifyMenu
//-------------------------------------------------------*

Constant int MIIM_STATE = 1
Constant int MIIM_ID = 2
Constant int MIIM_SUBMENU = 4
//Constant int MIIM_CHECKMARKS = 8
Constant int MIIM_TYPE = 16
Constant int MIIM_DATA = 32
Constant int MFS_CHECKED = 8
Integer li_countitem,li_index,li_row,li_count
Integer li_itempos //ÓÉÓÚ²»¿É¼û²Ëµ¥ÏîµÄÓ°Ïì£¬li_index²»µÈÓÚmenu item position
uLong hSubMenu

if al_hmenu<=0 then return

li_countitem = UpperBound(am_menu.Item[])
For li_index = 1 To li_countitem
	
	if am_menu.Item[li_index].visible=false then 
			continue
	end if
	
	li_itempos++
	
	hSubMenu = GetSubMenu(al_hmenu,li_itempos - 1)
	if  al_hsysmenu = hSubMenu then //if it's system menu
		li_itempos++ 
		hSubMenu = GetSubMenu(al_hmenu,li_itempos - 1)
	end if
	If am_menu.Item[li_index].Text = "-" Then am_menu.Item[li_index].Enabled = false
	If ai_level > 0 Then

		lpMenuItemInfo.cbsize=44
      lpMenuItemInfo.fMask = MIIM_TYPE+MIIM_DATA
		boolean lb_return
		
		lb_return = GetMenuItemInfo(al_hmenu,li_itempos - 1,true,lpMenuItemInfo)
      if lpMenuItemInfo.dwItemData=0 or not of_Containselement(lpMenuItemInfo.fType,MF_OWNERDRAW) then
			lpMenuItemInfo.fType=  lpMenuItemInfo.fType + MF_OWNERDRAW
			lpMenuItemInfo.fMask = MIIM_TYPE	 +MIIM_DATA
			
			//li_row = of_find_bymenuId(am_menu.Item[li_index].classname())
      if	lpMenuItemInfo.dwItemData>0 then li_row = of_find_byId(lpMenuItemInfo.dwItemData)	
		if li_row<=0  then
			ii_num++ //²Ëµ¥µÄÎ¨Ò»±êÊ¾,ÉáÆúÁËÒÔÇ°ÀûÓÃItemIDµÄ·½·¨
			lpMenuItemInfo.dwItemData = ii_num
			SetMenuItemInfo(al_hmenu,li_itempos - 1,true,lpMenuItemInfo)
			of_add(ii_num,am_menu.Item[li_index].Text,am_menu.item[li_index],ai_level)
		else
			lpMenuItemInfo.dwItemData = ist_menuinfo[li_row].ItemID 
			SetMenuItemInfo(al_hmenu,li_itempos - 1,true,lpMenuItemInfo)

		end if
	end if
 
  end if
  if hSubMenu>0 then of_registermenu(am_menu.Item[li_index],ai_level + 1,hsubMenu,al_hsysmenu)
Next
 
 
//ÒÔÏÂ´¦ÀíÓÉÓÚsheet´°¿Ú¶ø¶¯Ì¬Éú³ÉµÄ²Ëµ¥,ÓÐÒ»¶¨ÎÊÌâ£¡~
li_count= GetMenuItemCount(al_hmenu)
if li_itempos<li_count - 1 and ai_level>0 then 
	
	string ls_menuText
	ls_menuText=space(255)
	For li_index = li_count to li_itempos + 1  step - 1
		lpMenuItemInfo.cbsize=44
		lpMenuItemInfo.fMask = MIIM_TYPE +MIIM_DATA +MIIM_STATE

		
		lb_return = GetMenuItemInfo(al_hmenu,li_index - 1,true,lpMenuItemInfo)
      if  lpMenuItemInfo.dwItemData=0 or not of_containselement(lpMenuItemInfo.fType,MF_OWNERDRAW) then  //not ownerdraw menuitem
			GetMenuString(al_hmenu,li_index - 1,ls_menuText,255,MF_BYPOSITION	)	
      	

			lpMenuItemInfo.fMask = MIIM_TYPE	+MIIM_DATA
			lpMenuItemInfo.fType=  lpMenuItemInfo.fType+MF_OWNERDRAW
			li_row = of_find_byname(ls_menuText)
			if li_row>0 then
				lpMenuItemInfo.dwItemData = ist_menuinfo[li_row].ItemID 
				if lpMenuItemInfo.fState= MFS_CHECKED then 
					ist_menuinfo[li_row].menupt.checked = true
				else
					ist_menuinfo[li_row].menupt.checked = false
				end if
				SetMenuItemInfo(al_hmenu,li_index - 1,true,lpMenuItemInfo)
         else
				ii_num++
				menu m_temp
				m_temp=create menu
         	if ls_menuText="" then
					m_temp.enabled =false
					m_temp.text="-"
		   	else 	
					m_temp.text=ls_menuText
					if lpMenuItemInfo.fState= MFS_CHECKED then m_temp.checked = true
            end if
				of_add(ii_num,ls_menuText,m_temp,ai_level)
				lpMenuItemInfo.dwItemData = ii_num
				SetMenuItemInfo(al_hmenu,li_index - 1,true,lpMenuItemInfo)
			end if
		end if


	next
end if
end subroutine

public subroutine of_drawchecked (long hdc, ref tagrect rect);long hpen,holdpen
//hPen = CreatePen(PS_SOLID,2,RGB(0,0,147))
//holdPen=SelectObject(hdc,hPen)
//MoveToEx(hdc,rect.Left+6,rect.Top+10,0)
//LineTo(hdc,rect.Left+8,rect.Top+14)
//LineTo(hdc,rect.Left + 14,rect.top+ 6)

tagrect fillrect
fillrect.left = rect.left +8
fillrect.right = rect.left +14
fillrect.top = rect.top +9
fillrect.bottom = rect.top  +14

hPen = CreatePen(PS_SOLID,1,GetSysColor(COLOR_ACTIVECAPTION))
holdpen = SelectObject(hdc,hPen)
RoundRect(hdc,fillrect.Left - 2,fillrect.Top - 2,fillrect.right +2,fillrect.bottom+2,4,4)
SelectObject(hdc,holdPen)
deleteobject(hPen)
FillRect(hdc,fillrect,GetSysColorBrush(COLOR_HIGHLIGHT))


end subroutine

private function unsignedlong of_createverticalfont (long hdc);//-------------------------------------------------------*
//	FUNCTION:		of_CreateVerticalFont									*
//	Description:														*
//-------------------------------------------------------*
// Arguments:	
//
//	long hdc
//															*
//-------------------------------------------------------*
//	Author(s)		Date			Remark							*
//	Rain				2003.03.10										*
//-------------------------------------------------------*
long	ll_font
long	ll_textlen = 255
string	ls_text = space(255)
LOGFONT    VerticalFont

ll_textlen = GetTextFace(hdc, ll_TextLen, ls_Text)

	
VerticalFont.lfFaceName = Left(ls_text, ll_textlen+1 )
VerticalFont.lfWeight = 700
VerticalFont.lfEscapement = 900
VerticalFont.lfOrientation = 900
VerticalFont.lfHeight = - 16;
ll_font = CreateFontIndirect(VerticalFont)

RETURN	 ll_font

//Type LOGFONT
//lfHeight As Integer                  ' ×ÖÌåµÄ¸ß¶È
//lfWidth As Integer                  ' ×ÖÌåµÄ¿í¶È
//lfEscapement As Integer             ' ×ÖÌåÐý×ªµÄ½Ç¶È
//lfOrientation As Integer             
//lfWeight As Integer                     ' ×ÖÌåµÄÇáÖØ
//lfItalic As String * 1                 ' ÊÇ·ñÎªÐ±Ìå
//lfUnderline As String * 1             ' ÊÇ·ñÓÐÏÂ»®Ïß
//lfStrikeOut As String * 1             ' ÊÇ·ñÓÐÇ¿µ÷Ïß
//lfCharSet As String * 1             ' ×Ö·û¼¯
//lfOutPrecision As String * 1        ' Êä³ö¾«¶È
//lfClipPrecision As String * 1        ' ¼ô²Ã¾«¶È
//lfQuality As String * 1             ' Êä³öÖÊÁ¿
//lfPitchAndFamily As String * 1    ' ¼ä¾àºÍ×ÖÌå×å
//lfFaceName As String * LF_FACESIZE ' ×ÖÌåÃû£¬Èç¡°ËÎÌå¡±
//End Type
end function

public function boolean of_containselement (long al_src, long al_exponent);//ÅÐ¶ÏÒ»¸öÊýÖÐµÄÄ³¸ö¶þ½øÖÆÎ»ÊÇ·ñÊÇ1,Ò²¾ÍÊÇÁ½¸öÊýÇóÂß¼­orºóÊÇ·ñÈÔÈ»ÊÇµÚÒ»¸öÊý

//al_dst±ØÐëÎª2µÄÕûÊý´Î·½(Õâ¸öÕûÊý´Î·½¾ÍÊÇal_srcµÄÄ³Ò»Î»,³öÓÚÐ§ÂÊ²»×÷ÅÐ¶Ï),·ñÔò½á¹û²»ÄÜÔ¤ÁÏ


al_src = al_src/al_exponent

if mod(al_src,2) = 1 then
	return true
else
	return false
end if	
end function

public subroutine of_fillwithgradient (unsignedlong hdc, tagrect rect, long colorfrom, long colorto);//--------------------------------------------------------------------
// Write By: ¼ú¿ÍÎÞÃû		Date: 2003.02.27
// Modified by : Addison Lu Sunday, 2/3/3
//--------------------------------------------------------------------

//--------------------------------------------------------------------
//	Modify goto statement in 03/14/2005 by zhanghf(Appeon)
//--------------------------------------------------------------------

int li_height, li_width, li, li_steps,li_halfwidth
int li_ori_left, li_ori_right
long ll_rgb
ulong hBrush, hOldBrush
int r1,r2,g1,g2,b1,b2,vr,vg,vb

IF Menustyle = STYLE_VGRADIENT THEN
	//GOTO VGRADIENT
	li_steps = 20 - 1
	li_width = (rect.bottom - rect.top) / li_steps
	
	of_color2rgb(colorfrom,r1,g1,b1)
	of_color2rgb(colorto,r2,g2,b2)
	
	vr = abs(r1 - r2) / li_steps
	vg = abs(g1 - g2) / li_steps
	vb = abs(b1 - b2) / li_steps
	IF r2<r1 THEN vr = vr * -1
	IF g2<g1 THEN vg = vg * -1
	IF b2<b1 THEN vb = vb * -1
	
	SetBkMode(hdc,TRANSPARENT)
	li_ori_left = rect.top
	li_ori_right = rect.bottom
	
	FOR li = 1 TO li_steps
		r2	=	r1 + vr * li
		g2 =	g1 + vg * li
		b2 =	b1 + vb * li
		ll_RGB = RGB( r2, g2, b2)
		rect.top = li_ori_left + (li - 1) * li_width
		rect.bottom = rect.top + li_width
	
		hBrush = CreateSolidBrush(ll_rgb)
	
		FillRect(hdc,rect,hBrush)				
	
	
		DeleteObject(hBrush)
	NEXT
	
	rect.top = li_ori_left + (li - 1) * li_width
	rect.bottom = li_ori_right
	
	hBrush = CreateSolidBrush(ll_rgb)
	
	
	FillRect(hdc,rect,hBrush)
	
	
	DeleteObject(hBrush)
	return
END IF

IF Menustyle = STYLE_VEDGEGRADIENT THEN
	//GOTO VEDGEGRADIENT
	tagrect rect2
	rect2=rect
	li_steps = 11 - 1
	li_halfwidth= (rect.bottom - rect.top) /2
	li_ori_left = rect.top
	li_ori_right = rect.bottom
	
	rect.bottom = li_halfwidth + rect.top
	rect2.top=rect2.bottom - li_halfwidth
	li_width = (rect.bottom - rect.top) / li_steps
	
	of_color2rgb(colorto,r1,g1,b1)
	of_color2rgb(colorfrom,r2,g2,b2)
	
	vr = abs(r1 - r2) / li_steps
	vg = abs(g1 - g2) / li_steps
	vb = abs(b1 - b2) / li_steps
	IF r2<r1 THEN vr = vr * -1
	IF g2<g1 THEN vg = vg * -1
	IF b2<b1 THEN vb = vb * -1
	
	SetBkMode(hdc,TRANSPARENT)
	
	FOR li = 1 TO li_steps
		r2	=	r1 + vr * li
		g2 =	g1 + vg * li
		b2 =	b1 + vb * li
		ll_RGB = RGB( r2, g2, b2)
		rect.top = li_ori_left + (li - 1) * li_width
		rect.bottom = rect.top + li_width
		
		rect2.top = li_ori_Right - (li - 1) * li_width
		rect2.bottom = rect.bottom - li_width
		
		hBrush = CreateSolidBrush(ll_rgb)
	
		FillRect(hdc,rect,hBrush)				
		FillRect(hdc,rect2,hBrush)
	
		DeleteObject(hBrush)
	NEXT
	return
END IF

IF Menustyle = STYLE_VHEADERGRADIENT THEN
	//GOTO VHEADERGRADIENT
	li_steps = 11 - 1
	li_halfwidth= (rect.bottom - rect.top) /2
	li_ori_left = rect.top
	li_ori_right = rect.bottom
	
	rect.bottom = li_halfwidth + rect.top
	rect2.top=rect2.bottom - li_halfwidth
	li_width = (rect.bottom - rect.top) / li_steps
	
	of_color2rgb(colorto,r1,g1,b1)
	of_color2rgb(colorfrom,r2,g2,b2)
	
	vr = abs(r1 - r2) / li_steps
	vg = abs(g1 - g2) / li_steps
	vb = abs(b1 - b2) / li_steps
	IF r2<r1 THEN vr = vr * -1
	IF g2<g1 THEN vg = vg * -1
	IF b2<b1 THEN vb = vb * -1
	
	SetBkMode(hdc,TRANSPARENT)
	
	FOR li = 1 TO li_steps
		 r2	=	r1 + vr * li
		 g2 =	g1 + vg * li
		 b2 =	b1 + vb * li
		 ll_RGB = RGB( r2, g2, b2)
		 rect.top = li_ori_left + (li - 1) * li_width
		 rect.bottom = rect.top + li_width
		
		hBrush = CreateSolidBrush(ll_rgb)
	
		FillRect(hdc,rect,hBrush)				
		DeleteObject(hBrush)
	NEXT
	
	rect.top = li_ori_left + (li - 1) * li_width
	rect.bottom = li_ori_right
	
	hBrush = CreateSolidBrush(ll_rgb)
	FillRect(hdc,rect,hBrush)
	DeleteObject(hBrush)
	return
END IF
li_steps = 30 - 1
li_width = (rect.right - rect.left) / li_steps

of_color2rgb(colorfrom,r1,g1,b1)
of_color2rgb(colorto,r2,g2,b2)

vr = abs(r1 - r2) / li_steps
vg = abs(g1 - g2) / li_steps
vb = abs(b1 - b2) / li_steps
IF r2<r1 THEN vr = vr * -1
IF g2<g1 THEN vg = vg * -1
IF b2<b1 THEN vb = vb * -1

SetBkMode(hdc,TRANSPARENT)
li_ori_left = rect.left
li_ori_right = rect.right
FOR li = 1 TO li_steps

	r2	=	r1 + vr * li
	g2 =	g1 + vg * li
	b2 =	b1 + vb * li

	ll_RGB = RGB( r2, g2, b2)
	rect.left = li_ori_left + (li - 1) *li_width
	rect.right = rect.left + li_width

	hBrush = CreateSolidBrush(ll_rgb)


	FillRect(hdc,rect,hBrush)				

	DeleteObject(hBrush)
NEXT

rect.left = li_ori_left + (li - 1) *li_width
rect.right = li_ori_right

hBrush = CreateSolidBrush(ll_rgb)


FillRect(hdc,rect,hBrush)


DeleteObject(hBrush)
RETURN

//VGRADIENT:
//li_steps = 20 - 1
//li_width = (rect.bottom - rect.top) / li_steps
//
//of_color2rgb(colorfrom,r1,g1,b1)
//of_color2rgb(colorto,r2,g2,b2)
//
//vr = abs(r1 - r2) / li_steps
//vg = abs(g1 - g2) / li_steps
//vb = abs(b1 - b2) / li_steps
//IF r2<r1 THEN vr = vr * -1
//IF g2<g1 THEN vg = vg * -1
//IF b2<b1 THEN vb = vb * -1
//
//SetBkMode(hdc,TRANSPARENT)
//li_ori_left = rect.top
//li_ori_right = rect.bottom
//
//FOR li = 1 TO li_steps
//	r2	=	r1 + vr * li
//	g2 =	g1 + vg * li
//	b2 =	b1 + vb * li
//	ll_RGB = RGB( r2, g2, b2)
//	rect.top = li_ori_left + (li - 1) * li_width
//	rect.bottom = rect.top + li_width
//
//	hBrush = CreateSolidBrush(ll_rgb)
//
//	FillRect(hdc,rect,hBrush)				
//
//
//	DeleteObject(hBrush)
//NEXT
//
//rect.top = li_ori_left + (li - 1) * li_width
//rect.bottom = li_ori_right
//
//hBrush = CreateSolidBrush(ll_rgb)
//
//
//FillRect(hdc,rect,hBrush)
//
//
//DeleteObject(hBrush)
//return

//VEDGEGRADIENT:
//tagrect rect2
//rect2=rect
//li_steps = 11 - 1
//li_halfwidth= (rect.bottom - rect.top) /2
//li_ori_left = rect.top
//li_ori_right = rect.bottom
//
//rect.bottom = li_halfwidth + rect.top
//rect2.top=rect2.bottom - li_halfwidth
//li_width = (rect.bottom - rect.top) / li_steps
//
//of_color2rgb(colorto,r1,g1,b1)
//of_color2rgb(colorfrom,r2,g2,b2)
//
//vr = abs(r1 - r2) / li_steps
//vg = abs(g1 - g2) / li_steps
//vb = abs(b1 - b2) / li_steps
//IF r2<r1 THEN vr = vr * -1
//IF g2<g1 THEN vg = vg * -1
//IF b2<b1 THEN vb = vb * -1
//
//SetBkMode(hdc,TRANSPARENT)
//
//FOR li = 1 TO li_steps
//	r2	=	r1 + vr * li
//	g2 =	g1 + vg * li
//	b2 =	b1 + vb * li
//	ll_RGB = RGB( r2, g2, b2)
//	rect.top = li_ori_left + (li - 1) * li_width
//	rect.bottom = rect.top + li_width
//   
//	rect2.top = li_ori_Right - (li - 1) * li_width
//	rect2.bottom = rect.bottom - li_width
//   
//	hBrush = CreateSolidBrush(ll_rgb)
//
//	FillRect(hdc,rect,hBrush)				
//   FillRect(hdc,rect2,hBrush)
//
//	DeleteObject(hBrush)
//NEXT
//return

//VHEADERGRADIENT:
//li_steps = 11 - 1
//li_halfwidth= (rect.bottom - rect.top) /2
//li_ori_left = rect.top
//li_ori_right = rect.bottom
//
//rect.bottom = li_halfwidth + rect.top
//rect2.top=rect2.bottom - li_halfwidth
//li_width = (rect.bottom - rect.top) / li_steps
//
//of_color2rgb(colorto,r1,g1,b1)
//of_color2rgb(colorfrom,r2,g2,b2)
//
//vr = abs(r1 - r2) / li_steps
//vg = abs(g1 - g2) / li_steps
//vb = abs(b1 - b2) / li_steps
//IF r2<r1 THEN vr = vr * -1
//IF g2<g1 THEN vg = vg * -1
//IF b2<b1 THEN vb = vb * -1
//
//SetBkMode(hdc,TRANSPARENT)
//
//FOR li = 1 TO li_steps
//	 r2	=	r1 + vr * li
//	 g2 =	g1 + vg * li
//	 b2 =	b1 + vb * li
//	 ll_RGB = RGB( r2, g2, b2)
//	 rect.top = li_ori_left + (li - 1) * li_width
//	 rect.bottom = rect.top + li_width
//   
//	hBrush = CreateSolidBrush(ll_rgb)
//
//	FillRect(hdc,rect,hBrush)				
//	DeleteObject(hBrush)
//NEXT
//
//rect.top = li_ori_left + (li - 1) * li_width
//rect.bottom = li_ori_right
//
//hBrush = CreateSolidBrush(ll_rgb)
//FillRect(hdc,rect,hBrush)
//DeleteObject(hBrush)
//return
end subroutine

private subroutine of_drawfirstlevelmenu (ref zdrawitemstruct ast_drawitemstruct, ref ust_menuinfo ast_menuinfo);//not complete!
end subroutine

private subroutine of_drawnormalitem (integer ai_menubkstyle, long hdc, ref tagrect ast_rect, ref ust_menuinfo ast_menuinfo);string ls_ItemName,ls_shortcutkey
long hIcon
tagrect rTmp
menu lm_menupt	
long hBrush,hOldBrush,hPen,hOldPen

ls_ItemName 	= ast_menuinfo.menupt.text
if MenuBKStyle = STYLE_BKWhite and ls_ItemName<>"-" then ls_ItemName=" "+ls_ItemName
lm_menupt		= ast_menuinfo.menupt
hIcon 			= ast_menuinfo.hIcon
ls_shortcutkey = ast_menuinfo.shortcutkey

int li_pos
li_pos = POS(ls_ItemName,"~t")
IF li_pos > 0 THEN
	ls_ItemName = LEFT(ls_ItemName,li_pos - 1)
END IF

choose case ai_MenuBKStyle
	case  STYLE_BKWhite

   	FillRect(hdc,ast_rect,GetStockObject(WHITE_BRUSH))

	   rTmp.Left = ast_rect.Left
      rTmp.top= ast_rect.top
      rTmp.Right = ast_rect.Left+20
      rTmp.bottom = ast_rect.bottom
	   hBrush = CreateSolidBrush(RGB(240, 240,240))
      FillRect(hdc,rTmp,hBrush)
		DeleteObject(hBrush)
		
	   hPen = CreatePen(PS_SOLID,0,RGB(200,200,200))
	   hOldPen = SelectObject(hdc,hPen)
      MoveToEx(hdc,rTmp.Left,rTmp.Top,0)
      LineTo(hdc,rTmp.Left,rTmp.Bottom)
	   MoveToEx(hdc,rTmp.Right,rTmp.Top,0)
      LineTo(hdc,rTmp.Right,rTmp.Bottom)
		SelectObject(hdc, hOldPen)
      DeleteObject(hPen)
	   
		
   case STYLE_BKGRAY 	
	  hBrush = CreateSolidBrush(RGB(221, 227,235))
     FillRect(hdc,ast_rect,hBrush)
	  DeleteObject(hBrush)
	  
	  rTmp.Left = ast_rect.Left
     rTmp.top= ast_rect.top
     rTmp.Right = ast_rect.Left+20
     rTmp.bottom = ast_rect.bottom

	  hBrush = CreateSolidBrush(RGB(156, 171,186))
	  FillRect(hdc,rTmp,hBrush)
	  DeleteObject(hBrush)
	  
	  hPen = CreatePen(PS_SOLID,0,RGB(127,136,147))
	  holdPen=SelectObject(hdc,hPen)
     MoveToEx(hdc,rTmp.Left,rTmp.Top,0)
     LineTo(hdc,rTmp.Left,rTmp.Bottom)
	 
	  MoveToEx(hdc,rTmp.Left,0,0)
     LineTo(hdc,rTmp.Right - 1,0)
	  MoveToEx(hdc,rTmp.Left+20,rTmp.Top,0)
     LineTo(hdc,rTmp.Left+20,rTmp.Bottom)
	  SelectObject(hdc, hOldPen)
	  DeleteObject(hPen)
case STYLE_BKGRAY_XP 

	
     FillRect(hdc,ast_rect,GetStockObject(WHITE_BRUSH))
	  
	  rTmp.Left = ast_rect.Left
     rTmp.top= ast_rect.top
     rTmp.Right = ast_rect.Left+20
     rTmp.bottom = ast_rect.bottom

	  FillRect(hdc,rTmp,GetStockObject(GRAY_BRUSH))
	  
	  hPen = CreatePen(PS_SOLID,0,RGB(127,136,147))
	  holdPen=SelectObject(hdc,hPen)
     MoveToEx(hdc,rTmp.Left,rTmp.Top,0)
     LineTo(hdc,rTmp.Left,rTmp.Bottom)
	 
	  MoveToEx(hdc,rTmp.Left,0,0)
     LineTo(hdc,rTmp.Right - 1,0)
	  MoveToEx(hdc,rTmp.Left+20,rTmp.Top,0)
     LineTo(hdc,rTmp.Left+20,rTmp.Bottom)
	  
	  SelectObject(hdc, hOldPen)
	  DeleteObject(hPen)
case STYLE_BKAMB 

	
     FillRect(hdc,ast_rect, GetStockObject(WHITE_BRUSH))
	  
	  rTmp.Left = ast_rect.Left
     rTmp.top= ast_rect.top
     rTmp.Right = ast_rect.Left+22
     rTmp.bottom = ast_rect.bottom


	  FillRect(hdc,rTmp,GetSysColorBrush(COLOR_BTNFACE))
	  SelectObject(hdc, hOldBrush)
	  DeleteObject(hBrush)
	  
 case else
		FillRect(hdc,ast_rect,GetSysColorBrush(COLOR_MENU))
end choose
//draw text and ico
IF	lm_menupt.enabled	THEN
	if lm_menupt.checked then 
		of_drawchecked(hdc,ast_rect)
	elseif hIcon>0 then
		DrawIconEx(hdc,ast_rect.Left + 3,ast_rect.Top + 3,hIcon,16,16,0,0,3)	
	end if

	ast_rect.Left = ast_rect.Left + 24
	ast_rect.Top = ast_rect.Top + 4

	of_drawtext(hdc,ls_itemname,ls_shortcutkey,ast_rect,true)
	
	ELSE
		if ls_ItemName="-" then
			if MenuBKStyle = STYLE_BKWhite or MenuBKStyle = STYLE_BKGRAY or MenuBKStyle = STYLE_BKGRAY_XP then
				hPen = CreatePen(PS_SOLID,0,RGB(172,168,153))
				hOldPen = SelectObject(hdc,hPen)
				int li_middpos
				li_middpos = (ast_rect.Top+ast_rect.Bottom)/2
   			MoveToEx(hdc,ast_rect.Left+22,li_middpos,0)
   			LineTo(hdc,ast_rect.Right,li_middpos)
				SelectObject(hdc,hOldPen)
   			DeleteObject(hPen)
		   else
				hPen = CreatePen(PS_SOLID,0,RGB(128,128,128))
				hOldPen = SelectObject(hdc,hPen)
				li_middpos = (ast_rect.Top+ast_rect.Bottom)/2
   			MoveToEx(hdc,ast_rect.Left - 4,li_middpos,0)
   			LineTo(hdc,ast_rect.Right - 1,li_middpos)
				SelectObject(hdc,hOldPen)
   			DeleteObject(hPen)
				
				hPen = GetStockObject(WHITE_PEN)
            SelectObject(hdc,hPen)
				li_middpos = li_middpos+1
   			MoveToEx(hdc,ast_rect.Left - 4,li_middpos,0)
   			LineTo(hdc,ast_rect.Right - 1,li_middpos)
				SelectObject(hdc,hOldPen)
			end if
		end if
		if hIcon>0 then DrawState(hdc, 0, 0, hIcon, 0, ast_rect.Left + 3, ast_rect.Top + 3,16, 16, DST_ICON + DSS_DISABLED)

			ast_rect.Left = ast_rect.Left + 24
	   	ast_rect.Top = ast_rect.Top + 4

		of_drawtext(hdc,ls_itemname,ls_shortcutkey,ast_rect,False)
	END	IF
end subroutine

public function decimal of_getshortcutkeyrate (menu am_menu);string ls_text
long	lhdc_temp,MenuFont,OldFont
tagrect rc,tmp
integer li_for,li_pos,li_tmp,li_width1,li_width2
Dec ld_rate,ld_this

lhdc_temp = GetDC(il_winhandle)
MenuFont = of_GetmenuFont(lhdc_temp)
OldFont = SelectObject(lhdc_temp,MenuFont)

FOR li_for = 1 TO UpperBound(am_menu.Item)
	ls_text = am_menu.Item[li_for].Text
	li_pos = POS(ls_text,"~t")
	
	IF li_pos > 0 THEN
		
		rc = tmp
		DrawText(lhdc_temp,LEFT(ls_text,li_pos - 1),li_pos - 1,rc,DT_CALCRECT)
		li_tmp = rc.right - rc.left
		IF li_tmp > li_width1 THEN
			li_width1 = li_tmp
		END IF

		rc = tmp
		DrawText(lhdc_temp,MID(ls_text,li_pos + 1),Len(ls_text) - li_pos,rc,DT_CALCRECT)
		li_tmp = rc.right - rc.left
		IF li_tmp > li_width2 THEN
			li_width2 = li_tmp
		END IF
		
	END IF
NEXT

SelectObject(lhdc_temp,OldFont)

IF li_width1 + li_width2 > 0 THEN
	ld_rate = li_width1 / ( li_width1 + li_width2 )
END IF
ReleaseDc(il_winhandle,lhdc_temp)
RETURN ld_rate

end function

public subroutine of_setvisible (menu am_menu, boolean ab_visible);//NOW CAN IMPLEMENT!

am_menu.visible=ab_visible
of_registerwindow(iw_win)


end subroutine

public subroutine of_registerwindow (readonly window aw_win);//-------------------------------------------------------*
//	FUNCTION:		of_registerwindow								*
//	Description:														*
//-------------------------------------------------------*
//	Parameters:		window		aw_win							*
//-------------------------------------------------------*
//	Author(s)		Date			Remark							*
//	Rain				2003.03.10	Develop							*
//-------------------------------------------------------*
uLong hMenu,ll_hsysmenu
menu smenu
String sMenuName
Integer li_level = 0
il_winhandle = handle(aw_win)
iw_win = aw_win
hMenu = GetMenu(il_winhandle)
smenu = aw_win.menuid
if hMenu>0 then
	ll_hsysmenu = GetSystemMenu(il_winhandle,false)
	of_registermenu(smenu,li_level,hMenu,ll_hsysmenu)
end if	

end subroutine

public function boolean of_iswhitespace (string as_source);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_IsWhiteSpace
//
//	Access: 			public
//
//	Arguments:
//	as_source		The source string.
//
//	Returns:  		Boolean
//						True if the string only contains White Space characters. 
//						If any argument's value is NULL, function returns NULL.
//
//	Description:  	Determines whether a string contains only White Space
//						characters. White Space characters include Newline, Tab,
//						Vertical tab, Carriage return, Formfeed, and Backspace.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

long 		ll_count=0
long 		ll_length
char		lc_char[]
integer	li_ascii

//Check parameters
If IsNull(as_source) Then
	boolean lb_null
	SetNull(lb_null)
	Return lb_null
End If

//Get the length
ll_length = Len (as_source)

//Check for at least one character
If ll_length=0 Then
	Return False
End If

//Move string into array of chars
lc_char = as_source


//Perform loop around all characters
//Quit loop if Non WhiteSpace character is found
do while ll_count<ll_length
	ll_count ++
	
	//Get ASC code of character.
	li_ascii = Asc (lc_char[ll_count])
	
	If li_ascii=8	or			/* BackSpae */		 		& 
		li_ascii=9 	or			/* Tab */		 			& 
		li_ascii=10 or			/* NewLine */				& 
		li_ascii=11 or			/* Vertical Tab */		& 
		li_ascii=12 or			/* Form Feed */			& 
		li_ascii=13 or			/* Carriage Return */	&
		li_ascii=32 Then		/* Space */		
		//Character is a WhiteSpace.
		//Continue with the next character.
	Else
		/* Character is Not a White Space. */
		Return False
	End If
loop
	
// Entire string is White Space.
return True

end function

public subroutine of_measureitem (ref unsignedlong childid, ref long measureitemstruct);//-------------------------------------------------------*
//	FUNCTION:		of_measureitem									*
//	Description:														*
//-------------------------------------------------------*
//	Parameters:		ulong	childid									*
//						long	measureitemstruct						*
//-------------------------------------------------------*
//	Author(s)		Date			Remark							*
//	¼ú¿ÍÎÞÃû			2003.02.27	Develop							*
//	Rain				2003.03.10	calc width of menuitem	
// Bluetlck                   use GetTextExtentpoint32 instead of drawtext
//-------------------------------------------------------*

string	ls_text
long	lhdc_temp,holdfont
tagrect rc
int li_row,rcWidth,li_return
long Itemwidth

MeasureItemStruct tMeasureItemStruct
CopyMemory(tMeasureItemStruct,MeasureItemStruct,24)

IF	tMeasureItemStruct.CtlType <> 1	THEN	//	<>	ODT_MENU	
	RETURN
END	IF
if tMeasureItemStruct.itemdata=0 then return
li_row = of_find_byid(tMeasureItemStruct.itemdata)

IF li_row =0	THEN
	RETURN	//none of our business
ELSE

//get menuitem's text to measure width
	ls_text = trim(ist_menuinfo[li_row].menupt.text) 
	int li_pos,li_lenght
	li_pos = POS(ls_text,"~t")
	IF li_pos = 0 THEN
		ls_text = ls_text +ist_menuinfo[li_row].ShortcutKey
	END IF
END IF

If ist_menuinfo[li_row].menupt.text="-" then
	tMeasureItemStruct.Itemheight = GetSystemMetrics(SM_CYMENU)/3
	tMeasureItemStruct.ItemWidth = 0
else
	tMeasureItemStruct.ItemHeight = GetSystemMetrics(SM_CYMENU) +3
 	lhdc_temp = GetDC(il_winhandle)

 TextSize lstr_Size
	// Get the size of the text.
	
  holdfont = SelectObject(lhdc_temp,GetStockObject(SYSTEM_FONT))
  GetTextExtentpoint32(lhdc_temp, ls_text, len(ls_text), lstr_Size )
  SelectObject(lhdc_temp,holdfont)
  rcWidth = lstr_Size.l_cx


  if ist_menuinfo[li_row].level <> 0 then 
	 itemwidth = rcWidth+22
  else
	 itemwidth = rcWidth
  END IF 
  tMeasureItemStruct.ItemWidth = itemwidth
  ReleaseDc(il_winhandle,lhdc_temp)
 end if


CopyMemory(MeasureItemStruct,tMeasureItemStruct,24)

end subroutine

private subroutine of_drawselectitem (integer ai_menustyle, long hdc, ref tagrect ast_rect, ref ust_menuinfo ast_menuinfo);string ls_ItemName,ls_shortcutkey
long hIcon
tagrect rTmp
menu lm_menupt	

ls_ItemName 	= ast_menuinfo.menupt.text
if MenuBKStyle = STYLE_BKWhite and ls_ItemName<>"-" then ls_ItemName=" "+ls_ItemName
lm_menupt		= ast_menuinfo.menupt
hIcon 			= ast_menuinfo.hIcon
ls_shortcutkey = ast_menuinfo.shortcutkey

int li_pos
li_pos = POS(ls_ItemName,"~t")
IF li_pos > 0 THEN
	ls_ItemName = LEFT(ls_ItemName,li_pos - 1)
END IF


Choose Case ai_Menustyle
	Case 1
		FillRect(hdc,ast_rect,GetSysColorBrush(COLOR_HIGHLIGHT))	
		if lm_menupt.checked then 
			of_drawchecked(hdc,ast_rect)
		elseif hIcon>0 then
		   DrawIconEx(hdc,ast_rect.Left + 3,ast_rect.Top + 3,hIcon,16,16,0,0,3)	
		end if
		SetTextColor(hdc,GetSysColor(COLOR_HIGHLIGHTTEXT))
	Case 2
		//draw border 
		rTmp.Top = ast_rect.Top
		rTmp.Left = ast_rect.Left + 1
		rTmp.Bottom = ast_rect.Bottom
		rTmp.Right = ast_rect.Left + 21
		DrawEdge(hdc,rTmp,BDR_RAISEDINNER,BF_TOP + BF_LEFT + BF_BOTTOM + BF_RIGHT)
		rTmp.Left = rTmp.Left + 22
		rTmp.Right = ast_rect.Right - 1
		DrawEdge(hdc,rTmp,BDR_SUNKENOUTER,BF_TOP + BF_LEFT + BF_BOTTOM + BF_RIGHT)
		If hIcon<=0 and not lm_menupt.Checked Then 
			rTmp.Left = ast_rect.Left
		end if	
		FillRect(hdc,rTmp,GetSysColorBrush(COLOR_HIGHLIGHT))
		SetTextColor(hdc,GetSysColor(COLOR_HIGHLIGHTTEXT))
	Case 3
		rTmp.Top = ast_rect.Top 
		rTmp.Left = ast_rect.Left + 1
		rTmp.Bottom = ast_rect.Bottom
		rTmp.Right = ast_rect.Left + 21
		DrawEdge(hdc,rTmp,BDR_RAISEDINNER,BF_TOP + BF_LEFT + BF_BOTTOM + BF_RIGHT)
		rTmp.Left = rTmp.Left + 22
		rTmp.Right = ast_rect.Right - 1
		If hIcon<=0 and not lm_menupt.Checked Then rTmp.Left = 0
		FillRect(hdc,rTmp,GetSysColorBrush(COLOR_BACKGROUND ))
		SetTextColor(hdc,GetSysColor(COLOR_HIGHLIGHTTEXT))
	Case 4,5,6,7
		rTmp.Top = ast_rect.Top 
		rTmp.Left = ast_rect.Left + 1
		rTmp.Bottom = ast_rect.bottom 
		rTmp.Right = ast_rect.Left + 21
		DrawEdge(hdc,rTmp,BDR_RAISEDINNER,BF_TOP + BF_LEFT + BF_BOTTOM + BF_RIGHT)
		
		rTmp.Right = ast_rect.Right - 1
		If hIcon<=0 and not lm_menupt.Checked Then 
			rTmp.Left = ast_rect.Left
		else
		   rTmp.Left = rTmp.Left + 22	
		end if	
		of_FillWithGradient(hdc,rTmp,COLOR_START,COLOR_END)
		SetTextColor(hdc,GetSysColor(COLOR_HIGHLIGHTTEXT))
	Case 8,9,10 //XPSTYLE
			//--------------------------------------------------------------------
         // Write By: ÍõÎÞµÐ	Date: 2003.03.02
			// Modified date : 2003.03.16
         //--------------------------------------------------------------------
		if Menustyle=8 then of_xprect(hdc,ast_rect,RGB(80, 80, 165),RGB(185,185,215))
		if Menustyle=9 then of_xprect(hdc,ast_rect,RGB(255, 131, 6),RGB(255,196,136))
      if Menustyle=10 then of_xprect(hdc,ast_rect,RGB(0, 0, 0),RGB(192,192,192))
		if lm_menupt.checked then 
			of_drawchecked(hdc,ast_rect)
		elseif hIcon>0 then
		   DrawIconEx(hdc,ast_rect.Left + 2,ast_rect.Top + 2,hIcon,16,16,0,0,3)	
		end if
	Case STYLE_COLOR_INFOBK
		rtmp.left = ast_rect.left+22
		rtmp.right = ast_rect.right - 2
		rtmp.top = ast_rect.top +1
		rtmp.bottom = ast_rect.bottom - 1
		of_xprect(hdc,rtmp,RGB(0, 0, 0), GetSysColor(COLOR_INFOBK))
		if lm_menupt.checked then 
			of_drawchecked(hdc,ast_rect)
		elseif hIcon>0 then
		   DrawIconEx(hdc,ast_rect.Left + 2,ast_rect.Top + 2,hIcon,16,16,0,0,3)	
		end if
	End Choose
	
	//draw text
	ast_rect.Left = ast_rect.Left + 24
	ast_rect.Top = ast_rect.Top + 4
	SetBkMode(hdc,TRANSPARENT)
	DrawText(hdc,ls_ItemName,Len(ls_ItemName),ast_rect,DT_VCENTER)				
	ast_rect.Right =ast_rect.Right - 12
	DrawText(hdc,ls_shortcutkey,Len(ls_shortcutkey),ast_rect,DT_RIGHT)				

end subroutine

on n_supermenu.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_supermenu.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event destructor;integer li_loop
//IF	il_menufont<>0	THEN	DeleteObject(il_menufont)
FOR	li_loop	=1	TO	UpperBound(ist_menuinfo)
	IF	ist_menuinfo[li_loop].hIcon<>0	THEN
		DestroyIcon(ist_menuinfo[li_loop].hIcon)
	END	IF
	if isValid(ist_menuinfo[li_loop].menupt) then
		destroy ist_menuinfo[li_loop].menupt
	end if
NEXT

end event

event constructor;//----------------------------------------------------------------*
//		UserObject:		nvo_supermenu_class									*
//		Description:	icon menu (ONLY WINDOW MENU SUPPORTED)			*
//----------------------------------------------------------------*
//	Author(s):	         Date 				Remark							*
//	¼ú¿ÍÎÞÃû		         2003.02.27     Develop							*
//	Addison Lu				2003.03.02		fixed a few bugs				*								
// ÍõÎÞµÐ					2003.03.02		new "xp rectangle" style	*
//	Rain						2003.03.10		as below							*
//																						*
//		I made a lot of changed on this object,such as					*
//		1.Encapsulates all code in one userobjet,since PB does not	*
//		  support "Address of Function" , so we can not set new    	*
//		  WndProc, just makes the object more easy to use.				*
//		2.Uses structure array instead of Datastore						*
//		3.Calc width of menuitem  at runtime(MEASUREITEM)				*
//		4.Draw disabled status													*
//		5.Performance enhanced,fixed Memorey Leak bugs	...			*
//																						*
//		it's a great pity that some bugs/functions	are still	not*
//		fixed/implemented.														*
//		1.	submenu available when parent set disabled					*
//		2.	can not modify visible property at runtime					*
//----------------------------------------------------------------*

//============================================*
//					HOW	TO	USE	                *
//============================================*
//	----	1.Declare	INSTANCE	Variable	----
//
//	nvo_supermenu_class	inv_supermenu	//	autoinstantiate
//
//	----	2.Window Open Event	----
//
//	inv_SuperMenu.MenuStyle = inv_SuperMenu.STYLE_STYLE3
//	inv_SuperMenu.of_registerwindow(this)
//	inv_SuperMenu.of_SetMenuIcon('BYID',"m_5","´ò¿ª.ICO")
//	inv_SuperMenu.of_SetMenuIcon('BYTEXT',"ÐÂ½¨","ÐÂ½¨.ICO")
//	inv_SuperMenu.of_SetMenuIcon('BYID',"m_6","±£´æ.ICO")
//
//	----	3.ue_drawmenuitem(PBM_DRAWMENUITEM)	----
//	inv_SuperMenu.of_drawitem(childid,drawitemstruct)
//
//	----	4.ue_measureitem(PBM_MEASUREITEM)	----
//	inv_SuperMenu.of_measureitem(childid,measureitemstruct)


//		more	style
//CONSTANT INTEGER STYLE_NORMAL = 1
//CONSTANT INTEGER STYLE_OFFICE2K    = 2
//CONSTANT INTEGER STYLE_STYLE3   = 3
//CONSTANT INTEGER STYLE_GRADIENT = 4
////Gradient style does not work well under Win98 , 
////and it's slow in PB.  (My Computer : PIII 650,TNT2)
//CONSTANT INTEGER STYLE_OFFICEXP = 5


/* Bluetlck						2003.04.25		as below	

Á½ÖÖÉèÖÃvisibleÊôÐÔµÄ·½·¨£¬È¡ÆäÒ»¼´¿É
1:ÀûÓÃinv_SuperMenuµÄÄÚ²¿º¯Êýof_setvisible
2:ÔÚ²Ëµ¥ËùÔÚ´°¿ÚÖÐ×Ô¶¨ÒåÊÂ¼þpbm_initmenu£¬¼ÓÈëscript:
	if hmenu <> inv_supermenu.GetMenu(handle(this)) then
   	inv_supermenu.of_registermenu(m_dmm0200,1,hmenu)
	else
		inv_supermenu.of_registermenu(m_dmm0200,0,hmenu)
	end if 
	È»ºó¾Í¿ÉÒÔÖ±½Ó¸ü¸Ä²Ëµ¥µÄvisibleÊôÐÔ
*/

/* ATTENTION!!!
 if your pb version is not pb8 ,please modify some extelnal functions by hand.
*/
if COLOR_START	= 0 then COLOR_START	= GetSysColor(COLOR_HIGHLIGHT)
if COLOR_END =0 then COLOR_END =GetSysColor(COLOR_MENU)
end event

