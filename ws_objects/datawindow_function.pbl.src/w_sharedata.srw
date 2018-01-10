$PBExportHeader$w_sharedata.srw
forward
global type w_sharedata from window
end type
type cb_8 from commandbutton within w_sharedata
end type
type dw_3 from datawindow within w_sharedata
end type
type cb_3 from commandbutton within w_sharedata
end type
type cb_2 from commandbutton within w_sharedata
end type
type dw_2 from datawindow within w_sharedata
end type
type sle_input from multilineedit within w_sharedata
end type
type cb_21 from commandbutton within w_sharedata
end type
type sle_inputto from multilineedit within w_sharedata
end type
type cb_15 from commandbutton within w_sharedata
end type
type cb_14 from commandbutton within w_sharedata
end type
type cb_7 from commandbutton within w_sharedata
end type
type cb_6 from commandbutton within w_sharedata
end type
type cbx_selectrow from checkbox within w_sharedata
end type
type mle_output from multilineedit within w_sharedata
end type
type dw_function from datawindow within w_sharedata
end type
type st_2 from statictext within w_sharedata
end type
type st_1 from statictext within w_sharedata
end type
type sle_columnname from singlelineedit within w_sharedata
end type
type dw_selectdw from datawindow within w_sharedata
end type
type dw_1 from datawindow within w_sharedata
end type
type gb_2 from groupbox within w_sharedata
end type
type gb_3 from groupbox within w_sharedata
end type
type gb_1 from groupbox within w_sharedata
end type
end forward

global type w_sharedata from window
integer width = 4617
integer height = 2352
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
dw_3 dw_3
cb_3 cb_3
cb_2 cb_2
dw_2 dw_2
sle_input sle_input
cb_21 cb_21
sle_inputto sle_inputto
cb_15 cb_15
cb_14 cb_14
cb_7 cb_7
cb_6 cb_6
cbx_selectrow cbx_selectrow
mle_output mle_output
dw_function dw_function
st_2 st_2
st_1 st_1
sle_columnname sle_columnname
dw_selectdw dw_selectdw
dw_1 dw_1
gb_2 gb_2
gb_3 gb_3
gb_1 gb_1
end type
global w_sharedata w_sharedata

type prototypes


end prototypes

type variables
boolean ib_visible = false;

string is_prev_sort;
string is_prev_dwoname;
end variables

forward prototypes
public subroutine wf_getstatus (integer ai_row, string as_buffer)
public function long wf_aftertime (time at_start, time at_end)
public subroutine wf_function (string ag_funcname)
public subroutine wf_output (string as_mess, boolean ab_add)
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

public subroutine wf_function (string ag_funcname);String null_str;
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
	case "find"
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
	case "RowsCopy"
		li_return = dw_1.RowsCopy(dw_1.GetRow(),long(sle_input.text), Primary!, dw_2, 1, Primary!)
		wf_output("RowsCopy return value is : " + string(li_return),False)
	case "RowsMove"
		li_return = dw_1.RowsMove(1, dw_1.DeletedCount(), Delete!,dw_1, 1, Primary!)
		wf_output("RowsMove return value is : " + string(li_return),False)
	case "Scroll"
		li_return = dw_1.scroll( long(sle_input.text))
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
	case "SelectText"
		ls_return = dw_1.selectedtext( )
		wf_output("SelectText return value is : " + ls_return,False)
	case "selectedLength"
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
	case "update"
		if dw_1.update() = 1 then
			commit;
			MessageBox("","Success!")
		else
			rollback;
		end if
	case "print"
		li_return = dw_1.print( )
		wf_output("Print return value is : " + string(li_return),False)
End Choose
end subroutine

public subroutine wf_output (string as_mess, boolean ab_add);if ab_add then
	mle_output.text += as_mess + "~r~n";
else
	mle_output.text = as_mess + "~r~n";
end if
end subroutine

on w_sharedata.create
this.cb_8=create cb_8
this.dw_3=create dw_3
this.cb_3=create cb_3
this.cb_2=create cb_2
this.dw_2=create dw_2
this.sle_input=create sle_input
this.cb_21=create cb_21
this.sle_inputto=create sle_inputto
this.cb_15=create cb_15
this.cb_14=create cb_14
this.cb_7=create cb_7
this.cb_6=create cb_6
this.cbx_selectrow=create cbx_selectrow
this.mle_output=create mle_output
this.dw_function=create dw_function
this.st_2=create st_2
this.st_1=create st_1
this.sle_columnname=create sle_columnname
this.dw_selectdw=create dw_selectdw
this.dw_1=create dw_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.gb_1=create gb_1
this.Control[]={this.cb_8,&
this.dw_3,&
this.cb_3,&
this.cb_2,&
this.dw_2,&
this.sle_input,&
this.cb_21,&
this.sle_inputto,&
this.cb_15,&
this.cb_14,&
this.cb_7,&
this.cb_6,&
this.cbx_selectrow,&
this.mle_output,&
this.dw_function,&
this.st_2,&
this.st_1,&
this.sle_columnname,&
this.dw_selectdw,&
this.dw_1,&
this.gb_2,&
this.gb_3,&
this.gb_1}
end on

