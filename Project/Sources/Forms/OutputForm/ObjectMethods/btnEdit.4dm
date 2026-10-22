If (Form.selectedOrder#Null)
	var $object:={entity: Form.selectedOrder; theme: Form.theme; radius: Form.radius}
	var $win : Integer
	$win:=Open form window("InputForm"; Movable form dialog box)
	DIALOG("InputForm"; $object)
	
	Form.theme:=$object.theme
	Form.radius:=$object.radius
	ApplyTheme(Form)
End if 
