$PBExportHeader$w_inh501w01_callancestor.srw
forward
global type w_inh501w01_callancestor from window
end type
type uo_test from u_cst_l3 within w_inh501w01_callancestor
end type
type cb_3 from commandbutton within w_inh501w01_callancestor
end type
type cb_2 from commandbutton within w_inh501w01_callancestor
end type
type cb_execute from commandbutton within w_inh501w01_callancestor
end type
type lb_items from listbox within w_inh501w01_callancestor
end type
type cb_clear from commandbutton within w_inh501w01_callancestor
end type
type cb_close from commandbutton within w_inh501w01_callancestor
end type
type mle_output from multilineedit within w_inh501w01_callancestor
end type
type mle_view from multilineedit within w_inh501w01_callancestor
end type
type gb_3 from groupbox within w_inh501w01_callancestor
end type
type gb_4 from groupbox within w_inh501w01_callancestor
end type
type gb_5 from groupbox within w_inh501w01_callancestor
end type
type mle_describe from multilineedit within w_inh501w01_callancestor
end type
type gb_1 from groupbox within w_inh501w01_callancestor
end type
type gb_2 from groupbox within w_inh501w01_callancestor
end type
end forward

global type w_inh501w01_callancestor from window
integer width = 3954
integer height = 2408
boolean titlebar = true
string title = "Call Ancestor"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event ue_runall ( )
uo_test uo_test
cb_3 cb_3
cb_2 cb_2
cb_execute cb_execute
lb_items lb_items
cb_clear cb_clear
cb_close cb_close
mle_output mle_output
mle_view mle_view
gb_3 gb_3
gb_4 gb_4
gb_5 gb_5
mle_describe mle_describe
gb_1 gb_1
gb_2 gb_2
end type
global w_inh501w01_callancestor w_inh501w01_callancestor

type variables
//OutPut Index 
Integer ii_index = 0

//Standrad Object
//n_inh306_L3_ds	iuo_ds

//BEGIN_WININSVAR
long il_WindowID = -1
DataStore ids_TestPoint
DataStore ids_ResultDetailTemp
//END_WININSVAR
end variables

forward prototypes
public subroutine wf_describe ()
public subroutine wf_scriptview (string as_script)
public subroutine wf_output (string as_mess, boolean ab_clear)
public subroutine wf_scriptexe (integer ai_item, boolean ab_execute)
public subroutine wf_init_items ()
public function integer wf_createresultset ()
public function integer wf_savetempresult (long al_row)
end prototypes

event ue_runall ( );//start:event ue_runall ( )
integer i

for i = 1 to lb_items.TotalItems()
	 wf_ScriptExe(i, true)	
next
//end:event ue_runall ( )
end event

public subroutine wf_describe ();//You must Define this Function for call
////////////////////////////////////////////////////////////////
//Function : wf_describe ; Output Describe
//Argument : none
//Output   : none
//Designer : guojun
//Date     : 2003-11-10
////////////////////////////////////////////////////////////////

mle_describe.text  = "1.Appeon Window : "
mle_describe.text +=  Classname() + "~r~n" //This Must be the First output
mle_describe.text += "2.Testing Purpose : Calling Ancestor with different method" // This must include
mle_describe.text += "~r~n"
mle_describe.text += "3.Operation Step : ~r~n" // Optional
mle_describe.text += ""
mle_describe.text += "4.Object Declare : ~r~n" // Optional
Return
end subroutine

public subroutine wf_scriptview (string as_script);//You must Define this Function for view and Execute Script

//////////////////////////////////////////////////////////////////////
//Function: wf_scriptview  View a line Script
//Argument: String  as_mess a line Script
//Output:   none
//Designer:
//Date:
/////////////////////////////////////////////////////////////////////

mle_view.Text += as_script + "~r~n"

Return
end subroutine

public subroutine wf_output (string as_mess, boolean ab_clear);////////////////////////////////////////////////////////////////
//Function : Wf_OutPut
//Argument : String   as_mess;   The Message you will output 
//				 Boolean  ab_clear;  Clear Flag
//Output   : None
//Designer : 
//Date     :
////////////////////////////////////////////////////////////////

If ab_clear Then
	mle_output.Text = ""
	ii_index = 0
End IF	

//ii_index ++
//mle_output.Text += String(ii_index,'00') + "." + as_mess + "~r~n"
mle_output.Text = mle_output.text + as_mess
end subroutine

public subroutine wf_scriptexe (integer ai_item, boolean ab_execute);//You must Define this Function for view and Execute Script

//////////////////////////////////////////////////////////////////////
//Function: wf_scriptexe  View and Execute Script
//Argument: Int ai_item: SelectedItem;
//          Boolean ab_execute: Execute or View Flag
//Output:   none
//Designer:	guojun
//Date:		2003-11-10
/////////////////////////////////////////////////////////////////////
String 		ls_item,ls_descript
long			ll_pos

If ai_item < 1 Then Return

ll_pos = Pos(lb_items.text(ai_item),':')
ls_item = Mid(lb_items.text(ai_item),1,ll_pos - 1)
ls_descript = Mid(lb_items.text(ai_item),ll_pos + 1,Len(lb_items.text(ai_item)))

