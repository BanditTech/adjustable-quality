-- mod-name: QualityAdjuster
-- settings.lua
-- Allows users to modify the quality levels via mod settings

---------------------------------------
-- Section A - General
---------------------------------------
data:extend({
	{
		type = "double-setting",
		name = "default_multiplier",
		setting_type = "startup",
		default_value = 0.3,
		minimum_value = 0.01,
		maximum_value = 10,
		order = "a0"
	}, {
		type = "double-setting",
		name = "tool_durability_multiplier",
		setting_type = "startup",
		default_value = 1,
		minimum_value = 0.01,
		maximum_value = 10,
		order = "a1"
	}, {
		type = "int-setting",
		name = "maximum_quality_jump",
		setting_type = "startup",
		default_value = 255,
		minimum_value = 1,
		maximum_value = 255,
		order = "a2"
	}
})

---------------------------------------
-- Section B - Quality prototypes
---------------------------------------
data:extend({
	{ -- Normal
		type = "string-setting",
		name = "normal_level_name",
		setting_type = "startup",
		default_value = "Normal",
		allow_blank = false,
		order = "b01a"
	}, {
		type = "int-setting",
		name = "normal_level",
		setting_type = "startup",
		default_value = 0,
		minimum_value = 0,
		maximum_value = 255,
		order = "b01b"
	}, {
		type = "double-setting",
		name = "normal_next_probability",
		setting_type = "startup",
		default_value = 1.0,
		minimum_value = 0,
		maximum_value = 10,
		order = "b01c"
	}, { -- Uncommon
		type = "string-setting",
		name = "uncommon_level_name",
		setting_type = "startup",
		default_value = "Uncommon",
		allow_blank = false,
		order = "b02a"
	}, {
		type = "int-setting",
		name = "uncommon_level",
		setting_type = "startup",
		default_value = 1,
		minimum_value = 1,
		maximum_value = 255,
		order = "b02b"
	}, {
		type = "double-setting",
		name = "uncommon_next_probability",
		setting_type = "startup",
		default_value = 1.0,
		minimum_value = 0,
		maximum_value = 10,
		order = "b02c"
	}, {
		type = "double-setting",
		name = "uncommon_chain_probability",
		setting_type = "startup",
		default_value = 0.1,
		minimum_value = 0,
		maximum_value = 1,
		order = "b02d"
	}, { -- Rare
		type = "string-setting",
		name = "rare_level_name",
		setting_type = "startup",
		default_value = "Rare",
		allow_blank = false,
		order = "b03a"
	}, {
		type = "int-setting",
		name = "rare_level",
		setting_type = "startup",
		default_value = 2,
		minimum_value = 1,
		maximum_value = 255,
		order = "b03b"
	}, {
		type = "double-setting",
		name = "rare_next_probability",
		setting_type = "startup",
		default_value = 1.0,
		minimum_value = 0,
		maximum_value = 10,
		order = "b03c"
	}, {
		type = "double-setting",
		name = "rare_chain_probability",
		setting_type = "startup",
		default_value = 0.1,
		minimum_value = 0,
		maximum_value = 1,
		order = "b03d"
	}, { -- Epic
		type = "string-setting",
		name = "epic_level_name",
		setting_type = "startup",
		default_value = "Epic",
		allow_blank = false,
		order = "b04a"
	}, {
		type = "int-setting",
		name = "epic_level",
		setting_type = "startup",
		default_value = 3,
		minimum_value = 1,
		maximum_value = 255,
		order = "b04b"
	}, {
		type = "double-setting",
		name = "epic_next_probability",
		setting_type = "startup",
		default_value = 1.0,
		minimum_value = 0,
		maximum_value = 10,
		order = "b04c"
	}, {
		type = "double-setting",
		name = "epic_chain_probability",
		setting_type = "startup",
		default_value = 0.1,
		minimum_value = 0,
		maximum_value = 1,
		order = "b04d"
	}, { -- Legendary
		type = "string-setting",
		name = "legendary_level_name",
		setting_type = "startup",
		default_value = "Legendary",
		allow_blank = false,
		order = "b05a"
	}, {
		type = "int-setting",
		name = "legendary_level",
		setting_type = "startup",
		default_value = 5,
		minimum_value = 1,
		maximum_value = 255,
		order = "b05b"
	}
})

