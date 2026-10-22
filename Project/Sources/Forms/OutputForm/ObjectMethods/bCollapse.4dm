

var $margin:=20

Case of 
		
	: (Form event code=On Clicked)
		var $l; $t; $r; $b; $lf; $tf; $rf; $bf : Integer
		
		If (Form.isCollapsed)
			//collapsed
			OBJECT GET COORDINATES(*; "bCollapse"; $l; $t; $r; $b)
			GET WINDOW RECT($lf; $tf; $rf; $bf; Current form window)
			SET WINDOW RECT($lf; $tf; $lf+$r+$margin; $bf; Current form window)
			
		Else 
			//expanded
			OBJECT GET COORDINATES(*; "controlPanel"; $l; $t; $r; $b)
			GET WINDOW RECT($lf; $tf; $rf; $bf; Current form window)
			SET WINDOW RECT($lf; $tf; $lf+$r+$margin; $tf+$b+$margin; Current form window)
		End if 
		
End case 