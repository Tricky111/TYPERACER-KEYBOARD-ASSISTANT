        local composer = require( "composer" )
 
local MainMenu = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
 
 
 
-- -----------------------------------------------------------------------------------
-- scene event functions
-- -----------------------------------------------------------------------------------
 

-- create()
function MainMenu:create( event )
 
    local scene2Group = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
 
end
 
 
-- show()
function MainMenu:show( event )
 
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

        --text
        local text = display.newText( "TypeRacer" , 400, 70, "Impact", 150 )
        text:setFillColor(  100/255, 250/255, 0/255 )
        scene2Group:insert(text)

        local text23 = display.newText( "Type your name in the text box" , 385, 750, "Impact", 60 )
        text23:setFillColor(  100/255, 250/255, 0/255 )
        scene2Group:insert(text23)

        --Textbox
         local EntryTextField = native.newTextField( display.contentCenterX + 1, display.contentCenterY + 400, 600, 200 )
        EntryTextField.id = "EntryTextField"
         scene2Group:insert(EntryTextField)

        --enterbutton
        local enterButton = display.newImageRect( "Enter.png", 200, 200 )
        enterButton.x = 400
        enterButton.y = 1100
        scene2Group:insert(enterButton)

         local enterButtontest123 = display.newImageRect( "KeyBoard123.png", 500, 500 )
        enterButtontest123.x = 400
        enterButtontest123.y = 400
        scene2Group:insert(enterButtontest123)


        --go to scene function
        function GoToGame1 (event)
                    if event.phase == "ended" then

                local PlayerName = EntryTextField.text
                local options = {
                    params = {PlayerName}
                        }
    enterButton:removeSelf()
     enterButton = nil
     EntryTextField:removeSelf()
     EntryTextField = nil
            composer.gotoScene( "InstructionsScene", options)
        
        
        end


         if ( scoresTable == nil or #scoresTable == 0 ) then
        scoresTable = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }
    
end
 
 
local function saveScores()
 
    for i = #scoresTable, 11, -1 do
        table.remove( scoresTable, i )
    end
 
    local file = io.open( filePath, "w" )
 
    if file then
        file:write( json.encode( scoresTable ) )
        io.close( file )
    end
end
        end

        enterButton:addEventListener( "touch", GoToGame1 )
    elseif ( phase == "did" ) then


    end
end
 
 
-- -----------------------------------------------------------------------------------
-- scene event function listeners
-- -----------------------------------------------------------------------------------
MainMenu:addEventListener( "create", MainMenu )
MainMenu:addEventListener( "show", MainMenu )
-- -----------------------------------------------------------------------------------
 
return MainMenu