//%attributes = {"invisible":true}
C_OBJECT:C1216($_wifes; $_husbands)
C_OBJECT:C1216($wife; $husband)
C_DATE:C307($date1; $date2)
C_LONGINT:C283($h)

var $progressID : Integer
var $i; $n : Integer

// select woman over 20 years old without partner
$date1:=Add to date:C393(Current date:C33; -18; 0; 0)

$_wifes:=ds:C1482.people.query("gender = True and partnerID is null and birthday <= :1"; $date1)

$progressID:=Progress New
Progress SET PROGRESS($progressID; -1)
Progress SET TITLE($progressID; "Setup couples")

$i:=0
$n:=$_wifes.length

For each ($wife; $_wifes)
	$i:=$i+1
	If (($i%10)=0)
		Progress SET PROGRESS($progressID; $i/$n)
	End if 
	
	$date1:=Add to date:C393($wife.birthday; -2; 0; 0)
	$date2:=Add to date:C393($wife.birthday; 2; 0; 0)
	
	$_husbands:=ds:C1482.people.query("gender=False and partnerID is null and birthday >= :1 and birthday <= :2"; $date1; $date2)
	//"PartnerID=0" instead of "Partner = null" because "Partner = null" does not work (yet)
	
	$h:=$_husbands.length
	
	If ($h>0)
		$husband:=$_husbands[Random:C100%$h]
		$wife.partner:=$husband
		$husband.partner:=$wife
		
		$wife.save()
		$husband.save()
	End if 
	
End for each 

Progress QUIT($progressID)
