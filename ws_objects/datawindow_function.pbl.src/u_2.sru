$PBExportHeader$u_2.sru
forward
global type u_2 from datawindow
end type
end forward

global type u_2 from datawindow
integer width = 1623
integer height = 648
string title = "none"
string dataobject = "d_gen_export_hawb_reserve"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type
global u_2 u_2

on u_2.create
end on

on u_2.destroy
end on

event buttonclicked;long ll_count
string ls_shipper_code

choose case dwo.name
	case 'b_reserve'
		this.visible = false
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

