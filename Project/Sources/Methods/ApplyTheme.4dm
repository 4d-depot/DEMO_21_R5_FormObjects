//%attributes = {"invisible":true}
// Apply a theme to the current form and build the code shown in the panel.
// $state.theme  : "system", "roundedSystem", "blue", "grey" or "pop"
// $state.fields : object group that only gets a border color ("list@" or "input@")
// $state.code   : receives the code applied, for display
#DECLARE($state : Object)

var $themes : Object
If (FORM Get color scheme="light")
	$themes:={\
		blue: {font: "#0093F5"; fill: "#e3f2fd"; border: "#0093F5"; fieldBorder: "#8FC1FA"; internalGrid: "#e3f2fd"; radius: 8}; \
		grey: {font: "#000000"; fill: "#FFFFFF"; border: "#D0D5DD"; fieldBorder: "#D0D5DD"; internalGrid: "#D0D5DD"; radius: 4}; \
		pop: {font: "#FFFFFF"; fill: "#F3AA18"; border: "#F3AA18"; fieldBorder: "#FFE0CC"; internalGrid: "#FFE0CC"; radius: 14}\
		}
Else 
	$themes:={\
		blue: {font: "#4DB2FF"; fill: "#0D2A45"; border: "#4DB2FF"; fieldBorder: "#2F6FA8"; internalGrid: "#1B3A57"; radius: 8}; \
		grey: {font: "#FFFFFF"; fill: "#2C2C2E"; border: "#48484A"; fieldBorder: "#48484A"; internalGrid: "#3A3A3C"; radius: 4}; \
		pop: {font: "#FFFFFF"; fill: "#D98E04"; border: "#D98E04"; fieldBorder: "#5C3D12"; internalGrid: "#5C3D12"; radius: 14}\
		}
End if 
var $t : Object:=$themes[$state.theme]
var $fields : Text:=$state.fields

If ($t=Null)  // System or Rounded System
	var $rounded : Boolean:=($state.theme="roundedSystem")
	OBJECT SET FORMAT(*; "btn@"; ";;;;;;2")
	OBJECT SET BORDER STYLE(*; "btn@"; Border System)
	OBJECT SET RGB COLORS(*; "btn@"; Foreground color)
	OBJECT SET BORDER STYLE(*; "list@"; Border System)
	LISTBOX SET GRID COLOR(*; "list@"; Foreground color; True; True)
	OBJECT SET BORDER STYLE(*; "input@"; $rounded ? Border System Rounded : Border System)
	
	$state.code:="OBJECT SET BORDER STYLE(*; \"btn@\"; Border System)\r"+\
		"OBJECT SET BORDER STYLE(*; \""+$fields+"\"; "+\
		((($fields="input@") && $rounded) ? "Border System Rounded" : "Border System")+")"
	
Else 
	// Buttons: background, border and radius
	OBJECT SET FORMAT(*; "btn@"; ";;;;;;4")
	OBJECT SET BORDER STYLE(*; "btn@"; Border Custom)
	OBJECT SET RGB COLORS(*; "btn@"; $t.font; $t.fill; ""; $t.border)
	OBJECT SET CORNER RADIUS(*; "btn@"; $t.radius)
	
	// Other objects: border color
	OBJECT SET BORDER STYLE(*; $fields; Border Plain)
	OBJECT SET RGB COLORS(*; $fields; ""; ""; ""; $t.fieldBorder)
	If ($fields="list@")
		LISTBOX SET GRID COLOR(*; $fields; $t.internalGrid; True; True)
		OBJECT SET RGB COLORS(*; $fields; ""; ""; ""; $t.border)
	End if 
	
	$state.code:="// Buttons\r"+\
		"OBJECT SET BORDER STYLE(*; \"btn@\"; Border Custom)\r"+\
		"OBJECT SET RGB COLORS(*; \"btn@\"; \""+$t.font+"\"; \""+$t.fill+"\"; \"\"; \""+$t.border+"\")\r"+\
		"OBJECT SET CORNER RADIUS(*; \"btn@\"; "+String($t.radius)+")\r\r"+\
		"// "+(($fields="list@") ? "Listbox" : "Inputs")+"\r"+\
		"OBJECT SET BORDER STYLE(*; \""+$fields+"\"; Border Plain)\r"+\
		"OBJECT SET RGB COLORS(*; \""+$fields+"\"; \"\"; \"\"; \"\"; \""+$t.fieldBorder+"\")"
End if 

If ($fields="input@")
	var $name : Text
	var $left; $top; $right; $bottom; $bestWidth; $bestHeight; $i : Integer
	
	// Save/Cancel: taller with a custom theme, bottom-aligned
	var $height : Integer:=($t=Null) ? 24 : 32
	For each ($name; ["btnSave"; "btnCancel"])
		OBJECT GET COORDINATES(*; $name; $left; $top; $right; $bottom)
		OBJECT SET COORDINATES(*; $name; $left; $bottom-$height; $right; $bottom)
	End for each 
	
	// Inputs: best height with System, designed height (33) with a custom theme, top-aligned
	ARRAY TEXT($objects; 0)
	FORM GET OBJECTS($objects)
	For ($i; 1; Size of array($objects))
		If ($objects{$i}="input@")
			OBJECT GET COORDINATES(*; $objects{$i}; $left; $top; $right; $bottom)
			If ($t=Null)
				OBJECT GET BEST SIZE(*; $objects{$i}; $bestWidth; $bestHeight)
				$height:=$bestHeight
			Else 
				$height:=33
			End if 
			OBJECT SET COORDINATES(*; $objects{$i}; $left; $top; $right; $top+$height)
		End if 
	End for 
End if 
