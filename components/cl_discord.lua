COMPONENTS.Discord = {
	_name = "base",
	RichPresence = function(self)
		SetDiscordAppId(COMPONENTS.Convar.DISCORD_APP.value)
		SetDiscordRichPresenceAsset("logo2")
		SetDiscordRichPresenceAssetText("Join Today: quantumRP.com")
		--SetDiscordRichPresenceAssetSmall("info")
		SetDiscordRichPresenceAction(0, "Register at quantumRP.net", "https://quantumrp.com")
		SetDiscordRichPresenceAction(1, "Join Our Discord", "https://discord.gg/quantumrp")

		CreateThread(function()
			while true do
				local char = LocalPlayer.state.Character
				local playerCount = GlobalState["PlayerCount"] or 0
				local queueCount = GlobalState["QueueCount"] or 0
				if char ~= nil then
					SetRichPresence(
						string.format(
							"%d/%d Players - Playing %s %s",
							playerCount,
							GlobalState.MaxPlayers,
							char:GetData("First"),
							char:GetData("Last")
						)
					)
				else
					SetRichPresence(
						string.format("%d/%d Players - Selecting a Character", playerCount, GlobalState.MaxPlayers)
					)
				end

				-- SetDiscordRichPresenceAssetSmallText(
				-- 	string.format("%s/%s [Queue: %s]", playerCount, GlobalState.MaxPlayers, queueCount)
				-- )
				Wait(30000)
			end
		end)
	end,
}

CreateThread(function()
	COMPONENTS.Discord:RichPresence()
end)
