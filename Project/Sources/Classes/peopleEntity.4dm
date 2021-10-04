Class extends Entity



Function clearLinks
	This:C1470.fatherID:=Null:C1517
	This:C1470.motherID:=Null:C1517
	This:C1470.partnerID:=Null:C1517
	
	//  ****************      GETTERS       ****************
	
	
Function get fullname($event : Object)->$fullname : Text
	
	Case of 
		: (This:C1470.firstname=Null:C1517) & (This:C1470.lastname=Null:C1517)
			$fullname:=""
		: (This:C1470.firstname=Null:C1517)
			$fullname:=This:C1470.lastname
		: (This:C1470.lastname=Null:C1517)
			$fullname:=This:C1470.firstname
		Else 
			$fullname:=This:C1470.firstname+" "+This:C1470.lastname
	End case 
	
	If (This:C1470.deathday#Null:C1517)
		$fullname:=$fullname+" (†"+String:C10(This:C1470.aged)+")"
	End if 
	
	
Function get fullAddress()->$result : Object
	
	$result:=New object:C1471
	
	$result.fullname:=This:C1470.fullname
	$result.address:=This:C1470.address
	$result.zipCode:=This:C1470.zipCode
	$result.city:=This:C1470.city
	$result.state:=This:C1470.state
	$result.country:=This:C1470.country
	
Function get age($event : Object)->$age : Integer
	
	If (This:C1470.birthday=!00-00-00!) | (This:C1470.birthday=Null:C1517)
		$event.result:=""
	Else 
		If (This:C1470.deathday=!00-00-00!) | (This:C1470.deathday=Null:C1517)
			$age:=Int:C8((Current date:C33-This:C1470.birthday)/365.25)
		Else 
			$event.result:=Null:C1517
		End if 
	End if 
	
Function get aged($event : Object)->$age : Integer
	
	If (This:C1470.birthday=!00-00-00!)
		$event.result:=""
	Else 
		If (This:C1470.deathday=!00-00-00!) | (This:C1470.deathday=Null:C1517)
			$event.result:=Null:C1517
		Else 
			$age:=Int:C8((This:C1470.deathday-This:C1470.birthday)/365.25)
		End if 
	End if 
	
Function get birthdayShort($event : Object)->$result : Text
	
	If (This:C1470.birthday=Null:C1517)
		$result:=""
	Else 
		$result:=String:C10(This:C1470.birthday; System date short:K1:1)
	End if 
	
Function get portrait($event : Object)->$portrait : Picture
	
	If (This:C1470.age#Null:C1517)  // based on current age for living persons
		Case of 
			: (This:C1470.age<20)  //
				$portrait:=This:C1470.portrait_0
			: (This:C1470.age<40)  //
				$portrait:=This:C1470.portrait_1
			: (This:C1470.age<60)  //
				$portrait:=This:C1470.portrait_2
			: (This:C1470.age>=60)
				$portrait:=This:C1470.portrait_3
		End case 
	Else   //  based on age of death for passed persons
		If (This:C1470.aged#Null:C1517)
			Case of 
				: (This:C1470.aged<20)  //
					$portrait:=This:C1470.portrait_0
				: (This:C1470.aged<40)  //
					$portrait:=This:C1470.portrait_1
				: (This:C1470.aged<60)  //
					$portrait:=This:C1470.portrait_2
				: (This:C1470.aged>=60)
					$portrait:=This:C1470.portrait_3
			End case 
		End if 
	End if 
	
	
	//Function get genderIcon()->$icon : Picture
	
	//If (This.gender=False)
	//$icon:=Storage.symbols.manSymbol
	//Else 
	//$icon:=Storage.symbols.womanSymbol
	//End if 
	
	
Function get genderSymbol()->$symbol : Text
	
	If (This:C1470.gender=False:C215)
		$symbol:=Char:C90(9794)  // manSymbol
	Else 
		$symbol:=Char:C90(9792)  // womanSymbol
	End if 
	
	
	// SINGLE ENTITIES
	
Function get fathersDad()->$fd : cs:C1710.peopleEntity
	$fd:=This:C1470.father.father
	
Function get fathersMum()->$fm : cs:C1710.peopleEntity
	$fm:=This:C1470.father.mother
	
	
	// ENTITY SELECTIONS
	
Function get parents()->$parents : cs:C1710.peopleSelection
	$parents:=ds:C1482.people.newSelection().or(This:C1470.father).or(This:C1470.mother)
	
Function get grandParents()->$grandParents : cs:C1710.peopleSelection
	//$grandParents:=This.parents.parents
	$grandParents:=ds:C1482.people.newSelection().or(This:C1470.parents.father).or(This:C1470.parents.mother)
	
Function get children()->$children : cs:C1710.peopleSelection
	$children:=ds:C1482.people.newSelection().or(This:C1470.childrenAsMother).or(This:C1470.childrenAsFather)
	
Function get siblings()->$siblings : cs:C1710.peopleSelection
	$siblings:=ds:C1482.people.newSelection().or(This:C1470.father.childrenAsFather).or(This:C1470.mother.childrenAsMother).minus(This:C1470)
	
Function get unclesAndAunts()->$uncleAunts : cs:C1710.peopleSelection
	$uncleAunts:=This:C1470.grandParents.childrenAsFather.or(This:C1470.grandParents.childrenAsMother).minus(This:C1470.parents)
	
Function get cousins()->$cousins : cs:C1710.peopleSelection
	$cousins:=This:C1470.unclesAndAunts.childrenAsFather.or(This:C1470.unclesAndAunts.childrenAsMother)
	
	
	//  ****************      SETTERS       ****************
	
Function set fullname($fullname : Text)  // ex : "Peter Paul/Smith(†36)"
	
	var $p : Integer
	$p:=Position:C15(" (†"; $fullname)  // deceased person
	If ($p>0)
		$fullname:=Substring:C12($fullname; 1; $p-1)  // remove "(†...)"
	End if 
	$p:=Position:C15("/"; $fullname)  // Pablo Antonio/de la Casa Del Mar
	If ($p<=0)
		$p:=Position:C15(" "; $fullname)  // John Smith
	End if 
	This:C1470.firstname:=Substring:C12($fullname; 1; $p-1)  // "" if $p<0
	This:C1470.lastname:=Substring:C12($fullname; $p+1)
	
	//  ****************      QUERIES      ****************
	
Function query fullname($event : Object)->$result : Object
	
	var $fullname; $firstname; $lastname; $query : Text
	var $operator : Text
	var $p : Integer
	var $parameters : Collection
	
	$operator:=$event.operator
	$fullname:=$event.value
	
	$p:=Position:C15(" "; $fullname)
	If ($p>0)
		$firstname:=Substring:C12($fullname; 1; $p-1)+"@"
		$lastname:=Substring:C12($fullname; $p+1)+"@"
		$parameters:=New collection:C1472($firstname; $lastname)
	Else 
		$fullname:=$fullname+"@"
		$parameters:=New collection:C1472($fullname)
	End if 
	
	Case of 
		: ($operator="==") | ($operator="===")
			If ($p>0)
				$query:="(firstname = :1 and lastname = :2) or (firstname = :2 and lastname = :1)"
			Else 
				$query:="firstname = :1 or lastname = :1"
			End if 
		: ($operator="!=")
			If ($p>0)
				$query:="firstname != :1 and lastname != :2 and firstname != :2 and lastname != :1"
			Else 
				$query:="firstname != :1 and lastname != :1"
			End if 
	End case 
	
	$result:=New object:C1471("query"; $query; "parameters"; $parameters)
	
	
Function query age($event : Object)->$result : Object
	
	var $operator : Text
	var $query : Text
	var $ph1; $ph2 : Text
	var $age; $i; $placeholderIndex : Integer
	var $_ages : Collection
	var $d1; $d2 : Date
	var $parameters : Collection
	
	$operator:=$event.operator
	$age:=Num:C11($event.value)  // integer
	$d1:=Add to date:C393(Current date:C33; -$age-1; 0; 0)
	$d2:=Add to date:C393($d1; 1; 0; 0)
	$parameters:=New collection:C1472(String:C10($d1; ISO date:K1:8); String:C10($d2; ISO date:K1:8))
	
	Case of 
		: ($operator="==")
			$query:="birthday > :1 and birthday <= :2"  // after d1 and before or egal d2
		: ($operator=">=")
			$query:="birthday <= :2"
		: ($operator=">")
			$query:="birthday <= :1"
		: ($operator="<=")
			$query:="birthday > :1"
		: ($operator="<")
			$query:="birthday > :2"
		: ($operator="!=")
			$query:="birthday <= :1 or birthday > :2"
		: ($operator="===")  // cherry on the cake :-)
			$query:="birthday = :2"
		Else 
			$event.result:=Null:C1517  // means : let 4d do the job !!!
	End case 
	
	If (Undefined:C82($event.result))  // ==> not created with NULL
		$result:=New object:C1471
		$result.query:=$query+" and deathday = null"
		$result.parameters:=$parameters
	End if 
	
	//  ****************      ORDER BY       ****************
	
	
Function orderBy fullname($event : Object)->$result : Text
	
	If ($event.descending)
		$result:="lastname desc, firstname desc"
	Else 
		$result:="lastname asc, firstname asc"
	End if 
	
	
Function orderBy age($event : Object)->$result : Text
	
	If ($event.descending)
		$result:="birthday asc"
	Else 
		$result:="birthday desc"
	End if 
	
	
Function orderBy genderSymbol($event : Object)->$result : Text
	
	If ($event.descending)
		$result:="gender asc"
	Else 
		$result:="gender desc"
	End if 
	