if (mods["Additional-Qualities"] or mods["Quality-Plus-Plus"]) then
	data:extend({{
		type = "double-setting",
		name = "legendary_next_probability",
		setting_type = "startup",
		default_value = 1.0,
		minimum_value = 0.01,
		maximum_value = 10.0,
		order = "b05c"
	}, {
		type = "double-setting",
		name = "legendary_chain_probability",
		setting_type = "startup",
		default_value = 0.1,
		minimum_value = 0,
		maximum_value = 1,
		order = "b05d"
	}})
end
if mods["Additional-Qualities"] then
	data:extend({
	{ -- Mythic Quality
		type = "string-setting",
		name = "mythic_level_name",
		setting_type = "startup",
		default_value = "Mythic",
		allow_blank = false,
		order = "b06a"
	}, {
		type = "int-setting",
		name = "mythic_level",
		setting_type = "startup",
		default_value = 7,
		minimum_value = 0,
		maximum_value = 255,
		order = "b06b"
	}, {
		type = "double-setting",
		name = "mythic_next_probability",
		setting_type = "startup",
		default_value = 1.0,
		minimum_value = 0.01,
		maximum_value = 10.0,
		order = "b06c"
	}, {
		type = "double-setting",
		name = "mythic_chain_probability",
		setting_type = "startup",
		default_value = 0.1,
		minimum_value = 0,
		maximum_value = 1,
		order = "b06d"
	}, { -- Relic Quality
		type = "string-setting",
		name = "relic_level_name",
		setting_type = "startup",
		default_value = "Relic",
		allow_blank = false,
		order = "b07a"
	}, {
		type = "int-setting",
		name = "relic_level",
		setting_type = "startup",
		default_value = 9,
		minimum_value = 0,
		maximum_value = 255,
		order = "b07b"
	}, {
		type = "double-setting",
		name = "relic_next_probability",
		setting_type = "startup",
		default_value = 1.0,
		minimum_value = 0.01,
		maximum_value = 10.0,
		order = "b07c"
	}, {
		type = "double-setting",
		name = "relic_chain_probability",
		setting_type = "startup",
		default_value = 0.1,
		minimum_value = 0,
		maximum_value = 1,
		order = "b07d"
	}, { -- Masterwork Quality
		type = "string-setting",
		name = "masterwork_level_name",
		setting_type = "startup",
		default_value = "Masterwork",
		allow_blank = false,
		order = "b08a"
	}, {
		type = "int-setting",
		name = "masterwork_level",
		setting_type = "startup",
		default_value = 12,
		minimum_value = 0,
		maximum_value = 255,
		order = "b08b"
	}, {
		type = "double-setting",
		name = "masterwork_next_probability",
		setting_type = "startup",
		default_value = 1.0,
		minimum_value = 0.01,
		maximum_value = 10.0,
		order = "b08c"
	}, {
		type = "double-setting",
		name = "masterwork_chain_probability",
		setting_type = "startup",
		default_value = 0.1,
		minimum_value = 0,
		maximum_value = 1,
		order = "b08d"
	}, { -- Eternal Quality
		type = "string-setting",
		name = "eternal_level_name",
		setting_type = "startup",
		default_value = "Eternal",
		allow_blank = false,
		order = "b09a"
	}, {
		type = "int-setting",
		name = "eternal_level",
		setting_type = "startup",
		default_value = 15,
		minimum_value = 0,
		maximum_value = 255,
		order = "b09b"
	}, {
		type = "double-setting",
		name = "eternal_next_probability",
		setting_type = "startup",
		default_value = 1.0,
		minimum_value = 0.01,
		maximum_value = 10.0,
		order = "b09c"
	}, {
		type = "double-setting",
		name = "eternal_chain_probability",
		setting_type = "startup",
		default_value = 0.1,
		minimum_value = 0,
		maximum_value = 1,
		order = "b09d"
	}, { -- Transcendent Quality
		type = "string-setting",
		name = "transcendent_level_name",
		setting_type = "startup",
		default_value = "Transcendent",
		allow_blank = false,
		order = "b10a"
	}, {
		type = "int-setting",
		name = "transcendent_level",
		setting_type = "startup",
		default_value = 20,
		minimum_value = 0,
		maximum_value = 255,
		order = "b10b"
	}, {
		type = "double-setting",
		name = "transcendent_next_probability",
		setting_type = "startup",
		default_value = 1.0,
		minimum_value = 0.01,
		maximum_value = 10.0,
		order = "b10c"
	}, {
		type = "double-setting",
		name = "transcendent_chain_probability",
		setting_type = "startup",
		default_value = 0.1,
		minimum_value = 0,
		maximum_value = 1,
		order = "b10d"
	}, {
		type = "int-setting",
		name = "transcendent_level_step",
		setting_type = "startup",
		default_value = 1,
		minimum_value = 0,
		maximum_value = 255,
		order = "b10e"
	}, {
		type = "double-setting",
		name = "transcendent_next_probability_decay",
		setting_type = "startup",
		default_value = 0.9,
		minimum_value = 0.0,
		maximum_value = 1.0,
		order = "b10f"
	}})
