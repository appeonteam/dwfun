$PBExportHeader$u_1.sru
forward
global type u_1 from userobject
end type
type dw_1 from datawindow within u_1
end type
end forward

global type u_1 from userobject
integer width = 727
integer height = 424
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_1 dw_1
end type
global u_1 u_1

on u_1.create
this.dw_1=create dw_1
this.Control[]={this.dw_1}
end on

on u_1.destroy
destroy(this.dw_1)
end on

type dw_1 from datawindow within u_1
integer width = 686
integer height = 400
integer taborder = 10
string title = "none"
string dataobject = "d_gen_export_hawb_reserve"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event buttonclicked;long ll_count
string ls_shipper_code

choose case dwo.name
	case 'b_reserve'
		parent.visible = false
		//this.width = 2000
//		this.accepttext()
//		ls_shipper_code = this.getitemstring(row,'shipper_code')
//		ll_count = this.getitemnumber(row,'count')
//		if not isnull(ls_shipper_code) and len(trim(ls_shipper_code)) > 0 then
//			wf_reserve(ls_shipper_code,ll_count)
//		end if
end choose

end event

event constructor;insertRow(0)
end event

