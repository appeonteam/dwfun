$PBExportHeader$w_response.srw
forward
global type w_response from window
end type
type cb_4 from commandbutton within w_response
end type
type cb_dll from commandbutton within w_response
end type
type tab_1 from tab within w_response
end type
type tabpage_1 from userobject within tab_1
end type
type dw_2 from datawindow within tabpage_1
end type
type cb_21 from commandbutton within tabpage_1
end type
type tabpage_1 from userobject within tab_1
dw_2 dw_2
cb_21 cb_21
end type
type tabpage_2 from userobject within tab_1
end type
type tabpage_2 from userobject within tab_1
end type
type tab_1 from tab within w_response
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
type cb_3 from commandbutton within w_response
end type
type cb_2 from commandbutton within w_response
end type
type dw_response from datawindow within w_response
end type
type cb_1 from commandbutton within w_response
end type
end forward

global type w_response from window
integer width = 3945
integer height = 1996
boolean titlebar = true
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_4 cb_4
cb_dll cb_dll
tab_1 tab_1
cb_3 cb_3
cb_2 cb_2
dw_response dw_response
cb_1 cb_1
end type
global w_response w_response

type prototypes

end prototypes

on w_response.create
this.cb_4=create cb_4
this.cb_dll=create cb_dll
this.tab_1=create tab_1
this.cb_3=create cb_3
this.cb_2=create cb_2
this.dw_response=create dw_response
this.cb_1=create cb_1
this.Control[]={this.cb_4,&
this.cb_dll,&
this.tab_1,&
this.cb_3,&
this.cb_2,&
this.dw_response,&
this.cb_1}
end on

on w_response.destroy
destroy(this.cb_4)
destroy(this.cb_dll)
destroy(this.tab_1)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.dw_response)
destroy(this.cb_1)
end on

event open;dw_response.setTransobject(sqlca)
dw_response.retrieve()
end event

type cb_4 from commandbutton within w_response
integer x = 814
integer y = 1192
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "insertrow"
end type

event clicked;dw_response.insertrow( 0)
end event

type cb_dll from commandbutton within w_response
integer x = 498
integer y = 1548
integer width = 457
integer height = 128
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "dll"
end type

event clicked;//n_supermenu_child l_dll
//ulong hInst
//LONG LL_LONG
//string lpsz
//ulong un1
//ulong n1
//ulong n2
//ulong un2
//l_dll.LoadImage(hInst,lpsz,un1,n1,n2,un2)
////l_dll.LoadImageB(hInst,lpsz,un1,n1,n2,un2)
//LoadImage(LL_LONG,lpsz,un1,n1,n2,un2)
end event

type tab_1 from tab within w_response
integer width = 1152
integer height = 864
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.Control[]={this.tabpage_1,&
this.tabpage_2}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
end on

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 120
integer width = 1115
integer height = 728
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_2 dw_2
cb_21 cb_21
end type

on tabpage_1.create
this.dw_2=create dw_2
this.cb_21=create cb_21
this.Control[]={this.dw_2,&
this.cb_21}
end on

on tabpage_1.destroy
destroy(this.dw_2)
destroy(this.cb_21)
end on

type dw_2 from datawindow within tabpage_1
integer y = 44
integer width = 1111
integer height = 400
integer taborder = 20
string title = "none"
string dataobject = "d_bug8724"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_21 from commandbutton within tabpage_1
integer x = 187
integer y = 556
integer width = 421
integer height = 112
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
end type

event clicked;dw_2.insertRow(0)
end event

type tabpage_2 from userobject within tab_1
boolean visible = false
integer x = 18
integer y = 120
integer width = 1115
integer height = 728
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
end type

type cb_3 from commandbutton within w_response
integer x = 1015
integer y = 1552
integer width = 421
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "open(w_main)"
end type

event clicked;open(w_main)
end event

type cb_2 from commandbutton within w_response
integer x = 32
integer y = 1552
integer width = 421
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Retrieve"
end type

type dw_response from datawindow within w_response
integer x = 1175
integer width = 2501
integer height = 1028
integer taborder = 10
string title = "none"
string dataobject = "d_allstyle"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_response
integer x = 110
integer y = 1732
integer width = 421
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "close"
end type

event clicked;close(parent)
end event

