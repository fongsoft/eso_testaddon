-- Create a namespace.
AddonTest = {}

AddonTest.name = 'ESOAddonTest'

function AddonTest:Initialize()
	-- Keep track of whether the player is in combat.
	self.inCombat = IsUnitInCombat('player')

	-- Register event handlers.
	EVENT_MANAGER:RegisterForEvent(self.name, EVENT_PLAYER_COMBAT_STATE, self.OnPlayerCombatState)
end

-- When addons are loaded, run our plugin's init function.
function AddonTest.OnAddOnLoaded(event, addonName)
	if addonName == AddonTest.name then
		AddonTest:Initialize()
	end
end

-- Handle when the player's combat state changes.
function AddonTest.OnPlayerCombatState(event, inCombat)
	if inCombat ~= AddonTest.inCombat then
		AddonTest.inCombat = inCombat

		if inCombat then
			d('Entering Combat')
		else
			d('Exiting Combat')
		end
	end
end

-- Register event handler.
EVENT_MANAGER:RegisterForEvent(AddonTest.name, EVENT_ADD_ON_LOADED, AddonTest.OnAddOnLoaded)
