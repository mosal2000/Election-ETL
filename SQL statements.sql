use election_2018_db;

SELECT hc.fec_candidate_id, hc.name, hc.party, hc.status, hc.office_state, 
		hc.district, cf.total_receipt, cf.cash_on_hand_cop, 
        cf.total_contribution, cf.net_contribution 
FROM house_candidate hc
join candidate_finance cf on hc.fec_candidate_id = cf.fec_candidate_id;

select cl.id, cl.name, hc.fec_candidate_id
FROM election_2018_db.us_congress_list cl
left join house_candidate hc on hc.clean_name = cl.name;


select cl.id, cl.name, cl.state, cl.st_abbrev, cl.district, hc.fec_candidate_id
FROM election_2018_db.us_congress_list cl
left join house_candidate hc on (hc.clean_name = cl.name and hc.office_state = cl.st_abbrev and hc.district = cl.district)
where cl.congress_num = 116
order by cl.st_abbrev, cl.district;

select cl.id, cl.name, cl.state, cl.st_abbrev, cl.district, hc.fec_candidate_id
FROM election_2018_db.us_congress_list cl
left join house_candidate hc on (hc.clean_name = cl.name and hc.office_state = cl.st_abbrev and hc.district = cl.district)
where cl.congress_num = 116 and hc.fec_candidate_id is null
order by cl.st_abbrev, cl.district;

select cl.id, cl.name, cl.state, cl.st_abbrev, cl.district, hc.fec_candidate_id
FROM election_2018_db.us_congress_list cl
left join house_candidate hc on (
	(SUBSTRING_INDEX(hc.clean_name, ' ', -1) = SUBSTRING_INDEX(cl.name, ' ', -1)
      or SUBSTRING_INDEX(hc.clean_name, ' ', 1) = SUBSTRING_INDEX(cl.name, ' ', 1)
      or SUBSTRING_INDEX(hc.clean_name, ' ', 2) = SUBSTRING_INDEX(cl.name, ' ', 2)
    )
    and hc.office_state = cl.st_abbrev 
    and hc.district = cl.district
    )
where cl.congress_num = 116 and hc.fec_candidate_id is null
order by cl.st_abbrev, cl.district;

