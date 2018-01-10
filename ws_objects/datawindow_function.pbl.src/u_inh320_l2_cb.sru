$PBExportHeader$u_inh320_l2_cb.sru
forward
global type u_inh320_l2_cb from u_inh320_l1_cb
end type
end forward

global type u_inh320_l2_cb from u_inh320_l1_cb
end type
global u_inh320_l2_cb u_inh320_l2_cb

forward prototypes
public subroutine uf_point_6 ()
public subroutine uf_point_1 ()
public subroutine uf_point_2 ()
public subroutine uf_point_4 (string as_type)
public subroutine uf_point_5 (string as_type)
end prototypes

public subroutine uf_point_6 ();If NOT IsValid(gw_inh320w01_commandbutton) Then Return

gw_inh320w01_commandbutton.Wf_OutPut("Information : Execute u_inh320_L2 Function uf_point_6() Script.", False)
end subroutine

public subroutine uf_point_1 ();If NOT IsValid(gw_inh320w01_commandbutton) Then Return

gw_inh320w01_commandbutton.Wf_OutPut("Information : Execute u_inh320_L2 Function uf_point_1() Script.", False)
end subroutine

public subroutine uf_point_2 ();If NOT IsValid(gw_inh320w01_commandbutton) Then Return

gw_inh320w01_commandbutton.Wf_OutPut("Information : Execute u_inh320_L2 Function uf_point_2() Script.", False)
end subroutine

public subroutine uf_point_4 (string as_type);If NOT IsValid(gw_inh320w01_commandbutton) Then Return

gw_inh320w01_commandbutton.Wf_OutPut("Information : Execute u_inh320_L2 Function uf_point_4(String as_Type) Script.", False)
end subroutine

public subroutine uf_point_5 (string as_type);If NOT IsValid(gw_inh320w01_commandbutton) Then Return

gw_inh320w01_commandbutton.Wf_OutPut("Information : Execute u_inh320_L2 Function uf_point_5(String as_Type) Script.", False)
end subroutine

on u_inh320_l2_cb.create
call super::create
end on

on u_inh320_l2_cb.destroy
call super::destroy
end on

