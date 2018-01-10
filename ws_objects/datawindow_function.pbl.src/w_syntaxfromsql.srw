$PBExportHeader$w_syntaxfromsql.srw
forward
global type w_syntaxfromsql from window
end type
type cb_5 from commandbutton within w_syntaxfromsql
end type
type cb_3 from commandbutton within w_syntaxfromsql
end type
type cb_2 from commandbutton within w_syntaxfromsql
end type
type cb_1 from commandbutton within w_syntaxfromsql
end type
type sle_inputto from singlelineedit within w_syntaxfromsql
end type
type sle_input from singlelineedit within w_syntaxfromsql
end type
type sle_columnname from singlelineedit within w_syntaxfromsql
end type
type mle_style from multilineedit within w_syntaxfromsql
end type
type cbx_retrieve from checkbox within w_syntaxfromsql
end type
type cb_reset from commandbutton within w_syntaxfromsql
end type
type cb_4 from commandbutton within w_syntaxfromsql
end type
type cbx_show from checkbox within w_syntaxfromsql
end type
type dw_function from datawindow within w_syntaxfromsql
end type
type dw_selectdw from datawindow within w_syntaxfromsql
end type
type cb_show from commandbutton within w_syntaxfromsql
end type
type mle_output from multilineedit within w_syntaxfromsql
end type
type mle_input from multilineedit within w_syntaxfromsql
end type
type cb_create from commandbutton within w_syntaxfromsql
end type
type dw_1 from datawindow within w_syntaxfromsql
end type
type gb_1 from groupbox within w_syntaxfromsql
end type
type gb_2 from groupbox within w_syntaxfromsql
end type
type gb_3 from groupbox within w_syntaxfromsql
end type
type dw_tmp from datawindow within w_syntaxfromsql
end type
end forward

global type w_syntaxfromsql from window
integer width = 4640
integer height = 2356
boolean titlebar = true
string title = "Create Test"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_5 cb_5
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
sle_inputto sle_inputto
sle_input sle_input
sle_columnname sle_columnname
mle_style mle_style
cbx_retrieve cbx_retrieve
cb_reset cb_reset
cb_4 cb_4
cbx_show cbx_show
dw_function dw_function
dw_selectdw dw_selectdw
cb_show cb_show
mle_output mle_output
mle_input mle_input
cb_create cb_create
dw_1 dw_1
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
dw_tmp dw_tmp
end type
global w_syntaxfromsql w_syntaxfromsql

type variables
int ii_index = 0
end variables

forward prototypes
public subroutine wf_output (string as_mess, boolean ab_clear)
public subroutine wf_function (string ag_funcname)
end prototypes

public subroutine wf_output (string as_mess, boolean ab_clear);////////////////////////////////////////////////////////////////
//Function : Wf_OutPut
//Argument : String   as_mess;   The Message you will output 
//				 Boolean  ab_clear;  Clear Flag
//Output   : None
//Designer : 
//Date     :
////////////////////////////////////////////////////////////////

If ab_clear Then
	mle_output.Text = ""
	ii_index = 0
End IF	

ii_index = ii_index + 1
mle_output.Text += String(ii_index,'00')+". "+as_mess+"~r~n"
end subroutine

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
			li_return = dw_1.setsqlselect(ls_return + sle_input.text)
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

on w_syntaxfromsql.create
this.cb_5=create cb_5
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.sle_inputto=create sle_inputto
this.sle_input=create sle_input
this.sle_columnname=create sle_columnname
this.mle_style=create mle_style
this.cbx_retrieve=create cbx_retrieve
this.cb_reset=create cb_reset
this.cb_4=create cb_4
this.cbx_show=create cbx_show
this.dw_function=create dw_function
this.dw_selectdw=create dw_selectdw
this.cb_show=create cb_show
this.mle_output=create mle_output
this.mle_input=create mle_input
this.cb_create=create cb_create
this.dw_1=create dw_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.dw_tmp=create dw_tmp
this.Control[]={this.cb_5,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.sle_inputto,&
this.sle_input,&
this.sle_columnname,&
this.mle_style,&
this.cbx_retrieve,&
this.cb_reset,&
this.cb_4,&
this.cbx_show,&
this.dw_function,&
this.dw_selectdw,&
this.cb_show,&
this.mle_output,&
this.mle_input,&
this.cb_create,&
this.dw_1,&
this.gb_1,&
this.gb_2,&
this.gb_3,&
this.dw_tmp}
end on

