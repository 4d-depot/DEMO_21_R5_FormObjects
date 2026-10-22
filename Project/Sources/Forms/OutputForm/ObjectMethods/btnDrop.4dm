var $status : Object
If (Form.selectedOrder#Null)
	CONFIRM("Delete order "+Form.selectedOrder.orderNumber+"?")
	If (OK=1)
		$status:=Form.selectedOrder.drop(dk force drop if stamp changed)
		Form.orders:=ds.Order.all()
	End if 
End if 

