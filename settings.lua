-- mod-name: QualityAdjuster
-- settings.lua
-- Allows users to modify the quality levels via mod settings
data:extend({{
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
}, {
	type = "string-setting",
	name = "normal_level_name",
	setting_type = "startup",
	default_value = "Normal",
	allow_blank = false,
	order = "b1a"
}, {
	type = "int-setting",
	name = "normal_level",
	setting_type = "startup",
	default_value = 0,
	minimum_value = 0,
	maximum_value = 20,
	order = "b1b"
}, {
	type = "double-setting",
	name = "normal_next_probability",
	setting_type = "startup",
	default_value = 0.1,
	minimum_value = 0,
	maximum_value = 1,
	order = "b1c"
}, {
	type = "string-setting",
	name = "uncommon_level_name",
	setting_type = "startup",
	default_value = "Uncommon",
	allow_blank = false,
	order = "b2a"
}, {
	type = "int-setting",
	name = "uncommon_level",
	setting_type = "startup",
	default_value = 1,
	minimum_value = 1,
	maximum_value = 20,
	order = "b2b"
}, {
	type = "double-setting",
	name = "uncommon_next_probability",
	setting_type = "startup",
	default_value = 0.1,
	minimum_value = 0,
	maximum_value = 1,
	order = "b2c"
}, {
	type = "string-setting",
	name = "rare_level_name",
	setting_type = "startup",
	default_value = "Rare",
	allow_blank = false,
	order = "b3a"
}, {
	type = "int-setting",
	name = "rare_level",
	setting_type = "startup",
	default_value = 2,
	minimum_value = 1,
	maximum_value = 20,
	order = "b3b"
}, {
	type = "double-setting",
	name = "rare_next_probability",
	setting_type = "startup",
	default_value = 0.1,
	minimum_value = 0,
	maximum_value = 1,
	order = "b3c"
}, {
	type = "string-setting",
	name = "epic_level_name",
	setting_type = "startup",
	default_value = "Epic",
	allow_blank = false,
	order = "b4a"
}, {
	type = "int-setting",
	name = "epic_level",
	setting_type = "startup",
	default_value = 3,
	minimum_value = 1,
	maximum_value = 20,
	order = "b4b"
}, {
	type = "double-setting",
	name = "epic_next_probability",
	setting_type = "startup",
	default_value = 0.1,
	minimum_value = 0,
	maximum_value = 1,
	order = "b4c"
}, {
	type = "string-setting",
	name = "legendary_level_name",
	setting_type = "startup",
	default_value = "Legendary",
	allow_blank = false,
	order = "b5a"
}, {
	type = "int-setting",
	name = "legendary_level",
	setting_type = "startup",
	default_value = 5,
	minimum_value = 1,
	maximum_value = 20,
	order = "b5b"
}, {
	type = "double-setting",
	name = "quality_module_1",
	setting_type = "startup",
	default_value = 0.1,
	minimum_value = 0,
	maximum_value = 1,
	order = "c0"
}, {
	type = "double-setting",
	name = "quality_module_2",
	setting_type = "startup",
	default_value = 0.2,
	minimum_value = 0,
	maximum_value = 1,
	order = "c1"
}, {
	type = "double-setting",
	name = "quality_module_3",
	setting_type = "startup",
	default_value = 0.25,
	minimum_value = 0,
	maximum_value = 1,
	order = "c2"
}, {
	type = "double-setting",
	name = "speed_module_1",
	setting_type = "startup",
	default_value = -0.1,
	minimum_value = -1,
	maximum_value = 0,
	order = "c3"
}, {
	type = "double-setting",
	name = "speed_module_2",
	setting_type = "startup",
	default_value = -0.15,
	minimum_value = -1,
	maximum_value = 0,
	order = "c4"
}, {
	type = "double-setting",
	name = "speed_module_3",
	setting_type = "startup",
	default_value = -0.25,
	minimum_value = -1,
	maximum_value = 0,
	order = "c5"
}, {
	type = "bool-setting",
	name = "unlink_quality_from_speed",
	setting_type = "startup",
	default_value = false,
	order = "c6"
}, {
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
}, {
	type = "double-setting",
	name = "inserter_speed_multiplier",
	setting_type = "startup",
	default_value = 1,
	minimum_value = 0.1,
	maximum_value = 10,
	order = "e0"
}, {
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
}, {
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
}, {
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
}, {
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
	order = "j1"
}, {
	type = "int-setting",
	name = "rare_science_pack_drain",
	setting_type = "startup",
	default_value = 98,
	minimum_value = 1,
	maximum_value = 100,
	order = "j2"
}, {
	type = "int-setting",
	name = "epic_science_pack_drain",
	setting_type = "startup",
	default_value = 97,
	minimum_value = 1,
	maximum_value = 100,
	order = "j3"
}, {
	type = "int-setting",
	name = "legendary_science_pack_drain",
	setting_type = "startup",
	default_value = 95,
	minimum_value = 1,
	maximum_value = 100,
	order = "j4"
}, {
	type = "bool-setting",
	name = "quality_affects_module_slots_lab",
	setting_type = "startup",
	default_value = false,
	order = "j5"
}, {
	type = "double-setting",
	name = "lab_module_slots_bonus",
	setting_type = "startup",
	default_value = 1,
	minimum_value = 0.1,
	maximum_value = 10,
	order = "j6"
}, {
	type = "double-setting",
	name = "lab_research_speed_multiplier",
	setting_type = "startup",
	default_value = 1,
	minimum_value = 0.1,
	maximum_value = 10,
	order = "j7"
}, {
	type = "bool-setting",
	name = "quality_affects_inventory_size_container",
	setting_type = "startup",
	default_value = true,
	order = "k0"
}, {
	type = "bool-setting",
	name = "quality_affects_inventory_size_cargo_wagon",
	setting_type = "startup",
	default_value = false,
	order = "k1"
}, {
	type = "double-setting",
	name = "inventory_size_multiplier",
	setting_type = "startup",
	default_value = 1,
	minimum_value = 0.1,
	maximum_value = 10,
	order = "k2"
}, {
	type = "bool-setting",
	name = "quality_affects_capacity_fluid_wagon",
	setting_type = "startup",
	default_value = false,
	order = "k3"
}, {
	type = "double-setting",
	name = "fluid_wagon_capacity_multiplier",
	setting_type = "startup",
	default_value = 1,
	minimum_value = 0.1,
	maximum_value = 10,
	order = "k4"
}, {
	type = "double-setting",
	name = "equipment_grid_width_bonus",
	setting_type = "startup",
	default_value = 1,
	minimum_value = 0.1,
	maximum_value = 10,
	order = "k5"
}, {
	type = "double-setting",
	name = "equipment_grid_height_bonus",
	setting_type = "startup",
	default_value = 1,
	minimum_value = 0.1,
	maximum_value = 10,
	order = "k6"
}, {
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
}, {
	type = "double-setting",
	name = "range_multiplier",
	setting_type = "startup",
	default_value = 0.1,
	minimum_value = 0.01,
	maximum_value = 2,
	order = "m1"
}})

