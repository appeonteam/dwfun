$PBExportHeader$u_cst_l1.sru
forward
global type u_cst_l1 from userobject
end type
type cb_1 from u_cb_l2 within u_cst_l1
end type
end forward

global type u_cst_l1 from userobject
integer width = 978
integer height = 216
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_1 cb_1
end type
global u_cst_l1 u_cst_l1

on u_cst_l1.create
this.cb_1=create cb_1
this.Control[]={this.cb_1}
end on

on u_cst_l1.destroy
destroy(this.cb_1)
end on

type cb_1 from u_cb_l2 within u_cst_l1
integer x = 73
integer y = 32
integer width = 805
integer height = 128
integer taborder = 10
end type

event ue_post_arg;//OverRide Script
gs_call = gs_call + "~r~nCall U_cst_l1.cb_1 Event Ue_post_arg(String as_arg="+as_arg+")"
end event

