$PBExportHeader$w_grid.srw
forward
global type w_grid from window
end type
type cb_8 from commandbutton within w_grid
end type
type cb_7 from commandbutton within w_grid
end type
type cb_6 from commandbutton within w_grid
end type
type sle_inputto from singlelineedit within w_grid
end type
type sle_input from singlelineedit within w_grid
end type
type st_3 from statictext within w_grid
end type
type cb_5 from commandbutton within w_grid
end type
type cb_4 from commandbutton within w_grid
end type
type cb_2 from commandbutton within w_grid
end type
type cbx_1 from checkbox within w_grid
end type
type cb_3 from commandbutton within w_grid
end type
type dw_2 from datawindow within w_grid
end type
type dw_export from datawindow within w_grid
end type
type cb_21 from commandbutton within w_grid
end type
type mle_output from multilineedit within w_grid
end type
type dw_function from datawindow within w_grid
end type
type st_2 from statictext within w_grid
end type
type st_1 from statictext within w_grid
end type
type sle_columnname from singlelineedit within w_grid
end type
type dw_selectdw from datawindow within w_grid
end type
type cb_11 from commandbutton within w_grid
end type
type cb_1 from commandbutton within w_grid
end type
type dw_1 from datawindow within w_grid
end type
type gb_2 from groupbox within w_grid
end type
type gb_3 from groupbox within w_grid
end type
end forward

