//%attributes = {}
C_LONGINT:C283($win)
C_OBJECT:C1216($form)

$win:=Open form window:C675("Introduction"; Modal form dialog box:K39:7; Horizontally centered:K39:1; Vertically centered:K39:4)

//$form:=New object
//$form.generateData:=False
//$form.peopleCount:=ds.people.all().length

DIALOG:C40("Introduction")  //; $form)
CLOSE WINDOW:C154

//If ($form.generateData=True)
//TOOLS_BUILD_ALL($form.howMany)
//End if 

$win:=Open form window:C675("Demo")
DIALOG:C40("Demo"; $form)
CLOSE WINDOW:C154


