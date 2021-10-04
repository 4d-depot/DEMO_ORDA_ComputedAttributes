//%attributes = {"invisible":true,"preemptive":"capable"}

//$e:=ds.people.all().first()


$es:=ds:C1482.people.all().orderBy("birthday asc")

$n:=$es.length-1

While ($n>=0)
	
	$e:=$es[$n]
	$e.drop()
	
	$n:=$n-2
	
End while 