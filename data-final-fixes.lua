local function setting(name) return settings.startup[name].value end

local function clamp(min, max, value)
	if value > max then
		return max
	elseif value < min then
		return min
	else
		return value
	end
end

local quality_mapping = {
	[0.01] = setting("quality_module_1"),
	[0.02] = setting("quality_module_2"),
	[0.025] = setting("quality_module_3"),
	[-0.01] = setting("speed_module_1"),
	[-0.015] = setting("speed_module_2"),
	[-0.025] = setting("speed_module_3")
}

local lab_drain = setting("lab_uses_quality_drain_modifier")
local unlink = setting("unlink_quality_from_speed")
local function modifyModule(mod)
	local effects = mod.effect
	if effects.speed and effects.speed > 0 then
		if unlink and effects.quality and effects.quality < 0 then
			effects.quality = 0
		elseif quality_mapping[effects.quality] then
			effects.quality = quality_mapping[effects.quality]
		end
	end
	if effects.quality and effects.quality > 0 then
		if unlink and effects.speed and effects.speed < 0 then effects.speed = 0 end
		if quality_mapping[effects.quality] then effects.quality = quality_mapping[effects.quality] end
	end
	mod.effect = effects
end

for _, mod in pairs(data.raw.module) do modifyModule(mod) end

-- Cargo inventory multiplier uses a .25 multiplier for uncommon - epic, and .3 for legendary
-- This incriments the slots at 10 per tier, with a jump of 30 for legendary.
-- If the user has left the multipliers alone, we will recreate this curve for levels < 5.
local default_multi = setting("default_multiplier") == 0.3 and setting("cargo_wagon_inventory_size_multiplier") == 1

