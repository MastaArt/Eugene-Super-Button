macroScript WF_S_T
Buttontext: "WayFair Setup Tools"
category:"[3DGROUND]"
toolTip:"WayFair Setup Tools"
Icon:#("UVWUnwrapView", 15)
(
	on execute do
	(
		szScript =  @"S:\00_Scripts\WayFair Setup Tools.ms"
		try(fileIn(szScript)) catch(messageBox "Script not found! Download WayFair Setup Tools again!" title: "Warning!")
	)
)

fn addQuadMenuButton macro cat txt remove: false =
(
	quadMenu = menuMan.getViewportRightClickMenu #nonePressed
	theMenu = quadMenu.getMenu 1

	fn findMenuItem theMenu menuName =
	(
		for i in 1 to theMenu.numItems() where (theMenu.getItem i).getTitle() == menuName do return i
		return 0
	)

	fn unregisterMenuItem theMenu menuName =
	(	
		try
		(
			for i in 1 to theMenu.numItems() do
			(
				if((theMenu.getItem i).getTitle() == menuName) do
				(
					theMenu.removeItemByPosition i 	

					if((theMenu.getItem (i - 1)).getIsSeparator()) do theMenu.removeItemByPosition (i - 1)
				)
			)
		)catch()
	)

	item = try(findMenuItem theMenu "Select &Similar")catch(6)

	unregisterMenuItem theMenu txt
	
	if(not remove) do
	(
		quadItem = menuMan.createActionItem macro (cat)
		
		theMenu.addItem quadItem (item += 1)
	)
		
	menuMan.updateMenuBar()
)

addQuadMenuButton "WF_S_T" "[3DGROUND]" "WayFair Setup Tools" remove: true
addQuadMenuButton "WF_S_T" "[3DGROUND]" "WayFair Setup Tools" remove: false

szScript =  @"S:\00_Scripts\WayFair Setup Tools.ms"
try(fileIn(szScript)) catch()