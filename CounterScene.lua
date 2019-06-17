          local composer = require( "composer" )
 
local CounterScene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
 
 
 
-- -----------------------------------------------------------------------------------
-- scene event functions
-- -----------------------------------------------------------------------------------
 

-- create()
function CounterScene:create( event )
 
    local scene2Group = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
 
end
 
 
-- show()
function CounterScene:show( event )
 
    local scene2Group = self.view
    local phase = event.phase
    local stuff
 
    if ( phase == "will" ) then


    	PlayerName = event.params[1]

    	local text = display.newText( "Type the \r amount of letters \r you want to type" , 385, 70, "Impact", 100 )
        text:setFillColor(  100/255, 250/255, 0/255 )
        scene2Group:insert(text)

    	CounterTextField = native.newTextField( display.contentCenterX + 1, display.contentCenterY + 400, 600, 200 )
        CounterTextField.id = "CounterTextField"
        -- CounterTextField.text = NumberOfLetters
         scene2Group:insert(CounterTextField)




        

          local enterButton = display.newImageRect( "Enter.png", 200, 200 )
        enterButton.x = 400
        enterButton.y = 1100
        scene2Group:insert(enterButton)
     
        function GoToGame1 (event)
        	if event.phase == "ended" then

        		local numCount =CounterTextField.text
       			local options = {
        			params = {numCount,PlayerName}
        				}


        		-- print("1:"..CounterTextField.text)
        		-- print("2:"..numCount)
	            composer.gotoScene( "GameScene", options)
	            -- composer.setVariable( "NumberOfLetters", NumberOfLetters )
	            enterButton:removeSelf()
	     		enterButton = nil
	     		CounterTextField:removeSelf()

     		end
        end

enterButton:addEventListener( "touch", GoToGame1 )
return (NumberOfLetters)
    end
end

 
 
-- -----------------------------------------------------------------------------------
-- scene event function listeners
-- -----------------------------------------------------------------------------------

CounterScene:addEventListener( "create", CounterScene )
CounterScene:addEventListener( "show", CounterScene )
-- -----------------------------------------------------------------------------------
 
return CounterScene