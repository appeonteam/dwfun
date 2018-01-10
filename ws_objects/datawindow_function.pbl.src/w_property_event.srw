$PBExportHeader$w_property_event.srw
forward
global type w_property_event from window
end type
type sle_inputto from singlelineedit within w_property_event
end type
type sle_input from singlelineedit within w_property_event
end type
type st_3 from statictext within w_property_event
end type
type cb_2 from commandbutton within w_property_event
end type
type cb_3 from commandbutton within w_property_event
end type
type cb_21 from commandbutton within w_property_event
end type
type mle_output from multilineedit within w_property_event
end type
type dw_function from datawindow within w_property_event
end type
type st_2 from statictext within w_property_event
end type
type st_1 from statictext within w_property_event
end type
type sle_columnname from singlelineedit within w_property_event
end type
type dw_selectdw from datawindow within w_property_event
end type
type cb_11 from commandbutton within w_property_event
end type
type cb_1 from commandbutton within w_property_event
end type
type dw_1 from datawindow within w_property_event
end type
type gb_2 from groupbox within w_property_event
end type
type gb_3 from groupbox within w_property_event
end type
end forward

global type w_property_event from window
integer width = 4667
integer height = 2476
boolean titlebar = true
string title = "Property Function"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
sle_inputto sle_inputto
sle_input sle_input
st_3 st_3
cb_2 cb_2
cb_3 cb_3
cb_21 cb_21
mle_output mle_output
dw_function dw_function
st_2 st_2
st_1 st_1
sle_columnname sle_columnname
dw_selectdw dw_selectdw
cb_11 cb_11
cb_1 cb_1
dw_1 dw_1
gb_2 gb_2
gb_3 gb_3
end type
global w_property_event w_property_event

type prototypes


end prototypes

type variables
//boolean ib_visible = false;

string is_prev_sort;
string is_prev_dwoname;
end variables

forward prototypes
public subroutine wf_getstatus (integer ai_row, string as_buffer)
public function long wf_aftertime (time at_start, time at_end)
public subroutine wf_output (string as_mess, boolean ab_add)
public subroutine wf_sort (datawindow ad_dw, string as_column)
protected subroutine wf_function (string ag_funcname)
end prototypes

public subroutine wf_getstatus (integer ai_row, string as_buffer);dwItemStatus l_status
choose case as_buffer
	case "primary!"
		l_status = dw_1.GetItemStatus(ai_row, 0,  Primary!)
	case "filter!"
		l_status = dw_1.GetItemStatus(ai_row, 0,  Filter!)
	case "delete!"
		l_status = dw_1.GetItemStatus(ai_row, 0,  delete!)
end choose

Choose case l_status
	Case new!
		MessageBox("",'new')
	Case NewModified!
		MessageBox("", 'NewModified')
	Case NotModified!
		MessageBox("", 'NotModified')
	Case DataModified!
		MessageBox("", 'DataModified')
End choose
end subroutine

public function long wf_aftertime (time at_start, time at_end);long ll_ret 
long ll_millisecond
integer li_hour, li_minute, li_second
boolean lb_negative = False
time lt_temp

If IsNull(at_start) Or IsNull(at_end) Then Return -1

If at_start > at_end Then 
	lt_temp = at_start
	at_start = at_end
	at_end = lt_temp
	lb_negative = True
End If

ll_millisecond = long(string(at_end,"fff")) - long(String(at_start, "fff"))

If ll_millisecond < 0 Then 
	ll_millisecond += 1000
	li_second = -1
End If

li_second += Second(at_end) - Second(at_start)
If li_second < 0 Then 
	li_second += 60
	li_minute = -1
End If

li_minute += Minute(at_end) - Minute(at_start)
If li_minute < 0 Then 
	li_minute += 60
	li_hour = -1
End If

li_hour += hour(at_end) - hour(at_start)

ll_ret = ((li_hour * 60 + li_minute) * 60 + li_second) * 1000 + ll_millisecond

If lb_negative Then ll_ret = -ll_ret

Return ll_ret

end function

public subroutine wf_output (string as_mess, boolean ab_add);if ab_add then
	mle_output.text += as_mess + "~r~n";
else
	mle_output.text = as_mess + "~r~n";
end if
end subroutine

public subroutine wf_sort (datawindow ad_dw, string as_column);ad_dw.SetSort(as_column + ' A')

If as_column <> is_prev_dwoname Then
		ad_dw.SetSort(as_column + ' A')
		is_prev_sort = 'A'
		is_prev_dwoname = as_column
