$PBExportHeader$w_modifyprop.srw
forward
global type w_modifyprop from window
end type
type cb_4 from commandbutton within w_modifyprop
end type
type cb_2 from commandbutton within w_modifyprop
end type
type mle_1 from multilineedit within w_modifyprop
end type
type sle_2 from singlelineedit within w_modifyprop
end type
type st_4 from statictext within w_modifyprop
end type
type st_3 from statictext within w_modifyprop
end type
type st_2 from statictext within w_modifyprop
end type
type cb_3 from commandbutton within w_modifyprop
end type
type sle_1 from singlelineedit within w_modifyprop
end type
type cb_1 from commandbutton within w_modifyprop
end type
type ddlb_1 from dropdownlistbox within w_modifyprop
end type
type ddlb_2 from dropdownlistbox within w_modifyprop
end type
type st_1 from statictext within w_modifyprop
end type
type gb_1 from groupbox within w_modifyprop
end type
type gb_2 from groupbox within w_modifyprop
end type
end forward

global type w_modifyprop from window
integer width = 2885
integer height = 1324
boolean titlebar = true
string title = "DataWindow Object Property Describe/Modify"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_4 cb_4
cb_2 cb_2
mle_1 mle_1
sle_2 sle_2
st_4 st_4
st_3 st_3
st_2 st_2
cb_3 cb_3
sle_1 sle_1
cb_1 cb_1
ddlb_1 ddlb_1
ddlb_2 ddlb_2
st_1 st_1
gb_1 gb_1
gb_2 gb_2
end type
global w_modifyprop w_modifyprop

type variables
DataWindow	idw_1
String		is_dwoType
end variables

forward prototypes
public function integer wf_parsetoarray (string as_source, string as_delimiter, ref string as_array[])
public subroutine wf_make_syntax ()
end prototypes

public function integer wf_parsetoarray (string as_source, string as_delimiter, ref string as_array[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_ParseToArray
//
//	Access:  public
//
//	Arguments:
//	as_Source   The string to parse.
//	as_Delimiter   The delimeter string.
//	as_Array[]   The array to be filled with the parsed strings, passed by reference.
//
//	Returns:  long
//	The number of elements in the array.
//	If as_Source or as_Delimeter is NULL, function returns NULL.
//
//	Description:  Parse a string into array elements using a delimeter string.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//	5.0.02   Fixed problem when delimiter is last character of string.

//	   Ref array and return code gave incorrect results.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

long		ll_DelLen, ll_Pos, ll_Count, ll_Start, ll_Length
string 	ls_holder

//Check for NULL
IF IsNull(as_source) or IsNull(as_delimiter) Then
	long ll_null
	SetNull(ll_null)
	Return ll_null
End If

//Check for at leat one entry
If Trim (as_source) = '' Then
	Return 0
End If

//Get the length of the delimeter
ll_DelLen = Len(as_Delimiter)

ll_Pos =  Pos(Upper(as_source), Upper(as_Delimiter))

//Only one entry was found
if ll_Pos = 0 then
	as_Array[1] = as_source
	return 1
end if

//More than one entry was found - loop to get all of them
ll_Count = 0
ll_Start = 1
Do While ll_Pos > 0
	
	//Set current entry
	ll_Length = ll_Pos - ll_Start
	ls_holder = Mid (as_source, ll_start, ll_length)

	// Update array and counter
	ll_Count ++
	as_Array[ll_Count] = ls_holder
	
	//Set the new starting position
	ll_Start = ll_Pos + ll_DelLen

	ll_Pos =  Pos(Upper(as_source), Upper(as_Delimiter), ll_Start)
Loop

//Set last entry
ls_holder = Mid (as_source, ll_start, Len (as_source))

// Update array and counter if necessary
if Len (ls_holder) > 0 then
	ll_count++
	as_Array[ll_Count] = ls_holder
end if

//Return the number of entries found
Return ll_Count

end function

public subroutine wf_make_syntax ();If ddlb_1.Text = "" Or ddlb_2.Text = "" Then 
	sle_2.Text = ""
	Return
End if

If sle_1.Text = "" Then
	sle_2.Text = "dw_1.Describe(" + ddlb_1.Text + "." + ddlb_2.Text + ")"
Else
	sle_2.Text = "dw_1.Modify(" + ddlb_1.Text + "." + ddlb_2.Text + "=" + sle_1.Text + ")"
End If



end subroutine

on w_modifyprop.create
this.cb_4=create cb_4
this.cb_2=create cb_2
this.mle_1=create mle_1
this.sle_2=create sle_2
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.cb_3=create cb_3
this.sle_1=create sle_1
this.cb_1=create cb_1
this.ddlb_1=create ddlb_1
this.ddlb_2=create ddlb_2
this.st_1=create st_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.cb_4,&
this.cb_2,&
this.mle_1,&
this.sle_2,&
this.st_4,&
this.st_3,&
this.st_2,&
this.cb_3,&
this.sle_1,&
this.cb_1,&
this.ddlb_1,&
this.ddlb_2,&
this.st_1,&
this.gb_1,&
this.gb_2}
end on

on w_modifyprop.destroy
destroy(this.cb_4)
destroy(this.cb_2)
destroy(this.mle_1)
destroy(this.sle_2)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.cb_3)
destroy(this.sle_1)
destroy(this.cb_1)
destroy(this.ddlb_1)
destroy(this.ddlb_2)
destroy(this.st_1)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;String	ls_objects[]
Integer	i, n