on w_syntaxfromsql.destroy
destroy(this.cb_5)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.sle_inputto)
destroy(this.sle_input)
destroy(this.sle_columnname)
destroy(this.mle_style)
destroy(this.cbx_retrieve)
destroy(this.cb_reset)
destroy(this.cb_4)
destroy(this.cbx_show)
destroy(this.dw_function)
destroy(this.dw_selectdw)
destroy(this.cb_show)
destroy(this.mle_output)
destroy(this.mle_input)
destroy(this.cb_create)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.dw_tmp)
end on

type cb_5 from commandbutton within w_syntaxfromsql
integer x = 1550
integer y = 832
integer width = 457
integer height = 96
integer taborder = 70
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "ImportFile"
end type

event clicked;string null_str
SetNull(null_str)
DW_1.ImportFile(null_str)
end event

type cb_3 from commandbutton within w_syntaxfromsql
integer x = 2912
integer y = 828
integer width = 617
integer height = 104
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "User Transaction"
end type

event clicked;string ls_syntax,ls_ErrBuff,ls_sql
int li_return
ls_sql = mle_input.text
if trim(ls_sql) = "" then 
	messagebox("","ÇëÊäÈëÓï·¨")
	return
end if

wf_output("SyntaxFromSql Info:",true)
Transaction its_db2
its_db2 = create transaction
//its_db2.DBMS = "JDB-DB2"
//its_db2.LogPass = 'ADMIN'
//its_db2.LogId = "db2admin"
//its_db2.AutoCommit = true
//its_db2.DBParm = "Driver='COM.ibm.db2.jdbc.net.DB2Driver',URL='jdbc:db2://172.17.1.17:6789/DWCTRLDB',JavaVM='Sun1.3',CacheName='db2_117',PBCatalogOwner = 'DB2ADMIN'"
// Profile db2odbc
its_db2.DBMS = "ODB-DB2"
its_db2.AutoCommit = False
//its_db2.DBParm = "ConnectString='DSN=DWCTRLDB;UID=DB2ADMIN;PWD=ADMIN',CacheName='db2_117',PBCatalogOwner = 'DB2ADMIN'"
its_db2.DBParm = "ConnectString='DSN=DWCTRLDB;UID=DB2ADMIN;PWD=ADMIN',PBCatalogOwner = 'DB2ADMIN'"

connect using its_db2;

ls_syntax = its_db2.SyntaxFromSql( ls_sql, mle_style.text, ls_ErrBuff)
wf_output(ls_syntax,false)

wf_output("Create Info:",false)
li_return = dw_1.create( ls_syntax, ls_ErrBuff)
IF li_return = 1 THEN 
	wf_output("Success Create!",false)
else
	wf_output(ls_ErrBuff,false)
END IF

if cbx_show.checked then dw_1.show()
if cbx_retrieve.checked then 
	dw_1.setTransObject(its_db2)
	dw_1.Retrieve()
end if
end event

type cb_2 from commandbutton within w_syntaxfromsql
integer x = 1097
integer y = 832
integer width = 434
integer height = 96
integer taborder = 60
integer textsize = -12
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

type cb_1 from commandbutton within w_syntaxfromsql
integer x = 3547
integer y = 2048
integer width = 219
integer height = 96
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "clear"
end type

event clicked;wf_output("",True)
end event

type sle_inputto from singlelineedit within w_syntaxfromsql
integer x = 3877
integer y = 640
integer width = 731
integer height = 96
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type sle_input from singlelineedit within w_syntaxfromsql
integer x = 3877
integer y = 528
integer width = 731
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

type sle_columnname from singlelineedit within w_syntaxfromsql
integer x = 3877
integer y = 416
integer width = 731
integer height = 96
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type mle_style from multilineedit within w_syntaxfromsql
integer x = 763
integer y = 468
integer width = 3081
integer height = 328
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "style(type=grid)"
boolean vscrollbar = true
boolean autovscroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;text ='style(type=grid Header_Top_Margin=40) '+&
		'~r~nDataWindow(Color=134217752) '+&
		'~r~nText(border=6) '+&
		'~r~nColumn(Color=11108864)'