Choose Case ls_item
	Case 'INH501W01P001'
		If ab_execute Then
			//Call Ancestor with child object
			gs_call = ''
			uo_test.cb_1.event ue_call_1()
			wf_output('//Call Ancestor with child object',True)
			wf_output(gs_call,False)
		Else
			wf_scriptview("//Call Ancestor with child object                  ")
			wf_scriptview("gs_call = ''                                       ")
			wf_scriptview("uo_test.cb_1.event ue_call_1()                     ")
			wf_scriptview("wf_output('//Call Ancestor with child object',True)")
			wf_scriptview("wf_output(gs_call,False)                           ")
			
			wf_scriptview("                                               ")
			wf_scriptview("Ue_Call_1() Script View //Ê¹ÓÃ×Ó¶ÔÏóÃû·ÃÎÊ     ")
			wf_scriptview("{                                              ")
			wf_scriptview("     gs_call += '~r~n01'                       ")
			wf_scriptview("     cb_1::of_trigger()                        ")
			wf_scriptview("     gs_call += '~r~n02'                       ")
			wf_scriptview("     cb_1::EVENT ue_trigger()                  ")
			wf_scriptview("     gs_call += '~r~n03'                       ")
			wf_scriptview("     cb_1::FUNCTION of_trigger()               ")
			wf_scriptview("     gs_call += '~r~n04'                       ")
			wf_scriptview("     cb_1::TRIGGER of_trigger()                ")
			wf_scriptview("     gs_call += '~r~n05'                       ")
			wf_scriptview("     cb_1::POST of_post()                      ")
			wf_scriptview("     gs_call += '~r~n06'                       ")
			wf_scriptview("     cb_1::of_trigger_arg('1')                 ")
			wf_scriptview("     gs_call += '~r~n07'                       ")
			wf_scriptview("     cb_1::EVENT TRIGGER ue_trigger()          ")
			wf_scriptview("     gs_call += '~r~n08'                       ")
			wf_scriptview("     cb_1::EVENT POST ue_post()                ")
			wf_scriptview("     gs_call += '~r~n09'                       ")
			wf_scriptview("     cb_1::FUNCTION TRIGGER of_trigger()       ")
			wf_scriptview("     gs_call += '~r~n10'                       ")
			wf_scriptview("     cb_1::FUNCTION POST of_post()             ")
			wf_scriptview("     gs_call += '~r~n11'                       ")
			wf_scriptview("     cb_1::EVENT ue_trigger_arg('1')           ")
			wf_scriptview("     gs_call += '~r~n12'                       ")
			wf_scriptview("     cb_1::FUNCTION of_trigger_arg('1')        ")
			wf_scriptview("     gs_call += '~r~n13'                       ")
			wf_scriptview("     cb_1::TRIGGER of_trigger_arg('1')         ")
			wf_scriptview("     gs_call += '~r~n14'                       ")
			wf_scriptview("     cb_1::POST of_post_arg('1')               ")
			wf_scriptview("     gs_call += '~r~n15'                       ")
			wf_scriptview("     cb_1::EVENT TRIGGER ue_trigger_arg('1')   ")
			wf_scriptview("     gs_call += '~r~n16'                       ")
			wf_scriptview("     cb_1::EVENT POST ue_post_arg('1')         ")
			wf_scriptview("     gs_call += '~r~n17'                       ")
			wf_scriptview("     cb_1::FUNCTION TRIGGER of_trigger_arg('1')")
			wf_scriptview("     gs_call += '~r~n18'                       ")
			wf_scriptview("     cb_1::FUNCTION POST of_post_arg('1')      ")
			wf_scriptview("}                                              ")

		End If
		
	Case 'INH501W01P002'
		If ab_execute Then
			//Call Ancestor with Level 1 object
			gs_call = ''
			uo_test.cb_1.event ue_call_2()
			wf_output('//Call Ancestor with Level 1 object',True)
			wf_output(gs_call,False)			
		Else
 			wf_scriptview("//Call Ancestor with Level 1 object                  ")
			wf_scriptview("gs_call = ''                                         ")
			wf_scriptview("uo_test.cb_1.event ue_call_2()                       ")
			wf_scriptview("wf_output('//Call Ancestor with Level 1 object',True)")
			wf_scriptview("wf_output(gs_call,False)                             ")
			
			wf_scriptview("                                                  ")
			wf_scriptview("Ue_Call_2() Script View//Ê¹ÓÃµÚÒ»²ã¸ù¶ÔÏóÃû·ÃÎÊ   ")
			wf_scriptview("{                                                 ")
			wf_scriptview("     gs_call += '~r~n01'                          ")
			wf_scriptview("     u_cb_l1::of_trigger()                        ")
			wf_scriptview("     gs_call += '~r~n02'                          ")
			wf_scriptview("     u_cb_l1::EVENT ue_trigger()                  ")
			wf_scriptview("     gs_call += '~r~n03'                          ")
			wf_scriptview("     u_cb_l1::FUNCTION of_trigger()               ")
			wf_scriptview("     gs_call += '~r~n04'                          ")
			wf_scriptview("     u_cb_l1::TRIGGER of_trigger()                ")
			wf_scriptview("     gs_call += '~r~n05'                          ")
			wf_scriptview("     u_cb_l1::POST of_post()                      ")
			wf_scriptview("     gs_call += '~r~n06'                          ")
			wf_scriptview("     u_cb_l1::of_trigger_arg('1')                 ")
			wf_scriptview("     gs_call += '~r~n07'                          ")
			wf_scriptview("     u_cb_l1::EVENT TRIGGER ue_trigger()          ")
			wf_scriptview("     gs_call += '~r~n08'                          ")
			wf_scriptview("     u_cb_l1::Event Post ue_post()                ")
			wf_scriptview("     gs_call += '~r~n09'                          ")
			wf_scriptview("     u_cb_l1::FUNCTION TRIGGER of_trigger()       ")
			wf_scriptview("     gs_call += '~r~n10'                          ")
			wf_scriptview("     u_cb_l1::FUNCTION POST of_post()             ")
			wf_scriptview("     gs_call += '~r~n11'                          ")
			wf_scriptview("     u_cb_l1::EVENT ue_trigger_arg('1')           ")
			wf_scriptview("     gs_call += '~r~n12'                          ")
			wf_scriptview("     u_cb_l1::FUNCTION of_trigger_arg('1')        ")
			wf_scriptview("     gs_call += '~r~n13'                          ")
			wf_scriptview("     u_cb_l1::TRIGGER of_trigger_arg('1')         ")
			wf_scriptview("     gs_call += '~r~n14'                          ")
			wf_scriptview("     u_cb_l1::POST of_post_arg('1')               ")
			wf_scriptview("     gs_call += '~r~n15'                          ")
			wf_scriptview("     u_cb_l1::EVENT TRIGGER ue_trigger_arg('1')   ")
			wf_scriptview("     gs_call += '~r~n16'                          ")
			wf_scriptview("     u_cb_l1::EVENT POST ue_post_arg('1')         ")
			wf_scriptview("     gs_call += '~r~n17'                          ")
			wf_scriptview("     u_cb_l1::FUNCTION TRIGGER of_trigger_arg('1')")
			wf_scriptview("     gs_call += '~r~n18'                          ")
			wf_scriptview("     u_cb_l1::FUNCTION POST of_post_arg('1')      ")
			wf_scriptview("}                                                 ")

 		End If

	Case 'INH501W01P003'
		If ab_execute Then
			//Call Ancestor with Level 2 object
			gs_call = ''
			uo_test.cb_1.event ue_call_3()
			wf_output('//Call Ancestor with Level 2 object',True)
			wf_output(gs_call,False)			
		Else
			wf_scriptview("//Call Ancestor with Level 2 object                  ")
			wf_scriptview("gs_call = ''                                         ")
			wf_scriptview("uo_test.cb_1.event ue_call_3()                       ")
			wf_scriptview("wf_output('//Call Ancestor with Level 2 object',True)")
			wf_scriptview("wf_output(gs_call,False)                             ")
		
			wf_scriptview("                                                  ")
			wf_scriptview("Ue_Call_3()Script View//Ê¹ÓÃµÚ¶þ²ã¸ù¶ÔÏóÃû·ÃÎÊ    ")
			wf_scriptview("{                                                 ")
			wf_scriptview("     gs_call += '~r~n01'                          ")
			wf_scriptview("     u_cb_l2::of_trigger()                        ")
			wf_scriptview("     gs_call += '~r~n02'                          ")
			wf_scriptview("     u_cb_l2::EVENT ue_trigger()                  ")
			wf_scriptview("     gs_call += '~r~n03'                          ")
			wf_scriptview("     u_cb_l2::FUNCTION of_trigger()               ")
			wf_scriptview("     gs_call += '~r~n04'                          ")
			wf_scriptview("     u_cb_l2::TRIGGER of_trigger()                ")
			wf_scriptview("     gs_call += '~r~n05'                          ")
			wf_scriptview("     u_cb_l2::POST of_post()                      ")
			wf_scriptview("     gs_call += '~r~n06'                          ")
			wf_scriptview("     u_cb_l2::of_trigger_arg('1')                 ")
			wf_scriptview("     gs_call += '~r~n07'                          ")
			wf_scriptview("     u_cb_l2::EVENT TRIGGER ue_trigger()          ")
			wf_scriptview("     gs_call += '~r~n08'                          ")
			wf_scriptview("     u_cb_l2::EVENT POST ue_post()                ")
			wf_scriptview("     gs_call += '~r~n09'                          ")
			wf_scriptview("     u_cb_l2::FUNCTION TRIGGER of_trigger()       ")
			wf_scriptview("     gs_call += '~r~n10'                          ")
			wf_scriptview("     u_cb_l2::FUNCTION POST of_post()             ")
			wf_scriptview("     gs_call += '~r~n11'                          ")
			wf_scriptview("     u_cb_l2::EVENT ue_trigger_arg('1')           ")
			wf_scriptview("     gs_call += '~r~n12'                          ")
			wf_scriptview("     u_cb_l2::FUNCTION of_trigger_arg('1')        ")
			wf_scriptview("     gs_call += '~r~n13'                          ")
			wf_scriptview("     u_cb_l2::TRIGGER of_trigger_arg('1')         ")
			wf_scriptview("     gs_call += '~r~n14'                          ")
			wf_scriptview("     u_cb_l2::POST of_post_arg('1')               ")
			wf_scriptview("     gs_call += '~r~n15'                          ")
			wf_scriptview("     u_cb_l2::EVENT TRIGGER ue_trigger_arg('1')   ")
			wf_scriptview("     gs_call += '~r~n16'                          ")
			wf_scriptview("     u_cb_l2::EVENT POST ue_post_arg('1')         ")
			wf_scriptview("     gs_call += '~r~n17'                          ")
			wf_scriptview("     u_cb_l2::FUNCTION TRIGGER of_trigger_arg('1')")
			wf_scriptview("     gs_call += '~r~n18'                          ")
			wf_scriptview("     u_cb_l2::FUNCTION POST of_post_arg('1')      ")
			wf_scriptview("}                                                 ")
						
		End If

	Case 'INH501W01P004'
		If ab_execute Then
			//Call Ancestor with Level 3 object
			gs_call = ''
			uo_test.cb_1.event ue_call_4()
			wf_output('//Call Ancestor with Level 3 object',True)
			wf_output(gs_call,False)			
		Else
			wf_scriptview("//Call Ancestor with Level 3 object                  ")
			wf_scriptview("gs_call = ''                                         ")
			wf_scriptview("uo_test.cb_1.event ue_call_4()                       ")
			wf_scriptview("wf_output('//Call Ancestor with Level 3 object',True)")
			wf_scriptview("wf_output(gs_call,False)                             ")

			wf_scriptview("                                                        ")
			wf_scriptview("Ue_Call_4()Script View//Ê¹ÓÃµÚÈý²ã¸ù¶ÔÏóÃû              ")
			wf_scriptview("{                                                       ")
			wf_scriptview("     gs_call += '~r~n01'                                ")
			wf_scriptview("     u_cst_l1`cb_1::of_trigger()                        ")
			wf_scriptview("     gs_call += '~r~n02'                                ")
			wf_scriptview("     u_cst_l1`cb_1::EVENT ue_trigger()                  ")
			wf_scriptview("     gs_call += '~r~n03'                                ")
			wf_scriptview("     u_cst_l1`cb_1::FUNCTION of_trigger()               ")
			wf_scriptview("     gs_call += '~r~n04'                                ")
			wf_scriptview("     u_cst_l1`cb_1::TRIGGER of_trigger()                ")
			wf_scriptview("     gs_call += '~r~n05'                                ")
			wf_scriptview("     u_cst_l1`cb_1::POST of_post()                      ")
			wf_scriptview("     gs_call += '~r~n06'                                ")
			wf_scriptview("     u_cst_l1`cb_1::of_trigger_arg('1')                 ")
			wf_scriptview("     gs_call += '~r~n07'                                ")
			wf_scriptview("     u_cst_l1`cb_1::EVENT TRIGGER ue_trigger()          ")
			wf_scriptview("     gs_call += '~r~n08'                                ")
			wf_scriptview("     u_cst_l1`cb_1::EVENT POST ue_post()                ")
			wf_scriptview("     gs_call += '~r~n09'                                ")
			wf_scriptview("     u_cst_l1`cb_1::FUNCTION TRIGGER of_trigger()       ")
			wf_scriptview("     gs_call += '~r~n10'                                ")
			wf_scriptview("     u_cst_l1`cb_1::FUNCTION POST of_post()             ")
			wf_scriptview("     gs_call += '~r~n11'                                ")
			wf_scriptview("     u_cst_l1`cb_1::EVENT ue_trigger_arg('1')           ")
			wf_scriptview("     gs_call += '~r~n12'                                ")
			wf_scriptview("     u_cst_l1`cb_1::FUNCTION of_trigger_arg('1')        ")
			wf_scriptview("     gs_call += '~r~n13'                                ")
			wf_scriptview("     u_cst_l1`cb_1::TRIGGER of_trigger_arg('1')         ")
			wf_scriptview("     gs_call += '~r~n14'                                ")
			wf_scriptview("     u_cst_l1`cb_1::POST of_post_arg('1')               ")
			wf_scriptview("     gs_call += '~r~n15'                                ")
			wf_scriptview("     u_cst_l1`cb_1::EVENT TRIGGER ue_trigger_arg('1')   ")
			wf_scriptview("     gs_call += '~r~n16'                                ")
			wf_scriptview("     u_cst_l1`cb_1::EVENT POST ue_post_arg('1')         ")
			wf_scriptview("     gs_call += '~r~n17'                                ")
			wf_scriptview("     u_cst_l1`cb_1::FUNCTION TRIGGER of_trigger_arg('1')")
			wf_scriptview("     gs_call += '~r~n18'                                ")
			wf_scriptview("     u_cst_l1`cb_1::FUNCTION POST of_post_arg('1')      ")
			wf_scriptview("}                                                       ")
					
			
		End If

	Case 'INH501W01P005'
		If ab_execute Then
			//Call Ancestor with Level 4 object
			gs_call = ''
			uo_test.cb_1.event ue_call_5()
			wf_output('//Call Ancestor with Level 4 object',True)
			wf_output(gs_call,False)			
		Else
			wf_scriptview("//Call Ancestor with Level 4 object                  ")
			wf_scriptview("gs_call = ''                                         ")
			wf_scriptview("uo_test.cb_1.event ue_call_5()                       ")
			wf_scriptview("wf_output('//Call Ancestor with Level 4 object',True)")
			wf_scriptview("wf_output(gs_call,False)                             ")
			
			wf_scriptview("                                                        ")
			wf_scriptview("Ue_Call_5() Script View//Ê¹ÓÃµÚËÄ²ã¸ù¶ÔÏóÃû             ")
			wf_scriptview("{                                                       ")
			wf_scriptview("     gs_call += '~r~n01'                                ")
			wf_scriptview("     u_cst_l2`cb_1::of_trigger()                        ")
			wf_scriptview("     gs_call += '~r~n02'                                ")
			wf_scriptview("     u_cst_l2`cb_1::EVENT ue_trigger()                  ")
			wf_scriptview("     gs_call += '~r~n03'                                ")
			wf_scriptview("     u_cst_l2`cb_1::FUNCTION of_trigger()               ")
			wf_scriptview("     gs_call += '~r~n04'                                ")
			wf_scriptview("     u_cst_l2`cb_1::TRIGGER of_trigger()                ")
			wf_scriptview("     gs_call += '~r~n05'                                ")
			wf_scriptview("     u_cst_l2`cb_1::POST of_post()                      ")
			wf_scriptview("     gs_call += '~r~n06'                                ")
			wf_scriptview("     u_cst_l2`cb_1::of_trigger_arg('1')                 ")
			wf_scriptview("     gs_call += '~r~n07'                                ")
			wf_scriptview("     u_cst_l2`cb_1::EVENT TRIGGER ue_trigger()          ")
			wf_scriptview("     gs_call += '~r~n08'                                ")
			wf_scriptview("     u_cst_l2`cb_1::EVENT POST ue_post()                ")
			wf_scriptview("     gs_call += '~r~n09'                                ")
			wf_scriptview("     u_cst_l2`cb_1::FUNCTION TRIGGER of_trigger()       ")
			wf_scriptview("     gs_call += '~r~n10'                                ")
			wf_scriptview("     u_cst_l2`cb_1::FUNCTION POST of_post()             ")
			wf_scriptview("     gs_call += '~r~n11'                                ")
			wf_scriptview("     u_cst_l2`cb_1::EVENT ue_trigger_arg('1')           ")
			wf_scriptview("     gs_call += '~r~n12'                                ")
			wf_scriptview("     u_cst_l2`cb_1::FUNCTION of_trigger_arg('1')        ")
			wf_scriptview("     gs_call += '~r~n13'                                ")
			wf_scriptview("     u_cst_l2`cb_1::TRIGGER of_trigger_arg('1')         ")
			wf_scriptview("     gs_call += '~r~n14'                                ")
			wf_scriptview("     u_cst_l2`cb_1::POST of_post_arg('1')               ")
			wf_scriptview("     gs_call += '~r~n15'                                ")
			wf_scriptview("     u_cst_l2`cb_1::EVENT TRIGGER ue_trigger_arg('1')   ")
			wf_scriptview("     gs_call += '~r~n16'                                ")
			wf_scriptview("     u_cst_l2`cb_1::EVENT POST ue_post_arg('1')         ")
			wf_scriptview("     gs_call += '~r~n17'                                ")
			wf_scriptview("     u_cst_l2`cb_1::FUNCTION TRIGGER of_trigger_arg('1')")
			wf_scriptview("     gs_call += '~r~n18'                                ")
			wf_scriptview("     u_cst_l2`cb_1::FUNCTION POST of_post_arg('1')      ")
			wf_scriptview("}                                                       ")
			
		End If

	Case 'INH501W01P006'
		If ab_execute Then
			//Call Ancestor with Level 5 object
			gs_call = ''
			uo_test.cb_1.event ue_call_6()
			wf_output('//Call Ancestor with Level 5 object',True)
			wf_output(gs_call,False)			
		Else
			wf_scriptview("//Call Ancestor with Level 5 object                  ")
			wf_scriptview("gs_call = ''                                         ")
			wf_scriptview("uo_test.cb_1.event ue_call_6()                       ")
			wf_scriptview("wf_output('//Call Ancestor with Level 5 object',True)")
			wf_scriptview("wf_output(gs_call,False)                             ")
			
			wf_scriptview("                                                        ")
			wf_scriptview("Ue_call_6() Script View//Ê¹ÓÃµÚÎå²ã¸ù¶ÔÏóÃû             ")
			wf_scriptview("{                                                       ")
			wf_scriptview("     gs_call += '~r~n01'                                ")
			wf_scriptview("     u_cst_l3`cb_1::of_trigger()                        ")
			wf_scriptview("     gs_call += '~r~n02'                                ")
			wf_scriptview("     u_cst_l3`cb_1::EVENT ue_trigger()                  ")
			wf_scriptview("     gs_call += '~r~n03'                                ")
			wf_scriptview("     u_cst_l3`cb_1::FUNCTION of_trigger()               ")
			wf_scriptview("     gs_call += '~r~n04'                                ")
			wf_scriptview("     u_cst_l3`cb_1::TRIGGER of_trigger()                ")
			wf_scriptview("     gs_call += '~r~n05'                                ")
			wf_scriptview("     u_cst_l3`cb_1::POST of_post()                      ")
			wf_scriptview("     gs_call += '~r~n06'                                ")
			wf_scriptview("     u_cst_l3`cb_1::of_trigger_arg('1')                 ")
			wf_scriptview("     gs_call += '~r~n07'                                ")
			wf_scriptview("     u_cst_l3`cb_1::EVENT TRIGGER ue_trigger()          ")
			wf_scriptview("     gs_call += '~r~n08'                                ")
			wf_scriptview("     u_cst_l3`cb_1::EVENT POST ue_post()                ")
			wf_scriptview("     gs_call += '~r~n09'                                ")
			wf_scriptview("     u_cst_l3`cb_1::FUNCTION TRIGGER of_trigger()       ")
			wf_scriptview("     gs_call += '~r~n10'                                ")
			wf_scriptview("     u_cst_l3`cb_1::EVENT ue_trigger_arg('1')           ")
			wf_scriptview("     gs_call += '~r~n11'                                ")
			wf_scriptview("     u_cst_l3`cb_1::FUNCTION of_trigger_arg('1')        ")
			wf_scriptview("     gs_call += '~r~n12'                                ")
			wf_scriptview("     u_cst_l3`cb_1::TRIGGER of_trigger_arg('1')         ")
			wf_scriptview("     gs_call += '~r~n13'                                ")
			wf_scriptview("     u_cst_l3`cb_1::POST of_post_arg('1')               ")
			wf_scriptview("     gs_call += '~r~n14'                                ")
			wf_scriptview("     u_cst_l3`cb_1::EVENT TRIGGER ue_trigger_arg('1')   ")
			wf_scriptview("     gs_call += '~r~n15'                                ")
			wf_scriptview("     u_cst_l3`cb_1::EVENT POST ue_post_arg('1')         ")
			wf_scriptview("     gs_call += '~r~n16'                                ")
			wf_scriptview("     u_cst_l3`cb_1::FUNCTION TRIGGER of_trigger_arg('1')")
			wf_scriptview("     gs_call += '~r~n17'                                ")
			wf_scriptview("     u_cst_l3`cb_1::FUNCTION POST of_post_arg('1')      ")
			wf_scriptview("}                                                       ")
			
			
		End If

	Case 'INH501W01P007'
		If ab_execute Then
			//Call Ancestor with CALL of keyword
			gs_call = ''
			uo_test.cb_1.event ue_call_7()
			wf_output('//Call Ancestor with CALL of keyword',True)
			wf_output(gs_call,False)			
		Else
			wf_scriptview("//Call Ancestor with CALL of keyword                  ")
			wf_scriptview("gs_call = ''                                          ")
			wf_scriptview("uo_test.cb_1.event ue_call_7()                        ")
			wf_scriptview("wf_output('//Call Ancestor with CALL of keyword',True)")
			wf_scriptview("wf_output(gs_call,False)                              ")
			
			wf_scriptview("                                         ")
			wf_scriptview("Ue_Call_7() Script View//Ê¹ÓÃ Call ¹Ø¼ü×Ö")
			wf_scriptview("{                                        ")
			wf_scriptview("     gs_call += '~r~n01'                 ")
			wf_scriptview("     Call cb_1::ue_trigger               ")
			wf_scriptview("     gs_call += '~r~n02'                 ")
			wf_scriptview("     Call cb_1::ue_post                  ")
			wf_scriptview("     gs_call += '~r~n03'                 ")
			wf_scriptview("     Call u_cb_l1::ue_trigger            ")
			wf_scriptview("     gs_call += '~r~n04'                 ")
			wf_scriptview("     Call u_cb_l1::ue_post               ")
			wf_scriptview("     gs_call += '~r~n05'                 ")
			wf_scriptview("     Call u_cb_l2::ue_trigger            ")
			wf_scriptview("     gs_call += '~r~n06'                 ")
			wf_scriptview("     Call u_cb_l2::ue_post               ")
			wf_scriptview("     gs_call += '~r~n07'                 ")
			wf_scriptview("     Call u_cst_l1`cb_1::ue_trigger      ")
			wf_scriptview("     gs_call += '~r~n08'                 ")
			wf_scriptview("     Call u_cst_l1`cb_1::ue_post         ")
			wf_scriptview("     gs_call += '~r~n09'                 ")
			wf_scriptview("     Call u_cst_l2`cb_1::ue_trigger      ")
			wf_scriptview("     gs_call += '~r~n10'                 ")
			wf_scriptview("     Call u_cst_l2`cb_1::ue_post         ")
			wf_scriptview("     gs_call += '~r~n11'                 ")
			wf_scriptview("     Call u_cst_l3`cb_1::ue_trigger      ")
			wf_scriptview("     gs_call += '~r~n12'                 ")
			wf_scriptview("     Call u_cst_l3`cb_1::ue_post         ")
			wf_scriptview("     //Call Super                        ")
			wf_scriptview("     gs_call += '~r~n13'                 ")
			wf_scriptview("     Call Super::ue_trigger              ")
			wf_scriptview("     gs_call += '~r~n14'                 ")
			wf_scriptview("     Call Super::ue_post                 ")
			wf_scriptview("}                                        ")

			
		End If

	Case 'INH501W01P008'
		If ab_execute Then
			//Call Ancestor with SUPER of keyword
			gs_call = ''
			uo_test.cb_1.event ue_call_8()
			wf_output('//Call Ancestor with SUPER of keyword',True)
			wf_output(gs_call,False)			
		Else
			wf_scriptview("//Call Ancestor with SUPER of keyword                  ")
			wf_scriptview("gs_call = ''                                           ")
			wf_scriptview("uo_test.cb_1.event ue_call_8()                         ")
			wf_scriptview("wf_output('//Call Ancestor with SUPER of keyword',True)")
			wf_scriptview("wf_output(gs_call,False)                               ")
			
			wf_scriptview("                                                ")
			wf_scriptview("Ue_Call_8() Script View//Ê¹ÓÃ Supper ¹Ø¼ü×Ö     ")
			wf_scriptview("{                                               ")
			wf_scriptview("     gs_call += '~r~n01'                        ")
			wf_scriptview("     super::of_trigger()                        ")
			wf_scriptview("     gs_call += '~r~n02'                        ")
			wf_scriptview("     super::EVENT ue_trigger()                  ")
			wf_scriptview("     gs_call += '~r~n03'                        ")
			wf_scriptview("     super::FUNCTION of_trigger()               ")
			wf_scriptview("     gs_call += '~r~n04'                        ")
			wf_scriptview("     super::TRIGGER of_trigger()                ")
			wf_scriptview("     gs_call += '~r~n05'                        ")
			wf_scriptview("     super::POST of_post()                      ")
			wf_scriptview("     gs_call += '~r~n06'                        ")
			wf_scriptview("     super::of_trigger_arg('1')                 ")
			wf_scriptview("     gs_call += '~r~n07'                        ")
			wf_scriptview("     super::EVENT TRIGGER ue_trigger()          ")
			wf_scriptview("     gs_call += '~r~n08'                        ")
			wf_scriptview("     super::EVENT POST ue_post()                ")
			wf_scriptview("     gs_call += '~r~n09'                        ")
			wf_scriptview("     super::FUNCTION TRIGGER of_trigger()       ")
			wf_scriptview("     gs_call += '~r~n10'                        ")
			wf_scriptview("     super::FUNCTION POST of_post()             ")
			wf_scriptview("     gs_call += '~r~n11'                        ")
			wf_scriptview("     super::EVENT ue_trigger_arg('1')           ")
			wf_scriptview("     gs_call += '~r~n12'                        ")
			wf_scriptview("     super::FUNCTION of_trigger_arg('1')        ")
			wf_scriptview("     gs_call += '~r~n13'                        ")
			wf_scriptview("     super::TRIGGER of_trigger_arg('1')         ")
			wf_scriptview("     gs_call += '~r~n14'                        ")
			wf_scriptview("     super::POST of_post_arg('1')               ")
			wf_scriptview("     gs_call += '~r~n15'                        ")
			wf_scriptview("     super::EVENT TRIGGER ue_trigger_arg('1')   ")
			wf_scriptview("     gs_call += '~r~n16'                        ")
			wf_scriptview("     super::EVENT POST ue_post_arg('1')         ")
			wf_scriptview("     gs_call += '~r~n17'                        ")
			wf_scriptview("     super::FUNCTION TRIGGER of_trigger_arg('1')")
			wf_scriptview("     gs_call += '~r~n18'                        ")
			wf_scriptview("     super::FUNCTION POST of_post_arg('1')      ")
			wf_scriptview("}                                               ")
			
		End If

	Case 'INH501W01P009'
		If ab_execute Then
			//Call Ue_Post()
			gs_call = ''
			uo_test.cb_1.event ue_post()
			wf_output('//Call Ue_Post() ',True)
			wf_output(gs_call,False)			
		Else
			wf_scriptview("//Call Ue_Post()                   ")
			wf_scriptview("gs_call = ''                       ")
			wf_scriptview("uo_test.cb_1.event ue_post()       ")
			wf_scriptview("wf_output('//Call Ue_Post() ',True)")
			wf_scriptview("wf_output(gs_call,False)           ")
		End If

	Case 'INH501W01P010'
		If ab_execute Then
			//Call Ue_Post_arg()
			gs_call = ''
			uo_test.cb_1.event ue_post_arg('1')
			wf_output('//Call Ue_Post_arg() ',True)
			wf_output(gs_call,False)			
		Else
			wf_scriptview("//Call Ue_Post_arg()                   ")
			wf_scriptview("gs_call = ''                           ")
			wf_scriptview("uo_test.cb_1.event ue_post_arg('1')    ")
			wf_scriptview("wf_output('//Call Ue_Post_arg() ',True)")
			wf_scriptview("wf_output(gs_call,False)               ")
		End If

	Case 'INH501W01P011'
		If ab_execute Then
			//Call Ue_Trigger()
			gs_call = ''
			uo_test.cb_1.event ue_trigger()
			wf_output('//Call Ue_Trigger() ',True)
			wf_output(gs_call,False)			
		Else
			wf_scriptview("//Call Ue_Trigger()                    ")
			wf_scriptview("gs_call = ''                           ")
			wf_scriptview("uo_test.cb_1.event ue_trigger()        ")
			wf_scriptview("wf_output('//Call Ue_Trigger() ',True) ")
			wf_scriptview("wf_output(gs_call,False)               ")
		End If

	Case 'INH501W01P012'
		If ab_execute Then
			////Call Ue_Trigger_arg()
			gs_call = ''
			uo_test.cb_1.event ue_trigger_arg('1')
			wf_output('//Call Ue_Trigger_arg() ',True)
			wf_output(gs_call,False)			
		Else
			wf_scriptview("////Call Ue_Trigger_arg()                 ")
			wf_scriptview("gs_call = ''                              ")
			wf_scriptview("uo_test.cb_1.event ue_trigger_arg('1')    ")
			wf_scriptview("wf_output('//Call Ue_Trigger_arg() ',True)")
			wf_scriptview("wf_output(gs_call,False)                  ")
		End If
	Case 'INH501W01P013'
		If ab_execute Then
			//
			gs_call = ''
			uo_test.cb_1.event ue_callsuper()
			wf_output('//Call Ue_Trigger_arg() ',True)
			wf_output(gs_call,False)			
		Else
			
		End If
	Case Else
	 	MessageBox("Error","This Point Not Coding",Exclamation!)
