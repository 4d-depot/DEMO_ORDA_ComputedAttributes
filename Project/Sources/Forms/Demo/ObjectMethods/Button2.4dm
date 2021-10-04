vMs:=Milliseconds:C459

var $age : Integer
$age:=Form:C1466.age
If (Shift down:C543)
	Form:C1466.people:=ds:C1482.people.query("age is :1"; $age)
Else 
	Form:C1466.people:=ds:C1482.people.query("age = :1"; $age)
End if 

vMs:=Milliseconds:C459-vMs

LISTBOX SELECT ROW:C912(*; "LB1"; 1)