if mods["space-age"] or (mods["space-exploration"] and mods["quality-se"]) then
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

if mods["space-age"] then
	data:extend({{
		type = "int-setting",
		name = "asteroid_collector_collection_radius_bonus",
		setting_type = "startup",
		default_value = 1,
		minimum_value = 0,
		maximum_value = 10,
		order = "n0"
	}, {
		type = "int-setting",
		name = "inventory_size_quality_increase_collector",
		setting_type = "startup",
		default_value = 5,
		minimum_value = 0,
		maximum_value = 20,
		order = "n1"
	}, {
		type = "int-setting",
		name = "arm_inventory_size_quality_increase_collector",
		setting_type = "startup",
		default_value = 0,
		minimum_value = 0,
		maximum_value = 10,
		order = "n2"
	}, {
		type = "double-setting",
		name = "energy_usage_quality_scaling_collector",
		setting_type = "startup",
		default_value = 0.1,
		minimum_value = 0,
		maximum_value = 10,
		order = "n3"
	}, {
		type = "int-setting",
		name = "arm_count_quality_scaling_collector",
		setting_type = "startup",
		default_value = 1,
		minimum_value = 0,
		maximum_value = 10,
		order = "n4"
	}, {
		type = "double-setting",
		name = "arm_speed_quality_scaling_collector",
		setting_type = "startup",
		default_value = 0.1,
		minimum_value = 0,
		maximum_value = 1,
		order = "n5"
	}, {
		type = "double-setting",
		name = "arm_angular_speed_cap_quality_scaling_collector",
		setting_type = "startup",
		default_value = 0.1,
		minimum_value = 0,
		maximum_value = 1,
		order = "n6"
	}})
