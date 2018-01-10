$PBExportHeader$w_main.srw
forward
global type w_main from window
end type
type cb_2 from commandbutton within w_main
end type
type dw_main from datawindow within w_main
end type
type cb_1 from commandbutton within w_main
end type
end forward

global type w_main from window
integer width = 3301
integer height = 1368
boolean titlebar = true
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_2 cb_2
dw_main dw_main
cb_1 cb_1
end type
global w_main w_main

type prototypes

end prototypes

on w_main.create
this.cb_2=create cb_2
this.dw_main=create dw_main
this.cb_1=create cb_1
this.Control[]={this.cb_2,&
this.dw_main,&
this.cb_1}
end on

on w_main.destroy
destroy(this.cb_2)
destroy(this.dw_main)
destroy(this.cb_1)
end on

event open;dw_main.setTransobject(sqlca)
dw_main.retrieve()

//int i=0
//for i=0 to 20
//	dw_main.insertRow(0)
//NEXT
end event

type cb_2 from commandbutton within w_main
integer x = 251
integer y = 1076
integer width = 457
integer height = 128
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Retrieve"
end type

type dw_main from datawindow within w_main
integer width = 3333
integer height = 868
integer taborder = 10
string title = "none"
string dataobject = "d_grid_delaytest"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_main
integer x = 987
integer y = 1060
integer width = 457
integer height = 128
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "close"
end type

event clicked;close(parent)
end event

