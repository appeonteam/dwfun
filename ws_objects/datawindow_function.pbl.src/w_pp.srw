$PBExportHeader$w_pp.srw
forward
global type w_pp from window
end type
type st_1 from statictext within w_pp
end type
end forward

global type w_pp from window
integer width = 3959
integer height = 1648
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_1 st_1
end type
global w_pp w_pp

on w_pp.create
this.st_1=create st_1
this.Control[]={this.st_1}
end on

on w_pp.destroy
destroy(this.st_1)
end on

type st_1 from statictext within w_pp
integer x = 841
integer y = 720
integer width = 457
integer height = 72
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "none"
boolean focusrectangle = false
end type

