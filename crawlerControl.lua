--[[ Mining Crawler Control Software--]]
--[[Jackknrsh7--]]
local versionNum = "1"
local revisionNum = "6"

--[[ Parameter Vars --]]

local remoteInSide = "back"
local manualInSide = "top"
local crawlerForwardSide = "right"
local supportForwardSide = "left"
local breakerSide = "bottom"
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
  sleep(postBreakerWait)
end

function supportMove()
  term.setCursorPos(1,3)
  term.write("                                                                                             ")
  term.setCursorPos(1,3)
  term.write("Moving Support Strut")
  redstone.setOutput(breakerSide, true)
  sleep(supportWait)
end

function crawlerMove()
  term.setCursorPos(1,3)
  term.write("                                                                                             ")
  term.setCursorPos(1,3)
  term.write("Moving Crawler")
  redstone.setOutput(breakerSide, true)
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
  elseif redstone.getInput(remoteSide) == true then
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