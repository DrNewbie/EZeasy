function ButlerMirroringManager:_on_heist_complete(level_id, difficulty_id)
	local sound_event = nil
	local heist_difficulties = {
		{
			{
				"overkill_290",
				"sm_wish",
				"EZeasy"
			},
			"d"
		},
		{
			{
				"normal",
				"hard",
				"overkill",
				"overkill_145",
				"easy_wish",
				"overkill_290",
				"sm_wish",
				"EZeasy"
			},
			"n"
		}
	}
	local heist_events = {
		firestarter = "fs",
		branchbank_prof = "bh",
		watchdogs_night = "wd",
		branchbank_deposit = "bh",
		ukrainian_job_prof = "uj",
		framing_frame = "ff",
		hox = "hb",
		arm_par = "at",
		born = "bkr",
		pbr = "btm",
		rat = "co",
		jewelry_store = "js",
		big = "bb",
		cane = "sw",
		arm_cro = "at",
		alex = "rat",
		election_day = "ed",
		welcome_to_the_jungle_prof = "bo",
		mus = "td",
		kosugi = "sr",
		arm_fac = "at",
		cage = "cs",
		peta = "gs",
		kenaz = "gg",
		mad = "bp",
		crojob2 = "bf",
		haunted = "sfn",
		shoutout_raid = "md",
		branchbank_gold_prof = "bh",
		family = "ds",
		nightclub = "nc",
		mallcrasher = "mc",
		pbr2 = "bos",
		hox_3 = "hr",
		pal = "cf",
		dinner = "slh",
		man = "uc",
		watchdogs = "wd",
		nail = "lr",
		crojob1 = "bd",
		four_stores = "fos",
		branchbank_cash = "bh",
		flat = "pr",
		arm_for = "th",
		watchdogs_wrapper = "wd",
		roberts = "gb",
		arm_und = "at",
		dark = "ms",
		jolly = "as",
		red2 = "fwb",
		arm_hcm = "at",
		arena = "ah",
		mia = "hm",
		pines = "wx",
		chill_combat = "sfh",
		gallery = "ag"
	}
	local level_event_id = heist_events[level_id]

	if level_event_id then
		local difficulty_event_id = nil

		for _, diff_data in ipairs(heist_difficulties) do
			if table.contains(diff_data[1], difficulty_id) then
				difficulty_event_id = diff_data[2]

				break
			end
		end

		difficulty_event_id = difficulty_event_id or "n"
		sound_event = "Play_btl_hcr_" .. level_event_id .. difficulty_event_id .. "_01"

		print("[ButlerMirroringManager] queued sound event for heist: ", level_id, sound_event)
	else
		print("[ButlerMirroringManager] no sound_event for heist: ", level_id)
	end

	local generic_lines = {
		the_butcher = "Play_btl_contract_butcher_sin",
		the_elephant = "Play_btl_contract_elephant_sin",
		the_continental = "Play_btl_contract_continental_sin",
		the_dentist = "Play_btl_contract_dentist_sin",
		vlad = "Play_btl_contract_vlad_sin",
		bain = "Play_btl_contract_bain_sin",
		locke = "Play_btl_contract_locke_sin"
	}

	if not sound_event then
		local job = tweak_data.narrative.jobs[level_id]

		if job and job.contact then
			sound_event = generic_lines[job.contact]
		end
	end

	if sound_event then
		self:_set_queue("Message.OnHeistComplete", {
			debug = "On heist complete VO",
			forgettable = true,
			sound_events = {sound_event},
			priority = priorities.heist_result + 0.5
		}, 1.1, 99)
	elseif managers.statistics:session_hit_accuracy() > 80 then
		self:_set_queue("heist_result", {
			debug = "On won a heist VO",
			forgettable = true,
			sound_events = {"Play_btl_acc_80"},
			priority = priorities.heist_result + 0.5
		})
	else
		self:_set_queue("heist_result", {
			debug = "On won a heist VO",
			forgettable = true,
			sound_events = {"Play_btl_lvl_won_gen"},
			priority = priorities.heist_result
		})
	end
end