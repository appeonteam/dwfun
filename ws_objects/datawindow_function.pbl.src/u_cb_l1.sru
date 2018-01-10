$PBExportHeader$u_cb_l1.sru
forward
global type u_cb_l1 from commandbutton
end type
end forward

global type u_cb_l1 from commandbutton
integer width = 910
integer height = 148
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Uo_CommadBottom"
event ue_post ( )
event ue_post_arg ( string as_arg )
event ue_trigger ( )
event ue_trigger_arg ( string as_arg )
end type
global u_cb_l1 u_cb_l1

forward prototypes
public subroutine of_post ()
public subroutine of_post_arg (string as_arg)
public subroutine of_trigger ()
public subroutine of_trigger_arg (string as_arg)
end prototypes

event ue_post();gs_call = gs_call + "~r~nCall u_cb_L1 Event Ue_post()"
end event

event ue_post_arg(string as_arg);gs_call = gs_call + "~r~nCall u_cb_L1 Event Ue_post_arg(String as_arg="+as_arg+")"
end event

event ue_trigger();gs_call = gs_call + "~r~nCall u_cb_L1 Event Ue_trigger()"
end event

event ue_trigger_arg(string as_arg);gs_call = gs_call + "~r~nCall u_cb_L1 Event Ue_trigger_arg(String as_arg ="+as_arg+")"
end event

public subroutine of_post ();gs_call = gs_call + "~r~nCall u_cb_L1 Function of_post()"
end subroutine

public subroutine of_post_arg (string as_arg);gs_call = gs_call + "~r~nCall u_cb_L1 Function of_post_arg(String as_arg="+as_arg+")"
end subroutine

public subroutine of_trigger ();gs_call = gs_call + "~r~nCall u_cb_L1 Function of_trigger()"
end subroutine

public subroutine of_trigger_arg (string as_arg);gs_call = gs_call + "~r~nCall u_cb_L1 Function of_trigger_arg(String as_arg="+as_arg+")"
end subroutine

on u_cb_l1.create
end on

on u_cb_l1.destroy
end on

