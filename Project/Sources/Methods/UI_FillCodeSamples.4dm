//%attributes = {"invisible":true}
var $_codeSamples : Collection
var $_codes : Collection
var $code : Object
var $text4DCode : Text
var $p : Integer
var $fullClassCode : Text



METHOD GET CODE:C1190("[class]/peopleEntity"; $fullClassCode; 0)




Form:C1466.codeSamples:=New object:C1471

$_codes:=New collection:C1472

$code:=New object:C1471()
$code.name:="getGenderSymbol"
$code.title:="get genderSymbol"
$code.path:="[class]/peopleEntity/get genderSymbol"
$_codes.push($code)


$code:=New object:C1471()
$code.name:="getFullname"
$code.title:="get fullname"
$code.path:="[class]/peopleEntity/get fullname"
$_codes.push($code)

$code:=New object:C1471()
$code.name:="setFullname"
$code.title:="set fullname"
$code.path:="[class]/peopleEntity/set fullname"
$_codes.push($code)

$code:=New object:C1471()
$code.name:="getPortrait"
$code.title:="get portrait"
$code.path:="[class]/peopleEntity/get portrait"
$_codes.push($code)

$code:=New object:C1471()
$code.name:="getAge"
$code.title:="get age"
$code.path:="[class]/peopleEntity/get age"
$_codes.push($code)


$code:=New object:C1471()
$code.name:="getFullAddress"
$code.title:="get fullAddress"
$code.path:="[class]/peopleEntity/get fullAddress"
$_codes.push($code)

$code:=New object:C1471()
$code.name:="getParents"
$code.title:="get parents"
$code.path:="[class]/peopleEntity/get parents"
$_codes.push($code)

$code:=New object:C1471()
$code.name:="getChildren"
$code.title:="get children"
$code.path:="[class]/peopleEntity/get children"
$_codes.push($code)

$code:=New object:C1471()
$code.name:="getSiblings"
$code.title:="get siblings"
$code.path:="[class]/peopleEntity/get siblings"
$_codes.push($code)

$code:=New object:C1471()
$code.name:="orderByGenderSymbol"
$code.title:="orderBy genderSymbol"
$code.path:="[class]/peopleEntity/orderBy genderSymbol"
$_codes.push($code)

$code:=New object:C1471()
$code.name:="orderByFullname"
$code.title:="orderBy fullname"
$code.path:="[class]/peopleEntity/orderBy fullname"
$_codes.push($code)

$code:=New object:C1471()
$code.name:="orderByAge"
$code.title:="orderBy age"
$code.path:="[class]/peopleEntity/orderBy age"
$_codes.push($code)

$code:=New object:C1471()
$code.name:="queryFullname"
$code.title:="query fullname"
$code.path:="[class]/peopleEntity/query fullname"
$_codes.push($code)

$code:=New object:C1471()
$code.name:="queryAge"
$code.title:="query age"
$code.path:="[class]/peopleEntity/query age"
$_codes.push($code)

For each ($code; $_codes)
	
	METHOD GET CODE:C1190($code.path; $text4DCode; 0)
	$p:=Position:C15("\r"; $text4DCode)
	$text4DCode:=Substring:C12($text4DCode; $p+2)
	While (Substring:C12($text4DCode; 1; 1)="\r")
		$text4DCode:=Substring:C12($text4DCode; 2)
	End while 
	
	// extend title to full header code
	$p:=Position:C15($code.title; $fullClassCode)
	If ($p>0)
		$code.title:="function "+Substring:C12($fullClassCode; $p; (Position:C15("\r"; $fullClassCode; $p+1))-$p)
	End if 
	
	
	Form:C1466.codeSamples[$code.name]:=$text4DCode
	Form:C1466.codeSamples[$code.name+"Path"]:=$code.path
	Form:C1466.codeSamples[$code.name+"Title"]:=$code.title
	
End for each 