end event

type cbx_retrieve from checkbox within w_syntaxfromsql
integer x = 4032
integer y = 96
integer width = 471
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = gb2312charset!
fontpitch fontpitch = variable!
string facename = "ËÎÌå"
long textcolor = 33554432
long backcolor = 67108864
string text = "×Ô¶¯Retrieve"
boolean checked = true
end type

event clicked;if checked then
	cb_show.enabled = false
else
	cb_show.enabled = true
end if
end event

type cb_reset from commandbutton within w_syntaxfromsql
integer x = 3538
integer y = 828
integer width = 334
integer height = 104
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Reset"
end type

event clicked;dw_1.reset()
wf_output("",True)
end event

type cb_4 from commandbutton within w_syntaxfromsql
integer x = 731
integer y = 828
integer width = 334
integer height = 104
integer taborder = 20
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

type cbx_show from checkbox within w_syntaxfromsql
integer x = 4032
integer y = 16
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = gb2312charset!
fontpitch fontpitch = variable!
string facename = "ËÎÌå"
long textcolor = 33554432
long backcolor = 67108864
string text = "×Ô¶¯show"
boolean checked = true
end type

event clicked;if checked then
	cb_show.enabled = false
else
	cb_show.enabled = true
end if
end event

type dw_function from datawindow within w_syntaxfromsql
integer x = 3877
integer y = 736
integer width = 695
integer height = 1472
integer taborder = 30
string title = "none"
string dataobject = "d_dw_function"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;if row <= 0 then Return

string ls_function
ls_function = dw_function.GetItemString(row,"functionname")
wf_function(ls_function)
end event

type dw_selectdw from datawindow within w_syntaxfromsql
integer width = 718
integer height = 2220
integer taborder = 20
string title = "none"
string dataobject = "d_dw_list"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;TriggerEvent(RowFocusChanged!)

cb_create.TriggerEvent(Clicked!)
end event

event rowfocuschanged;long ll_Row
ll_Row = dw_selectdw.GetRow()
if  ll_Row <= 0 then Return

string ls_dw
ls_dw = dw_selectdw.GetItemString(ll_Row,"datawindowname")
dw_tmp.dataobject = ls_dw
dw_tmp.setTransObject(sqlca)

mle_input.text = string(dw_tmp.object.datawindow.Table.SQLSelect)

cb_reset.triggerEvent(Clicked!)
end event

type cb_show from commandbutton within w_syntaxfromsql
integer x = 4027
integer y = 304
integer width = 471
integer height = 116
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Show"
end type

event clicked;//string ls_syntax,ls_ErrBuff
//int li_return
//ls_syntax = mle_1.text
//li_return = dw_1.create( ls_syntax, ls_ErrBuff)
//IF li_return = 1 THEN 
//	wf_output("Success Create!",true)
//else
//	wf_output(ls_ErrBuff,true)
//END IF
//
dw_1.show()

