var $bError:=False

If (Form.customer="")
	OBJECT SET BORDER STYLE(*; "inputCustomer"; Border Plain)
	OBJECT SET RGB COLORS(*; "inputCustomer"; ""; ""; ""; 0x00FF0000)
	OBJECT SET VISIBLE(*; "MandatoryCustomer"; True)
	$bError:=True
End if 

If (Form.status="")
	OBJECT SET BORDER STYLE(*; "inputStatus"; Border Plain)
	OBJECT SET RGB COLORS(*; "inputStatus"; ""; ""; ""; 0x00FF0000)
	OBJECT SET VISIBLE(*; "MandatoryStatus"; True)
	$bError:=True
End if 

If (Form.date=!00-00-00!)
	OBJECT SET BORDER STYLE(*; "inputDate"; Border Plain)
	OBJECT SET RGB COLORS(*; "inputDate"; ""; ""; ""; 0x00FF0000)
	OBJECT SET VISIBLE(*; "MandatoryDate"; True)
	$bError:=True
End if 

If (Form.address="")
	OBJECT SET BORDER STYLE(*; "inputAddress"; Border Plain)
	OBJECT SET RGB COLORS(*; "inputAddress"; ""; ""; ""; 0x00FF0000)
	OBJECT SET VISIBLE(*; "MandatoryAddress"; True)
	$bError:=True
End if 


If ($bError=False)
	Form.entity.date:=Form.date
	Form.entity.status:=Form.status
	Form.entity.customer:=Form.customer
	Form.entity.address:=Form.address
	Form.entity.notes:=Form.notes
	Form.entity.save()
	ACCEPT
	
End if 