end

if (mods["Additional-Qualities"] or mods["Quality-Plus-Plus"]) then
	if not (data.raw["double-setting"] and data.raw["double-setting"]["legendary_next_probability"]) then
		data:extend({{
			type = "double-setting",
			name = "legendary_next_probability",
			setting_type = "startup",
			default_value = 0.1,
			minimum_value = 0.01,
			maximum_value = 1.0,
			order = "b5c"
		}})
	end
end

-- Additional Qualities mod support
if mods["Additional-Qualities"] then
	data:extend({ -- Mythic Quality
	{
		type = "string-setting",
		name = "mythic_level_name",
		setting_type = "startup",
		default_value = "Mythic",
		allow_blank = false,
		order = "b6a"
	}, {
		type = "int-setting",
		name = "mythic_level",
		setting_type = "startup",
		default_value = 7,
		minimum_value = 0,
		maximum_value = 255,
		order = "b6b"
	}, {
		type = "double-setting",
		name = "mythic_next_probability",
		setting_type = "startup",
		default_value = 0.1,
		minimum_value = 0.01,
		maximum_value = 1.0,
		order = "b6c"
	}, -- Relic Quality
	{
		type = "string-setting",
		name = "relic_level_name",
		setting_type = "startup",
		default_value = "Relic",
		allow_blank = false,
		order = "b7a"
	}, {
		type = "int-setting",
		name = "relic_level",
		setting_type = "startup",
		default_value = 9,
		minimum_value = 0,
		maximum_value = 255,
		order = "b7b"
	}, {
		type = "double-setting",
		name = "relic_next_probability",
		setting_type = "startup",
		default_value = 0.1,
		minimum_value = 0.01,
		maximum_value = 1.0,
		order = "b7c"
	}, -- Masterwork Quality
	{
		type = "string-setting",
		name = "masterwork_level_name",
		setting_type = "startup",
		default_value = "Masterwork",
		allow_blank = false,
		order = "b8a"
	}, {
		type = "int-setting",
		name = "masterwork_level",
		setting_type = "startup",
		default_value = 12,
		minimum_value = 0,
		maximum_value = 255,
		order = "b8b"
	}, {
		type = "double-setting",
		name = "masterwork_next_probability",
		setting_type = "startup",
		default_value = 0.1,
		minimum_value = 0.01,
		maximum_value = 1.0,
		order = "b8c"
	}, -- Eternal Quality
	{
		type = "string-setting",
		name = "eternal_level_name",
		setting_type = "startup",
		default_value = "Eternal",
		allow_blank = false,
		order = "b9a"
	}, {
		type = "int-setting",
		name = "eternal_level",
		setting_type = "startup",
		default_value = 15,
		minimum_value = 0,
		maximum_value = 255,
		order = "b9b"
	}, {
		type = "double-setting",
		name = "eternal_next_probability",
		setting_type = "startup",
		default_value = 0.1,
		minimum_value = 0.01,
		maximum_value = 1.0,
		order = "b9c"
	}, -- Transcendent Quality
	{
		type = "string-setting",
		name = "transcendent_level_name",
		setting_type = "startup",
		default_value = "Transcendent",
		allow_blank = false,
		order = "b9d"
	}, {
		type = "int-setting",
		name = "transcendent_level",
		setting_type = "startup",
		default_value = 20,
		minimum_value = 0,
		maximum_value = 255,
		order = "b9e"
	}, {
		type = "int-setting",
		name = "mythic_science_pack_drain",
		setting_type = "startup",
		default_value = 93,
		minimum_value = 1,
		maximum_value = 100,
		order = "j4a"
	}, {
		type = "int-setting",
		name = "relic_science_pack_drain",
		setting_type = "startup",
		default_value = 91,
		minimum_value = 1,
		maximum_value = 100,
		order = "j4b"
	}, {
		type = "int-setting",
		name = "masterwork_science_pack_drain",
		setting_type = "startup",
		default_value = 88,
		minimum_value = 1,
		maximum_value = 100,
		order = "j4c"
	}, {
		type = "int-setting",
		name = "eternal_science_pack_drain",
		setting_type = "startup",
		default_value = 85,
		minimum_value = 1,
		maximum_value = 100,
		order = "j4d"
	}, {
		type = "int-setting",
		name = "transcendent_science_pack_drain",
		setting_type = "startup",
		default_value = 80,
		minimum_value = 1,
		maximum_value = 100,
		order = "j4e"
	}})