str_setdwoprop lstr_msg

lstr_msg = Message.PowerObjectParm
idw_1 = lstr_msg.adw_1

If Not IsValid(idw_1) Then
	MessageBox("Open Failed", "Message Parm Pass Failed!")
	Close(This)
	Return
End If

wf_parseToArray(idw_1.Describe("DataWindow.Objects"), "~t", ls_objects)

ddlb_1.AddItem("datawindow")

For i = 1 To UpperBound(ls_objects)
	ddlb_1.AddItem(ls_objects[i])
Next

i = ddlb_1.FindItem(lstr_msg.as_col, 0)
Do While i > 0 And ddlb_1.Text(i) <> lstr_msg.as_col 
	i = ddlb_1.FindItem(lstr_msg.as_col, i)
Loop
If i > 0 Then 
	ddlb_1.SelectItem(i)
	ddlb_1.Event SelectionChanged(i)
End If

i = ddlb_2.FindItem(lstr_msg.as_prop, 0)
Do While i > 0 And ddlb_2.Text(i) <> lstr_msg.as_prop 
	i = ddlb_2.FindItem(lstr_msg.as_prop, i)
Loop
If i > 0 Then 
	ddlb_2.SelectItem(i)
	ddlb_2.Event SelectionChanged(i)
End If

If Len(lstr_msg.as_value) > 0 Then
	sle_1.Text = lstr_msg.as_value
End If

end event

type cb_4 from commandbutton within w_modifyprop
integer x = 1714
integer y = 1056
integer width = 453
integer height = 96
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Clear"
end type

event clicked;mle_1.Text = ''
end event

type cb_2 from commandbutton within w_modifyprop
integer x = 2281
integer y = 1056
integer width = 453
integer height = 96
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Close"
end type

event clicked;Close(Parent)
end event

type mle_1 from multilineedit within w_modifyprop
integer x = 87
integer y = 644
integer width = 2647
integer height = 376
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean autovscroll = true
borderstyle borderstyle = stylelowered!
end type

type sle_2 from singlelineedit within w_modifyprop
integer x = 87
integer y = 356
integer width = 1591
integer height = 100
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_4 from statictext within w_modifyprop
integer x = 1723
integer y = 92
integer width = 402
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Values:"
boolean focusrectangle = false
end type

type st_3 from statictext within w_modifyprop
integer x = 745
integer y = 88
integer width = 402
integer height = 68
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Property:"
boolean focusrectangle = false
end type

type st_2 from statictext within w_modifyprop
integer x = 105
integer y = 92
integer width = 402
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Object:"
boolean focusrectangle = false
end type

type cb_3 from commandbutton within w_modifyprop
integer x = 2277
integer y = 356
integer width = 453
integer height = 96
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Resume"
end type

event clicked;//integer	i
//
//mle_1.Text = ""
//
//For i = 1 To ddlb_2.TotalItems()
//	mle_1.Text += ddlb_2.Text(i) + "=" + idw_1.Describe(ddlb_1.Text + "." + ddlb_2.Text(i)) + "~r~n"
//Next

