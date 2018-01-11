$PBExportHeader$u_reproduce2.sru
forward
global type u_reproduce2 from userobject
end type
type ole_1 from olecontrol within u_reproduce2
end type
end forward

global type u_reproduce2 from userobject
integer width = 1915
integer height = 936
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
ole_1 ole_1
end type
global u_reproduce2 u_reproduce2

on u_reproduce2.create
this.ole_1=create ole_1
this.Control[]={this.ole_1}
end on

on u_reproduce2.destroy
destroy(this.ole_1)
end on

type ole_1 from olecontrol within u_reproduce2
integer x = 315
integer y = 136
integer width = 864
integer height = 756
integer taborder = 10
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
string binarykey = "u_reproduce2.udo"
omactivation activation = activateondoubleclick!
omdisplaytype displaytype = displayascontent!
omcontentsallowed contentsallowed = containsany!
end type

