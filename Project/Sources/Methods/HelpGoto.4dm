//%attributes = {"invisible":true,"preemptive":"incapable"}
#DECLARE($p : Integer)


var $page; $i : Integer
var $ptr : Pointer

If (Count parameters:C259>0)
	$page:=$p
Else 
	$page:=Num:C11(OBJECT Get name:C1087(Object current:K67:2))
End if 

FORM GOTO PAGE:C247($page)

If ($page>1)
	If (FORM Get color scheme:C1761="light")
		OBJECT SET VISIBLE:C603(*; "WhiteBlur"; True:C214)
	Else 
		OBJECT SET VISIBLE:C603(*; "BlackBlur"; True:C214)
	End if 
	OBJECT SET VISIBLE:C603(*; "HelpCircle@"; True:C214)
	
	For ($i; 2; 10)
		$ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "HelpCircle"+String:C10($i))
		$ptr->:=0
	End for 
	$ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "HelpCircle"+String:C10($page))
	$ptr->:=1
	
Else 
	OBJECT SET VISIBLE:C603(*; "WhiteBlur"; False:C215)
	OBJECT SET VISIBLE:C603(*; "BlackBlur"; False:C215)
	OBJECT SET VISIBLE:C603(*; "HelpCircle@"; False:C215)
End if 



