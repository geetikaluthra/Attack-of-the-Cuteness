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
local gametitlelocal score=0local scoretxtlocal hitPlanetlocal planetlocal hit=0

-- preload audiolocal skill=audio.loadSound("boing-1.wav")
local sblast=audio.loadSound("blast.mp3")local slose=audio.loadSound("wahwahwah.mp3")

-- create play screen
local bg=display.newImage("background.png")bg.x=centerXbg.y=centreYplanet=display.newImage("planet.png")planet.x=centerXplanet.alpha=0planet.xScale=2planet.yScale=2local function showTitle()	gametitle=display.newImage("gametitle.png")	gametitle.alpha=0	gametitle:scale(4,4)	transition.to(gametitle, { time=500 , alpha=1, xScale=1, yScale=1 })	startGame()end
transition.to(planet,{time=2000, alpha=1 , xScale=1 ,yScale=1 , y=centerY,onComplete=showTitle})

-- game functions

function spawnEnemy()	local enemy=display.newImage("beetleship.png")	enemy.x=math.random(20,display.contentWidth-20)	enemy.y=math.random(20,display.contentHeight-20)	enemy:addEventListener("tap" , shipSmash)	if math.random(2) ==1 then		enemy.x=math.random(-100,-10)	else		enemy.x=math.random(display.contentWidth+10,display.contentWidth+100)	end	enemy.y=math.random(display.contentHeight)		enemy.trans=transition.to(enemy,{ x=centerX ,y=centerY, time=3500, onComplete=hitPlanet })
	
end


function startGame()
local text=display.newText("Tap here to start",0,0,"Helvetica",24)text.x=centerXtext.y=display.contentHeight-30local  function goAway(event)	display.remove(event.target)	text=nil	display.remove(gametitle)	spawnEnemy()	scoretxt=display.newText("Score:0",0,0,"Helvetica",20)	scoretxt.x=centerX	scoretxt.y=10	score=0endtext:addEventListener("tap",goAway)
end


local function planetDamage()	hit=hit+1	if hit>3 then		planet.alpha=0		local t=display.newText("Try Again ...You lost",centerX-70,centerY,"Helvetica",30)			else		transition.to(planet, { time=200, xScale=2,yScale=2,alpha=1 })		end		

end


function hitPlanet(obj)	display.remove(obj)	planetDamage()	audio.play(sblast)	if hit<4 then	spawnEnemy()	end

end


function shipSmash(event)
	local obj=event.target	display.remove(obj)	audio.play(skill)	transition.cancel(event.target.trans)	score=score+27	scoretxt.text="Score:  " .. score	spawnEnemy()	return true
end