End Choose

//BEGIN_SCRIPTEXE
if ab_Execute then wf_SaveTempResult(ai_Item)
//END_SCRIPTEXE
end subroutine

public subroutine wf_init_items ();////////////////////////////////////////////////////////////////
//Function : wf_init_items ; Initialization ListBox Items
//Argument : none
//Output   : none
//Designer : 
//Date     :
////////////////////////////////////////////////////////////////

lb_items.Reset()
//script below  use to add test item into listbox control

lb_items.additem("INH501W01P001: Call Ue_Call_1()")
lb_items.additem("INH501W01P002: Call Ue_Call_2()")
lb_items.additem("INH501W01P003: Call Ue_Call_3()")
lb_items.additem("INH501W01P004: Call Ue_Call_4()")
lb_items.additem("INH501W01P005: Call Ue_Call_5()")
lb_items.additem("INH501W01P006: Call Ue_Call_6()")
lb_items.additem("INH501W01P007: Call Ue_Call_7()")
lb_items.additem("INH501W01P008: Call Ue_Call_8()")
lb_items.additem("INH501W01P009: Call Ue_Post()")
lb_items.additem("INH501W01P010: Call Ue_Post_arg()")
lb_items.additem("INH501W01P011: Call Ue_Trigger()")
lb_items.additem("INH501W01P012: Call Ue_Trigger_arg")
lb_items.additem("INH501W01P013: Call super system function and event")