end

-- Quality Plus Plus mod support
if mods["Quality-Plus-Plus"] then
	data:extend({ -- Mythical
	{
		type = "string-setting",
		name = "mythical_level_name",
		setting_type = "startup",
		default_value = "Mythical",
		allow_blank = false,
		order = "b6a"
	}, {
		type = "int-setting",
		name = "mythical_level",
		setting_type = "startup",
		default_value = 6,
		minimum_value = 0,
		maximum_value = 255,
		order = "b6b"
	}, {
		type = "double-setting",
		name = "mythical_next_probability",
		setting_type = "startup",
		default_value = 0.10,
		minimum_value = 0.0,
		maximum_value = 1.0,
		order = "b6c"
	}, -- Masterwork
	{
		type = "string-setting",
		name = "masterwork_level_name",
		setting_type = "startup",
		default_value = "Masterwork",
		allow_blank = false,
		order = "b7a"
	}, {
		type = "int-setting",
		name = "masterwork_level",
		setting_type = "startup",
		default_value = 7,
		minimum_value = 0,
		maximum_value = 255,
		order = "b7b"
	}, {
		type = "double-setting",
		name = "masterwork_next_probability",
		setting_type = "startup",
		default_value = 0.10,
		minimum_value = 0.0,
		maximum_value = 1.0,
		order = "b7c"
	}, -- Wondrous
	{
		type = "string-setting",
		name = "wondrous_level_name",
		setting_type = "startup",
		default_value = "Wondrous",
		allow_blank = false,
		order = "b8a"
	}, {
		type = "int-setting",
		name = "wondrous_level",
		setting_type = "startup",
		default_value = 8,
		minimum_value = 0,
		maximum_value = 255,
		order = "b8b"
	}, {
		type = "double-setting",
		name = "wondrous_next_probability",
		setting_type = "startup",
		default_value = 0.10,
		minimum_value = 0.0,
		maximum_value = 1.0,
		order = "b8c"
	}, -- Artifactual
	{
		type = "string-setting",
		name = "artifactual_level_name",
		setting_type = "startup",
		default_value = "Artifactual",
		allow_blank = false,
		order = "b9a"
	}, {
		type = "int-setting",
		name = "artifactual_level",
		setting_type = "startup",
		default_value = 10,
		minimum_value = 0,
		maximum_value = 255,
		order = "b9b"
	}, {
		type = "int-setting",
		name = "mythical_science_pack_drain",
		setting_type = "startup",
		default_value = 94,
		minimum_value = 1,
		maximum_value = 100,
		order = "j4a"
	}, {
		type = "int-setting",
		name = "masterwork_science_pack_drain",
		setting_type = "startup",
		default_value = 93,
		minimum_value = 1,
		maximum_value = 100,
		order = "j4b"
	}, {
		type = "int-setting",
		name = "wondrous_science_pack_drain",
		setting_type = "startup",
		default_value = 92,
		minimum_value = 1,
		maximum_value = 100,
		order = "j4c"
	}, {
		type = "int-setting",
		name = "artifactual_science_pack_drain",
		setting_type = "startup",
		default_value = 90,
		minimum_value = 1,
		maximum_value = 100,
		order = "j4d"
	}})
end
