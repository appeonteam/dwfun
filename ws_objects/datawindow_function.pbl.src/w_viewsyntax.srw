$PBExportHeader$w_viewsyntax.srw
forward
global type w_viewsyntax from window
end type
type cb_2 from commandbutton within w_viewsyntax
end type
type cb_1 from commandbutton within w_viewsyntax
end type
type mle_2 from multilineedit within w_viewsyntax
end type
type mle_1 from multilineedit within w_viewsyntax
end type
type gb_1 from groupbox within w_viewsyntax
end type
type gb_2 from groupbox within w_viewsyntax
end type
end forward

global type w_viewsyntax from window
integer width = 3259
integer height = 2208
boolean titlebar = true
string title = "View Datawindow Syntax"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_2 cb_2
cb_1 cb_1
mle_2 mle_2
mle_1 mle_1
gb_1 gb_1
gb_2 gb_2
end type
global w_viewsyntax w_viewsyntax

on w_viewsyntax.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.mle_2=create mle_2
this.mle_1=create mle_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.cb_2,&
this.cb_1,&
this.mle_2,&
this.mle_1,&
this.gb_1,&
this.gb_2}
end on

on w_viewsyntax.destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.mle_2)
destroy(this.mle_1)
destroy(this.gb_1)
destroy(this.gb_2)
end on

type cb_2 from commandbutton within w_viewsyntax
integer x = 2203
integer y = 1940
integer width = 457
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Compare"
end type

event clicked;

If mle_1.Text = mle_2.Text Then 
	MessageBox('Result', 'text1 = text2')
Else
	MessageBox('Result', 'text1 <> text2')
End If 
end event

type cb_1 from commandbutton within w_viewsyntax
integer x = 2711
integer y = 1944
integer width = 457
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Close"
end type

event clicked;Close(parent)
end event

type mle_2 from multilineedit within w_viewsyntax
integer x = 73
integer y = 1048
integer width = 3040
integer height = 836
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
boolean autohscroll = true
boolean autovscroll = true
borderstyle borderstyle = stylelowered!
end type

type mle_1 from multilineedit within w_viewsyntax
integer x = 73
integer y = 64
integer width = 3040
integer height = 860
integer taborder = 10
integer textsize = -9
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
boolean righttoleft = true
end type

type gb_1 from groupbox within w_viewsyntax
integer x = 14
integer y = 976
integer width = 3154
integer height = 944
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "dw_2 Syntax"
end type

type gb_2 from groupbox within w_viewsyntax
integer x = 23
integer width = 3154
integer height = 960
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "dw_1 Syntax"
end type