Else
	If is_prev_sort = 'A' Then
		ad_dw.SetSort(as_column + ' D' )
		is_prev_sort = 'D'
	Else
		ad_dw.SetSort(as_column + ' A' )
		is_prev_sort = 'A'
	End If	
End if

ad_dw.Sort()
end subroutine

protected subroutine wf_function (string ag_funcname);String null_str;
setNull(null_str)

integer li_return
string ls_return
boolean lb_return

long ll_row
ll_row = dw_1.getRow()
if ll_row < 0 then return

Choose case ag_funcname
	case "Accepttext"
		li_return = dw_1.accepttext( )
		wf_output("Accepttext return value is : " + string(li_return),False)
	case "Classname"
		ls_return = dw_1.classname( )
		wf_output("Classname return value is : " + ls_return,False)
	case "Deletedcount"
		li_return = dw_1.deletedcount( )
		wf_output("Deletedcount return value is : " + string(li_return),False)
	case "Deleterow"
		li_return = dw_1.deleterow(long(sle_input.text))
		wf_output("Deleterow return value is : " + string(li_return),False)
	case "SetSort"
		dw_1.SetSort(null_str);		
		dw_1.Sort();
	case "Sort"
		dw_1.SetSort(sle_input.text)
		dw_1.Sort()
	case "SetFilter"
		dw_1.SetFilter(null_str);		
		dw_1.Filter();
	case "Filter"
		dw_1.SetFilter(sle_input.text)
		dw_1.Filter()
	case "FilteredCount"
		li_return = dw_1.FilteredCount( )
		wf_output("FilteredCount return value is : " + string(li_return),False)
	Case "GetSqlSelect"
		wf_output(dw_1.GetSqlSelect(), false)
	Case "GetItemString"
		wf_output(dw_1.GetItemString(ll_row,sle_columnname.text), false)
	CASE "GetItemDate"
		wf_output(string(dw_1.GetItemDate(ll_row,sle_columnname.text)), false)
	CASE "GetItemDateTime"
		wf_output(string(dw_1.GetItemDateTime(ll_row,sle_columnname.text)), false)
	case "GetItemTime"
		wf_output(string(dw_1.GetItemTime(ll_row,sle_columnname.text)), false)
	case "GetItemDecimal"
		wf_output(string(dw_1.GetItemDecimal(ll_row,sle_columnname.text)), false)
	case "GetItemNumber"
		wf_output(string(dw_1.GetItemNumber(ll_row,sle_columnname.text)), false)
	Case "RowsDiscard"
		dw_1.rowsdiscard(long(sle_input.text),long(sle_inputto.text),primary!)
		dw_1.selectrow(0,false)
		ll_row = dw_1.getRow()
		if ll_row < 0 then return
		wf_output("After RowsDiscard,GetRow is : "+string(ll_row), false)
		dw_1.selectRow(ll_row,true)
	Case "GetItemStatus"
		dwItemStatus l_status
		wf_getstatus(ll_row,"primary!")
	Case "SetWidth"
		dw_1.width = long(sle_input.text)
	Case "SetHeight"
		dw_1.height = long(sle_input.text)
	Case "SetItem"
		dw_1.SetItem(dw_1.getRow(), sle_columnname.text, sle_input.text)
	Case "Modify"
		if sle_inputto.text = '' or isnull(sle_inputto.text) then
			ls_return = dw_1.modify(sle_columnname.text)
			wf_output("Modify return is : " + ls_return, false)
		else
			wf_output(sle_columnname.text+"."+sle_input.text +"="+sle_inputto.text, false)
			dw_1.modify(sle_columnname.text+"."+sle_input.text +"='"+sle_inputto.text+"'")
		end if
	Case "Describe"
		if sle_input.text = '' or isnull(sle_input.text) then
			wf_output(dw_1.Describe(sle_columnname.text), false)
		else
			wf_output(dw_1.Describe(sle_columnname.text+"."+sle_input.text), false)
		end if
	case "Find"
		li_return = dw_1.find(sle_columnname.text,long(sle_input.text), dw_1.rowcount())
		wf_output("Find return value is : " + string(li_return),False)
	case "FindRequired"
		long ll_rowid
		integer li_colnbr = 0
		string ls_colnam
		li_return = dw_1.FindRequired(Primary!,ll_rowid, li_colnbr,ls_colnam, FALSE)
		wf_output("Findrequired return value is : " + string(li_return) +" row is :"+string(ll_rowid)+ "  columnname is : "+ls_colnam +" column is : "+string(li_colnbr),False)
	case "GetClickedColumn"
		li_return = dw_1.getclickedcolumn( )
		wf_output("Getclickedcolumn return value is : " + string(li_return),False)
	CASE "GetClickedRow"
		li_return = dw_1.GetClickedRow( )
		wf_output("GetClickedRow return value is : " + string(li_return),False)
	CASE "GetColumn"
		li_return = dw_1.GetColumn( )
		wf_output("GetColumn return value is : " + string(li_return),False)
	CASE "GetColumnName"
		ls_return = dw_1.GetColumnName( )
		wf_output("GetColumnName return value is : " + ls_return,False)
	CASE "GetParent"
		wf_output("GetParent return value is : " + string(dw_1.GetParent()),False)
	case "GetRowFromRowId"
		li_return = dw_1.getrowfromrowid(ll_row)
		wf_output("Getrowfromrowid return value is : " + string(li_return),False)
	case "GetRowIdFromRow"
		li_return = dw_1.GetRowIdFromRow(ll_row)
		wf_output("GetRowIdFromRow return value is : " + string(li_return),False)
	Case "Zoom"
		dw_1.object.datawindow.Zoom = long(sle_input.text)
		dw_1.setItem(ll_row,2,sle_input.text)
	Case "ScrollToRow"
		dw_1.ScrollToRow(long(sle_input.text))
	Case "ScrollNextPage"
		dw_1.ScrollNextPage()
	case "GetSQLSelect"
		ls_return = dw_1.GetSQLSelect( )
		wf_output("GetSQLSelect return value is : " + ls_return,False)
	case "GetText"
		ls_return = dw_1.GetText( )
		wf_output("GetText return value is : " + ls_return,False)
	case "GetSelectedRow"
		li_return = dw_1.GetSelectedRow(ll_row)
		wf_output("GetSelectedRow return value is : " + string(li_return),False)
	case "Hide"
		li_return = dw_1.Hide()
		wf_output("Hide return value is : " + string(li_return),False)
	case "InsertRow"
		li_return = dw_1.InsertRow(long(sle_input.text))
		wf_output("InsertRow return value is : " + string(li_return),False)
	case "IsSelected"	
		wf_output("IsSelected return value is : " + string(dw_1.isselected(ll_row)),False)
	case "ModifiedCount"
		li_return = dw_1.ModifiedCount()
		wf_output("ModifiedCount return value is : " + string(li_return),False)
	case "Reset"
		li_return = dw_1.Reset()
		wf_output("Reset return value is : " + string(li_return),False)
	case "Resize"
		li_return = dw_1.Resize(long(sle_input.text),long(sle_inputto.text))
		wf_output("Resize return value is : " + string(li_return),False)
	case "RowCount"
		li_return = dw_1.RowCount()
		wf_output("RowCount return value is : " + string(li_return),False)
	case "ScrollNextPage"
		li_return = dw_1.ScrollNextPage()
		wf_output("ScrollNextPage return value is : " + string(li_return),False)
	case "ScrollNextRow"
		li_return = dw_1.ScrollNextRow()
		wf_output("ScrollNextRow return value is : " + string(li_return),False)
	case "ScrollPriorPage"
		li_return = dw_1.ScrollPriorPage()
		wf_output("ScrollPriorPage return value is : " + string(li_return),False)
	case "ScrollPriorRow"
		li_return = dw_1.ScrollPriorRow()
		wf_output("ScrollPriorRow return value is : " + string(li_return),False)
	case "ScrollToRow"
		li_return = dw_1.ScrollToRow( long(sle_input.text))
		wf_output("ScrollToRow return value is : " + string(li_return),False)
	case "SelectRow"
		if lb_return then
			li_return = dw_1.SelectRow( long(sle_input.text),false)
			wf_output("SelectRow return value is : " + string(li_return),False)
			lb_return = false
		else
			li_return = dw_1.SelectRow( long(sle_input.text),true)
			wf_output("SelectRow return value is : " + string(li_return),False)
			lb_return = true
		end if
	case "SelectedLength"
		li_return = dw_1.selectedLength()
		wf_output("selectedLength return value is : " + string(li_return),False)
	case "SelectedStart"
		li_return = dw_1.SelectedStart()
		wf_output("SelectedStart return value is : " + string(li_return),False)
	case "SetColumn"
		li_return = dw_1.SetColumn(long(sle_input.text))
		wf_output("SetColumn return value is : " + string(li_return),False)
	case "SetItemStatus"
		li_return = dw_1.SetItemStatus(long(sle_input.text),long(sle_inputto.text),Primary!, DataModified!)
		wf_output("SetItemStatus return value is : " + string(li_return),False)
	case "SetRow"
		li_return = dw_1.SetRow(long(sle_input.text))
		wf_output("SetRow return value is : " + string(li_return),False)
	case "SetSQLPreview"
		ls_return = dw_1.getsqlselect( )
		li_return = dw_1.SetSQLPreview(ls_return + sle_input.text)
		wf_output("SetSQLPreview return value is : " + string(li_return),False)
	case "SetSQLSelect"
		ls_return = dw_1.getsqlselect( )
		li_return = dw_1.setsqlselect(ls_return + sle_input.text)
		wf_output("SetSQLSelect return value is : " + string(li_return),False)
	case "SetTabOrder"
		li_return = dw_1.SetTabOrder(sle_input.text,long(sle_inputto.text))
		wf_output("SetTabOrder return value is : " + string(li_return),False)
	case "SetText"
		li_return = dw_1.SetText(sle_input.text)
		wf_output("SetText return value is : " + string(li_return),False)	
	case "TypeOf"
		wf_output("TypeOf return value is : " + string(dw_1.typeof()),False)
	case "Retrieve"
		li_return =dw_1.Retrieve()
		wf_output("Retrieve return value is : " + string(li_return),False)
	case "Update"
		if dw_1.update() = 1 then
			commit;
			MessageBox("","Success!")
		else
			rollback;
		end if
	case "print"
		li_return = dw_1.print( )
		wf_output("Print return value is : " + string(li_return),False)
	case "Setposition"
		dw_1.SetPosition(sle_input.text,sle_inputto.text, TRUE)
	case "SetValue"
		li_return = dw_1.setvalue(sle_input.text,dw_1.GetRow(),sle_inputto.text)
		wf_output("Setvalue return value is : " + string(li_return),False)
	case "SaveAs"
		li_return = dw_1.saveas( )
		wf_output("SaveAs return value is : " + string(li_return),False)
	case "SaveAsAscii"
		li_return = dw_1.SaveAsAscii(sle_input.text)
		wf_output("SaveAsAscii return value is : " + string(li_return),False)
	Case "Modify"
			ls_return = dw_1.modify(sle_columnname.text)			
			wf_output("Modify is : " + ls_return, false)			
