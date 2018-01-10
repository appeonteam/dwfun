$PBExportHeader$n_supermenu_child.sru
$PBExportComments$super menu!(³¬¼¶²Ëµ¥)
forward
global type n_supermenu_child from n_supermenu
end type
end forward

global type n_supermenu_child from n_supermenu
end type

type prototypes
FUNCTION ulong LoadImage(ulong hInst,string lpsz,ulong un1,ulong n1,ulong n2,ulong un2) LIBRARY "user32.dll" ALIAS FOR "LoadImageB;Ansi"
end prototypes

on n_supermenu_child.create
call super::create
end on

on n_supermenu_child.destroy
call super::destroy
end on

