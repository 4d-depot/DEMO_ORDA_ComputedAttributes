var $width; $height : Integer

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		PICTURE PROPERTIES:C457([people:1]portrait_0:9; $width; $height)
		Form:C1466.pictSize_0:=String:C10($width)+" x "+String:C10($height)
		
		PICTURE PROPERTIES:C457([people:1]portrait_1:10; $width; $height)
		Form:C1466.pictSize_1:=String:C10($width)+" x "+String:C10($height)
		
		PICTURE PROPERTIES:C457([people:1]portrait_2:11; $width; $height)
		Form:C1466.pictSize_2:=String:C10($width)+" x "+String:C10($height)
		
		PICTURE PROPERTIES:C457([people:1]portrait_3:12; $width; $height)
		Form:C1466.pictSize_3:=String:C10($width)+" x "+String:C10($height)
		
		
		
End case 