global type w_grid from window
integer width = 4631
integer height = 2436
boolean titlebar = true
string title = "Test"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_8 cb_8
cb_7 cb_7
cb_6 cb_6
sle_inputto sle_inputto
sle_input sle_input
st_3 st_3
cb_5 cb_5
cb_4 cb_4
cb_2 cb_2
cbx_1 cbx_1
cb_3 cb_3
dw_2 dw_2
dw_export dw_export
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
global w_grid w_grid

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
		if sle_input.text='' or isnull(sle_input.text) then
			li_return = dw_1.deleterow( dw_1.getrow( ) )
			wf_output("Deleterow return value is : " + string(li_return),False)
		else
			li_return = dw_1.deleterow(long(sle_input.text))
			wf_output("Deleterow return value is : " + string(li_return),False)
		end if
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
		if sle_columnname.text='' or isnull(sle_columnname.text) then
			wf_output(dw_1.GetItemString(ll_row, dw_1.getcolumn( ) ), false)
		else
			wf_output(dw_1.GetItemString(ll_row,sle_columnname.text), false)
		end if
	CASE "GetItemDate"
		if sle_columnname.text='' or isnull(sle_columnname.text) then
			wf_output(string(dw_1.GetItemDate(ll_row, dw_1.getcolumn( )) ), false)
		else
			wf_output(string(dw_1.GetItemDate(ll_row,sle_columnname.text)), false)
		end if
	CASE "GetItemDateTime"
		if sle_columnname.text='' or isnull(sle_columnname.text) then
			wf_output(string(dw_1.GetItemDateTime(ll_row, dw_1.getcolumn( ) )), false)
		else
			wf_output(string(dw_1.GetItemDateTime(ll_row,sle_columnname.text)), false)
		end if
	case "GetItemTime"
		if sle_columnname.text='' or isnull(sle_columnname.text) then
			wf_output(string(dw_1.GetItemTime(ll_row, dw_1.getcolumn( )) ), false)
		else
			wf_output(string(dw_1.GetItemTime(ll_row,sle_columnname.text)), false)
		end if
	case "GetItemDecimal"
		if sle_columnname.text='' or isnull(sle_columnname.text) then
			wf_output(string(dw_1.GetItemDecimal(ll_row, dw_1.getcolumn( ) )), false)
		else
			wf_output(string(dw_1.GetItemDecimal(ll_row,sle_columnname.text)), false)
		end if
	case "GetItemNumber"
		if sle_columnname.text='' or isnull(sle_columnname.text) then
			wf_output(string(dw_1.GetItemNumber(ll_row, dw_1.getcolumn( ) )), false)
		else
			wf_output(string(dw_1.GetItemNumber(ll_row,sle_columnname.text)), false)
		end if
	Case "RowsDiscard"
		if sle_input.text='' or isnull(sle_input.text) or sle_inputto.text='' or isnull(sle_inputto.text) then
			messagebox('Notice','Please input data to 2,3 singlelineedit')
		else
			dw_1.rowsdiscard(long(sle_input.text),long(sle_inputto.text),primary!)
			dw_1.selectrow(0,false)
			ll_row = dw_1.getRow()
			if ll_row < 0 then return
			wf_output("After RowsDiscard,GetRow is : "+string(ll_row), false)
			dw_1.selectRow(ll_row,true)
		end if
	Case "GetItemStatus"
		dwItemStatus l_status
		wf_getstatus(ll_row,"primary!")
	Case "SetWidth"
		if sle_input.text='' or isnull(sle_input.text) then
			messagebox('Notice','Please input data to 2 singlelineedit')
		else
			dw_1.width = long(sle_input.text)
		end if
	Case "SetHeight"
		if sle_input.text='' or isnull(sle_input.text) then
			messagebox('Notice','Please input data to 2 singlelineedit')
		else
			dw_1.height = long(sle_input.text)
		end if
	Case "SetItem"
		if sle_input.text='' or isnull(sle_input.text) or sle_columnname.text='' or isnull(sle_columnname.text) then
			messagebox('Notice','Please input data to 1,2 singlelineedit')
		else
			dw_1.SetItem(dw_1.getRow(), sle_columnname.text, sle_input.text)
		end if
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
		if sle_input.text='' or isnull(sle_input.text) then
			messagebox('Notice','Please input data to 2 singlelineedit')
		else
			dw_1.object.datawindow.Zoom = long(sle_input.text)
			dw_1.setItem(ll_row,2,sle_input.text)
		end if
	Case "ScrollToRow"
		if sle_input.text='' or isnull(sle_input.text) then
			dw_1.ScrollToRow(dw_1.getrow( ) + 1 )
		else
			dw_1.ScrollToRow(long(sle_input.text))
		end if
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
		if sle_input.text='' or isnull(sle_input.text) then
			li_return = dw_1.InsertRow(dw_1.getrow())
		else
			li_return = dw_1.InsertRow(long(sle_input.text))			
		end if
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
	case "RowsCopy"
		li_return = dw_1.RowsCopy(dw_1.GetRow(),long(sle_input.text), Primary!, dw_2, 1, Primary!)
		wf_output("RowsCopy return value is : " + string(li_return),False)
	case "RowsMove"
		li_return = dw_1.RowsMove(1, dw_1.DeletedCount(), Delete!,dw_1, 1, Primary!)
		wf_output("RowsMove return value is : " + string(li_return),False)
	case "Scroll"
		if sle_input.text='' or isnull(sle_input.text) then
			li_return = dw_1.scroll( dw_1.getrow() + 1)
		else
			li_return = dw_1.scroll( long(sle_input.text))
		end if
		wf_output("Scroll return value is : " + string(li_return),False)
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
	case "SelectText"
		ls_return = dw_1.selectedtext( )
		wf_output("SelectText return value is : " + ls_return,False)
	case "SelectedLength"
		li_return = dw_1.selectedLength()
		wf_output("selectedLength return value is : " + string(li_return),False)
	case "SelectedStart"
		li_return = dw_1.SelectedStart()
		wf_output("SelectedStart return value is : " + string(li_return),False)
	case "SetColumn"
		if sle_input.text='' or isnull(sle_input.text) then
			messagebox('Notice','Please input data to 2 singlelineedit')
		else
			li_return = dw_1.SetColumn(long(sle_input.text))
			wf_output("SetColumn return value is : " + string(li_return),False)
		end if
	case "SetItemStatus"
		li_return = dw_1.SetItemStatus(long(sle_input.text),long(sle_inputto.text),Primary!, DataModified!)
		wf_output("SetItemStatus return value is : " + string(li_return),False)
	case "SetRow"
		if sle_input.text='' or isnull(sle_input.text) then
			messagebox('Notice','Please input data to 2 singlelineedit')
		else
			li_return = dw_1.SetRow(long(sle_input.text))
			wf_output("SetRow return value is : " + string(li_return),False)
		end if
	case "SetSQLPreview"
		ls_return = dw_1.getsqlselect( )
		li_return = dw_1.SetSQLPreview(ls_return + sle_input.text)
		wf_output("SetSQLPreview return value is : " + string(li_return),False)
	case "SetSQLSelect"
		if sle_input.text='' or isnull(sle_input.text) then
			messagebox('Notice','Please input data to 2 singlelineedit')
		else
			ls_return = dw_1.getsqlselect( )
			li_return = dw_1.setsqlselect(ls_return +' ' + sle_input.text)
			wf_output("SetSQLSelect return value is : " + string(li_return),False)
		end if
	case "SetTabOrder"
		if sle_input.text='' or isnull(sle_input.text) or sle_inputto.text='' or isnull(sle_inputto.text) then
			messagebox('Notice','Please input data to 2,3 singlelineedit')
		else
			li_return = dw_1.SetTabOrder(sle_input.text,long(sle_inputto.text))
			wf_output("SetTabOrder return value is : " + string(li_return),False)
		end if
	case "SetText"
		li_return = dw_1.SetText(sle_input.text)
		wf_output("SetText return value is : " + string(li_return),False)
	case "ShareData"
		li_return =dw_1.shareData(dw_2)
		wf_output("ShareData return value is : " + string(li_return),False)
	case "ShareDataOff"
		li_return =dw_1.ShareDataOff()
		wf_output("ShareDataOff return value is : " + string(li_return),False)
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
//	case "GetColumnName"
//		li_return = dw_1.getcolumnname( )
//		wf_output("SaveAsAscii return value is : " + string(li_return),False)
End Choose