for i, obj in pairs(data.raw["quality"]) do
	if i == "normal" then
		obj.level = setting("normal_level")
		obj.next_probability = setting("normal_next_probability")
		obj.localised_name = {"", setting("normal_level_name")}
	elseif i == "uncommon" then
		obj.level = setting("uncommon_level")
		if lab_drain then
			obj.science_pack_drain_multiplier = setting("uncommon_science_pack_drain") / 100
		end
		obj.next_probability = setting("uncommon_next_probability")
		obj.localised_name = {"", setting("uncommon_level_name")}
	elseif i == "rare" then
		obj.level = setting("rare_level")
		if lab_drain then
			obj.science_pack_drain_multiplier = setting("rare_science_pack_drain") / 100
		end
		obj.next_probability = setting("rare_next_probability")
		obj.localised_name = {"", setting("rare_level_name")}
	elseif i == "epic" then
		obj.level = setting("epic_level")
		if lab_drain then
			obj.science_pack_drain_multiplier = setting("epic_science_pack_drain") / 100
		end
		obj.next_probability = setting("epic_next_probability")
		obj.localised_name = {"", setting("epic_level_name")}
	elseif i == "legendary" then
		obj.level = setting("legendary_level")
		if lab_drain then
			obj.science_pack_drain_multiplier = setting("legendary_science_pack_drain") / 100
		end
		obj.localised_name = {"", setting("legendary_level_name")}
		if mods["Additional-Qualities"] or mods["Quality-Plus-Plus"] then obj.next_probability = setting("legendary_next_probability") end
	elseif mods["Additional-Qualities"] then
		if i == "mythic" then
			obj.level = setting("mythic_level")
			obj.next_probability = setting("mythic_next_probability")
			obj.localised_name = {"", setting("mythic_level_name")}
			if lab_drain then
				obj.science_pack_drain_multiplier = setting("mythic_science_pack_drain") / 100
			end
		elseif i == "relic" then
			obj.level = setting("relic_level")
			obj.next_probability = setting("relic_next_probability")
			obj.localised_name = {"", setting("relic_level_name")}
			if lab_drain then
				obj.science_pack_drain_multiplier = setting("relic_science_pack_drain") / 100
			end
		elseif i == "masterwork" then
			obj.level = setting("masterwork_level")
			obj.next_probability = setting("masterwork_next_probability")
			obj.localised_name = {"", setting("masterwork_level_name")}
			if lab_drain then
				obj.science_pack_drain_multiplier = setting("masterwork_science_pack_drain") / 100
			end
		elseif i == "eternal" then
			obj.level = setting("eternal_level")
			obj.next_probability = setting("eternal_next_probability")
			obj.localised_name = {"", setting("eternal_level_name")}
			if lab_drain then
				obj.science_pack_drain_multiplier = setting("eternal_science_pack_drain") / 100
			end
		elseif i == "transcendent" or i:match("^transcendentx%d+$") or i:match("^transcendent%d+$") then
			local n = i:match("^transcendentx(%d+)$") or i:match("^transcendent(%d+)$")
			local suffix = tonumber(n) or 0
			local base = setting("transcendent_level")
			local step = setting("transcendent_level_step") or 1
			obj.level = base + suffix * step
			if suffix > 0 then
				local name = setting("transcendent_level_name") .. " " .. tostring(suffix)
				obj.localised_name = {"", name}
			else
				obj.localised_name = {"", setting("transcendent_level_name")}
			end
			if lab_drain then
				local baseDrain = setting("transcendent_science_pack_drain")
				local drainStep = setting("transcendent_science_pack_drain_step") or 0
				local drain = baseDrain - suffix * drainStep
				obj.science_pack_drain_multiplier = clamp(0.01, 1, drain / 100)
			end
			if settings.startup["transcendent_next_probability"] then
				local baseProb = settings.startup["transcendent_next_probability"].value
				local decay = setting("transcendent_next_probability_decay") or 1.0
				if suffix > 0 then
					obj.next_probability = baseProb * (decay ^ suffix)
				else
					obj.next_probability = baseProb
				end
			end
		end
	elseif mods["Quality-Plus-Plus"] then
		if i == "mythical" then
			obj.level = setting("mythical_level")
			obj.next_probability = setting("mythical_next_probability")
			obj.localised_name = {"", setting("mythical_level_name")}
			if lab_drain then
				obj.science_pack_drain_multiplier = setting("mythical_science_pack_drain") / 100
			end
		elseif i == "masterwork" then
			obj.level = setting("masterwork_level")
			obj.next_probability = setting("masterwork_next_probability")
			obj.localised_name = {"", setting("masterwork_level_name")}
			if lab_drain then
				obj.science_pack_drain_multiplier = setting("masterwork_science_pack_drain") / 100
			end
		elseif i == "wondrous" then
			obj.level = setting("wondrous_level")
			obj.next_probability = setting("wondrous_next_probability")
			obj.localised_name = {"", setting("wondrous_level_name")}
			if lab_drain then
				obj.science_pack_drain_multiplier = setting("wondrous_science_pack_drain") / 100
			end
		elseif i == "artifactual" then
			obj.level = setting("artifactual_level")
			obj.localised_name = {"", setting("artifactual_level_name")}
			if lab_drain then
				obj.science_pack_drain_multiplier = setting("artifactual_science_pack_drain") / 100
			end
		end
	end
	-- General
	obj.default_multiplier = 1 + setting("default_multiplier") * obj.level
	obj.tool_durability_multiplier = 1 + setting("tool_durability_multiplier") * obj.level
	-- Beacon
	obj.beacon_power_usage_multiplier = clamp(0.011, 1000, 1 - setting("beacon_power_usage_reduction") * obj.level)
	obj.beacon_supply_area_distance_bonus = clamp(0, 64, setting("beacon_supply_area_distance_bonus") * obj.level)
	obj.beacon_module_slots_bonus = setting("beacon_module_slots_bonus") * obj.level
	-- Mining
	obj.mining_drill_resource_drain_multiplier = clamp(0.01, 1, 1 - setting("mining_drill_resource_drain_reduction") * obj.level)
	obj.mining_drill_module_slots_bonus = setting("mining_drill_module_slots_bonus") * obj.level
	obj.mining_drill_mining_radius_bonus = setting("mining_drill_mining_radius_bonus") * obj.level
	-- Crafting
	obj.crafting_machine_energy_usage_multiplier = clamp(0.01, 1000, 1 - setting("crafting_machine_energy_usage_reduction") * obj.level)
	obj.crafting_machine_module_slots_bonus = setting("crafting_machine_module_slots_bonus") * obj.level
	obj.crafting_machine_speed_multiplier = setting("crafting_machine_speed_multiplier") * obj.default_multiplier
	-- Inserter
	obj.inserter_speed_multiplier = setting("inserter_speed_multiplier") * obj.default_multiplier
	-- Lab
	obj.lab_module_slots_bonus = setting("lab_module_slots_bonus") * obj.level
	obj.lab_research_speed_multiplier = setting("lab_research_speed_multiplier") * obj.default_multiplier
	-- Inventory
	obj.inventory_size_multiplier = setting("inventory_size_multiplier") * obj.default_multiplier
	obj.equipment_grid_width_bonus = setting("equipment_grid_width_bonus") * obj.level
	obj.equipment_grid_height_bonus = setting("equipment_grid_height_bonus") * obj.level
	-- Asteroid collector
	if mods["space-age"] then obj.asteroid_collector_collection_radius_bonus = setting("asteroid_collector_collection_radius_bonus") * obj.level end
	-- Electical
	obj.logistic_cell_charging_station_count_bonus = setting("logistic_cell_charging_station_count_bonus") * obj.level
	obj.logistic_cell_charging_energy_multiplier = setting("logistic_cell_charging_energy_multiplier") * obj.default_multiplier
	obj.flying_robot_max_energy_multiplier = 1 + setting("flying_robot_max_energy_multiplier") * obj.level
	obj.accumulator_capacity_multiplier = 1 + setting("accumulator_capacity_multiplier") * obj.level
	obj.electric_pole_wire_reach_bonus = setting("electric_pole_wire_reach_bonus") * obj.level
	obj.electric_pole_supply_area_distance_bonus = setting("electric_pole_supply_area_distance_bonus") * obj.level
	-- Weapon
	obj.range_multiplier = clamp(1, 3, 1 + setting("range_multiplier") * obj.level)
	-- Spoilage
	if mods["space-age"] then obj.spoil_ticks_multiplier = setting("spoil_ticks_multiplier") * obj.default_multiplier end
	-- Trains
	if default_multi and obj.level < 5 then
		obj.cargo_wagon_inventory_size_multiplier = 1 + 0.25 * obj.level
	else
		obj.cargo_wagon_inventory_size_multiplier = setting("cargo_wagon_inventory_size_multiplier") * obj.default_multiplier
	end
	obj.fluid_wagon_capacity_multiplier = setting("fluid_wagon_capacity_multiplier") * obj.default_multiplier
	obj.rolling_stock_max_speed_multiplier = 1 + setting("rolling_stock_max_speed_multiplier") * obj.level
	obj.locomotive_power_multiplier = 1 + setting("locomotive_power_multiplier") * obj.level
	-- Modules
	obj.module_consumption_multiplier = setting("module_consumption_multiplier") * obj.default_multiplier
	obj.module_speed_multiplier = setting("module_speed_multiplier") * obj.default_multiplier
	obj.module_productivity_multiplier = setting("module_productivity_multiplier") * obj.default_multiplier
	obj.module_pollution_multiplier = setting("module_pollution_multiplier") * obj.default_multiplier
	obj.module_quality_multiplier = setting("module_quality_multiplier") * obj.default_multiplier
