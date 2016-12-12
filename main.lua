-- Project: Attack of the Cuteness Game
-- http://MasteringCoronaSDK.com
-- Version: 1.0
-- Copyright 2013 J. A. Whye. All Rights Reserved.
-- "Space Cute" art by Daniel Cook (Lostgarden.com) 

-- housekeeping stuff

display.setStatusBar(display.HiddenStatusBar)

local centerX = display.contentCenterX
local centerY = display.contentCenterY

-- set up forward references
local spawnEnemy
local gametitle

-- preload audio
local sblast=audio.loadSound("blast.mp3")

-- create play screen
local bg=display.newImage("background.png")
transition.to(planet,{time=2000, alpha=1 , xScale=1 ,yScale=1 , y=centerY,onComplete=showTitle})

-- game functions

function spawnEnemy()
	
end


function startGame()
local text=display.newText("Tap here to start",0,0,"Helvetica",24)
end


local function planetDamage()

end


function hitPlanet(obj)

end


function shipSmash(event)
	local obj=event.target
end


