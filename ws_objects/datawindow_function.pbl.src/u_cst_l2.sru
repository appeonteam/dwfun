$PBExportHeader$u_cst_l2.sru
forward
global type u_cst_l2 from u_cst_l1
end type
end forward

global type u_cst_l2 from u_cst_l1
end type
global u_cst_l2 u_cst_l2

on u_cst_l2.create
call super::create
end on

on u_cst_l2.destroy
call super::destroy
end on

type cb_1 from u_cst_l1`cb_1 within u_cst_l2
end type

event cb_1::ue_post;//OverRide Script
gs_call = gs_call + "~r~nCall U_cst_l2.cb_1 Event Ue_post()"
end event

event cb_1::ue_post_arg;call super::ue_post_arg;gs_call = gs_call + "~r~nCall U_cst_l2.cb_1 Event Ue_post_arg(String as_arg="+as_arg+")"
end event

event cb_1::ue_trigger;call super::ue_trigger;gs_call = gs_call + "~r~nCall U_cst_l2.cb_1 Event Ue_trigger()"
end event

event cb_1::ue_triigger_arg;call super::ue_triigger_arg;
end event

event cb_1::ue_trigger_arg;call super::ue_trigger_arg;//OverRide Script
gs_call = gs_call + "~r~nCall U_cst_l2.cb_1 Event Ue_trigger_arg(String as_arg ="+as_arg+")"
end event

event cb_1::clicked;call super::clicked;gs_call = gs_call + 'U_cst_l2 cb_1 clicked'

end event