end

for _, obj in pairs(data.raw["lab"]) do
	if lab_drain then
		obj.uses_quality_drain_modifier = lab_drain
	end
	obj.quality_affects_module_slots = setting("quality_affects_module_slots_lab")
end

for _, obj in pairs(data.raw["cargo-wagon"]) do obj.quality_affects_inventory_size = setting("quality_affects_inventory_size_cargo_wagon") end

for _, obj in pairs(data.raw["fluid-wagon"]) do obj.quality_affects_capacity = setting("quality_affects_capacity_fluid_wagon") end

for _, obj in pairs(data.raw["locomotive"]) do obj.quality_affects_max_speed = setting("quality_affects_max_speed") end

for _, obj in pairs(data.raw["container"]) do obj.quality_affects_inventory_size = setting("quality_affects_inventory_size_container") end

for _, obj in pairs(data.raw["roboport-equipment"]) do obj.charging_station_count_affected_by_quality = setting("charging_station_count_affected_by_quality_equipment") end

for _, obj in pairs(data.raw["roboport"]) do obj.charging_station_count_affected_by_quality = setting("charging_station_count_affected_by_quality") end

if data.raw["chain-active-trigger"] then
	for _, obj in pairs(data.raw["chain-active-trigger"]) do obj.fork_chance_increase_per_quality_level = setting("fork_chance_increase_per_quality_level_chain_active_trigger") end
end

