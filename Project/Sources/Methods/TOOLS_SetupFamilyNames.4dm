//%attributes = {"invisible":true}
C_OBJECT:C1216($_fathers)
C_OBJECT:C1216($father)
C_OBJECT:C1216($_children)
C_OBJECT:C1216($child)

var $progressID : Integer
var $i; $n : Integer

$_fathers:=ds:C1482.people.query("gender=false")

$progressID:=Progress New
Progress SET PROGRESS($progressID; -1)
Progress SET TITLE($progressID; "Setup familly names")

$i:=0
$n:=$_fathers.length

For each ($father; $_fathers)
	
	$i:=$i+1
	If (($i%10)=0)
		Progress SET PROGRESS($progressID; $i/$n)
	End if 
	
	$_children:=$father.children
	For each ($child; $_children)
		
		$child.lastname:=$father.lastname
		$child.save()
		
	End for each 
End for each 

Progress QUIT($progressID)
