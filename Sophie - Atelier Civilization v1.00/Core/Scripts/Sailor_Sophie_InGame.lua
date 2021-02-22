--///////////////////////////////////////////////////////
--///////////////////////////////////////////////////////
-- Sophie Leader Scripts
--///////////////////////////////////////////////////////
--///////////////////////////////////////////////////////

--///////////////////////////////////////////////////////
-- Great Work of Writing Buff
--///////////////////////////////////////////////////////
function Sailor_Sophie_MysteriousBook(unitOwner, unitID, greatPersonClassID, greatPersonIndividualID)
	local bSOPHIELeader = false
	if unitOwner ~= -1 then
		local pPlayerConfig = PlayerConfigurations[unitOwner]
		local sLeader		= pPlayerConfig:GetLeaderTypeName()
		if sLeader == 'LEADER_SAILOR_SOPHIE' then
			bSOPHIELeader = true
		end
	end

	if bSOPHIELeader == true then
		if GameInfo.GreatPersonClasses[greatPersonClassID].UnitType == "UNIT_GREAT_WRITER" then
			local pPlayer			= Players[unitOwner]
			local pPlayerVisibility = PlayersVisibility[pPlayer:GetID()]
			local pPlayerUnits		= pPlayer:GetUnits()
			local tUnits			= {}
			local buffTurns			= 3 -- Desired turns + 1
			for i, pUnit in pPlayerUnits:Members() do
				table.insert(tUnits, pUnit)
			end
			for k, _Unit in ipairs(tUnits) do
				local _UnitAbility		= _Unit:GetAbility()
				local _UnitAbilityCount = _UnitAbility:GetAbilityCount("ABILITY_SAILOR_SOPHIE")
				local _UnitProperty		= _Unit:GetProperty("SailorSophieTimer")
				_UnitAbility:ChangeAbilityCount("ABILITY_SAILOR_SOPHIE", 1)
				-- // If unit doesn't have turns remaining, property equals current turn + x.
				if _UnitProperty == nil or _UnitProperty == 0 then
					_Unit:SetProperty("SailorSophieTimer", Game.GetCurrentGameTurn() + buffTurns)
				else
				-- // If unit has turns remaining, add the difference to current turn + x.
					local _UnitTimer = ((Game.GetCurrentGameTurn() + buffTurns) + (_UnitProperty - Game.GetCurrentGameTurn()))
					_Unit:SetProperty("SailorSophieTimer", _UnitTimer)
					local _UnitStatus = _Unit:GetProperty("SailorSophieTimer")
				end
			end
		end
	end
end

--///////////////////////////////////////////////////////
-- Unit Turn Timer (Supports Mysterious Book)
--///////////////////////////////////////////////////////
function Sailor_Sophie_UnitTimer()
	local bSOPHIELeader = false
	local playerID = 0
	for k, v in ipairs(PlayerManager.GetAliveIDs()) do
		if bSOPHIELeader == false then
			local sLeaderType = PlayerConfigurations[v]:GetLeaderTypeName()
			if sLeaderType == 'LEADER_SAILOR_SOPHIE' then
				bSOPHIELeader	= true
				playerID		= v
			end
		end
	end
	-- // Each unit has its own timer, attached via property.
	-- // Property is the turn on which the ability is removed.
	if bSOPHIELeader == true then
		local pPlayer			= Players[playerID]
		local pPlayerUnits		= pPlayer:GetUnits()
		local sUnits			= {}
		for i, pUnit in pPlayerUnits:Members() do
			table.insert(sUnits, pUnit)
		end

		for k, _Unit in ipairs(sUnits) do
			local _UnitAbility		= _Unit:GetAbility()
			local _UnitAbilityCount = _UnitAbility:GetAbilityCount("ABILITY_SAILOR_SOPHIE")
			local _UnitStatus		= _Unit:GetProperty("SailorSophieTimer")
			if _UnitStatus ~= nil then
				if _UnitStatus == Game.GetCurrentGameTurn() then
					_UnitAbility:ChangeAbilityCount("ABILITY_SAILOR_SOPHIE", -_UnitAbilityCount)
					_Unit:SetProperty("SailorSophieTimer", 0)
				end
			end
		end
	end
end