for _, obj in pairs(data.raw["beacon"]) do
	obj.distribution_effectivity_bonus_per_quality_level = setting("distribution_effectivity_bonus_per_quality_level")
	obj.quality_affects_module_slots = setting("quality_affects_module_slots_beacon")
	obj.quality_affects_supply_area_distance = setting("quality_affects_supply_area_distance_beacon")
end

if data.raw["asteroid-collector"] then
	for _, obj in pairs(data.raw["asteroid-collector"]) do
		obj.arm_inventory_size_quality_increase = setting("arm_inventory_size_quality_increase_collector")
		obj.inventory_size_quality_increase = setting("inventory_size_quality_increase_collector")
		obj.energy_usage_quality_scaling = setting("energy_usage_quality_scaling_collector")
		obj.arm_count_quality_scaling = setting("arm_count_quality_scaling_collector")
		obj.arm_speed_quality_scaling = setting("arm_speed_quality_scaling_collector")
		obj.arm_angular_speed_cap_quality_scaling = setting("arm_angular_speed_cap_quality_scaling_collector")
	end
end

for _, obj in pairs(data.raw["mining-drill"]) do
	obj.quality_affects_mining_radius = setting("quality_affects_mining_radius")
	if obj.module_slots ~= nil and obj.module_slots > 0 then obj.quality_affects_module_slots = setting("quality_affects_module_slots_mining") end
end

for _, obj in pairs(data.raw["assembling-machine"]) do
	obj.quality_affects_energy_usage = setting("quality_affects_energy_usage_crafting")
	if obj.module_slots ~= nil and obj.module_slots > 0 then obj.quality_affects_module_slots = setting("quality_affects_module_slots_crafting") end
end

for _, obj in pairs(data.raw["furnace"]) do
	obj.quality_affects_energy_usage = setting("quality_affects_energy_usage_furnace")
	if obj.module_slots ~= nil and obj.module_slots > 0 then obj.quality_affects_module_slots = setting("quality_affects_module_slots_furnace") end
end

if data.raw["rocket-silo"] then
	for _, obj in pairs(data.raw["rocket-silo"]) do
		obj.quality_affects_energy_usage = setting("quality_affects_energy_usage_silo")
		if obj.module_slots ~= nil and obj.module_slots > 0 then obj.quality_affects_module_slots = setting("quality_affects_module_slots_silo") end
		obj.rocket_rising_speed_modifier_per_quality_level = setting("rocket_rising_speed_modifier_per_quality_level")
		obj.rocket_engine_starting_speed_modifier_per_quality_level = setting("rocket_engine_starting_speed_modifier_per_quality_level")
		obj.arms_speed_modifier_per_quality_level = setting("arms_speed_modifier_per_quality_level")
	end
end

data.raw["utility-constants"]["default"].maximum_quality_jump = setting("maximum_quality_jump")

if mods["space-age"] and setting("quality_affects_asteroid_reprocessing") then
	for _, r in pairs({"metallic-asteroid-reprocessing", "carbonic-asteroid-reprocessing", "oxide-asteroid-reprocessing"}) do
		if data.raw["recipe"][r] then
			data.raw["recipe"][r].allow_quality = true
		end
	end
end

if mods["space-age"] and setting("agricultural_tower_enable_modules") then
	for _, obj in pairs(data.raw["agricultural-tower"]) do
		obj.module_slots = math.max(obj.module_slots or 0, setting("agricultural_tower_module_slots"))
		obj.quality_affects_module_slots = setting("agricultural_tower_quality_affects_module_slots")

		local effects_to_enable = {"consumption", "speed", "productivity", "pollution", "quality"}
		if obj.allowed_effects then
			local is_dictionary = false
			for k in pairs(obj.allowed_effects) do
				if type(k) == "string" then
					is_dictionary = true
					break
				end
			end
			if is_dictionary then
				for _, effect in ipairs(effects_to_enable) do
					obj.allowed_effects[effect] = true
				end
			else
				local existing = {}
				for _, effect in ipairs(obj.allowed_effects) do
					existing[effect] = true
				end
				for _, effect in ipairs(effects_to_enable) do
					if not existing[effect] then
						table.insert(obj.allowed_effects, effect)
					end
				end
			end
		else
			obj.allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"}
		end

		if not obj.allowed_module_categories then
			obj.allowed_module_categories = {"speed", "productivity", "quality", "efficiency"}
		end
	end
end