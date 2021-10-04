//var $p : Pointer
//var $DBinfo : Text

//Case of 
//: (Form event code=On Load)


//If (Form.peopleCount#0)

//OBJECT SET VISIBLE(*; "moreData"; True)
//$DBinfo:=Get localized string("DBinfo")
//$DBinfo:=Replace string($DBinfo; "<1>"; String(Form.peopleCount))
//Form.DBinfo:=$DBinfo

//End if 


//: (Form event code=On Page Change)

//$p:=OBJECT Get pointer(Object named; "rBtn2")
//$p->:=1
//Form.howMany:=5000

//End case 


