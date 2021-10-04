//%attributes = {}
//var $path : Text
//var $manSymbol; $womanSymbol : Picture

//$path:=Get 4D folder(Current resources folder)+"Images"+Folder separator

//READ PICTURE FILE($path+"Man.png"; $manSymbol)
//READ PICTURE FILE($path+"Woman.png"; $womanSymbol)

//Use (Storage)
//If (Undefined(Storage.symbols))
//Storage.symbols:=New shared object
//Use (Storage.symbols)
//Storage.symbols.manSymbol:=$manSymbol
//Storage.symbols.womanSymbol:=$womanSymbol
//End use 
//End if 
//End use 

