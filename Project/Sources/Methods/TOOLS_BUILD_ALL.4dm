//%attributes = {"invisible":true}
#DECLARE($count : Integer)

var $howMany; $step; $steps : Integer
var $progressID : Integer

If (Count parameters:C259=0)
	$howMany:=100
Else 
	$howMany:=$count/2  // FR + EN
End if 

$progressID:=Progress New
$steps:=6
$step:=0

$step:=$step+1

Progress SET PROGRESS($progressID; $step/$steps)
Progress SET TITLE($progressID; "Step "+String:C10($step)+" / "+String:C10($steps))

//TOOLS_Populate($howMany)

$step:=$step+1
Progress SET PROGRESS($progressID; $step/$steps)
Progress SET TITLE($progressID; "Step "+String:C10($step)+" / "+String:C10($steps))

TOOLS_RemoveAllRelations

$step:=$step+1
Progress SET PROGRESS($progressID; $step/$steps)
Progress SET TITLE($progressID; "Step "+String:C10($step)+" / "+String:C10($steps))

TOOLS_SetupCouples  // weddings for > 18 yo

$step:=$step+1
Progress SET PROGRESS($progressID; $step/$steps)
Progress SET TITLE($progressID; "Step "+String:C10($step)+" / "+String:C10($steps))

TOOLS_SetupFamilies  // (try to) find mother (and father) for everyone

$step:=$step+1
Progress SET PROGRESS($progressID; $step/$steps)
Progress SET TITLE($progressID; "Step "+String:C10($step)+" / "+String:C10($steps))

TOOLS_SetupFamilyNames  // set children names as father's name

$step:=$step+1
Progress SET PROGRESS($progressID; $step/$steps)
Progress SET TITLE($progressID; "Step "+String:C10($step)+" / "+String:C10($steps))

TOOLS_SetupDeathDate

Progress QUIT($progressID)