end subroutine

public function integer wf_createresultset ();//start:public function integer wf_createresultset ()
string ls_Syntax
string ls_ErrorMesg
string ls_SQLSelect
string ls_WinName

// Not connected TQMS DB
if not gb_COTDBConnected then Return -1

// Refresh data
if IsValid(ids_TestPoint) then
	ids_TestPoint.Retrieve()
	ids_ResultDetailTemp.Retrieve()
	Return 1
end if

// Get WindowID
if il_WindowID=-1 then
	ls_WinName = Lower(this.ClassName())
	SELECT WindowId INTO :il_WindowID FROM TestWindow WHERE SwName = :ls_WinName using gtr_COTDB;
	if gtr_COTDB.SQLCode<>0 or gtr_COTDB.SQLNRows<>1 then Return -1
end if

// TestPoint
ls_WinName = Lower(this.ClassName())
ls_SQLSelect =	"SELECT TestPointId = TestPoint.TestPointId, TPNO = TestPoint.TPNO, ExpectValue = TestPoint.ExpectValue " + &
					"FROM   TestPoint, TestWindow " + &
					"WHERE  ( TestPoint.WindowId = TestWindow.WindowId ) AND ( TestPoint.is_valid = '1' ) AND " + &
				 			 "( Lower(TestWindow.SwName) = '" + ls_WinName + "')"
