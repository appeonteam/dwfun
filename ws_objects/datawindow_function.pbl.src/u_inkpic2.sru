$PBExportHeader$u_inkpic2.sru
forward
global type u_inkpic2 from userobject
end type
type ole_1 from olecontrol within u_inkpic2
end type
type ie_1 from inkedit within u_inkpic2
end type
type ip_1 from inkpicture within u_inkpic2
end type
end forward

global type u_inkpic2 from userobject
integer width = 2578
integer height = 1052
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
ole_1 ole_1
ie_1 ie_1
ip_1 ip_1
end type
global u_inkpic2 u_inkpic2

on u_inkpic2.create
this.ole_1=create ole_1
this.ie_1=create ie_1
this.ip_1=create ip_1
this.Control[]={this.ole_1,&
this.ie_1,&
this.ip_1}
end on

on u_inkpic2.destroy
destroy(this.ole_1)
destroy(this.ie_1)
destroy(this.ip_1)
end on

type ole_1 from olecontrol within u_inkpic2
integer x = 1710
integer y = 104
integer width = 864
integer height = 756
integer taborder = 10
boolean focusrectangle = false
string binarykey = "u_inkpic2.udo"
omactivation activation = activateondoubleclick!
omdisplaytype displaytype = displayascontent!
omcontentsallowed contentsallowed = containsany!
end type

type ie_1 from inkedit within u_inkpic2
integer x = 1115
integer y = 140
integer width = 503
integer height = 864
integer taborder = 10
string text = "none"
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
end type

type ip_1 from inkpicture within u_inkpic2
integer x = 233
integer y = 88
integer width = 503
integer height = 864
end type