End Choose

end subroutine

on w_property_event.create
this.sle_inputto=create sle_inputto
this.sle_input=create sle_input
this.st_3=create st_3
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_21=create cb_21
this.mle_output=create mle_output
this.dw_function=create dw_function
this.st_2=create st_2
this.st_1=create st_1
this.sle_columnname=create sle_columnname
this.dw_selectdw=create dw_selectdw
this.cb_11=create cb_11
this.cb_1=create cb_1
this.dw_1=create dw_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.Control[]={this.sle_inputto,&
this.sle_input,&
this.st_3,&
this.cb_2,&
this.cb_3,&
this.cb_21,&
this.mle_output,&
this.dw_function,&
this.st_2,&
this.st_1,&
this.sle_columnname,&
this.dw_selectdw,&
this.cb_11,&
this.cb_1,&
this.dw_1,&
this.gb_2,&
this.gb_3}
end on

on w_property_event.destroy
destroy(this.sle_inputto)
destroy(this.sle_input)
destroy(this.st_3)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_21)
destroy(this.mle_output)
destroy(this.dw_function)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.sle_columnname)
destroy(this.dw_selectdw)
destroy(this.cb_11)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.gb_2)
destroy(this.gb_3)
end on

type sle_inputto from singlelineedit within w_property_event
integer x = 1317
integer y = 1440
integer width = 841
integer height = 96
integer taborder = 330
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type sle_input from singlelineedit within w_property_event
integer x = 1317
integer y = 1344
integer width = 841
integer height = 96
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within w_property_event
integer x = 1061
integer y = 1472
integer width = 219
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "to:"
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_property_event
integer x = 3109
integer y = 1408
integer width = 329
integer height = 88
integer taborder = 320
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "enabled"
end type