on w_sharedata.destroy
destroy(this.cb_8)
destroy(this.dw_3)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.dw_2)
destroy(this.sle_input)
destroy(this.cb_21)
destroy(this.sle_inputto)
destroy(this.cb_15)
destroy(this.cb_14)
destroy(this.cb_7)
destroy(this.cb_6)
destroy(this.cbx_selectrow)
destroy(this.mle_output)
destroy(this.dw_function)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.sle_columnname)
destroy(this.dw_selectdw)
destroy(this.dw_1)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.gb_1)
end on

event close;rollback;
end event

event open;//dw_1.retrieve()
//open(w_test)
//dw_1.setColumn(1)
//dw_1.setFocus()
end event

type cb_8 from commandbutton within w_sharedata
integer x = 2720
integer y = 1724
integer width = 695
integer height = 88
integer taborder = 250
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Special"
end type

event clicked;dw_2.dataobject = "d_freeform_sharedata"
dw_2.SetTransObject(Sqlca);
dw_1.sharedata(dw_2)

dw_3.dataobject = dw_1.dataobject
dw_3.SetTransObject(Sqlca);
dw_1.sharedata(dw_3)


end event

type dw_3 from datawindow within w_sharedata
integer x = 1984
integer y = 672
integer width = 1449
integer height = 676
integer taborder = 20
string title = "none"
string dataobject = "d_grid_delaytest"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;sle_columnName.text = string(dwo.name)


if dwo.name = "b_1" then mle_output.text = "Script in dw_1's clicked event!!"
if dwo.name = "b_5" then
	/*if this.Object.b_5.Text = "hello" then
		this.Object.b_5.Text = "back"
	else
		this.Object.b_5.Text = "hello"
	end if*/
	open(w_response)
	dw_1.reset()
	dw_1.insertRow(0)
end if

if cbx_SelectRow.checked then
	this.selectRow(0,false)
	if row > 0 then this.selectRow(row,true)
end if


if dwo.name = "v_name" then
	//open(w_test)	
	//dw_1.setFocus()
	//dw_1.SetItem(1,2,"hello")
	this.settext("hello")
	dw_1.setcolumn("dec_salary")
end if

string ls_dwoname,ls_column
If dwo.Type = 'text' Then
	ls_dwoname = dwo.Name
	ls_column = Left(dwo.Name, Len(ls_dwoname) - 2)
	This.SetSort(ls_column + ' A')
	
	If ls_dwoname <> is_prev_dwoname Then
			This.SetSort(ls_column + ' A')
			is_prev_sort = 'A'
			is_prev_dwoname = ls_dwoname
	Else
		If is_prev_sort = 'A' Then
			This.SetSort(ls_column + ' D' )
			is_prev_sort = 'D'
		Else
			This.SetSort(ls_column + ' A' )
			is_prev_sort = 'A'
		End If	
	End if 

	This.Sort()
End if 
end event

event constructor;SetTransObject(sqlca);

end event

event getfocus;//sle_input.text = ""
end event

event itemfocuschanged;wf_output("dw_3.ItemFocusCanged Event Trigger!",true)

string err
//err = dw_1.modify("DataWindow.HorizontalScrollPosition ='45'")
//IF err <> "" THEN
//        MessageBox("Status", &
//            "Change HorizontalScrollPosition Failed " + err)
//        RETURN
//
//END IF

//MessageBox("","OK")
end event

event rbuttondown;//m_t NewMenu
//
//NewMenu = CREATE m_t
//
//NewMenu.m_testcontent.PopMenu(this.x + PointerX() , this.y + PointerY())
//
//Destroy NewMenu
end event

event retrievestart;//messageBox("","hello")
end event

event rowfocuschanged;wf_output("dw_3.RowFocusCanged Event Trigger!",true)
end event

event rowfocuschanging;wf_output("dw_3.RowFocusChanging Event Trigger!",true)
end event

event sqlpreview;//messagebox("","hello")
wf_output("SqlPreView Event Trigger!",true)
end event

type cb_3 from commandbutton within w_sharedata
integer x = 2720
integer y = 1640
integer width = 695
integer height = 88
integer taborder = 290
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "ShareData"
end type

