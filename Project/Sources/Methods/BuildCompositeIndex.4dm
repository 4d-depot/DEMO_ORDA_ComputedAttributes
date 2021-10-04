//%attributes = {"invisible":true}




ARRAY POINTER:C280($_p; 0)
APPEND TO ARRAY:C911($_p; ->[people:1]firstname:3)
APPEND TO ARRAY:C911($_p; ->[people:1]lastname:2)

CREATE INDEX:C966([people:1]; $_p; Standard BTree index:K58:3; "firstnameLastname")

ARRAY POINTER:C280($_p; 0)
APPEND TO ARRAY:C911($_p; ->[people:1]lastname:2)
APPEND TO ARRAY:C911($_p; ->[people:1]firstname:3)

CREATE INDEX:C966([people:1]; $_p; Standard BTree index:K58:3; "lastnameFirstname")


//$options:=New object
//$options.path:="DB"
//$o:=Get database measures($options)