end subroutine

on w_grid.create
this.cb_8=create cb_8
this.cb_7=create cb_7
this.cb_6=create cb_6
this.sle_inputto=create sle_inputto
this.sle_input=create sle_input
this.st_3=create st_3
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_2=create cb_2
this.cbx_1=create cbx_1
this.cb_3=create cb_3
this.dw_2=create dw_2
this.dw_export=create dw_export
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
this.Control[]={this.cb_8,&
this.cb_7,&
this.cb_6,&
this.sle_inputto,&
this.sle_input,&
this.st_3,&
this.cb_5,&
this.cb_4,&
this.cb_2,&
this.cbx_1,&
this.cb_3,&
this.dw_2,&
this.dw_export,&
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

on w_grid.destroy
destroy(this.cb_8)
destroy(this.cb_7)
destroy(this.cb_6)
destroy(this.sle_inputto)
destroy(this.sle_input)
destroy(this.st_3)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_2)
destroy(this.cbx_1)
destroy(this.cb_3)
destroy(this.dw_2)
destroy(this.dw_export)
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

event close;//rollback;
end event

event open;//dw_1.retrieve()
//open(w_test)
//dw_1.setColumn(1)
//dw_1.setFocus()

end event

event closequery;if dw_1.ModifiedCount() > 0 then
	messageBox("","dw_1.ModifiedCount() = "+string(dw_1.ModifiedCount()))
	return 1
end if
end event

type cb_8 from commandbutton within w_grid
integer x = 2414
integer y = 1504
integer width = 457
integer height = 128
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "setsort"
end type

event clicked;//dw_1.saveas( )
string ls_s
ls_s = sle_columnname.text
dw_1.setsort( ls_s)
dw_1.sort( )
end event

type cb_7 from commandbutton within w_grid
integer x = 2194
integer y = 1760
integer width = 283
integer height = 64
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Rollback"
end type

event clicked;rollback;
end event

type cb_6 from commandbutton within w_grid
integer x = 2194
integer y = 1664
integer width = 256
integer height = 64
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Update"
end type

event clicked;dw_1.update( )
end event

type sle_inputto from singlelineedit within w_grid
integer x = 1317
integer y = 1728
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

type sle_input from singlelineedit within w_grid
integer x = 1317
integer y = 1632
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

type st_3 from statictext within w_grid
integer x = 1061
integer y = 1760
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

type cb_5 from commandbutton within w_grid
integer x = 3072
integer y = 2048
integer width = 311
integer height = 64
integer taborder = 230
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "dynamic1"
end type

event clicked;string  Mysql
Mysql= sle_columnname.text
EXECUTE IMMEDIATE :Mysql USING sqlca ;
wf_output("Retrun sqlcode is : "+string(sqlca.sqlcode) + ' sqlerrtext '+string(sqlca.sqlerrtext ),true)

end event

type cb_4 from commandbutton within w_grid
integer x = 3072
integer y = 2112
integer width = 261
integer height = 64
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "syntax"
end type

event clicked;String	ls_dwSyx1, ls_dwSyx2
String	ls_dwData1, ls_dwData2

//Open(w_ViewSyntax)
Opensheet(w_ViewSyntax,w_mdi,1,Original!)

ls_dwSyx1 = dw_1.Describe("Datawindow.Syntax")
ls_dwSyx2 = dw_2.Describe("Datawindow.Syntax")

ls_dwData1 = dw_1.Describe("Datawindow.Syntax.Data")
ls_dwData2 = dw_2.Describe("Datawindow.Syntax.data")

//If lb_items.selectedindex() < 6 Then 
	w_ViewSyntax.mle_1.Text = ls_dwSyx1 
	w_ViewSyntax.mle_2.Text = ls_dwSyx2 
