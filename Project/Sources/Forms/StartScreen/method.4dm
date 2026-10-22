// Navigation is handled by the two buttons on this screen.
Case of 
	: (Form event code=On Resize)
		GET WINDOW RECT($lf; $tf; $rf; $bf; Current form window)
		
		$width:=Round((Abs($lf-$rf)-60)/2; 0)
		$height:=Round(Abs($tf-$bf)-145-20; 0)
		
		OBJECT SET COORDINATES(*; "outputButton"; 20; 145; 20+$width; 145+$height)
		OBJECT SET COORDINATES(*; "dataButton"; $width+40; 145; $width+40+$width; 145+$height)
End case 
