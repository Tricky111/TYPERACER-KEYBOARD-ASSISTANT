        local composer = require( "composer" )
 
local InstructionsScene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
 
 
 
-- -----------------------------------------------------------------------------------
-- scene event functions
-- -----------------------------------------------------------------------------------
 

-- create()
function InstructionsScene:create( event )
 
    local scene2Group = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
 
end
 
 
-- show()
function InstructionsScene:show( event )
 
    local scene2Group = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
        --hides the status bar
        display.setStatusBar(display.HiddenStatusBar)
        --background
        local background = display.newRect(0, 0, 4000, 4000)
        background:setFillColor( 40/255, 0/255, 0/255)
        scene2Group:insert(background)

        PlayerName=event.params[1]

        --text
        local text = display.newText( "Hello "..PlayerName.."\rPlease Read The Instructions" , 385, 30, "Impact", 50 )
        text:setFillColor(  100/255, 250/255, 0/255 )
        scene2Group:insert(text)

        local text23 = display.newText( "You will have \r  to type keys \r as fast as you can \r You will be able \r to see your time \rand your score once you finish" , 385, 400, "Impact", 60 )
        text23:setFillColor(  100/255, 250/255, 0/255 )
        scene2Group:insert(text23)

        --enterbutton
        local enterButton = display.newImageRect( "ok.png", 200, 120 )
        enterButton.x = 680
        enterButton.y = 1120
        scene2Group:insert(enterButton)

        --go to scene function
        function GoToGame1 (event)
              if event.phase == "ended" then

                local options = {

                    params = {PlayerName}
                        }
                        
    enterButton:removeSelf()
     enterButton = nil
            composer.gotoScene( "CounterScene", options )
          
        end
end

        enterButton:addEventListener( "touch", GoToGame1 )
    -- elseif ( phase == "did" ) then


    end
end

 
 
-- -----------------------------------------------------------------------------------
-- scene event function listeners
-- -----------------------------------------------------------------------------------
InstructionsScene:addEventListener( "create", InstructionsScene )
InstructionsScene:addEventListener( "show", InstructionsScene )
-- -----------------------------------------------------------------------------------
 
return InstructionsScene