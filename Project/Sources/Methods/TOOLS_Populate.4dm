//%attributes = {"invisible":true}
//#DECLARE($howMany : Integer)

//var $template; $e : Object
//var $loop; $i : Integer
//var $minDate; $maxDate : Date
//var $progressID : Integer

//$template:=New object

//$template.lastname:="lastname"
//$template.firstname:="firstname"

//$template.address:="address"
//$template.zipCode:="zipCode"
//$template.city:="city"
//$template.state:="state"
//$template.country:="country"
//$template.phone:="phone"
//$template.cellPhone:="phone"
//$template.company:="company"
//$template.email:="email"
//$template.gender:="gender"
//$template.birthday:="date"
//$template.portrait_0:="portrait0"
//$template.portrait_1:="portrait1"
//$template.portrait_2:="portrait2"
//$template.portrait_3:="portrait3"


//ARRAY TEXT($_formats; 40)
//$_formats{38}:="1900/01/01"+Char(Tab)+"2018/01/01"  // date will be generated between those dates

//$progressID:=Progress New

//For ($loop; 1; 2)

//If ($loop=1)
//FakeData_ArraysInit("FR"; ->$_formats)
//Progress SET TITLE($progressID; "Create FR data")
//Else 

//FakeData_ArraysInit("EN"; ->$_formats)
//Progress SET TITLE($progressID; "Create EN data")
//End if 


//$minDate:=!1900-01-01!
//$maxDate:=Current date

//Progress SET PROGRESS($progressID; 0)

//For ($i; 1; $howMany)

//If (($i%10)=0)
//Progress SET PROGRESS($progressID; $i/$howMany)
//End if 

//$e:=ds.people.new()
//FakeData_FillObjectTemplate($template; $e)
//$e.save()

//End for 

//End for 

//FakeData_ArraysDeinit

//Progress QUIT($progressID)