end
if mods["Quality-Plus-Plus"] then
	data:extend({
	{ -- Mythical
		type = "string-setting",
		name = "mythical_level_name",
		setting_type = "startup",
		default_value = "Mythical",
		allow_blank = false,
		order = "b06a"
	}, {
		type = "int-setting",
		name = "mythical_level",
		setting_type = "startup",
		default_value = 6,
		minimum_value = 0,
		maximum_value = 255,
		order = "b06b"
	}, {
		type = "double-setting",
		name = "mythical_next_probability",
		setting_type = "startup",
		default_value = 1.0,
		minimum_value = 0.0,
		maximum_value = 10.0,
		order = "b06c"
	}, {
		type = "double-setting",
		name = "mythical_chain_probability",
		setting_type = "startup",
		default_value = 0.1,
		minimum_value = 0,
		maximum_value = 1,
		order = "b06d"
	}, { -- Masterwork
		type = "string-setting",
		name = "masterwork_level_name",
		setting_type = "startup",
		default_value = "Masterwork",
		allow_blank = false,
		order = "b07a"
	}, {
		type = "int-setting",
		name = "masterwork_level",
		setting_type = "startup",
		default_value = 7,
		minimum_value = 0,
		maximum_value = 255,
		order = "b07b"
	}, {
		type = "double-setting",
		name = "masterwork_next_probability",
		setting_type = "startup",
		default_value = 1.0,
		minimum_value = 0.0,
		maximum_value = 10.0,
		order = "b07c"
	}, {
		type = "double-setting",
		name = "masterwork_chain_probability",
		setting_type = "startup",
		default_value = 0.1,
		minimum_value = 0,
		maximum_value = 1,
		order = "b07d"
	}, { -- Wondrous
		type = "string-setting",
		name = "wondrous_level_name",
		setting_type = "startup",
		default_value = "Wondrous",
		allow_blank = false,
		order = "b08a"
	}, {
		type = "int-setting",
		name = "wondrous_level",
		setting_type = "startup",
		default_value = 8,
		minimum_value = 0,
		maximum_value = 255,
		order = "b08b"
	}, {
		type = "double-setting",
		name = "wondrous_next_probability",
		setting_type = "startup",
		default_value = 1.0,
		minimum_value = 0.0,
		maximum_value = 10.0,
		order = "b08c"
	}, {
		type = "double-setting",
		name = "wondrous_chain_probability",
		setting_type = "startup",
		default_value = 0.1,
		minimum_value = 0,
		maximum_value = 1,
		order = "b08d"
	}, { -- Artifactual
		type = "string-setting",
		name = "artifactual_level_name",
		setting_type = "startup",
		default_value = "Artifactual",
		allow_blank = false,
		order = "b09a"
	}, {
		type = "int-setting",
		name = "artifactual_level",
		setting_type = "startup",
		default_value = 10,
		minimum_value = 0,
		maximum_value = 255,
		order = "b09b"
	}})
