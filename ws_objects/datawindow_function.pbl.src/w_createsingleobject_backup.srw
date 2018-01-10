$PBExportHeader$w_createsingleobject_backup.srw
forward
global type w_createsingleobject_backup from window
end type
type cb_1 from commandbutton within w_createsingleobject_backup
end type
type lb_1 from listbox within w_createsingleobject_backup
end type
type cbx_retrieve from checkbox within w_createsingleobject_backup
end type
type cb_reset from commandbutton within w_createsingleobject_backup
end type
type cbx_show from checkbox within w_createsingleobject_backup
end type
type cb_show from commandbutton within w_createsingleobject_backup
end type
type mle_output from multilineedit within w_createsingleobject_backup
end type
type mle_input from multilineedit within w_createsingleobject_backup
end type
type cb_create from commandbutton within w_createsingleobject_backup
end type
type dw_1 from datawindow within w_createsingleobject_backup
end type
type gb_1 from groupbox within w_createsingleobject_backup
end type
end forward

global type w_createsingleobject_backup from window
integer width = 4645
integer height = 2372
boolean titlebar = true
string title = "Create Test"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_1 cb_1
lb_1 lb_1
cbx_retrieve cbx_retrieve
cb_reset cb_reset
cbx_show cbx_show
cb_show cb_show
mle_output mle_output
mle_input mle_input
cb_create cb_create
dw_1 dw_1
gb_1 gb_1
end type
global w_createsingleobject_backup w_createsingleobject_backup

type variables
int ii_index = 0
end variables

forward prototypes
public subroutine wf_output (string as_mess, boolean ab_clear)
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

on w_createsingleobject_backup.create
this.cb_1=create cb_1
this.lb_1=create lb_1
this.cbx_retrieve=create cbx_retrieve
this.cb_reset=create cb_reset
this.cbx_show=create cbx_show
this.cb_show=create cb_show
this.mle_output=create mle_output
this.mle_input=create mle_input
this.cb_create=create cb_create
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.cb_1,&
this.lb_1,&
this.cbx_retrieve,&
this.cb_reset,&
this.cbx_show,&
this.cb_show,&
this.mle_output,&
this.mle_input,&
this.cb_create,&
this.dw_1,&
this.gb_1}
end on

on w_createsingleobject_backup.destroy
destroy(this.cb_1)
destroy(this.lb_1)
destroy(this.cbx_retrieve)
destroy(this.cb_reset)
destroy(this.cbx_show)
destroy(this.cb_show)
destroy(this.mle_output)
destroy(this.mle_input)
destroy(this.cb_create)
destroy(this.dw_1)
destroy(this.gb_1)
end on

type cb_1 from commandbutton within w_createsingleobject_backup
integer x = 3438
integer y = 2048
integer width = 329
integer height = 96
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Clear"
end type

event clicked;wf_output("",True)
end event

