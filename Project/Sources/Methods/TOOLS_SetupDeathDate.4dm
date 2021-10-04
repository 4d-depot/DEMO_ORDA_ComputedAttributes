//%attributes = {"invisible":true,"preemptive":"incapable"}
var $_people : Object
var $person : Object
var $rnd; $days : Integer
var $deathDate : Date
var $progressID : Integer
var $i; $n : Integer

$_people:=ds:C1482.people.all()


$progressID:=Progress New
Progress SET PROGRESS($progressID; -1)
Progress SET TITLE($progressID; "Setup death date")

$i:=0
$n:=$_people.length

For each ($person; $_people)
	
	$i:=$i+1
	If (($i%10)=0)
		Progress SET PROGRESS($progressID; $i/$n)
	End if 
	
	$rnd:=Random:C100%100
	Case of 
		: ($rnd<20)  //20%
			// lived between 20 and 60 years
			$days:=(20*365)+(Random:C100*(40*365/32768))  // 20 years  + (0 up 40*365 days)
			
		: ($rnd>=90)  //10%
			// lived between 90 and 110 years
			$days:=(90*365)+(Random:C100*(20*365/32768))  // 90 years  + (0 up 40*365 days)
			
		Else   // 70%
			// lived between 60 and 90 years
			$days:=(60*365)+(Random:C100*(30*365/32768))  // 90 years  + (0 up 40*365 days)
	End case 
	
	$deathDate:=Add to date:C393($person.birthday; 0; 0; $days)
	If ($deathDate<=Current date:C33)
		$person.deathday:=$deathDate
	Else 
		$person.deathday:=Null:C1517
	End if 
	$person.save()
	
End for each 

Progress QUIT($progressID)