event clicked;dw_1.enabled = false
end event

type cb_3 from commandbutton within w_property_event
integer x = 3109
integer y = 1504
integer width = 329
integer height = 96
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "syntaxfsql"
end type

event clicked;string ls_sql_syntax,ls_errors,ls_presentation_str,ls_dwsyntax_str
ls_sql_syntax = sle_columnname.text
ls_errors = ''
if sle_input.text = '' or isnull(sle_input.text) then
	ls_presentation_str = 'style(type=grid)'
else
	ls_presentation_str = 'style(type=' + sle_input.text+')'
end if
if sle_inputto.text <> '' or not isnull(sle_inputto.text) then
	ls_presentation_str = ls_presentation_str + +' '+ sle_inputto.text
end if

ls_dwsyntax_str = SQLCA.SyntaxFromSQL(ls_sql_syntax,ls_presentation_str,ls_ERRORS)
IF Len(ls_ERRORS) > 0 THEN
	MessageBox("Caution","SyntaxFromSQL caused these errors: " + ls_ERRORS)
	RETURN
END IF
dw_1.Create(ls_dwsyntax_str,ls_ERRORS)
IF Len(ls_ERRORS) > 0 THEN
	MessageBox("Caution","Create cause these errors: " + ls_ERRORS)
	RETURN
