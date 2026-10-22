Case of 
	: (Form event code=On Load)
		If (ds.Order.all().length=0)
			GenerateData
		End if 
		Form.orders:=ds.Order.all()
		Form.selectedOrder:=Form.orders[0]
		
		Form.fields:="list@"
		Form.theme:="blue"
		ApplyTheme(Form)
		
		
		Form.isCollapsed:=True
		
	: (Form event code=On Double Clicked)
		If (Form.selectedOrder#Null)
			var $object:={entity: Form.selectedOrder; theme: Form.theme; radius: Form.radius}
			var $win : Integer
			$win:=Open form window("InputForm"; Movable form dialog box)
			DIALOG("InputForm"; $object)
			Form.orders:=ds.Order.all()
			Form.selectedOrder:=ds.Order.get($object.entity.ID)
			
			// Keep the theme chosen in the detail form
			Form.theme:=$object.theme
			ApplyTheme(Form)
		End if 
End case 