idw_1.getParent().Dynamic wf_setDataObject()
end event

type sle_1 from singlelineedit within w_modifyprop
event editchanged pbm_enchange
integer x = 1714
integer y = 164
integer width = 1006
integer height = 92
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event editchanged;wf_make_syntax()
end event

type cb_1 from commandbutton within w_modifyprop
integer x = 1723
integer y = 356
integer width = 443
integer height = 96
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Execute"
end type

event clicked;string	ls_Describe
String	ls_rtn
Long		ll_pos

If sle_2.Text = '' Then
	MessageBox("", "Select Information!")
	Return
End If

ll_pos = Pos(lower(sle_2.Text), "describe")

If ll_pos > 0 Then
	ls_rtn = "Describe: " + idw_1.Describe(Mid(sle_2.Text, Pos(sle_2.Text, "(") + 1, Len(sle_2.Text) - 15))
Else
	ls_rtn = idw_1.Modify(Mid(sle_2.Text, Pos(sle_2.Text, "(") + 1, Len(sle_2.Text) - 13))
	If Len(ls_rtn) = 0  Then ls_rtn = "Modify Successfully!"
	ls_rtn += "~r~n"
	ls_rtn += "Describe: " + idw_1.Describe(Mid(sle_2.Text, Pos(sle_2.Text, "(") + 1, Pos(sle_2.Text, "=") - Pos(sle_2.Text, "(") - 1))	
End if
	
mle_1.Text = ls_rtn

mle_1.Text = idw_1.Describe(ddlb_1.Text + "." + ddlb_2.Text)

end event

type ddlb_1 from dropdownlistbox within w_modifyprop
integer x = 87
integer y = 164
integer width = 622
integer height = 1064
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean allowedit = true
boolean sorted = false
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;String	ls_attributes[], ls_text
Integer	i

ls_text = idw_1.Describe(Text(index) + ".type")

If ls_text = is_dwoType Then 
	wf_make_syntax()
	Return
End If

is_dwoType = ls_text
ddlb_2.Text = ""
ddlb_2.Reset()
sle_2.Text = ''

wf_parseToArray(idw_1.Describe(Text(index) + ".Attributes"), "~t", ls_attributes)

For i = 1 To UpperBound(ls_attributes)
	ddlb_2.AddItem(ls_attributes[i])
Next

i = ddlb_2.FindItem('print.buttons', 0)

If i > 0 Then 
	ddlb_2.SelectItem(i)
	ddlb_2.Event SelectionChanged(i)
End If

end event

type ddlb_2 from dropdownlistbox within w_modifyprop
integer x = 731
integer y = 164
integer width = 965
integer height = 1064
integer taborder = 30
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean allowedit = true
boolean sorted = false
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;string ls_name
ls_name = this.text
choose case ls_name
	case 'print.buttons','print.cliptext','print.collate','print.preview','print.preview.rulers','print.prompt','print.preview.buttons'
		sle_1.text='yes/no'
	case 'print.color','print.columns','print.columns.width','print.copies','print.margin.bottom','print.margin.left','print.margin.right','print.margin.top'
		sle_1.text='0/1'
	case 'print.duplex'
		sle_1.text='1/2/3'
	case 'print.orientation','print.page.rangeinclude'
		sle_1.text='0/1/2'
	case 'print.documnetname','print.filename'
		sle_1.text='~'appoen~''
	case 'print.page.range'
		sle_1.text='~'2,3~''
	case 'print.paper.size'
		sle_1.text='0ÖÁ41'
	case 'print.paper.source'
		sle_1.text='0ÖÁ14'
	case 'print.quality'
		sle_1.text='0/1/2/3/4'
	case else
		sle_1.text=''
end choose
wf_make_syntax()
end event

type st_1 from statictext within w_modifyprop
integer x = 105
integer y = 284
integer width = 594
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Describe/Modify Syntax:"
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_modifyprop
integer x = 32
integer y = 12
integer width = 2770
integer height = 536
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Operator"
end type

type gb_2 from groupbox within w_modifyprop
integer x = 32
integer y = 568
integer width = 2770
integer height = 632
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Output"
end type

