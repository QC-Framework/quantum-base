COMPONENTS = {}

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        CreateThread(function()
            local ver
            repeat Wait(0) until COMPONENTS.Convar.MFW_VERSION ~= nil

            if COMPONENTS.Convar.MFW_VERSION.value == "UNKNOWN" then
                ver = "^1Version Unknown"
            else
                ver = "^2v"..COMPONENTS.Convar.MFW_VERSION.value
            end

            print([[


^2=================================================================================================^7
^1   ___                    _                     _____                                            _    
^1  / _ \ _   _  __ _ _ __ | |_ _   _ _ __ ___   |  ___| __ __ _ _ __ ___   _____      _____  _ __| | __
^1 | | | | | | |/ _` | '_ \| __| | | | '_ ` _ \  | |_ | '__/ _` | '_ ` _ \ / _ \ \ /\ / / _ \| '__| |/ /
^1 | |_| | |_| | (_| | | | | |_| |_| | | | | | | |  _|| | | (_| | | | | | |  __/\ V  V / (_) | |  |   < 
^1  \__\_\\__,_|\__,_|_| |_|\__|\__,_|_| |_| |_| |_|  |_|  \__,_|_| |_| |_|\___| \_/\_/ \___/|_|  |_|\_\
^1       
^7]])
            print('^1Quantum Framework '..ver..'^7 By ^6Artmines^7 & ^6Quantum Team')
            print([[
^2=================================================================================================^7

]])

            TriggerEvent('Core:Shared:Watermark')
        end)
    end
end)