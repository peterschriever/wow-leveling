--- trigger; Trigger State Updater
--- on Event; UNIT_SPELLCAST_START:player,UNIT_SPELLCAST_STOP:player

function(s,e,arg1,arg2,arg3)
    if arg3 == 8690 and arg1 == "player" then
        if e == "UNIT_SPELLCAST_START" then
            _G._HSstart = GetTime()
            C_Timer.After(aura_env.timer,aura_env.Accept)
        else
            print('stopped HS cast, wont set')
            _G._HSstart = GetTime()+10
        end
    end
end


--- actions > On Init > Custom Code

_G._HSstart = 0
aura_env.timer = 9.850
function aura_env.Accept()
    ConfirmBinder()
    print('HS set ok')
    print('set at: ' .. GetTime()-_G._HSstart) 
end


