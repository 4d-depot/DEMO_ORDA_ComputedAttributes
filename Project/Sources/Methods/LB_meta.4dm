//%attributes = {}
#DECLARE($id : Integer)

C_OBJECT:C1216($0)
C_OBJECT:C1216($meta)

$meta:=New object:C1471
If (This:C1470.gender)  //ID is an attribute of collection objects/entities
	$meta.cell:=New object:C1471("genderCol"+String:C10($id); New object:C1471("stroke"; "fuchsia"))
Else 
	$meta.cell:=New object:C1471("genderCol"+String:C10($id); New object:C1471("stroke"; "Blue"))
End if 

$0:=$meta