//Else
//	w_ViewSyntax.mle_1.Text = ls_dwSyx1 + ls_dwData1
//	w_ViewSyntax.mle_2.Text = ls_dwSyx2 + ls_dwData2
//End If 

end event

type cb_2 from commandbutton within w_grid
integer x = 3109
integer y = 1696
integer width = 361
integer height = 88
integer taborder = 320
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "QueryMode"
end type

event clicked;If This.Text = "QueryMode" Then 
	dw_1.Object.DataWindow.QueryMode = 'yes'
	This.Text = "Not QueryMode"
Else
	dw_1.Object.DataWindow.QueryMode = 'no'
	This.Text = "QueryMode"
End If
end event

type cbx_1 from checkbox within w_grid
integer x = 2779
integer y = 1728
integer width = 256
integer height = 96
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "event"
end type

type cb_3 from commandbutton within w_grid
integer x = 3109
integer y = 1792
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

dw_2.Create(ls_dwsyntax_str,ls_ERRORS)
IF Len(ls_ERRORS) > 0 THEN
	MessageBox("Caution","Create cause these errors: " + ls_ERRORS)
	RETURN
END IF
dw_2.settransobject(sqlca)

end event

type dw_2 from datawindow within w_grid
integer x = 882
integer y = 992
integer width = 2555
integer height = 468
integer taborder = 30
string title = "none"
string dataobject = "d_grid_delaytest"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_export from datawindow within w_grid
boolean visible = false
integer x = 759
integer y = 60
integer width = 1669
integer height = 400
integer taborder = 20
string title = "none"
string dataobject = "d_gen_export_hawb_reserve"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;insertRow(0)
end event

event buttonclicked;long ll_count
string ls_shipper_code

choose case dwo.name
	case 'b_reserve'
		this.visible = false
		//this.width = 2000
//		this.accepttext()
//		ls_shipper_code = this.getitemstring(row,'shipper_code')
//		ll_count = this.getitemnumber(row,'count')
//		if not isnull(ls_shipper_code) and len(trim(ls_shipper_code)) > 0 then
//			wf_reserve(ls_shipper_code,ll_count)
//		end if
end choose

end event

event rowfocuschanged;long ll_count
string ls_shipper_code


		this.visible = false
		//this.width = 2000
//		this.accepttext()
//		ls_shipper_code = this.getitemstring(row,'shipper_code')
//		ll_count = this.getitemnumber(row,'count')
//		if not isnull(ls_shipper_code) and len(trim(ls_shipper_code)) > 0 then
//			wf_reserve(ls_shipper_code,ll_count)
//		end if

end event

type cb_21 from commandbutton within w_grid
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

type mle_output from multilineedit within w_grid
integer x = 914
integer y = 1956
integer width = 2496
integer height = 304
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

type dw_function from datawindow within w_grid
integer x = 3456
integer y = 8
integer width = 1106
integer height = 2292
integer taborder = 250
string title = "none"
string dataobject = "d_dw_function"
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

type st_2 from statictext within w_grid
integer x = 914
integer y = 1664
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

type st_1 from statictext within w_grid
integer x = 910
integer y = 1588
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

type sle_columnname from singlelineedit within w_grid
integer x = 1317
integer y = 1536
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

type dw_selectdw from datawindow within w_grid
integer x = 5
integer y = 8
integer width = 846
integer height = 2288
integer taborder = 10
string title = "none"
string dataobject = "d_dw_list"
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
dw_2.dataobject = ls_dw
dw_2.SetTransObject(sqlca)
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

type cb_11 from commandbutton within w_grid
integer x = 3109
integer y = 1504
integer width = 334
integer height = 88
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Modify"
end type

event clicked;string ls_return
if sle_inputto.text = '' or isnull(sle_inputto.text) then
	ls_return = dw_1.modify(sle_columnname.text)
	wf_output("Modify return is : " + ls_return, false)
else
	wf_output(sle_columnname.text+"."+sle_input.text +"="+sle_inputto.text, false)
	dw_1.modify(sle_columnname.text+"."+sle_input.text +"='"+sle_inputto.text+"'")
end if
end event

type cb_1 from commandbutton within w_grid
integer x = 3109
integer y = 1600
integer width = 279
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

type dw_1 from datawindow within w_grid
integer x = 878
integer width = 2555
integer height = 976
integer taborder = 20
boolean titlebar = true
string title = "This   is ~~t test"
string dataobject = "d_f130a01w03_com"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(sqlca);

end event

event clicked;if cbx_1.checked = true then
	wf_output('Clicked triggered x '+ string(x) + ' y '+string(y)+ ' dwo '+string(dwo.name),true)