end

---------------------------------------
-- Section C - Module Adjustment
---------------------------------------
data:extend({
	{
		type = "double-setting",
		name = "quality_module_1",
		setting_type = "startup",
		default_value = 0.1,
		minimum_value = 0,
		maximum_value = 1,
		order = "c0a"
	}, {
		type = "double-setting",
		name = "quality_module_2",
		setting_type = "startup",
		default_value = 0.2,
		minimum_value = 0,
		maximum_value = 1,
		order = "c0b"
	}, {
		type = "double-setting",
		name = "quality_module_3",
		setting_type = "startup",
		default_value = 0.25,
		minimum_value = 0,
		maximum_value = 1,
		order = "c0c"
	}, {
		type = "double-setting",
		name = "speed_module_1",
		setting_type = "startup",
		default_value = -0.1,
		minimum_value = -1,
		maximum_value = 0,
		order = "c1a"
	}, {
		type = "double-setting",
		name = "speed_module_2",
		setting_type = "startup",
		default_value = -0.15,
		minimum_value = -1,
		maximum_value = 0,
		order = "c1b"
	}, {
		type = "double-setting",
		name = "speed_module_3",
		setting_type = "startup",
		default_value = -0.25,
		minimum_value = -1,
		maximum_value = 0,
		order = "c1c"
	}, {
		type = "bool-setting",
		name = "unlink_quality_from_speed",
		setting_type = "startup",
		default_value = false,
		order = "c2"
	}, {
		type = "double-setting",
		name = "module_consumption_multiplier",
		setting_type = "startup",
		default_value = 1.0,
		minimum_value = 0,
		maximum_value = 10,
		order = "c3"
	}, {
		type = "double-setting",
		name = "module_speed_multiplier",
		setting_type = "startup",
		default_value = 1.0,
		minimum_value = 0,
		maximum_value = 10,
		order = "c4"
	}, {
		type = "double-setting",
		name = "module_productivity_multiplier",
		setting_type = "startup",
		default_value = 1.0,
		minimum_value = 0,
		maximum_value = 10,
		order = "c5"
	}, {
		type = "double-setting",
		name = "module_quality_multiplier",
		setting_type = "startup",
		default_value = 1.0,
		minimum_value = 0,
		maximum_value = 10,
		order = "c6"
	}, {
		type = "double-setting",
		name = "module_pollution_multiplier",
		setting_type = "startup",
		default_value = 1.0,
		minimum_value = 0,
		maximum_value = 10,
		order = "c7"
	}
})

---------------------------------------
-- Section D - Crafting machine
---------------------------------------
data:extend({
	{
		type = "bool-setting",
		name = "quality_affects_energy_usage_furnace",
		setting_type = "startup",
		default_value = false,
		order = "d0a"
	}, {
		type = "bool-setting",
		name = "quality_affects_energy_usage_crafting",
		setting_type = "startup",
		default_value = false,
		order = "d0"
	}, {
		type = "double-setting",
		name = "crafting_machine_energy_usage_reduction",
		setting_type = "startup",
		default_value = 1 / 6,
		minimum_value = -10,
		maximum_value = 1,
		order = "d1"
	}, {
		type = "bool-setting",
		name = "quality_affects_module_slots_crafting",
		setting_type = "startup",
		default_value = false,
		order = "d2"
	}, {
		type = "bool-setting",
		name = "quality_affects_module_slots_furnace",
		setting_type = "startup",
		default_value = false,
		order = "d2a"
	}, {
		type = "double-setting",
		name = "crafting_machine_module_slots_bonus",
		setting_type = "startup",
		default_value = 1,
		minimum_value = 0.1,
		maximum_value = 10,
		order = "d3"
	}, {
		type = "double-setting",
		name = "crafting_machine_speed_multiplier",
		setting_type = "startup",
		default_value = 1,
		minimum_value = 0.1,
		maximum_value = 10,
		order = "d4"
	}
})

