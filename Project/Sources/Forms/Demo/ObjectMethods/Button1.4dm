vMs:=Milliseconds:C459

var $name : Text
$name:=Form:C1466.name


If (Shift down:C543)
	Form:C1466.people:=ds:C1482.people.query("fullname # :1"; $name)  //.orderBy("fullname asc")
Else 
	Form:C1466.people:=ds:C1482.people.query("fullname = :1"; $name)  //.orderBy("fullname asc")
End if 

vMs:=Milliseconds:C459-vMs

LISTBOX SELECT ROW:C912(*; "LB1"; 1)