end if
//if dwo.name = "b_1" then 
//	mle_output.text = "Script in dw_1's clicked event!!"
//end if
//
//if dwo.name = "b_5" then
//	/*if this.Object.b_5.Text = "hello" then
//		this.Object.b_5.Text = "back"
//	else
//		this.Object.b_5.Text = "hello"
//	end if*/
//	open(w_response)
//	dw_1.reset()
//	dw_1.insertRow(0)
//end if
//
//if cbx_SelectRow.checked then
//	this.selectRow(0,false)
//	this.selectRow(row,true)
//end if
//
//
//if dwo.name = "v_name" then
//	//open(w_test)	
//	//dw_1.setFocus()
//	//dw_1.SetItem(1,2,"hello")
//	this.settext("hello")
//	dw_1.setcolumn("dec_salary")
//end if
//
////$ Sort
//string ls_column
//If dwo.Type = 'text' Then
//	ls_column = dwo.Name
//	ls_column = Left(ls_column, Len(ls_column) - 2)
//	wf_sort(this, ls_column)
//end if
//
//
//// if IsSelected(row) then
////     SelectRow(row,false)
////  else
////     SelectRow(row,true)
////  end if
end event

event rbuttondown;//m_t NewMenu
//
//NewMenu = CREATE m_t
//
//NewMenu.m_testcontent.PopMenu(this.x + PointerX() , this.y + PointerY())
//
//Destroy NewMenu
end event

event retrievestart;if cbx_1.checked = true then
	wf_output("Retrievestart Trigger",true)
end if
end event

event getfocus;//sle_input.text = ""
end event

event sqlpreview;//messagebox("","hello")
if cbx_1.checked = true then
	wf_output("SqlPreView Trigger sqlpreviewfunction is "+string(request) + ' sqlpreviewtype '+string(sqltype) + ' sqlsyntax '+sqlsyntax,true)
end if

//messagebox(string(row),sqlsyntax)

end event

event itemfocuschanged;if cbx_1.checked = true then
	wf_output("ItemFocusCanged Trigger  row is "+string(row),true)
end if


end event

event rowfocuschanged;if cbx_1.checked = true then
	wf_output("RowFocusCanged Trigger  row is "+string(currentrow),true)
end if

/*
//$ Bug: 13031 Fixed CheckBox click error!
dw_1.setFilter("");
dw_1.filter();*/


/*
//$ Bug: 13950 
dw_1.modify("manager_id_1.protect = 1")
*/
end event

event rowfocuschanging;if cbx_1.checked = true then
	wf_output("RowFocusCanging Trigger  row is "+string(currentrow) + ' newrow ' + string(newrow),true)
end if

end event

event itemchanged;if cbx_1.checked = true then
	wf_output('Itemchanged trigger row is ' +string(row) + ' data ' + data,true)
end if

//$ Bug:13031 Fixed-ckeckboxµã»÷ÎÊÌâ,itemchangedÐ´ÁËµã²Ù×÷
Choose Case dwo.name
	Case 'sex_1'
			If data = 'M' Then
				This.Object.manager_id[row] = 1
			ELSE
				This.object.manager_id[row] = 0
			End If
			
	case 'sex'
			If data = 'M' Then
				This.Object.manager_id[row] = 1
			ELSE
				This.object.manager_id[row] = 0
			End If
end choose



//$ Bug:13205 ²»Ö§³Ö-ItemChangedÊÂ¼þÖÐÐ´insertrow
//dw_1.reset()
//dw_1.insertRow(0)



//$ Bug:13251 ItemChangedÊÂ¼þÖÐÐ´setitem×Ô¼º£¬²¢ÇÒ·µ»Ø2
//dw_1.setitem(row,1,111)
//RETURN 2


//$ Bug:13307 after retrieve dw_1.ModifiedCount() > 0 must = 0
//dw_1.retrieve()

//dw_1.deleteRow(row)
//dw_1.setColumn("emp_id")
end event

event buttonclicked;if dwo.name = "b_1" then this.insertRow(0)
if cbx_1.checked = true then
	wf_output('Buttonclicked event triggered,The row is '+ string(row) + 'the actionreturncode is :' +string(actionreturncode),true)	
end if

end event

event buttonclicking;if dwo.name = "b_1" then this.insertRow(0)
if cbx_1.checked = true then
	wf_output('Buttonclicking event triggered,The row is '+ string(row),true)
end if
end event

type gb_2 from groupbox within w_grid
integer x = 878
integer y = 1472
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

type gb_3 from groupbox within w_grid
integer x = 882
integer y = 1872
integer width = 2555
integer height = 424
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