---------------------------------------
-- Section E - Inserter
---------------------------------------
data:extend({
	{
		type = "double-setting",
		name = "inserter_speed_multiplier",
		setting_type = "startup",
		default_value = 1,
		minimum_value = 0.1,
		maximum_value = 10,
		order = "e0"
	}
})

---------------------------------------
-- Section F - Electricity
---------------------------------------
data:extend({
	{
		type = "double-setting",
		name = "accumulator_capacity_multiplier",
		setting_type = "startup",
		default_value = 1,
		minimum_value = 0.1,
		maximum_value = 10,
		order = "f0"
	}, {
		type = "double-setting",
		name = "electric_pole_wire_reach_bonus",
		setting_type = "startup",
		default_value = 2,
		minimum_value = 0.1,
		maximum_value = 20,
		order = "f1"
	}, {
		type = "double-setting",
		name = "electric_pole_supply_area_distance_bonus",
		setting_type = "startup",
		default_value = 1,
		minimum_value = 0.1,
		maximum_value = 10,
		order = "f2"
	}
})

---------------------------------------
-- Section G - Beacon
---------------------------------------
data:extend({
	{
		type = "bool-setting",
		name = "quality_affects_module_slots_beacon",
		setting_type = "startup",
		default_value = false,
		order = "g0"
	}, {
		type = "double-setting",
		name = "beacon_module_slots_bonus",
		setting_type = "startup",
		default_value = 1,
		minimum_value = 0.1,
		maximum_value = 10,
		order = "g1"
	}, {
		type = "bool-setting",
		name = "quality_affects_supply_area_distance_beacon",
		setting_type = "startup",
		default_value = false,
		order = "g2"
	}, {
		type = "double-setting",
		name = "beacon_supply_area_distance_bonus",
		setting_type = "startup",
		default_value = 1,
		minimum_value = 0,
		maximum_value = 10,
		order = "g3"
	}, {
		type = "double-setting",
		name = "distribution_effectivity_bonus_per_quality_level",
		setting_type = "startup",
		default_value = 0.2,
		minimum_value = 0,
		maximum_value = 10,
		order = "g4"
	}, {
		type = "double-setting",
		name = "beacon_power_usage_reduction",
		setting_type = "startup",
		default_value = 1 / 6,
		minimum_value = -10,
		maximum_value = 1,
		order = "g5"
	}
})

---------------------------------------
-- Section H - Mining drill
---------------------------------------
data:extend({
	{
		type = "double-setting",
		name = "mining_drill_resource_drain_reduction",
		setting_type = "startup",
		default_value = 1 / 6,
		minimum_value = 0,
		maximum_value = 1,
		order = "h0"
	}, {
		type = "bool-setting",
		name = "quality_affects_mining_radius",
		setting_type = "startup",
		default_value = false,
		order = "h1"
	}, {
		type = "double-setting",
		name = "mining_drill_mining_radius_bonus",
		setting_type = "startup",
		default_value = 1,
		minimum_value = 0.1,
		maximum_value = 10,
		order = "h2"
	}, {
		type = "bool-setting",
		name = "quality_affects_module_slots_mining",
		setting_type = "startup",
		default_value = false,
		order = "h3"
	}, {
		type = "double-setting",
		name = "mining_drill_module_slots_bonus",
		setting_type = "startup",
		default_value = 1,
		minimum_value = 0.1,
		maximum_value = 10,
		order = "h4"
	}
})

