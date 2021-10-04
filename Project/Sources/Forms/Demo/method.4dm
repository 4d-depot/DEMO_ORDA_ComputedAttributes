C_OBJECT:C1216(people)
Case of 
	: (Form event code:C388=On Load:K2:1)
		
		//https://en.wikipedia.org/wiki/Gender_symbol
		
		Form:C1466.people:=ds:C1482.people.all()  //query("birthday >= :1 and birthday < :2"; !1960-01-01!; !2000-01-01!).orderBy("birthday asc, lastname asc, firstname asc")
		
		Form:C1466.name:="A B"
		Form:C1466.age:=20
		
		Set_UI
		
		SET TIMER:C645(2*60)
		
	: (Form event code:C388=On Timer:K2:25)
		
		SET TIMER:C645(0)
		OBJECT SET VISIBLE:C603(*; "StartInfo@"; False:C215)  // panel over first listbox
		LISTBOX SELECT ROW:C912(*; "LB1"; 1)
		
End case 