ls_Syntax = gtr_COTDB.SyntaxFromSQL(ls_SQLSelect, "", ls_ErrorMesg)
if Len(ls_ErrorMesg)>0 then Return -1
ids_TestPoint = Create DataStore
ids_TestPoint.Create(ls_Syntax)
ids_TestPoint.SetTransObject(gtr_COTDB)
ids_TestPoint.Retrieve()
ids_TestPoint.SetSort("TPNO A")
ids_TestPoint.Sort()

// ResultDetailTemp
ls_SQLSelect = "SELECT * FROM ResultDetailTemp WHERE " + &
					"version = " + String(gi_COTVersion) + " AND " + &
					"Envi = '" + gs_COTEnvironment + "' AND " + &
					"WindowID = " + String(il_WindowID)
ls_Syntax = gtr_COTDB.SyntaxFromSQL(ls_SQLSelect, "", ls_ErrorMesg)
if Len(ls_ErrorMesg)>0 then
	Destroy ids_TestPoint
	Return -1
end if
ids_ResultDetailTemp = Create DataStore
ids_ResultDetailTemp.Create(ls_Syntax)
ids_ResultDetailTemp.SetTransObject(gtr_COTDB)
ids_ResultDetailTemp.Retrieve()

Return 1
//end:public function integer wf_createresultset ()
end function

