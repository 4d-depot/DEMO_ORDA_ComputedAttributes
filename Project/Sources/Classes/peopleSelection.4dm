// to be removed from Demo

Class extends EntitySelection


Function clearLinks
	var $e : Object
	
	For each ($e; This:C1470)
		$e.fatherID:=Null:C1517
		$e.motherID:=Null:C1517
		$e.partnerID:=Null:C1517
		$e.save()
	End for each 
	
	
Function clearDeathday
	var $e : Object
	For each ($e; This:C1470)
		$e.deathday:=Null:C1517
		$e.save()
	End for each 
	