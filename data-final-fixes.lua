local beacon_divisor = settings.startup["beacon_power_usage_divisor"].value
local mining_divisor = settings.startup["mining_drill_resource_drain_divisor"].value
local unlink = settings.startup["unlink_quality_from_speed"].value

local function round(value)
	return math.max(1, math.floor(value + 0.5))
end

local quality_mapping = {
	[0.1] = settings.startup["quality_module_1"].value,
	[0.2] = settings.startup["quality_module_2"].value,
	[0.25] = settings.startup["quality_module_3"].value,
	[-0.1] = settings.startup["speed_module_1"].value,
	[-0.15] = settings.startup["speed_module_2"].value,
	[-0.25] = settings.startup["speed_module_3"].value
}

local function modifyModule(mod)
	local effects = mod.effect
	if effects.speed and effects.speed > 0 then
		if unlink then
			effects.quality = 0
		else
			if quality_mapping[effects.quality] then
				effects.quality = quality_mapping[effects.quality]
			end
		end
	end
	if effects.quality and effects.quality > 0 then
		if unlink then
			effects.speed = 0
		end
		if quality_mapping[effects.quality] then
			effects.quality = quality_mapping[effects.quality]
		end
	end
	mod.effect = effects
end

for _, mod in pairs(data.raw.module) do
	modifyModule(mod)
end

local normal = data.raw.quality.normal
normal.level = settings.startup["normal_level"].value
normal.next_probability = settings.startup["normal_next_probability"].value

local uncommon = data.raw.quality.uncommon
uncommon.level = settings.startup["uncommon_level"].value
uncommon.beacon_power_usage_multiplier = round((5 / 6) * beacon_divisor) / beacon_divisor
uncommon.mining_drill_resource_drain_multiplier = round((5 / 6) * mining_divisor) / mining_divisor
uncommon.science_pack_drain_multiplier = settings.startup["uncommon_science_pack_drain"].value / 100
uncommon.next_probability = settings.startup["uncommon_next_probability"].value

local rare = data.raw.quality.rare
rare.level = settings.startup["rare_level"].value
rare.beacon_power_usage_multiplier = round((4 / 6) * beacon_divisor) / beacon_divisor
rare.mining_drill_resource_drain_multiplier = round((4 / 6) * mining_divisor) / mining_divisor
rare.science_pack_drain_multiplier = settings.startup["rare_science_pack_drain"].value / 100
rare.next_probability = settings.startup["rare_next_probability"].value

local epic = data.raw.quality.epic
epic.level = settings.startup["epic_level"].value
epic.beacon_power_usage_multiplier = round((3 / 6) * beacon_divisor) / beacon_divisor
epic.mining_drill_resource_drain_multiplier = round((3 / 6) * mining_divisor) / mining_divisor
epic.science_pack_drain_multiplier = settings.startup["epic_science_pack_drain"].value / 100
epic.next_probability = settings.startup["epic_next_probability"].value

local legendary = data.raw.quality.legendary
legendary.level = settings.startup["legendary_level"].value
legendary.beacon_power_usage_multiplier = 1 / beacon_divisor
legendary.mining_drill_resource_drain_multiplier = 1 / mining_divisor
legendary.science_pack_drain_multiplier = settings.startup["legendary_science_pack_drain"].value / 100

for _, obj in pairs(data.raw["lab"]) do
	obj.uses_quality_drain_modifier = settings.startup["lab_uses_quality_drain_modifier"].value
end

for _, obj in pairs(data.raw["cargo-wagon"]) do
	obj.quality_affects_inventory_size = settings.startup["quality_affects_inventory_size_cargo_wagon"].value
end

for _, obj in pairs(data.raw["container"]) do
	obj.quality_affects_inventory_size = settings.startup["quality_affects_inventory_size_container"].value
end

for _, obj in pairs(data.raw["fluid-wagon"]) do
	obj.quality_affects_capacity = settings.startup["quality_affects_capacity_fluid_wagon"].value
end

for _, obj in pairs(data.raw["roboport-equipment"]) do
	obj.charging_station_count_affected_by_quality =
		settings.startup["charging_station_count_affected_by_quality_roboport_equipment"].value
end

for _, obj in pairs(data.raw["roboport"]) do
	obj.charging_station_count_affected_by_quality =
		settings.startup["charging_station_count_affected_by_quality_roboport"].value
end

for _, obj in pairs(data.raw["chain-active-trigger"]) do
	obj.fork_chance_increase_per_quality_level =
		settings.startup["fork_chance_increase_per_quality_level_chain_active_trigger"].value
end

for _, obj in pairs(data.raw["beacon"]) do
	obj.distribution_effectivity_bonus_per_quality_level =
		settings.startup["distribution_effectivity_bonus_per_quality_level_beacon"].value
end

for _, obj in pairs(data.raw["asteroid-collector"]) do
	obj.arm_inventory_size_quality_increase =
		settings.startup["arm_inventory_size_quality_increase_asteroid_collector"].value
	obj.inventory_size_quality_increase = settings.startup["inventory_size_quality_increase_asteroid_collector"].value
	obj.energy_usage_quality_scaling = settings.startup["energy_usage_quality_scaling_asteroid_collector"].value
	obj.arm_count_quality_scaling = settings.startup["arm_count_quality_scaling_asteroid_collector"].value
	obj.arm_speed_quality_scaling = settings.startup["arm_speed_quality_scaling_asteroid_collector"].value
	obj.arm_angular_speed_cap_quality_scaling =
		settings.startup["arm_angular_speed_cap_quality_scaling_asteroid_collector"].value
end