public function integer wf_savetempresult (long al_row);//start:public function integer wf_savetempresult (long al_row)
long   ll_FindRow
long   ll_InsertRow
long   ll_TestpointId
string ls_ExpectValue
string ls_TrueValue
string ls_WinName
DateTime ldt_SaveTime

// Not connected TQMS DB
if not gb_COTDBConnected then Return -1

// Check WindowID
if il_WindowID=-1 then Return -1

// Save temp result
SELECT GetDate() INTO :ldt_SaveTime FROM sysdual using gtr_COTDB;
ll_TestpointId = ids_TestPoint.GetItemNumber(al_Row, "TestpointId")
ls_ExpectValue = ids_TestPoint.GetItemString(al_Row, "ExpectValue")
if IsNull(ls_ExpectValue) then ls_ExpectValue = ""

ll_FindRow = ids_ResultDetailTemp.Find("TestpointId=" + String(ll_TestpointId),1,ids_ResultDetailTemp.RowCount())
if ll_FindRow<=0 then
	ll_InsertRow = ids_ResultDetailTemp.InsertRow(0)
	ids_ResultDetailTemp.SetItem(ll_InsertRow, "TestpointId", ll_TestpointId)
	ids_ResultDetailTemp.SetItem(ll_InsertRow, "Envi", gs_COTEnvironment)
	ids_ResultDetailTemp.SetItem(ll_InsertRow, "version", gi_COTVersion)
	ids_ResultDetailTemp.SetItem(ll_InsertRow, "WindowID", il_WindowID)	
	ll_FindRow = ll_InsertRow
