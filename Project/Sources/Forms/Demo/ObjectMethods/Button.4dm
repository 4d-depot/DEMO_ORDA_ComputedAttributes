var $p : Integer

$p:=FORM Get current page:C276
If ($p>2)
	$p:=$p-1
	HelpGoto($p)
End if 