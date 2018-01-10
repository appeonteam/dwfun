$PBExportHeader$u_cb_l2.sru
forward
global type u_cb_l2 from u_cb_l1
end type
end forward

global type u_cb_l2 from u_cb_l1
end type
global u_cb_l2 u_cb_l2

forward prototypes
public subroutine of_post ()
public subroutine of_trigger ()
public function integer pointerx ()
end prototypes

public subroutine of_post ();//OverRide Script
gs_call = gs_call + "~r~nCall u_cb_L2 Function of_post()"
end subroutine

public subroutine of_trigger ();//OverRide Script
gs_call = gs_call + "~r~nCall u_cb_L2 Function of_trigger()"
end subroutine

public function integer pointerx ();gs_call = gs_call + 'U_cb_l2 Pointerx Function'
return 1
end function

event ue_post;//OverRide Script
gs_call = gs_call + "~r~nCall u_cb_L2 Event Ue_post()"
end event

on u_cb_l2.create
call super::create
end on

on u_cb_l2.destroy
call super::destroy
end on

event ue_trigger;call super::ue_trigger;gs_call = gs_call + "~r~nCall u_cb_L2 Event Ue_trigger()"
end event

