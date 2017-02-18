-- Create a namespace.
AddonTest = {}

AddonTest.name = 'ESOAddonTest'

function AddonTest:Initialize()

end

function AddonTest.OnAddOnLoaded(event, addonName)
	if addonName == AddonTest.name then
		AddonTest:Initialize()
	end
end

-- Register event handler.
EVENT_MANAGER:RegisterForEvent(AddonTest.name, EVENT_ADD_ON_LOADED, AddonTest.OnAddOnLoaded)
