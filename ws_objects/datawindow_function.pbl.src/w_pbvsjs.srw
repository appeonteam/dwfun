$PBExportHeader$w_pbvsjs.srw
forward
global type w_pbvsjs from window
end type
type cbx_1 from checkbox within w_pbvsjs
end type
type cb_1 from commandbutton within w_pbvsjs
end type
type mle_factual from multilineedit within w_pbvsjs
end type
type dw_result from datawindow within w_pbvsjs
end type
type cb_2 from commandbutton within w_pbvsjs
end type
type mle_expect from multilineedit within w_pbvsjs
end type
type gb_1 from groupbox within w_pbvsjs
end type
type gb_2 from groupbox within w_pbvsjs
end type
type gb_3 from groupbox within w_pbvsjs
end type
end forward

global type w_pbvsjs from window
integer width = 3698
integer height = 2044
boolean titlebar = true
string title = "View Test Result"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cbx_1 cbx_1
cb_1 cb_1
mle_factual mle_factual
dw_result dw_result
cb_2 cb_2
mle_expect mle_expect
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
end type
global w_pbvsjs w_pbvsjs

type variables
long il_PreRow
end variables

forward prototypes
public function long wf_retrieve (string as_winname)
public function integer wf_updateexpectvalue (long al_testpointid, string as_expectvalue)
end prototypes

public function long wf_retrieve (string as_winname);long ll_RowCount
long ll_WindowID

as_WinName = Lower(as_WinName)
SELECT WindowId INTO :ll_WindowID FROM TestWindow WHERE Lower(SwName) = :as_WinName using gtr_COTDB;
if gtr_COTDB.SQLCode<>0 or gtr_COTDB.SQLNRows<>1 then
	dw_result.Reset()
	Return -1
end if

ll_RowCount = dw_result.Retrieve(as_WinName, gi_COTVersion, gs_COTEnvironment, ll_WindowID)
dw_result.SelectRow(1, true)

Return ll_RowCount
end function

public function integer wf_updateexpectvalue (long al_testpointid, string as_expectvalue);DateTime ldt_SaveTime

// Update TestPoint
UPDATE TestPoint SET ExpectValue = :as_ExpectValue WHERE TestPointID = :al_TestpointId using gtr_COTDB;
if gtr_COTDB.SQLCode<>0 then
	 Rollback using gtr_COTDB;
	 Return -1
end if

// Update ResultDetailTemp
SELECT GetDate() INTO :ldt_SaveTime FROM sysdual using gtr_COTDB;
UPDATE ResultDetailTemp 
SET   ExpectValue = :as_ExpectValue, status = '1', SaveTime = :ldt_SaveTime
WHERE TestPointID = :al_TestpointId AND version = :gi_COTVersion AND Envi = :gs_COTEnvironment using gtr_COTDB;
if gtr_COTDB.SQLCode<>0 then
	 Rollback using gtr_COTDB;
	 Return -1
end if

Return 1
end function

on w_pbvsjs.create
this.cbx_1=create cbx_1
this.cb_1=create cb_1
this.mle_factual=create mle_factual
this.dw_result=create dw_result
this.cb_2=create cb_2
this.mle_expect=create mle_expect
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.Control[]={this.cbx_1,&
this.cb_1,&
this.mle_factual,&
this.dw_result,&
this.cb_2,&
this.mle_expect,&
this.gb_1,&
this.gb_2,&
this.gb_3}
end on

on w_pbvsjs.destroy
destroy(this.cbx_1)
destroy(this.cb_1)
destroy(this.mle_factual)
destroy(this.dw_result)
destroy(this.cb_2)
destroy(this.mle_expect)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
end on

type cbx_1 from checkbox within w_pbvsjs
integer x = 553
integer y = 1836
integer width = 599
integer height = 76
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Select All Test Point"
end type

event clicked;if Checked then
	dw_result.SelectRow(0, true)
else	
	dw_result.SelectRow(0, false)
	dw_result.SelectRow(dw_result.GetRow(), true)
end if
end event

type cb_1 from commandbutton within w_pbvsjs
integer x = 2450
integer y = 1820
integer width = 603
integer height = 104
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Update Expect Value"
end type

event clicked;long ll_RowCount
long ll_CurrentRow
long ll_TestPointID
string ls_ExpectValue
string ls_Status
boolean lb_Updated = false

ll_CurrentRow = dw_result.GetSelectedRow(0)
if ll_CurrentRow<=0 then
	MessageBox("Information", "Please select test point.")
	Return
