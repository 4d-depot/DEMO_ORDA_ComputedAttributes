//%attributes = {"invisible":true}
var $DBinfo : Text

If (Form event code:C388=On Load:K2:1)
	If (FORM Get color scheme:C1761="dark")
		
		OBJECT SET RGB COLORS:C628(*; "Background_Rect"; 0x00202020; 0x00202020)
		OBJECT SET RGB COLORS:C628(*; "Background_Query"; 0x00282828; 0x00282828)
		
	End if 
	
	Form:C1466.help1:=1
	$DBinfo:=Get localized string:C991("DBinfo")
	$DBinfo:=Replace string:C233($DBinfo; "<1>"; String:C10(ds:C1482.people.all().length))
	Form:C1466.DBinfo:=$DBinfo
	
	
	If (Is compiled mode:C492)
		
		OBJECT SET VISIBLE:C603(*; "HelpBulb@"; False:C215)
		
	Else 
		UI_FillCodeSamples
	End if 
	
End if 