END IF
dw_1.settransobject(sqlca)
dw_1.retrieve( )
end event

type cb_21 from commandbutton within w_property_event
integer x = 3072
integer y = 2176
integer width = 219
integer height = 64
integer taborder = 220
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Clear"
end type

event clicked;wf_output("",false)
end event

type mle_output from multilineedit within w_property_event
integer x = 914
integer y = 1664
integer width = 2487
integer height = 596
integer taborder = 210
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type dw_function from datawindow within w_property_event
integer x = 3456
integer y = 8
integer width = 1106
integer height = 2292
integer taborder = 250
string title = "none"
string dataobject = "d_dw_function_property"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;//cb_changedw.TriggerEvent(clicked!)

if row <= 0 then Return
string ls_function
ls_function = dw_function.GetItemString(row,"functionname")

wf_function(ls_function)
end event

event clicked;string ls_column
If dwo.Type = 'text' Then
	ls_column = dwo.Name
	ls_column = Left(ls_column, Len(ls_column) - 2)
	wf_sort(this, ls_column)
end if
end event

type st_2 from statictext within w_property_event
integer x = 914
integer y = 1376
integer width = 402
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "SetValue:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_property_event
integer x = 910
integer y = 1300
integer width = 402
integer height = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "ColumnName:"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_columnname from singlelineedit within w_property_event
integer x = 1317
integer y = 1248
integer width = 1719
integer height = 96
integer taborder = 280
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "c_sex"
borderstyle borderstyle = stylelowered!
end type

type dw_selectdw from datawindow within w_property_event
integer x = 5
integer y = 8
integer width = 846
integer height = 2288
integer taborder = 10
string title = "none"
string dataobject = "d_dw_list_property"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;//cb_changedw.TriggerEvent(clicked!)

if row <= 0 then Return
string ls_dw
ls_dw = dw_selectdw.GetItemString(row,"datawindowname")
dw_1.dataobject = ls_dw
dw_1.SetTransObject(sqlca)

end event

event constructor;dw_1.setTransobject(sqlca);
connect;
end event

event clicked;string ls_column
If dwo.Type = 'text' Then
	ls_column = dwo.Name
	ls_column = Left(ls_column, Len(ls_column) - 2)
	wf_sort(this, ls_column)
end if
//dw_selectdw.visible = false
end event

type cb_11 from commandbutton within w_property_event
integer x = 3109
integer y = 1216
integer width = 329
integer height = 88
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "setfoucs"
end type

event clicked;dw_1.setfocus( )
end event

type cb_1 from commandbutton within w_property_event
integer x = 3109
integer y = 1312
integer width = 329
integer height = 88
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Property"
end type

event clicked;str_setdwoprop lstr_1

lstr_1.adw_1 = dw_1
lstr_1.as_col = dw_1.GetColumnName()
lstr_1.as_prop = "datawindow"
OpensheetWithParm(w_modifyprop, lstr_1,w_mdi,1,Original!)

end event

type dw_1 from datawindow within w_property_event
integer x = 878
integer width = 2523
integer height = 1184
integer taborder = 20
boolean titlebar = true
string title = "This   is ~~t test"
string dataobject = "d_extern_property"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(sqlca);

end event

event clicked;wf_output('Getclickedcolumn is : ' + string(this.getclickedcolumn( )),True)
wf_output('Getclickedrow is : ' + string(this.getclickedrow( )),True)
end event

type gb_2 from groupbox within w_property_event
integer x = 878
integer y = 1184
integer width = 2194
integer height = 384
integer taborder = 170
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Set "
end type

type gb_3 from groupbox within w_property_event
integer x = 878
integer y = 1568
integer width = 2560
integer height = 736
integer taborder = 230
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "OutPut:"
end type

