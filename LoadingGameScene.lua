local composer = require( "composer" )
 
local LoadingGameScene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
 
 
 
-- -----------------------------------------------------------------------------------
-- scene event functions
-- -----------------------------------------------------------------------------------
 

-- create()
function LoadingGameScene:create( event )
 
    local scene1Group = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
 
end
 
 
-- show()
function LoadingGameScene:show( event )
 
    local scene1Group = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)

        --hides the status bar
        display.setStatusBar(display.HiddenStatusBar)

        --background
        local background = display.newRect(0, 0, 4000, 4000)
        background:setFillColor( 40/255, 0/255, 0/255)
        scene1Group:insert(background)

        --Title1
        local text = display.newText( "TYPERACER" , 370, 70, "Impact", 120 )
        text:setFillColor(  100/255, 250/255, 0/255 )
        scene1Group:insert(text)

        --Title3
        local text2 = display.newText( "Loading Game..." , 379, 800, "Impact", 120 )
        text2:setFillColor( 100/255, 250/255, 0/255 )
        scene1Group:insert(text2)

        
        --loading icon spritesheet
        local loadingOptions =
        {
            width = 102,
            height = 102,
            numFrames = 8
        }
        local sheetIdleKnight = graphics.newImageSheet( "Loading.png",  loadingOptions )
        -- sequences table
        local sequence_data = {
            -- consecutive frames sequence
            {
                name = "idle",
                start = 1,
                count = 8,
                time = 500,
                loopCount = 10000,
                sheet = sheetIdleKnight
            },
        }
        
        
        --loading icon png
        loading = display.newSprite( sheetIdleKnight, sequence_data )
        loading.x = 350
        loading.y = 500
        loading.xScale = 300/102
        loading.yScale = 300/102
        scene1Group:insert(loading)

        loading:play()

    elseif ( phase == "did" ) then
        timer.performWithDelay(2000, function()
            composer.gotoScene( "MainMenuScene" )
        end
        )


    end
end
 
 

 
 
-- -----------------------------------------------------------------------------------
-- scene event function listeners
-- -----------------------------------------------------------------------------------
LoadingGameScene:addEventListener( "create", LoadingGameScene )
LoadingGameScene:addEventListener( "show", LoadingGameScene )
-- -----------------------------------------------------------------------------------
 
return LoadingGameScene