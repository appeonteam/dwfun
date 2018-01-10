$PBExportHeader$w_validation.srw
forward
global type w_validation from window
end type
type st_2 from statictext within w_validation
end type
type st_1 from statictext within w_validation
end type
type sle_password from singlelineedit within w_validation
end type
type sle_username from singlelineedit within w_validation
end type
type cb_2 from commandbutton within w_validation
end type
type cb_1 from commandbutton within w_validation
end type
end forward

global type w_validation from window
integer width = 1394
integer height = 596
boolean titlebar = true
string title = "Identify Validation"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_2 st_2
st_1 st_1
sle_password sle_password
sle_username sle_username
cb_2 cb_2
cb_1 cb_1
end type
global w_validation w_validation

type variables
string is_Type
string is_Return = "cancel!"
end variables

forward prototypes
public function string of_keycode (string as_key, string as_type)
end prototypes

public function string of_keycode (string as_key, string as_type);string  ls_key
string  ls_word
integer li_i
integer li_j
integer li_len

/*
type: '1' 	:code
		'0'	:decode
*/
li_len = len(as_key)

If as_type = '1' Then
	for li_i = li_len to 1 step -1
		ls_word = mid(as_key,li_i,1)
		ls_key += String(char(ASC(ls_word) + li_i))
		as_key = mid(as_key,1,li_i - 1)
	next
	
End If

return ls_key
end function

on w_validation.create
this.st_2=create st_2
this.st_1=create st_1
this.sle_password=create sle_password
this.sle_username=create sle_username
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.st_2,&
this.st_1,&
this.sle_password,&
this.sle_username,&
this.cb_2,&
this.cb_1}
end on

on w_validation.destroy
destroy(this.st_2)
destroy(this.st_1)
destroy(this.sle_password)
destroy(this.sle_username)
destroy(this.cb_2)
destroy(this.cb_1)
end on

event close;CloseWithReturn(this, is_Return)
end event

event open;is_Type = Message.StringParm
end event

type st_2 from statictext within w_validation
integer x = 87
integer y = 236
integer width = 343
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Passowrd:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_validation
integer x = 87
integer y = 88
integer width = 343
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "User Name:"
boolean focusrectangle = false
end type

type sle_password from singlelineedit within w_validation
integer x = 457
integer y = 220
integer width = 818
integer height = 96
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean password = true
borderstyle borderstyle = stylelowered!
end type

type sle_username from singlelineedit within w_validation
integer x = 457
integer y = 72
integer width = 818
integer height = 96
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_validation
integer x = 946
integer y = 376
integer width = 334
integer height = 88
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cancel"
boolean cancel = true
end type

event clicked;Close(Parent)
end event

type cb_1 from commandbutton within w_validation
integer x = 599
integer y = 376
integer width = 334
integer height = 88
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&OK"
boolean default = true
end type

event clicked;string ls_LoginName
string ls_DBPassword
string ls_InputPassword
string ls_Upower
string ls_SResult

ls_LoginName = Lower(sle_username.Text)
ls_InputPassword = sle_password.Text

if IsNull(ls_LoginName) or ls_LoginName="" then
	MessageBox("Information", "Please input user name.")
	sle_username.SetFocus()
	Return
end if

SELECT Passwd,Is_Upower,Is_SResult INTO :ls_DBPassword,:ls_Upower,:ls_SResult FROM TUser
WHERE  Lower(LoginName) = :ls_LoginName using gtr_COTDB;
if gtr_COTDB.SQLCode=100 then
	MessageBox("Information", "The user name '" + ls_LoginName + "' Invalidate.")
	sle_username.SetFocus()
	Return
end if

if IsNull(ls_Upower) then ls_Upower = ""
if IsNull(ls_SResult) then ls_SResult = ""
if IsNull(ls_DBPassword) then ls_DBPassword = ""
if IsNull(ls_InputPassword) then ls_InputPassword = ""

ls_InputPassword = of_KeyCode(ls_InputPassword, "1")
if ls_InputPassword<>ls_DBPassword then
	MessageBox("Information", "The password incorrect.")
	sle_password.SetFocus()
	Return	
end if

if Lower(is_Type)=Lower("COTUpdateExpValue") then
	if Upper(ls_Upower)<>"T" then
		MessageBox("Information", "Identify validate failed.")
		Return	
	end if
else
	if Upper(ls_SResult)<>"T" then
		MessageBox("Information", "Identify validate failed.")
		Return	
	end if
end if

is_Return = "ok!"
Close(Parent)
end event