---------------------------------------
-- Section I - Trains
---------------------------------------
data:extend({
	{
		type = "bool-setting",
		name = "quality_affects_inventory_size_cargo_wagon",
		setting_type = "startup",
		default_value = true,
		order = "i0a"
	}, {
		type = "double-setting",
		name = "cargo_wagon_inventory_size_multiplier",
		setting_type = "startup",
		default_value = 1,
		minimum_value = 0.1,
		maximum_value = 10,
		order = "i0b"
	}, {
		type = "bool-setting",
		name = "quality_affects_capacity_fluid_wagon",
		setting_type = "startup",
		default_value = true,
		order = "i1a"
	}, {
		type = "double-setting",
		name = "fluid_wagon_capacity_multiplier",
		setting_type = "startup",
		default_value = 1,
		minimum_value = 0.1,
		maximum_value = 10,
		order = "i1b"
	}, {
		type = "bool-setting",
		name = "quality_affects_max_speed",
		setting_type = "startup",
		default_value = true,
		order = "i2a"
	}, {
		type = "double-setting",
		name = "rolling_stock_max_speed_multiplier",
		setting_type = "startup",
		default_value = 0.03,
		minimum_value = 0,
		maximum_value = 10,
		order = "i2b"
	}, {
		type = "double-setting",
		name = "locomotive_power_multiplier",
		setting_type = "startup",
		default_value = 0.2,
		minimum_value = 0,
		maximum_value = 10,
		order = "i3"
	}
})

---------------------------------------
-- Section J - Lab
---------------------------------------
data:extend({
	{
		type = "bool-setting",
		name = "lab_uses_quality_drain_modifier",
		setting_type = "startup",
		default_value = false,
		order = "j0"
	}, {
		type = "int-setting",
		name = "uncommon_science_pack_drain",
		setting_type = "startup",
		default_value = 99,
		minimum_value = 1,
		maximum_value = 100,
		order = "j1a"
	}, {
		type = "int-setting",
		name = "rare_science_pack_drain",
		setting_type = "startup",
		default_value = 98,
		minimum_value = 1,
		maximum_value = 100,
		order = "j1b"
	}, {
		type = "int-setting",
		name = "epic_science_pack_drain",
		setting_type = "startup",
		default_value = 97,
		minimum_value = 1,
		maximum_value = 100,
		order = "j1c"
	}, {
		type = "int-setting",
		name = "legendary_science_pack_drain",
		setting_type = "startup",
		default_value = 95,
		minimum_value = 1,
		maximum_value = 100,
		order = "j1d"
	}, {
		type = "bool-setting",
		name = "quality_affects_module_slots_lab",
		setting_type = "startup",
		default_value = false,
		order = "j2"
	}, {
		type = "double-setting",
		name = "lab_module_slots_bonus",
		setting_type = "startup",
		default_value = 1,
		minimum_value = 0.1,
		maximum_value = 10,
		order = "j3"
	}, {
		type = "double-setting",
		name = "lab_research_speed_multiplier",
		setting_type = "startup",
		default_value = 1,
		minimum_value = 0.1,
		maximum_value = 10,
		order = "j4"
	}
})

if mods["Additional-Qualities"] then
	data:extend({{
		type = "int-setting",
		name = "mythic_science_pack_drain",
		setting_type = "startup",
		default_value = 93,
		minimum_value = 1,
		maximum_value = 100,
		order = "j1e"
	}, {
		type = "int-setting",
		name = "relic_science_pack_drain",
		setting_type = "startup",
		default_value = 91,
		minimum_value = 1,
		maximum_value = 100,
		order = "j1f"
	}, {
		type = "int-setting",
		name = "masterwork_science_pack_drain",
		setting_type = "startup",
		default_value = 88,
		minimum_value = 1,
		maximum_value = 100,
		order = "j1g"
	}, {
		type = "int-setting",
		name = "eternal_science_pack_drain",
		setting_type = "startup",
		default_value = 85,
		minimum_value = 1,
		maximum_value = 100,
		order = "j1h"
	}, {
		type = "int-setting",
		name = "transcendent_science_pack_drain",
		setting_type = "startup",
		default_value = 80,
		minimum_value = 1,
		maximum_value = 100,
		order = "j1i"
	}, {
		type = "int-setting",
		name = "transcendent_science_pack_drain_step",
		setting_type = "startup",
		default_value = 0,
		minimum_value = 0,
		maximum_value = 100,
		order = "j1j"
	}})