/*ls_syntax = 'release 8;'+&
	'datawindow(units=0 timer_interval=0 color=1073741824 processing=0 HTMLDW=no print.documentname="" print.orientation = 0 print.margin.left = 110 print.margin.right = 110 print.margin.top = 96 print.margin.bottom = 96 print.paper.source = 0 print.paper.size = 0 print.prompt=no print.buttons=no print.preview.buttons=no )'+&
	'header(height=72 color="536870912" )'+&
	'summary(height=0 color="536870912" )'+&
	'footer(height=0 color="536870912" )'+&
	'detail(height=104 color="536870912" )'+&
	'table(column=(type=char(10) updatewhereclause=yes name=fa dbname="fa" )'+&
	' column=(type=char(10) updatewhereclause=yes name=fb dbname="fb" )'+&
	' column=(type=char(10) updatewhereclause=yes name=fc dbname="fc" )'+&
	' )'+&
	'data("10","sda","a","20","as","d","30","ds","g","40","sf","t",) '+&
	'text(band=header alignment="2" text="Fa" border="0" color="33554432" x="5" y="4" height="64" width="274" html.valueishtml="0"  name=fa_t visible="1"  font.face="Arial" font.height="-10" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" )'+&
	'text(band=header alignment="2" text="Fb" border="0" color="33554432" x="283" y="4" height="64" width="274" html.valueishtml="0"  name=fb_t visible="1"  font.face="Arial" font.height="-10" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" )'+&
	'text(band=header alignment="2" text="Fc" border="0" color="33554432" x="562" y="4" height="64" width="274" html.valueishtml="0"  name=fc_t visible="1"  font.face="Arial" font.height="-10" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" )'+&
	'column(band=detail id=1 alignment="0" tabsequence=10 border="0" color="33554432" x="5" y="4" height="76" width="274" format="[general]" html.valueishtml="0"  name=fa visible="1" edit.limit=0 edit.case=any edit.autoselect=yes edit.autohscroll=yes edit.imemode=0  font.face="Arial" font.height="-10" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" )'+&
	'column(band=detail id=2 alignment="0" tabsequence=20 border="0" color="33554432" x="283" y="4" height="76" width="274" format="[general]" html.valueishtml="0"  name=fb visible="1" edit.limit=0 edit.case=any edit.autoselect=yes edit.autohscroll=yes edit.imemode=0  font.face="Arial" font.height="-10" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" )'+&
	'column(band=detail id=3 alignment="0" tabsequence=30 border="0" color="33554432" x="562" y="4" height="76" width="274" format="[general]" html.valueishtml="0"  name=fc visible="1" edit.limit=0 edit.case=any edit.autoselect=yes edit.autohscroll=yes edit.imemode=0  font.face="Arial" font.height="-10" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" )'+&
	'button(band=detail text="button"filename=""action="0" border="1" color="33554432" x="869" y="4" height="88" width="229" vtextalign="0" htextalign="0"  name=b_1 visible="1"  font.face="Arial" font.height="-12" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="67108864" )'+&
	'text(band=detail alignment="0" text="text" border="0" color="33554432" x="1134" y="12" height="60" width="274" html.valueishtml="0"  name=t_1 visible="1"  font.face="Arial" font.height="-12" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="134217739" )'+&
	'htmltable(border="1" )'+&
	'htmlgen(clientevents="1" clientvalidation="1" clientcomputedfields="1" clientformatting="0" clientscriptable="0" generatejavascript="1" netscapelayers="0" )'
	*/
end event

type mle_output from multilineedit within w_syntaxfromsql
integer x = 763
integer y = 1820
integer width = 3081
integer height = 384
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
boolean autohscroll = true
boolean autovscroll = true
borderstyle borderstyle = stylelowered!
end type

type mle_input from multilineedit within w_syntaxfromsql
integer x = 763
integer y = 76
integer width = 3081
integer height = 364
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "SELECT * FROM SYNTAXFORMSQL_DATAFONT"
boolean vscrollbar = true
boolean autovscroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_create from commandbutton within w_syntaxfromsql
integer x = 4027
integer y = 180
integer width = 471
integer height = 116
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Create"
boolean default = true
end type

event clicked;string ls_syntax,ls_ErrBuff,ls_sql
int li_return
ls_sql = mle_input.text
if trim(ls_sql) = "" then 
	messagebox("","ÇëÊäÈëÓï·¨")
	return
end if

wf_output("SyntaxFromSql Info:",true)

ls_syntax = SqlCa.SyntaxFromSql( ls_sql, mle_style.text, ls_ErrBuff)
wf_output(ls_syntax,false)

wf_output("Create Info:",false)
li_return = dw_1.create( ls_syntax, ls_ErrBuff)
IF li_return = 1 THEN 
	wf_output("Success Create!",false)
else
	wf_output(ls_ErrBuff,false)
END IF

if cbx_show.checked then dw_1.show()
if cbx_retrieve.checked then 
	dw_1.setTransObject(sqlca)
	dw_1.Retrieve()
end if


