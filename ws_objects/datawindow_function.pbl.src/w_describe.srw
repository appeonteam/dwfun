$PBExportHeader$w_describe.srw
forward
global type w_describe from window
end type
type cb_8 from commandbutton within w_describe
end type
type cb_7 from commandbutton within w_describe
end type
type cb_6 from commandbutton within w_describe
end type
type cb_5 from commandbutton within w_describe
end type
type cb_4 from commandbutton within w_describe
end type
type cb_3 from commandbutton within w_describe
end type
type mle_1 from multilineedit within w_describe
end type
type cb_2 from commandbutton within w_describe
end type
type cb_1 from commandbutton within w_describe
end type
type dw_1 from datawindow within w_describe
end type
end forward

global type w_describe from window
integer width = 3753
integer height = 1516
boolean titlebar = true
string title = "Untitled"
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
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
mle_1 mle_1
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
end type
global w_describe w_describe

on w_describe.create
this.cb_8=create cb_8
this.cb_7=create cb_7
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.mle_1=create mle_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_8,&
this.cb_7,&
this.cb_6,&
this.cb_5,&
this.cb_4,&
this.cb_3,&
this.mle_1,&
this.cb_2,&
this.cb_1,&
this.dw_1}
end on

on w_describe.destroy
destroy(this.cb_8)
destroy(this.cb_7)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.mle_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
end on

type cb_8 from commandbutton within w_describe
integer x = 2523
integer y = 1200
integer width = 1088
integer height = 128
integer taborder = 80
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "dw_1.setitem(1,~"date1~",ld_data)"
end type

event clicked;datetime ldt_datetime
setnull(ldt_datetime)
dw_1.setitem(1,"datetime1",ldt_datetime)
end event

type cb_7 from commandbutton within w_describe
integer x = 2030
integer y = 1216
integer width = 343
integer height = 104
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "save"
end type

event clicked;dw_1.accepttext()
if dw_1.update() = 1 then
 commit;
 messagebox(title,"save successed!")
else
 rollback;
 messagebox(title,"save failed!")
end if 
end event

type cb_6 from commandbutton within w_describe
integer x = 1499
integer y = 1232
integer width = 343
integer height = 104
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "delete"
end type

event clicked;dw_1.deleterow(0)
end event

type cb_5 from commandbutton within w_describe
integer x = 1079
integer y = 1216
integer width = 343
integer height = 104
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "insert"
end type

event clicked;dw_1.insertrow(0)
end event

type cb_4 from commandbutton within w_describe
integer x = 549
integer y = 1248
integer width = 343
integer height = 104
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "retrieve"
end type

event clicked;dw_1.retrieve()
end event

type cb_3 from commandbutton within w_describe
integer x = 55
integer y = 1200
integer width = 402
integer height = 104
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "settransobject"
end type

event clicked;dw_1.settransobject(sqlca)
end event

type mle_1 from multilineedit within w_describe
integer x = 2231
integer y = 384
integer width = 1463
integer height = 752
integer taborder = 40
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

type cb_2 from commandbutton within w_describe
integer x = 2231
integer y = 208
integer width = 786
integer height = 128
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "dw_1.object.datawindow.data"
end type

event clicked;mle_1.text = dw_1.object.datawindow.data
end event

type cb_1 from commandbutton within w_describe
integer x = 2231
integer y = 64
integer width = 914
integer height = 128
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "dw_1.describe(~"datawindow.data~")"
end type

event clicked;mle_1.text = dw_1.describe("datawindow.data")
 
 
 
end event

type dw_1 from datawindow within w_describe
integer y = 16
integer width = 2194
integer height = 1136
integer taborder = 10
string title = "none"
string dataobject = "d_datatype"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