--///////////////////////////////////////////////////////
-- Return Home on Skip Turn on Atelier Improvement
--///////////////////////////////////////////////////////
function Sailor_Sophie_FairyBook(playerID, unitID, iUnknown, hOperation) -- hOperation Skip Turn / Wait = 36
    local bSOPHIELeader = false
    if playerID ~= -1 then
        local pPlayerConfig = PlayerConfigurations[playerID]
        local sLeader		= pPlayerConfig:GetLeaderTypeName()
        if sLeader == 'LEADER_SAILOR_SOPHIE' then
            bSOPHIELeader = true
        end
    end

    if bSOPHIELeader == true then
        if hOperation == 36 then
            local pPlayer			= Players[playerID]
            local pPlayerUnits		= pPlayer:GetUnits()
            local _Unit				= pPlayerUnits:FindID(unitID)
            local iX, iY			= _Unit:GetX(), _Unit:GetY()
            local _Plot				= Map.GetPlot(iX, iY)
            local validPlot			= true
            if _Plot:GetImprovementType() > -1 then
                if GameInfo.Improvements[_Plot:GetImprovementType()].ImprovementType == "IMPROVEMENT_SAILOR_ATLEER_UI" then
                    local pCap = pPlayer:GetCities():GetCapitalCity()
                    if pCap then
                        local unitList:table = Units.GetUnitsInPlotLayerID(pCap:GetX(), pCap:GetY(), MapLayers.ANY)
                        if unitList ~= nil then
                            for i, pUnit in ipairs(unitList) do
                                if GameInfo.Units[_Unit:GetType()].FormationClass == GameInfo.Units[pUnit:GetType()].FormationClass then
                                    validPlot = false
                                end
                            end
                        end
                        if validPlot == true then
                            UnitManager.RestoreMovement(_Unit) -- Can't PlaceUnit without first restoring movement.
                            UnitManager.PlaceUnit(_Unit, pCap:GetX(), pCap:GetY())
                            UnitManager.RestoreMovement(_Unit) -- PlaceUnit consumes all movement. This restores it.
                        else
                        -- // Will attempt to place on adjacent plots if capital city not free.
                            local iCityRadius = 8
                            local iCityX, iCityY = pCap:GetX(), pCap:GetY()
                            for dx = (iCityRadius * -1), iCityRadius do
                                for dy = (iCityRadius * -1), iCityRadius do
                                    local pPlotNearCity = Map.GetPlotXYWithRangeCheck(iCityX, iCityY, dx, dy, iCityRadius);
                                    if pPlotNearCity then
                                        for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
                                            local adjacentPlot = Map.GetAdjacentPlot(pCap:GetX(), pCap:GetY(), direction)
                                            if adjacentPlot then
                                                if not adjacentPlot:IsNaturalWonder() and not adjacentPlot:IsMountain() and not adjacentPlot:IsWater() then
                                                    local unitList2:table = Units.GetUnitsInPlotLayerID(adjacentPlot:GetX(), adjacentPlot:GetY(), MapLayers.ANY)
                                                    local aValidPlot = true
                                                    if unitList2 ~= nil then
                                                        for k, sUnit in ipairs(unitList2) do
                                                            if GameInfo.Units[_Unit:GetType()].FormationClass == GameInfo.Units[sUnit:GetType()].FormationClass then
                                                                aValidPlot = false
                                                            end
                                                        end
                                                    end
                                                    if aValidPlot == true then
                                                        UnitManager.RestoreMovement(_Unit) -- Can't PlaceUnit without first restoring movement.
                                                        UnitManager.PlaceUnit(_Unit, adjacentPlot:GetX(), adjacentPlot:GetY())
                                                        UnitManager.RestoreMovement(_Unit) -- PlaceUnit consumes all movement. This restores it.
                                                        return
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end
--///////////////////////////////////////////////////////
-- Leader Present Detection by SeelingCat
--///////////////////////////////////////////////////////
local bSophiePresent = false

for k, v in ipairs(PlayerManager.GetWasEverAliveIDs()) do
    if bSophiePresent == false then
        local sLeaderType = PlayerConfigurations[v]:GetLeaderTypeName()
        if sLeaderType == 'LEADER_SAILOR_SOPHIE' then
			bSophiePresent = true
        end
    end
end
if bSophiePresent == true then
    print ("///// Sophie detected. Loading functions...")
	print ("///// Don't gamble on sailboat races. They're all rigged.")
	Events.UnitGreatPersonActivated.Add(Sailor_Sophie_MysteriousBook)
	--GameEvents.PlayerTurnStartComplete.Add(Sailor_Sophie_UnitTimer)
	Events.LocalPlayerTurnBegin.Add(Sailor_Sophie_UnitTimer)
	Events.UnitOperationAdded.Add(Sailor_Sophie_FairyBook)
	--Events.GreatWorkCreated.Add(Sailor_Sophie_Tent)
	--Events.CityRemovedFromMap.Add(Sailor_Sophie_TentRemoved)
	--Events.GreatWorkMoved.Add(Sailor_Sophie_BookTransfer)
else
    print ("///// Sophie not detected.")
end