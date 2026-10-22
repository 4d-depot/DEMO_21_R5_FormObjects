var $margin:=20
var $name : Text
var $item : Object
var $l; $t; $r; $b : Integer
var $ratio : Real

Case of
	: (Form event code=On Load)
		Form.orderNumber:=Form.entity.orderNumber
		Form.customer:=Form.entity.customer
		Form.status:=Form.entity.status
		Form.total:=Form.entity.total
		Form.date:=Form.entity.date
		Form.address:=Form.entity.address
		Form.notes:=Form.entity.notes

		// Theme inherited from the list form
		Form.fields:="input@"
		If (Form.theme=Null)
			Form.theme:="system"
		End if
		ApplyTheme(Form)

		Form.isCollapsed:=True

		// Design coordinates of the labels and inputs that scale with the window width
		Form.scaledObjects:=[]
		For each ($name; ["orderNumberLabel"; "inputOrderNumber"; "customerLabel"; "inputCustomer"; "MandatoryCustomer"; \
			"addressLabel"; "inputAddress"; "MandatoryAddress"; "notesLabel"; "inputNotes"; \
			"dateLabel"; "inputDate"; "MandatoryDate"; "statusLabel"; "inputStatus"; "MandatoryStatus"])
			OBJECT GET COORDINATES(*; $name; $l; $t; $r; $b)
			Form.scaledObjects.push({name: $name; left: $l; right: $r})
		End for each

		// bCollapse ("move") marks the right edge of the content area
		OBJECT GET COORDINATES(*; "bCollapse"; $l; $t; $r; $b)
		Form.designRight:=$r

	: (Form event code=On Resize)
		// Ratio between the current and the design width of the content area
		OBJECT GET COORDINATES(*; "bCollapse"; $l; $t; $r; $b)
		$ratio:=($r-$margin)/(Form.designRight-$margin)

		For each ($item; Form.scaledObjects)
			OBJECT GET COORDINATES(*; $item.name; $l; $t; $r; $b)
			OBJECT SET COORDINATES(*; $item.name; $margin+Round(($item.left-$margin)*$ratio; 0); $t; $margin+Round(($item.right-$margin)*$ratio; 0); $b)
		End for each

End case
