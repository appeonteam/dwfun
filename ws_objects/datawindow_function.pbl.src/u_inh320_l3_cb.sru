$PBExportHeader$u_inh320_l3_cb.sru
forward
global type u_inh320_l3_cb from u_inh320_l2_cb
end type
end forward

global type u_inh320_l3_cb from u_inh320_l2_cb
end type
global u_inh320_l3_cb u_inh320_l3_cb

forward prototypes
public subroutine uf_point_1 ()
public subroutine uf_point_4 (string as_type, string as_flag)
public subroutine uf_point_5 ()
end prototypes

public subroutine uf_point_1 ();If NOT IsValid(gw_inh320w01_commandbutton) Then Return

gw_inh320w01_commandbutton.Wf_OutPut("Information : Execute u_inh320_L3 Function uf_point_1() Script.", False)
end subroutine

public subroutine uf_point_4 (string as_type, string as_flag);If NOT IsValid(gw_inh320w01_commandbutton) Then Return

gw_inh320w01_commandbutton.Wf_OutPut("Information : Execute u_inh320_L3 Function uf_point_4(String as_Type, String as_Flag) Script.", False)
end subroutine

public subroutine uf_point_5 ();If NOT IsValid(gw_inh320w01_commandbutton) Then Return

gw_inh320w01_commandbutton.Wf_OutPut("Information : Execute u_inh320_L3 Function uf_point_5() Script.", False)
end subroutine

on u_inh320_l3_cb.create
call super::create
end on

on u_inh320_l3_cb.destroy
call super::destroy
end on

