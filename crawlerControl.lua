--[[ Mining Crawler Control Software--]]
--[[Jackknrsh7--]]
local versionNum = "1"
local revisionNum = "7"

--[[ Parameter Vars --]]

local remoteInSide = "back"
local manualInSide = "top"
local crawlerForwardSide = "right"
local supportForwardSide = "left"
local breakerSide = "bottom"
local pulseLength = .25 --[[Length of each redstone pulse --]]
local crawlForwardWait = 1 --[[ Time to wait between moving forward and engaging the breaker --]]
local postBreakerWait = 4 --[[ Time to wait After breaker, before forward movement. Remember to account for supportWait time as well --]]
local supportWait = 1 --[[ Time to wait between moving the support strut and moving the crawler forward --]]

function cycle(activationMethod)
  term.clear()
  term.setCursorPos(1,1)
  term.write("Crawler Control Version " ..versionNum ..", Revision " ..revisionNum ..".")
  term.setCursorPos(1,2)
  term.write("Crawler Activated Via "..activationMethod .." input.")
  
  breaker()
  crawlerMove()
  supportMove()
  
end

function breaker()
  term.setCursorPos(1,3)
  term.write("                                                                                             ")
  term.setCursorPos(1,3)
  term.write("Breaking Blocks")
  redstone.setOutput(breakerSide, true)
  sleep(pulseLength)
  redstone.setOutput(breakerSide, false)
  sleep(postBreakerWait)
end

function supportMove()
  term.setCursorPos(1,3)
  term.write("                                                                                             ")
  term.setCursorPos(1,3)
  term.write("Moving Support Strut")
  redstone.setOutput(supportForwardSide, true)
    sleep(pulseLength)
  redstone.setOutput(supportForwardSide, false)
  sleep(supportWait)
end

function crawlerMove()
  term.setCursorPos(1,3)
  term.write("                                                                                             ")
  term.setCursorPos(1,3)
  term.write("Moving Crawler")
  redstone.setOutput(crawlerForwardSide, true)
    sleep(pulseLength)
  redstone.setOutput(crawlerForwardSide, false)
  sleep(crawlForwardWait)
end

term.clear()
term.setCursorPos(1,1)
term.write("Crawler Control Version " ..versionNum ..", Revision " ..revisionNum ..".")
term.setCursorPos(1,2)
term.write("Initializing...")

while true do
  if redstone.getInput(manualInSide) == true then
    cycle("Manual")
  elseif redstone.getInput(remoteInSide) == true then
    cycle("Remote")
  else
    term.clear()
    term.setCursorPos(1,1)
    term.write("Crawler Control Version " ..versionNum ", Revision " ..revisionNum ..".")
    term.setCursorPos(1,2)
    term.write("System currently disabled.")
  end
  sleep(0)
end