end if

ls_TrueValue = mle_output.Text
ids_ResultDetailTemp.SetItem(ll_FindRow, "TrueValue", ls_TrueValue)
ids_ResultDetailTemp.SetItem(ll_FindRow, "ExpectValue", ls_ExpectValue)
ids_ResultDetailTemp.SetItem(ll_FindRow, "SaveTime", ldt_SaveTime)
if ls_TrueValue=ls_ExpectValue then	
	ids_ResultDetailTemp.SetItem(ll_FindRow, "status", "1")
else
	ids_ResultDetailTemp.SetItem(ll_FindRow, "status", "0")
end if

if ids_ResultDetailTemp.Update()=1 then
	Commit using gtr_COTDB;
	if not gb_COTAutoRun and IsValid(w_pbvsjs) then
		w_pbvsjs.wf_Retrieve(this.ClassName())
		w_pbvsjs.dw_result.ScrollToRow(al_Row)
		w_pbvsjs.dw_result.SelectRow(0, false)
		w_pbvsjs.dw_result.SelectRow(al_Row, true)
	end if	
	Return 1
else
	Rollback using gtr_COTDB;
	ids_ResultDetailTemp.ResetUpdate()
	Return -1
end if
//end:public function integer wf_savetempresult (long al_row)
end function

on w_inh501w01_callancestor.create
this.uo_test=create uo_test
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_execute=create cb_execute
this.lb_items=create lb_items
this.cb_clear=create cb_clear
this.cb_close=create cb_close
this.mle_output=create mle_output
this.mle_view=create mle_view
this.gb_3=create gb_3
this.gb_4=create gb_4
this.gb_5=create gb_5
this.mle_describe=create mle_describe
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.uo_test,&
this.cb_3,&
this.cb_2,&
this.cb_execute,&
this.lb_items,&
this.cb_clear,&
this.cb_close,&
this.mle_output,&
this.mle_view,&
this.gb_3,&
this.gb_4,&
this.gb_5,&
this.mle_describe,&
this.gb_1,&
this.gb_2}
end on