end
if mods["Quality-Plus-Plus"] then
	data:extend({{
		type = "int-setting",
		name = "mythical_science_pack_drain",
		setting_type = "startup",
		default_value = 94,
		minimum_value = 1,
		maximum_value = 100,
		order = "j1e"
	}, {
		type = "int-setting",
		name = "masterwork_science_pack_drain",
		setting_type = "startup",
		default_value = 93,
		minimum_value = 1,
		maximum_value = 100,
		order = "j1f"
	}, {
		type = "int-setting",
		name = "wondrous_science_pack_drain",
		setting_type = "startup",
		default_value = 92,
		minimum_value = 1,
		maximum_value = 100,
		order = "j1g"
	}, {
		type = "int-setting",
		name = "artifactual_science_pack_drain",
		setting_type = "startup",
		default_value = 90,
		minimum_value = 1,
		maximum_value = 100,
		order = "j1h"
	}})
end

---------------------------------------
-- Section K - Inventory
---------------------------------------
data:extend({
	{
		type = "bool-setting",
		name = "quality_affects_inventory_size_container",
		setting_type = "startup",
		default_value = true,
		order = "k0"
	}, {
		type = "double-setting",
		name = "inventory_size_multiplier",
		setting_type = "startup",
		default_value = 1,
		minimum_value = 0.1,
		maximum_value = 10,
		order = "k1"
	}, {
		type = "double-setting",
		name = "equipment_grid_width_bonus",
		setting_type = "startup",
		default_value = 1,
		minimum_value = 0.1,
		maximum_value = 10,
		order = "k2"
	}, {
		type = "double-setting",
		name = "equipment_grid_height_bonus",
		setting_type = "startup",
		default_value = 1,
		minimum_value = 0.1,
		maximum_value = 10,
		order = "k3"
	}
})

---------------------------------------
-- Section L - Logistic cell
---------------------------------------
data:extend({
	{
		type = "bool-setting",
		name = "charging_station_count_affected_by_quality_equipment",
		setting_type = "startup",
		default_value = false,
		order = "l0"
	}, {
		type = "bool-setting",
		name = "charging_station_count_affected_by_quality",
		setting_type = "startup",
		default_value = false,
		order = "l1"
	}, {
		type = "double-setting",
		name = "logistic_cell_charging_energy_multiplier",
		setting_type = "startup",
		default_value = 1,
		minimum_value = 0.1,
		maximum_value = 10,
		order = "l2"
	}, {
		type = "double-setting",
		name = "logistic_cell_charging_station_count_bonus",
		setting_type = "startup",
		default_value = 1,
		minimum_value = 0.1,
		maximum_value = 10,
		order = "l2"
	}, {
		type = "double-setting",
		name = "flying_robot_max_energy_multiplier",
		setting_type = "startup",
		default_value = 1,
		minimum_value = 0.1,
		maximum_value = 10,
		order = "l3"
	}
})

---------------------------------------
-- Section M - Weaponry
---------------------------------------
if mods["space-age"] or mods["space-exploration"] then
	data:extend({{
		type = "double-setting",
		name = "fork_chance_increase_per_quality_level_chain_active_trigger",
		setting_type = "startup",
		default_value = 0.1,
		minimum_value = 0,
		maximum_value = 1,
		order = "m0"
	}})
end
data:extend({{
	type = "double-setting",
	name = "range_multiplier",
	setting_type = "startup",
	default_value = 0.1,
	minimum_value = 0.01,
	maximum_value = 2,
	order = "m01"
}})

