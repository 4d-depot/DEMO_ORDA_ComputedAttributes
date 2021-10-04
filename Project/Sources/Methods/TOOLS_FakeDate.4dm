//%attributes = {"invisible":true}
#DECLARE($minDate : Date; $maxDate : Date)->$date

var $delta : Integer

$minDate:=!1900-01-01!
$maxDate:=Current date:C33
$delta:=($maxDate-$minDate)/2
While ($delta>0)
	If (Random:C100>Random:C100)
		$minDate:=$minDate+$delta
	Else 
		$maxDate:=$maxDate-$delta
	End if 
	$delta:=($maxDate-$minDate)/2
End while 

$date:=$maxDate
