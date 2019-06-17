local composer = require( "composer" )
--composer2 = setVariable( "NumberOfLetters", NumberOfLetters )
 
local GameScene = composer.newScene()

function GameScene:create( event)
 
    local scene1Group = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
 
end
 
 
-- show()
function GameScene:show( event )
 
    local scene1Group = self.view
    local phase = event.phase
-- numTable=event.params

NumberOfLetters=tonumber(event.params[1])
PlayerName=event.params[2]
-- print("number:"..NumberOfLetters)

    if ( phase == "will" ) then

    	-- print(NumberOfLetters)
    	-- return NumberOfLetters

background = display.newRect(0, 0, 4000, 4000)
  background:setFillColor( 0/255, 100/255, 255/255)
  scene1Group:insert(background)





--   CounterTextField = native.newTextField( display.contentCenterX, display.contentCenterY -100, 600, 200 )
--     CounterTextField.id = "CounterTextField"
--     CounterTextField.text = counterMax
--     scene1Group:insert(CounterTextField)


-- -- initialize variables

-- print(counterMax)

counter = 0 
Score = 0 
letterArray = {"a", "b", "c", "d", "e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"}

letterXAxisArray = {148,310,220,240,230,287,333,377,455,424,467,514,400,357,500,545,140,275,195,320,410,260,185,170,365,125}

letterYAxisArray = {120,169,169,120,80,120,120,120,80,120,120,120,169,169,80,80,80,80,120,80,80,169,80,169,80,169}

letterText = display.newText( "press any key to start", display.contentCenterX + 1 , display.contentCenterY +200, "Impact", 50 )
scene1Group:insert(letterText)
percentageText = display.newText( "---%", display.contentCenterX + 1 , display.contentCenterY +500, "Impact", 50 )
scene1Group:insert(percentageText)

backgroundSquare2 = display.newRect(1000,1000,40,40)
scene1Group:insert(backgroundSquare2)


-- backgroundSquare2 = display.newRect(0,0,40,40)
-- 	backgroundSquare2:setFillColor( 0/255, 100/255, 255/255)
-- 	backgroundSquare2.alpha = 0.0



-- start the game
-- play = display.newImageRect( "startbutton.png", 200, 200 )
--   play.x = 390
--   play.y = 150

-- local function playTouch( event )

	--Keyboard = display.newImageRect( "Keyboard.png", 780, 550 )
	--  Keyboard.x = 390
	--  Keyboard.y = 150

-- 	  play:removeSelf()
-- 	  play = nil
-- -- end  -- end playTouch function

-- play:removeEventListener( "touch", playTouch)
-- play:addEventListener( "touch", playTouch )




--display the percentage (start at 0%)
local function updatePercentage()

	percentageText.text = ""
	percentage = Score/(counter-1) * 100
	percentageText.text = "Correct:  "..math.round(percentage) .. "%"
	backgroundSquare2.isVisible = false
	displayKey()

end  -- end the updatePercentage function


function displayKey ()

	print(counter)
	print(NumberOfLetters)

	if counter <= NumberOfLetters then

		-- backgroundSquare2 = display.newRect(letterXAxisArray[pick],letterYAxisArray[pick],40,40)
		-- backgroundSquare2:setFillColor( 0/255, 100/255, 255/255)
		-- backgroundSquare2.alpha = 0.60


		--display the random letter
	

		pick = math.random(1,26)
		-- 

		randomLetter = letterArray[pick]
		letterText.text = "Type this:  ".. randomLetter .. "    ("..counter.."/"..NumberOfLetters..")"
		
		--display box

		-- backgroundSquare2 = display.newRect(letterXAxisArray[pick],letterYAxisArray[pick],40,40)
			backgroundSquare2.isVisible = true
			backgroundSquare2.x = letterXAxisArray[pick]
			backgroundSquare2.y = letterYAxisArray[pick]
			backgroundSquare2:setFillColor( 255/255, 100/255, 255/255)
			backgroundSquare2.alpha = 0.60




	else gameOver()
			
	end

end

Keyboard = display.newImageRect( "Keyboard.png", 780, 550 )
	 Keyboard.x = 390
	 Keyboard.y = 150
	 scene1Group:insert(Keyboard)

function onKeyEvent( event )



	if event.phase == "down" then 

		if counter == 0 then



			counter = counter + 1
			displayKey()
			startTime = os.clock()

		else
		    
			userLetter = event.keyName

			-- increase the counter by 1
			counter = counter + 1

			--print(userLetter)letter

			-- check user input

			print("UserLetter:"..userLetter)
			print("randomLetter"..randomLetter)

			-- if it is correct increase score by one
			if randomLetter == userLetter then
				Score = Score + 1
				
			-- displayKey()
			end -- check 

			
			-- backgroundSquare2:removeSelf()

			-- update the percentage value on the screent
			
			updatePercentage()

		end -- check first time

		

	end -- event.phase if 



end  --end  onKeyEvent function



--displayKey()

Runtime:addEventListener( "key", onKeyEvent )


function gameOver ()
	stopTime = os.clock()
	elapsedTime	=stopTime - startTime
	letterText.text = ""
	letterText.text = "Thanks for playing, "..PlayerName.."! \r It took you "..math.round(elapsedTime).." seconds \rto type "..NumberOfLetters.." letters.  \rYou got "..Score.." letters correct! \r Press CTRL + R to play again"
	Runtime:removeEventListener("key", onKeyEvent)
	PercentPoints = percentage * 10
	TimeBonus = NumberOfLetters / elapsedTime * 10
	Highscore = PercentPoints + (TimeBonus*percentage)
	-- print(Highscore)
	percentageText.text = "Your Score Is "..math.round(Highscore)
end

    end
end
 
-- -----------------------------------------------------------------------------------
-- scene event function listeners
-- -----------------------------------------------------------------------------------
GameScene:addEventListener( "create", GameScene )
GameScene:addEventListener( "show", GameScene )
-- -----------------------------------------------------------------------------------
 
return GameScene