end if
ll_RowCount = dw_result.RowCount()

if not gb_COTUpdateExpValue then
	OpenWithParm(w_validation, "COTUpdateExpValue")
	if Message.StringParm<>"ok!" then Return
	gb_COTUpdateExpValue = true
end if

if MessageBox("Information", "Are you confirm update expect value?", Question!, YesNo!)=2 then Return

for ll_CurrentRow = 1 to ll_RowCount
	 if not dw_result.IsSelected(ll_CurrentRow) then Continue
	 ls_Status = Trim(dw_result.GetItemString(ll_CurrentRow, "Status"))
	 if IsNull(ls_Status) or ls_Status="" then Continue
 	 ll_TestPointID = dw_result.GetItemNumber(ll_CurrentRow, "TestPointID")
	 ls_ExpectValue = dw_result.GetItemString(ll_CurrentRow, "TrueValue")
	 if IsNull(ls_ExpectValue) then ls_ExpectValue = ""
	 if wf_UpdatEexpectValue(ll_TestPointID, ls_ExpectValue)=1 then
		 dw_result.SetItem(ll_CurrentRow, "ExpectValue", ls_ExpectValue)
		 dw_result.SetItem(ll_CurrentRow, "TPExpectValue", ls_ExpectValue)
		 dw_result.SetItem(ll_CurrentRow, "Status", "1")		 
		 dw_result.Event RowFocusChanged(ll_CurrentRow)
		 lb_Updated = true
	 else
		 MessageBox("Error", "Update expect value failed.", StopSign!)
		 Return
	 end if
next

if lb_Updated then
	Commit using gtr_COTDB;
	if not gb_COTAutoRun and IsValid(gw_COTCurrentWin) then
		gw_COTCurrentWin.Dynamic wf_CreateResultSet()										
	end if
end if
end event

type mle_factual from multilineedit within w_pbvsjs
integer x = 1865
integer y = 1108
integer width = 1746
integer height = 652
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type dw_result from datawindow within w_pbvsjs
integer x = 50
integer y = 60
integer width = 3566
integer height = 956
integer taborder = 10
string title = "none"
string dataobject = "d_testpoint"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.SetTransObject(gtr_COTDB)
end event

event clicked;long ll_beg
long ll_end
long ll_Row

if not Row>0 then Return

if not KeyDown(KeyShift!) and not KeyDown(KeyControl!) then
	il_PreRow = Row
	this.SelectRow(0, false)
	this.SelectRow(Row, true)
	if this.GetRow()<>Row then this.SetRow(Row)
else
	if KeyDown(KeyControl!) then
		this.SelectRow(Row, not this.isselected(Row))
	else
		if Row > il_PreRow then
			ll_beg = il_PreRow
			ll_end = Row
		else
			ll_beg = Row
			ll_end = il_PreRow
		end if
		for ll_Row = ll_beg to ll_end
			 this.SelectRow(ll_Row, true)
		next
	end if
end if
end event

event rowfocuschanged;string ls_TrueValue
string ls_ExpectValue

if not CurrentRow>0 then Return

ls_TrueValue = dw_result.GetItemString(CurrentRow, "TrueValue")
ls_ExpectValue = dw_result.GetItemString(CurrentRow, "ExpectValue")
if IsNull(ls_TrueValue) then ls_TrueValue = ""
if IsNull(ls_ExpectValue) then
	ls_ExpectValue = dw_result.GetItemString(CurrentRow, "TPExpectValue")
	if IsNull(ls_ExpectValue) then ls_ExpectValue = ""
end if

mle_factual.Text = ls_TrueValue
mle_expect.Text = ls_ExpectValue
end event

type cb_2 from commandbutton within w_pbvsjs
integer x = 3077
integer y = 1820
integer width = 389
integer height = 104
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Close"
end type

event clicked;Close(Parent)
end event

type mle_expect from multilineedit within w_pbvsjs
integer x = 50
integer y = 1108
integer width = 1746
integer height = 652
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_pbvsjs
integer x = 23
integer y = 4
integer width = 3616
integer height = 1032
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Test Point"
end type

type gb_2 from groupbox within w_pbvsjs
integer x = 23
integer y = 1048
integer width = 1801
integer height = 736
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Expect Value"
end type

type gb_3 from groupbox within w_pbvsjs
integer x = 1838
integer y = 1048
integer width = 1801
integer height = 736
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Factual Value"
end type