event clicked;dw_2.dataobject = dw_1.dataobject
dw_2.SetTransObject(Sqlca);
dw_1.sharedata(dw_2)

dw_3.dataobject = dw_1.dataobject
dw_3.SetTransObject(Sqlca);
dw_1.sharedata(dw_3)

end event

type cb_2 from commandbutton within w_sharedata
integer x = 2720
integer y = 1564
integer width = 695
integer height = 80
integer taborder = 290
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "ShareDataOff"
end type

event clicked;dw_1.sharedataoff()
end event

type dw_2 from datawindow within w_sharedata
integer x = 878
integer y = 672
integer width = 1102
integer height = 676
integer taborder = 20
boolean titlebar = true
string dataobject = "d_grid_delaytest"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;sle_columnName.text = string(dwo.name)


if dwo.name = "b_1" then mle_output.text = "Script in dw_1's clicked event!!"
if dwo.name = "b_5" then
	/*if this.Object.b_5.Text = "hello" then
		this.Object.b_5.Text = "back"
	else
		this.Object.b_5.Text = "hello"
	end if*/
	open(w_response)
	dw_1.reset()
	dw_1.insertRow(0)
end if

if cbx_SelectRow.checked then
	this.selectRow(0,false)
	if row > 0 then this.selectRow(row,true)
end if


if dwo.name = "v_name" then
	//open(w_test)	
	//dw_1.setFocus()
	//dw_1.SetItem(1,2,"hello")
	this.settext("hello")
	dw_1.setcolumn("dec_salary")
end if

string ls_dwoname,ls_column
If dwo.Type = 'text' Then
	ls_dwoname = dwo.Name
	ls_column = Left(dwo.Name, Len(ls_dwoname) - 2)
	This.SetSort(ls_column + ' A')
	
	If ls_dwoname <> is_prev_dwoname Then
			This.SetSort(ls_column + ' A')
			is_prev_sort = 'A'
			is_prev_dwoname = ls_dwoname
	Else
		If is_prev_sort = 'A' Then
			This.SetSort(ls_column + ' D' )
			is_prev_sort = 'D'
		Else
			This.SetSort(ls_column + ' A' )
			is_prev_sort = 'A'
		End If	
	End if 

	This.Sort()
End if 
end event

event constructor;SetTransObject(sqlca);

end event

event getfocus;//sle_input.text = ""
end event

event itemfocuschanged;wf_output("dw_2.ItemFocusCanged Event Trigger!",true)

string err
//err = dw_1.modify("DataWindow.HorizontalScrollPosition ='45'")
//IF err <> "" THEN
//        MessageBox("Status", &
//            "Change HorizontalScrollPosition Failed " + err)
//        RETURN
//
//END IF

//MessageBox("","OK")
end event

event rbuttondown;//m_t NewMenu
//
//NewMenu = CREATE m_t
//
//NewMenu.m_testcontent.PopMenu(this.x + PointerX() , this.y + PointerY())
//
//Destroy NewMenu
end event

event retrievestart;//messageBox("","hello")
end event

event rowfocuschanged;wf_output("dw_2.RowFocusCanged Event Trigger!",true)
end event

event rowfocuschanging;wf_output("dw_2.RowFocusChanging Event Trigger!",true)
end event

event sqlpreview;//messagebox("","hello")
wf_output("SqlPreView Event Trigger!",true)
end event

type sle_input from multilineedit within w_sharedata
integer x = 1344
integer y = 1640
integer width = 434
integer height = 148
integer taborder = 320
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "text"
borderstyle borderstyle = stylelowered!
end type

type cb_21 from commandbutton within w_sharedata
integer x = 3026
integer y = 2080
integer width = 293
integer height = 112
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

type sle_inputto from multilineedit within w_sharedata
integer x = 1792
integer y = 1640
integer width = 421
integer height = 148
integer taborder = 310
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "aa"
borderstyle borderstyle = stylelowered!
end type

type cb_15 from commandbutton within w_sharedata
integer x = 2277
integer y = 1716
integer width = 379
integer height = 112
integer taborder = 240
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Enabled"
end type

event clicked;//messageBox("",string(dw_1.getRow()))

//dw_1.Modify("emp_status.CheckBox.On='F'")
//dw_1.Modify("emp_status.CheckBox.Off='M'")

if dw_1.enabled = true then
	dw_1.enabled = false
else
	dw_1.enabled = true
end if


end event

type cb_14 from commandbutton within w_sharedata
integer x = 2277
integer y = 1604
integer width = 379
integer height = 112
integer taborder = 290
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "reset->insert"
end type

event clicked;dw_1.reset()
dw_1.insertRow(0)
end event