type lb_1 from listbox within w_createsingleobject_backup
integer y = 24
integer width = 713
integer height = 2204
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
string item[] = {"Create Text","Create Button","Create Bitmap","Create Compute","Create Line","Create Column Edit","Create Column CheckBox","Create Column RadioBox","Create Column DDLB","Create Column DDDW","Create Column EditMask","Destroy Text","Destroy Button","Destroy Bitmap","Destroy Compute","Destroy Line","Destroy Column Edit","Destroy Column CheckBox","Destroy Column RadioBox","Destroy Column DDLB","Destroy Column DDDW","Destroy Column EditMask","Create Report","Destroy Report"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;choose case text(index)
	case "Create Text"
		//mle_input.text = 'Create text(band=detail alignment="2" text="New Text" border="1" color="255" x="1691" y="300" height="64" width="306" html.valueishtml="0"  name=t_7 visible="1"  font.face="Arial" font.height="-10" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" HideSnaked=0 Moveable=1 Resizeable=1 SlideLeft=No Pointer="SizeNESW!" Tag="Text")'
		mle_input.text = 'Create text(band=detail alignment="2" text="New Text" border="1" color="255" x="1691" y="300" height="64" width="306" html.valueishtml="0"  name=t_7  tag="Text" pointer="SizeNESW!" visible="1"  resizeable=1  moveable=1  hidesnaked=1  slideleft=yes  font.face="Arial" font.height="-10" font.weight="700"  font.family="2" font.pitch="2" font.charset="0" font.escapement="0~t900" font.italic="0" font.underline="0" font.strikethrough="0"  background.mode="1" background.color="536870912"  height.autosize=yes)'
	case "Create Button"
		//mle_input.text = 'Create button(band=detail text="" filename="" defaultpicture=yes action="2" border="1" color="33554432" x="1568" y="604" height="108" width="160" vtextalign="0" htextalign="0" name=b_3  tag="Retrieve" visible="1"  font.face="Arial" font.height="-10" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="67108864" HideSnaked=0 Moveable=1 Resizeable=1 SlideLeft=No Pointer="NO!" Tag="Button" )'
		mle_input.text = 'Create button(band=detail text="f"filename=""defaultpicture=yes suppresseventprocessing=yes action="2" border="0" color="33554432" x="1568" y="604" height="108" width="160" vtextalign="0" htextalign="0"  name=b_3  tag="Button" pointer="NO!" visible="1"  resizeable=1  moveable=1  hidesnaked=1  slideleft=no font.face="Arial" font.height="-10" font.weight="700"  font.family="2" font.pitch="2" font.charset="0" font.escapement="0~t900" font.italic="1" font.underline="1" font.strikethrough="1" background.mode="2" background.color="67108864" )'
	case "Create Bitmap"
		//mle_input.text = 'Create bitmap(band=detail filename="C:\Documents and Settings\Administrator\Desktop\´Ê·¨·ÖÎöÏêÏ¸Éè¼Æ\DynamicDW\26904-2-embed.jpg" x="1550" y="28" height="196" width="594" border="0"  name=p_1 visible="1" HideSnaked=0 Moveable=1 Resizeable=1 SlideLeft=No Pointer="SizeNESW!" Tag="Bitmap")'
		mle_input.text = 'Create bitmap(band=detail filename="C:\Documents and Settings\Administrator\Desktop\´Ê·¨·ÖÎöÏêÏ¸Éè¼Æ\DynamicDW\26904-2-embed.jpg" x="1550" y="28" height="196" width="594" border="6"  invert="0"  name=p_1  tag="Bitmap" pointer="SizeNESW!" visible="1"  resizeable=1  moveable=1  hidesnaked=1  slideleft=no )'
	case "Create Compute"
		//mle_input.text = 'Create compute(band=detail alignment="0" expression="sum(   salary for all )"border="2" color="16711680" x="942" y="660" height="64" width="457" format="[GENERAL]" html.valueishtml="0" name=compute_2 visible="1"  font.face="Arial" font.height="-10" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="12639424" HideSnaked=0 Moveable=1 Resizeable=1 SlideLeft=No Pointer="Size!" Tag="Compute")'
		mle_input.text = 'Create compute(band=detail alignment="2" expression="sum(   salary for all )"border="2" color="16711680" x="942" y="660" height="64" width="457" format="[GENERAL]" html.valueishtml="0"  name=compute_2  tag="Compute" pointer="Size!" visible="1"  resizeable=1  moveable=1  hidesnaked=1  slideleft=no  font.face="ËÎÌå" font.height="-10" font.weight="400"  font.family="0" font.pitch="2" font.charset="134" font.escapement="0~t900" font.italic="0" font.underline="1" font.strikethrough="0" background.mode="2" background.color="12639424" )'
	case "Create Line"
		//mle_input.text = 'Create line(band=detail x1="1550" y1="480" x2="2144" y2="480" name=l_1 visible="1" pen.style="3" pen.width="5" pen.color="255"  background.mode="2" background.color="1073741824" HideSnaked=0 Moveable=1 Resizeable=1 SlideLeft=No Pointer="SizeNESW!" Tag="Line")'
		mle_input.text = 'Create line(band=detail x1="1550" y1="480" x2="2144" y2="480"  name=l_1  tag="Line" pointer="SizeNESW!" visible="1"  resizeable=1  moveable=1  hidesnaked=1  slideleft=no  slideup=allabove pen.style="3" pen.width="5" pen.color="255"  background.mode="2" background.color="1073741824" )'
	case "Create Column Edit"
		mle_input.text = 'Create column(band=detail id=2 alignment="1" tabsequence=90 border="2" color="33554432" x="942" y="12" height="72" width="457" format="*********" html.link="2" html.linktarget="3" html.valueishtml="1" html.appendedhtml="5" protect="0~t0"  name=manager_id  tag="Text" pointer="UpArrow!" visible="1"  resizeable=1  moveable=1  hidesnaked=1  slideleft=yes height.autosize=yes bitmapname=no edit.limit=0 edit.case=any edit.autoselect=yes edit.password=yes edit.required=yes edit.nilisnull=yes edit.autohscroll=yes edit.autovscroll=yes edit.hscrollbar=yes edit.imemode=0 edit.vscrollbar=yes edit.displayonly=yes edit.codetable=yes edit.validatecode=yes criteria.required=yes criteria.override_edit=yes  font.face="Arial" font.height="-10" font.escapement="0~t900" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" font.italic="0" font.underline="0" font.strikethrough="0" background.mode="1" background.color="12639424" )'
	case "Create Column CheckBox"
		mle_input.text = 'Create column(band=detail id=3 alignment="0" tabsequence=70 border="5" color="16711680" x="942" y="204" height="72" width="457" format="[general]" html.valueishtml="0" protect="0~t0" name=sex  tag="checkbox" pointer="SizeWE!" visible="1"  resizeable=1  moveable=1  hidesnaked=1  slideleft=yes height.autosize=no bitmapname=no righttoleft=1 checkbox.text="Male" checkbox.on="M" checkbox.off="F" checkbox.other="" checkbox.lefttext=yes checkbox.scale=yes checkbox.threed=yes criteria.required=yes criteria.override_edit=yes  font.face="Arial" font.height="-10" font.weight="700"  font.family="2" font.pitch="2" font.charset="0" font.italic="1" font.underline="0" font.strikethrough="1" background.mode="2" background.color="12639424" )'
	case "Create Column RadioBox"
		mle_input.text = 'Create column(band=detail id=13 alignment="3" tabsequence=110 border="6" color="16711680" x="946" y="300" height="140" width="457" format="[general]" html.valueishtml="0" protect="0~t0" name=status_1  tag="radiobuttons" pointer="Help!" visible="1"  resizeable=1  moveable=1  hidesnaked=1  slideleft=yes height.autosize=no bitmapname=yes accelerator="a" righttoleft=1 radiobuttons.columns=2 radiobuttons.scale=yes radiobuttons.threed=yes criteria.required=yes criteria.override_edit=yes  font.face="Arial" font.height="-10" font.weight="700"  font.family="2" font.pitch="2" font.charset="0" font.italic="1" font.escapement="0~t900" font.underline="1" font.strikethrough="0" background.mode="2" background.color="12639424" )'
	case "Create Column DDLB"
		//mle_input.text = 'Create column(band=detail id=12 alignment="0" tabsequence=80 border="2" color="16711680" x="942" y="464" height="72" width="457" format="[general]" html.valueishtml="0"  HideSnaked=0 Moveable=1 Resizeable=1 SlideLeft=No Pointer="SizeNESW!" Tag="DDLB" name=start_date visible="1" ddlb.limit=0 ddlb.allowedit=no ddlb.sorted=yes ddlb.NilIsNull=no ddlb.useasborder=yes DDLB.VScrollBar=yes ddlb.case=any ddlb.imemode=0  font.face="Arial" font.height="-10" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="12639424" )'
		mle_input.text = 'Create column(band=detail id=12 alignment="0" tabsequence=80 border="1" color="16711680" x="942" y="464" height="72" width="457" format="[general]" html.valueishtml="0" protect="0~t0" name=start_date  tag="DDLB" pointer="AppStarting!" visible="1"  resizeable=1  moveable=1  hidesnaked=1 bitmapname=yes righttoleft=1 ddlb.limit=5 ddlb.sorted=yes ddlb.allowedit=yes ddlb.case=any ddlb.required=yes ddlb.nilisnull=yes ddlb.autohscroll=yes ddlb.vscrollbar=yes ddlb.useasborder=yes ddlb.imemode=0 criteria.required=yes criteria.override_edit=yes slideleft=no height.autosize=no font.face="Arial" font.height="-10" font.weight="700"  font.family="2" font.pitch="2" font.charset="0" font.italic="0" font.underline="0" font.escapement="0~t900" font.strikethrough="0" background.mode="2" background.color="15780518" )'
	case "Create Column DDDW"
		//mle_input.text = 'Create column(band=detail id=1 alignment="0" tabsequence=70 border="2" color="16711680" x="942" y="560" height="72" width="457" format="[general]" html.valueishtml="0"  HideSnaked=0 Moveable=1 Resizeable=1 SlideLeft=No Pointer="SizeNESW!" Tag="DDDW" name=emp_id visible="1" dddw.name=d_dddw_emp dddw.displaycolumn=emp_id dddw.datacolumn=emp_id dddw.percentwidth=0 dddw.AutoHScroll=yes dddw.HScrollBar=yes DDDW.VScrollbar=yes dddw.lines=5 dddw.limit=0 dddw.allowedit=no DDDW.NilIsNull=no dddw.useasborder=yes dddw.case=any dddw.imemode=0 DDDW.Limit=5 font.face="Arial" font.height="-10" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="12639424" )'
		mle_input.text = 'Create column(band=detail id=1 alignment="0" tabsequence=70 border="2" color="16711680" x="942" y="560" height="72" width="457" format="[general]" html.valueishtml="0" protect="0~t0"  name=emp_id  tag="DDDW" pointer="SizeNESW!" visible="1"  resizeable=1  moveable=1  hidesnaked=1 bitmapname=yes accelerator="a" righttoleft=1 dddw.name=d_dddw_emp dddw.displaycolumn=emp_id dddw.datacolumn=emp_id dddw.percentwidth=120 dddw.lines=5 dddw.limit=5 dddw.allowedit=yes dddw.useasborder=yes dddw.case=any dddw.required=yes dddw.nilisnull=yes dddw.autohscroll=yes dddw.imemode=0 dddw.hscrollbar=yes dddw.vscrollbar=yes criteria.required=yes criteria.override_edit=yes  slideleft=no height.autosize=no font.face="Arial" font.escapement="0~t900" font.height="-10" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" font.italic="0" font.underline="0" font.strikethrough="1" background.mode="2" background.color="12639424" )'
	case "Create Column EditMask"
		//mle_input.text = 'Create column(band=detail id=2 alignment="1" tabsequence=60 border="2" color="16711680" x="942" y="108" height="72" width="457" format="[general]" html.valueishtml="0"  HideSnaked=0 Moveable=1 Resizeable=1 SlideLeft=No Pointer="SizeNESW!" Tag="EditMask" name=manager_id_1 visible="1" editmask.spin=yes editmask.spinrange="1~~5" editmask.spinincr=1 editmask.mask="###,###.00" editmask.imemode=0 editmask.focusrectangle=no  font.face="Arial" font.height="-10" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="12639424" )'
		mle_input.text = 'Create column(band=detail id=2 alignment="1" tabsequence=60 border="2" color="16711680" x="942" y="108" height="72" width="457" format="[general]" html.valueishtml="0" protect="0~t0" name=manager_id_1  tag="EditMask" pointer="SizeNESW!" visible="1"  resizeable=1  moveable=1  slideleft=yes height.autosize=no bitmapname=no righttoleft=1 HideSnaked=0 editmask.required=yes editmask.autoskip=yes editmask.useformat=yes editmask.readonly=no editmask.spin=yes editmask.mask="###,###.00" editmask.imemode=0 editmask.spinrange="1~~5" editmask.spinincr=1 criteria.required=yes criteria.override_edit=yes  font.face="Arial" font.height="-10" font.weight="400"  font.family="2" font.pitch="2" font.escapement="0~t900" font.charset="0" font.italic="1" font.underline="0" font.strikethrough="0" background.mode="2" background.color="12639424" )'
	case "Destroy Text"
		mle_input.text = 'Destroy t_7'
	case "Destroy Button"
		mle_input.text = 'Destroy b_3'
	case "Destroy Bitmap"
		mle_input.text = 'Destroy p_1'
	case "Destroy Compute"
		mle_input.text = 'Destroy compute_2'
	case "Destroy Line"
		mle_input.text = 'Destroy l_1'	
	case "Destroy Column Edit"
		mle_input.text = 'Destroy manager_id'
	case "Destroy Column CheckBox"
		mle_input.text = 'Destroy sex'
	case "Destroy Column RadioBox"
		mle_input.text = 'Destroy status_1'
	case "Destroy Column DDLB"
		mle_input.text = 'Destroy start_date'
	case "Destroy Column DDDW"
		mle_input.text = 'Destroy emp_id'
	case "Destroy Column EditMask"
		mle_input.text = 'Destroy manager_id_1'
	case "Create Report"
		mle_input.text = 'Create report(band=detail dataobject="d_dce007w01_column_backup" x="1426" y="44" height="136" width="1714" border="0"  height.autosize=yes criteria="" trail_footer = yes  name=dw_1 visible="1"  slideup=directlyabove )'
	case "Destroy Report"
		mle_input.text = 'Destroy Dw_1'
end choose

end event

event doubleclicked;triggerevent(SelectionChanged!)

cb_create.TriggerEvent(Clicked!)
end event

type cbx_retrieve from checkbox within w_createsingleobject_backup
integer x = 4206
integer y = 32
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

type cb_reset from commandbutton within w_createsingleobject_backup
integer x = 3543
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

event clicked;dw_1.DataObject = "d_freeform_createsingle"
dw_1.SetTransObject( Sqlca)
dw_1.Retrieve()

end event

type cbx_show from checkbox within w_createsingleobject_backup
integer x = 3877
integer y = 32
integer width = 366
integer height = 64
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

type cb_show from commandbutton within w_createsingleobject_backup
integer x = 3977
integer y = 240
integer width = 567
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

type mle_output from multilineedit within w_createsingleobject_backup
integer x = 763
integer y = 1904
integer width = 3785
integer height = 308
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

type mle_input from multilineedit within w_createsingleobject_backup
integer x = 763
integer y = 76
integer width = 3086
integer height = 716
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "column(band=detail id=1 alignment=~"0~" tabsequence=10 border=~"0~" color=~"33554432~" x=~"5~" y=~"4~" height=~"76~" width=~"274~" format=~"[general]~" html.valueishtml=~"0~"  name=fa visible=~"1~" edit.limit=0 edit.case=any edit.autoselect=yes edit.autohscroll=yes edit.ime"
boolean vscrollbar = true
boolean autovscroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;text = 'create text(band=detail alignment="1" text="New text" border="0" color="1234" x="4" y="4" height="76" width="384" html.valueishtml="0"  name=dt_born_t visible="1"  font.face="Arial" font.height="-10" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="134217739" )"'
end event

type cb_create from commandbutton within w_createsingleobject_backup
integer x = 3977
integer y = 116
integer width = 567
integer height = 116
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "CreateSingleObject"
end type

event clicked;string ls_syntax
ls_syntax = mle_input.text
if trim(ls_syntax) = "" then 
	messagebox("","ÇëÊäÈëÓï·¨")
	return
end if

string ls_retrun
ls_retrun = dw_1.Modify(ls_syntax)
wf_output(ls_retrun,true)


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

type dw_1 from datawindow within w_createsingleobject_backup
integer x = 763
integer y = 1016
integer width = 3776
integer height = 780
integer taborder = 10
string title = "none"
string dataobject = "d_freeform_createsingle_copy"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(Sqlca)
Retrieve()
end event

event sqlpreview;messagebox(string(row),sqlsyntax)
end event

type gb_1 from groupbox within w_createsingleobject_backup
integer x = 731
integer width = 3145
integer height = 816
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = gb2312charset!
fontpitch fontpitch = variable!
string facename = "ËÎÌå"
long textcolor = 33554432
long backcolor = 67108864
string text = "ÊäÈëÓï·¨(Syntax)£º"
end type