---------------------------------------
-- Section N - Silo and Space Age
---------------------------------------
data:extend({
	{
		type = "bool-setting",
		name = "quality_affects_energy_usage_silo",
		setting_type = "startup",
		default_value = false,
		order = "n00"
	}, {
		type = "bool-setting",
		name = "quality_affects_module_slots_silo",
		setting_type = "startup",
		default_value = false,
		order = "n01"
	}, {
		type = "double-setting",
		name = "rocket_rising_speed_modifier_per_quality_level",
		setting_type = "startup",
		default_value = 0.15,
		minimum_value = 0,
		maximum_value = 10,
		order = "n02"
	}, {
		type = "double-setting",
		name = "rocket_engine_starting_speed_modifier_per_quality_level",
		setting_type = "startup",
		default_value = 0.45,
		minimum_value = 0,
		maximum_value = 10,
		order = "n03"
	}, {
		type = "double-setting",
		name = "arms_speed_modifier_per_quality_level",
		setting_type = "startup",
		default_value = 0.2,
		minimum_value = 0,
		maximum_value = 10,
		order = "n04"
	}
})
if mods["space-age"] then
	data:extend({
		{
			type = "int-setting",
			name = "asteroid_collector_collection_radius_bonus",
			setting_type = "startup",
			default_value = 1,
			minimum_value = 0,
			maximum_value = 10,
			order = "n05"
		}, {
			type = "int-setting",
			name = "inventory_size_quality_increase_collector",
			setting_type = "startup",
			default_value = 5,
			minimum_value = 0,
			maximum_value = 20,
			order = "n06"
		}, {
			type = "int-setting",
			name = "arm_inventory_size_quality_increase_collector",
			setting_type = "startup",
			default_value = 0,
			minimum_value = 0,
			maximum_value = 10,
			order = "n07"
		}, {
			type = "double-setting",
			name = "energy_usage_quality_scaling_collector",
			setting_type = "startup",
			default_value = 0.1,
			minimum_value = 0,
			maximum_value = 10,
			order = "n08"
		}, {
			type = "int-setting",
			name = "arm_count_quality_scaling_collector",
			setting_type = "startup",
			default_value = 1,
			minimum_value = 0,
			maximum_value = 10,
			order = "n09"
		}, {
			type = "double-setting",
			name = "arm_speed_quality_scaling_collector",
			setting_type = "startup",
			default_value = 0.1,
			minimum_value = 0,
			maximum_value = 1,
			order = "n10"
		}, {
			type = "double-setting",
			name = "arm_angular_speed_cap_quality_scaling_collector",
			setting_type = "startup",
			default_value = 0.1,
			minimum_value = 0,
			maximum_value = 1,
			order = "n11"
		}, {
			type = "bool-setting",
			name = "quality_affects_asteroid_reprocessing",
			setting_type = "startup",
			default_value = false,
			order = "n12"
		}
	})
end

---------------------------------------
-- Section O - Spoilage
---------------------------------------
if mods["space-age"] then
	data:extend({
		{
			type = "double-setting",
			name = "spoil_ticks_multiplier",
			setting_type = "startup",
			default_value = 1.0,
			minimum_value = 0.1,
			maximum_value = 10,
			order = "o0"
		}
	})
end

---------------------------------------
-- Section P - Agricultural Tower
---------------------------------------
if mods["space-age"] then
	data:extend({
		{
			type = "bool-setting",
			name = "agricultural_tower_enable_modules",
			setting_type = "startup",
			default_value = false,
			order = "p0"
		}, {
			type = "int-setting",
			name = "agricultural_tower_module_slots",
			setting_type = "startup",
			default_value = 2,
			minimum_value = 0,
			maximum_value = 10,
			order = "p1"
		}, {
			type = "bool-setting",
			name = "agricultural_tower_quality_affects_module_slots",
			setting_type = "startup",
			default_value = false,
			order = "p2"
		}
	})
end