type cb_7 from commandbutton within w_sharedata
integer x = 2277
integer y = 1492
integer width = 379
integer height = 112
integer taborder = 190
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "CheckBox"
end type

event clicked;if dw_1.Object.sex_1.CheckBox.On = "M" then
	dw_1.Object.sex_1.CheckBox.On = "F"
else
	dw_1.Object.sex_1.CheckBox.On = "M"
end if
end event

type cb_6 from commandbutton within w_sharedata
integer x = 3049
integer y = 1372
integer width = 389
integer height = 112
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "SelectRow(a)"
end type

event clicked;dw_1.selectRow(0,true)
end event

type cbx_selectrow from checkbox within w_sharedata
integer x = 2587
integer y = 1380
integer width = 421
integer height = 92
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "SelectRow"
end type

type mle_output from multilineedit within w_sharedata
integer x = 914
integer y = 1896
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

type dw_function from datawindow within w_sharedata
integer x = 3456
integer y = 8
integer width = 1106
integer height = 2232
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

type st_2 from statictext within w_sharedata
integer x = 910
integer y = 1652
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

type st_1 from statictext within w_sharedata
integer x = 910
integer y = 1552
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

type sle_columnname from singlelineedit within w_sharedata
integer x = 1344
integer y = 1528
integer width = 869
integer height = 100
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

type dw_selectdw from datawindow within w_sharedata
integer x = 5
integer width = 846
integer height = 2228
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
dw_1.SetTransObject(sqlca);
end event

event constructor;dw_1.setTransobject(sqlca);
connect;
end event

type dw_1 from datawindow within w_sharedata
integer x = 878
integer width = 2555
integer height = 664
integer taborder = 20
string title = "none"
string dataobject = "d_grid_delaytest"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(sqlca);

end event

event clicked;sle_columnName.text = string(dwo.name)


if dwo.name = "b_1" then mle_output.text = "Script in dw_1's clicked event!!"
if dwo.name = "b_5" then
	/*if this.Object.b_5.Text = "hello" then
		this.Object.b_5.Text = "back"
	else
		this.Object.b_5.Text = "hello"
	end if*/
	open(w_response)
	dw_1.reset()
	dw_1.insertRow(0)
end if

if cbx_SelectRow.checked then
	this.selectRow(0,false)
	if row > 0 then this.selectRow(row,true)
end if


if dwo.name = "v_name" then
	//open(w_test)	
	//dw_1.setFocus()
	//dw_1.SetItem(1,2,"hello")
	this.settext("hello")
	dw_1.setcolumn("dec_salary")
end if

string ls_dwoname,ls_column
If dwo.Type = 'text' Then
	ls_dwoname = dwo.Name
	ls_column = Left(dwo.Name, Len(ls_dwoname) - 2)
	This.SetSort(ls_column + ' A')
	
	If ls_dwoname <> is_prev_dwoname Then
			This.SetSort(ls_column + ' A')
			is_prev_sort = 'A'
			is_prev_dwoname = ls_dwoname
	Else
		If is_prev_sort = 'A' Then
			This.SetSort(ls_column + ' D' )
			is_prev_sort = 'D'
		Else
			This.SetSort(ls_column + ' A' )
			is_prev_sort = 'A'
		End If	
	End if 

	This.Sort()
End if 
end event

event rbuttondown;//m_t NewMenu
//
//NewMenu = CREATE m_t
//
//NewMenu.m_testcontent.PopMenu(this.x + PointerX() , this.y + PointerY())
//
//Destroy NewMenu
end event

event retrievestart;//messageBox("","hello")
end event

event getfocus;//sle_input.text = ""
end event

event sqlpreview;//messagebox("","hello")
wf_output("SqlPreView Event Trigger!",true)
end event

event itemfocuschanged;wf_output("dw_1.ItemFocusCanged Event Trigger!",true)

string err
//err = dw_1.modify("DataWindow.HorizontalScrollPosition ='45'")
//IF err <> "" THEN
//        MessageBox("Status", &
//            "Change HorizontalScrollPosition Failed " + err)
//        RETURN
//
//END IF

//MessageBox("","OK")
end event

event rowfocuschanged;wf_output("dw_1.RowFocusCanged Event Trigger!",true)
end event

event rowfocuschanging;wf_output("dw_1.RowFocusChanging Event Trigger!",true)
end event

type gb_2 from groupbox within w_sharedata
integer x = 882
integer y = 1472
integer width = 1371
integer height = 340
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

type gb_3 from groupbox within w_sharedata
integer x = 882
integer y = 1812
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

type gb_1 from groupbox within w_sharedata
integer x = 2679
integer y = 1496
integer width = 759
integer height = 320
integer taborder = 290
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "ShareData:"
end type