/*ls_syntax = 'release 8;'+&
	'datawindow(units=0 timer_interval=0 color=1073741824 processing=0 HTMLDW=no print.documentname="" print.orientation = 0 print.margin.left = 110 print.margin.right = 110 print.margin.top = 96 print.margin.bottom = 96 print.paper.source = 0 print.paper.size = 0 print.prompt=no print.buttons=no print.preview.buttons=no )'+&
	'header(height=72 color="536870912" )'+&
	'summary(height=0 color="536870912" )'+&
	'footer(height=0 color="536870912" )'+&
	'detail(height=104 color="536870912" )'+&
	'table(column=(type=char(10) updatewhereclause=yes name=fa dbname="fa" )'+&
	' column=(type=char(10) updatewhereclause=yes name=fb dbname="fb" )'+&
	' column=(type=char(10) updatewhereclause=yes name=fc dbname="fc" )'+&
	' )'+&
	'data("10","sda","a","20","as","d","30","ds","g","40","sf","t",) '+&
	'text(band=header alignment="2" text="Fa" border="0" color="33554432" x="5" y="4" height="64" width="274" html.valueishtml="0"  name=fa_t visible="1"  font.face="Arial" font.height="-10" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" )'+&
	'text(band=header alignment="2" text="Fb" border="0" color="33554432" x="283" y="4" height="64" width="274" html.valueishtml="0"  name=fb_t visible="1"  font.face="Arial" font.height="-10" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" )'+&
	'text(band=header alignment="2" text="Fc" border="0" color="33554432" x="562" y="4" height="64" width="274" html.valueishtml="0"  name=fc_t visible="1"  font.face="Arial" font.height="-10" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" )'+&
	'column(band=detail id=1 alignment="0" tabsequence=10 border="0" color="33554432" x="5" y="4" height="76" width="274" format="[general]" html.valueishtml="0"  name=fa visible="1" edit.limit=0 edit.case=any edit.autoselect=yes edit.autohscroll=yes edit.imemode=0  font.face="Arial" font.height="-10" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" )'+&
	'column(band=detail id=2 alignment="0" tabsequence=20 border="0" color="33554432" x="283" y="4" height="76" width="274" format="[general]" html.valueishtml="0"  name=fb visible="1" edit.limit=0 edit.case=any edit.autoselect=yes edit.autohscroll=yes edit.imemode=0  font.face="Arial" font.height="-10" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" )'+&
	'column(band=detail id=3 alignment="0" tabsequence=30 border="0" color="33554432" x="562" y="4" height="76" width="274" format="[general]" html.valueishtml="0"  name=fc visible="1" edit.limit=0 edit.case=any edit.autoselect=yes edit.autohscroll=yes edit.imemode=0  font.face="Arial" font.height="-10" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" )'+&
	'button(band=detail text="button"filename=""action="0" border="1" color="33554432" x="869" y="4" height="88" width="229" vtextalign="0" htextalign="0"  name=b_1 visible="1"  font.face="Arial" font.height="-12" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="67108864" )'+&
	'text(band=detail alignment="0" text="text" border="0" color="33554432" x="1134" y="12" height="60" width="274" html.valueishtml="0"  name=t_1 visible="1"  font.face="Arial" font.height="-12" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="134217739" )'+&
	'htmltable(border="1" )'+&
	'htmlgen(clientevents="1" clientvalidation="1" clientcomputedfields="1" clientformatting="0" clientscriptable="0" generatejavascript="1" netscapelayers="0" )'
	*/
end event

type dw_1 from datawindow within w_syntaxfromsql
integer x = 763
integer y = 1016
integer width = 3081
integer height = 700
integer taborder = 10
boolean titlebar = true
string title = "none"
string dataobject = "d_db2test"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject( sqlca)
end event

type gb_1 from groupbox within w_syntaxfromsql
integer x = 731
integer width = 3141
integer height = 816
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = gb2312charset!
fontpitch fontpitch = variable!
string facename = "ËÎÌå"
long textcolor = 33554432
long backcolor = 67108864
string text = "ÊäÈëÓï·¨(Sql ºÍ Style)£º"
end type

type gb_2 from groupbox within w_syntaxfromsql
integer x = 731
integer y = 948
integer width = 3141
integer height = 792
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = gb2312charset!
fontpitch fontpitch = variable!
string facename = "ËÎÌå"
long textcolor = 33554432
long backcolor = 67108864
string text = "DataWindowÐ§¹û£º"
end type

type gb_3 from groupbox within w_syntaxfromsql
integer x = 731
integer y = 1748
integer width = 3141
integer height = 476
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = gb2312charset!
fontpitch fontpitch = variable!
string facename = "ËÎÌå"
long textcolor = 33554432
long backcolor = 67108864
string text = "Êä³ö£º"
end type

type dw_tmp from datawindow within w_syntaxfromsql
integer y = 692
integer width = 686
integer height = 400
integer taborder = 40
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

