//%attributes = {"invisible":true,"preemptive":"incapable"}
var $person; $mother : Object
var $_people; $_mothers : Object
var $date1; $date2 : Date
var $m : Integer
var $formula : Object
var $progressID : Integer
var $i; $n : Integer

//$_people:=ds.people.all()  //query("age <= 60")
//$_people:=ds.PEOPLE.query("Father=0 or Mother=0")

$_people:=ds:C1482.people.query("father is null")

$progressID:=Progress New
Progress SET PROGRESS($progressID; -1)
Progress SET TITLE($progressID; "Setup famillies")

$i:=0
$n:=$_people.length


For each ($person; $_people)
	
	$i:=$i+1
	If (($i%10)=0)
		Progress SET PROGRESS($progressID; $i/$n)
	End if 
	
	$date1:=Add to date:C393($person.birthday; 0; 0; (30*365)*(-1))
	$date2:=Add to date:C393($person.birthday; 0; 0; (25*365)*(-1))
	$formula:=Formula:C1597(This:C1470.childrenAsMother.length<4)
	
	$_mothers:=ds:C1482.people.query("gender=True and birthday >= :1 and birthday <= :2 and :3"; $date1; $date2; $formula)
	
	$m:=$_mothers.length
	
	If ($m>0)
		
		$mother:=$_mothers[Random:C100%$m]
		$person.mother:=$mother
		If ($mother.partner#Null:C1517)
			$person.father:=$mother.partner
		End if 
		
		$person.save()
	End if 
	
End for each 

Progress QUIT($progressID)