on w_inh501w01_callancestor.destroy
destroy(this.uo_test)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_execute)
destroy(this.lb_items)
destroy(this.cb_clear)
destroy(this.cb_close)
destroy(this.mle_output)
destroy(this.mle_view)
destroy(this.gb_3)
destroy(this.gb_4)
destroy(this.gb_5)
destroy(this.mle_describe)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;//Add Describe
Wf_Describe()
//Init ListBox to add Test Items
Wf_Init_Items()


//cb_clear.Event post Clicked()

//start:event open
wf_CreateResultSet()
//end:event open
end event

event closequery;//If IsValid(iuo_ds) Then destroy iuo_ds

//start:event close
if IsValid(ids_TestPoint) then Destroy ids_TestPoint
if IsValid(ids_ResultDetailTemp) then Destroy ids_ResultDetailTemp
//end:event close
end event

type uo_test from u_cst_l3 within w_inh501w01_callancestor
integer x = 439
integer y = 224
integer taborder = 20
boolean border = true
end type

on uo_test.destroy
call u_cst_l3::destroy
end on

type cb_3 from commandbutton within w_inh501w01_callancestor
integer x = 453
integer y = 2152
integer width = 402
integer height = 112
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "View Result"
end type

event clicked;if gb_COTDBConnected then
	gw_COTCurrentWin = Parent
	if not IsValid(w_pbvsjs) then Open(w_pbvsjs)
	w_pbvsjs.wf_Retrieve(Parent.ClassName())
else
	this.Enabled = false
end if
end event

type cb_2 from commandbutton within w_inh501w01_callancestor
integer x = 32
integer y = 2152
integer width = 402
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Auto Run"
end type

event clicked;Parent.TriggerEvent("ue_RunAll")
end event

type cb_execute from commandbutton within w_inh501w01_callancestor
integer x = 2437
integer y = 2140
integer width = 448
integer height = 128
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Execute"
end type

event clicked;lb_items.Event DoublecLicked(lb_items.SelectedIndex())
end event

type lb_items from listbox within w_inh501w01_callancestor
integer x = 59
integer y = 708
integer width = 1797
integer height = 736
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
boolean sorted = false
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;//Execute Script
IF index > 0 THEN
	wf_Scriptexe(lb_items.selectedindex(),True)
END IF
end event

event selectionchanged;//View Script
IF index > 0 THEN
	mle_view.text = ''
	wf_Scriptexe(lb_items.selectedindex(),False)
END IF
end event

type cb_clear from commandbutton within w_inh501w01_callancestor
integer x = 2903
integer y = 2140
integer width = 448
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Clear"
end type

event clicked;ii_index = 0
mle_output.text=''
mle_view.text = ""
end event

type cb_close from commandbutton within w_inh501w01_callancestor
integer x = 3369
integer y = 2140
integer width = 448
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Close"
end type

event clicked;close(parent)
end event

type mle_output from multilineedit within w_inh501w01_callancestor
integer x = 69
integer y = 1548
integer width = 3771
integer height = 532
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
boolean autohscroll = true
boolean autovscroll = true
borderstyle borderstyle = stylelowered!
end type

type mle_view from multilineedit within w_inh501w01_callancestor
integer x = 1970
integer y = 720
integer width = 1851
integer height = 724
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
boolean autohscroll = true
boolean autovscroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_3 from groupbox within w_inh501w01_callancestor
integer x = 27
integer y = 648
integer width = 1861
integer height = 824
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Test Items"
end type

type gb_4 from groupbox within w_inh501w01_callancestor
integer x = 1934
integer y = 648
integer width = 1929
integer height = 820
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Script View"
end type

type gb_5 from groupbox within w_inh501w01_callancestor
integer x = 27
integer y = 1484
integer width = 3854
integer height = 624
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "OutPut"
end type

type mle_describe from multilineedit within w_inh501w01_callancestor
integer x = 2011
integer y = 64
integer width = 1792
integer height = 544
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
boolean autohscroll = true
boolean autovscroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_inh501w01_callancestor
integer x = 1938
integer width = 1902
integer height = 640
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Description"
end type

type gb_2 from groupbox within w_inh501w01_callancestor
integer x = 27
integer y = 32
integer width = 1865
integer height = 608
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Use Object"
end type

