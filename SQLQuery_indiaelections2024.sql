select distinct COUNT (parliament_constituency) as Total_seats
from constituencywise_results

--total number of seats available for elections in each state
select states.State, COUNT(constituencywise_results.Parliament_Constituency) as Total_Seats
from states join statewise_results
on states.State_ID = statewise_results.State_ID
join constituencywise_results
on constituencywise_results.Parliament_Constituency = statewise_results.Parliament_Constituency
group by states.State

---total seats won by NDA Alliance
select 
SUM(case
when party in ('Bharatiya Janata Party - BJP', 
                'Telugu Desam - TDP', 
				'Janata Dal  (United) - JD(U)',
                'Shiv Sena - SHS', 
                'AJSU Party - AJSUP', 
                'Apna Dal (Soneylal) - ADAL', 
                'Asom Gana Parishad - AGP',
                'Hindustani Awam Morcha (Secular) - HAMS', 
				'Janasena Party - JnP', 
				'Janata Dal  (Secular) - JD(S)',
                'Lok Janshakti Party(Ram Vilas) - LJPRV', 
                'Nationalist Congress Party - NCP',
                'Rashtriya Lok Dal - RLD', 
                'Sikkim Krantikari Morcha - SKM')
then [won]
else 0
end) as Total_Seats_Won_by_NDA
from partywise_results
    
---Seats Won by NDA Allianz Parties
	select Party, Won from [partywise_results]
where party in ('Bharatiya Janata Party - BJP', 
                'Telugu Desam - TDP', 
				'Janata Dal  (United) - JD(U)',
                'Shiv Sena - SHS', 
                'AJSU Party - AJSUP', 
                'Apna Dal (Soneylal) - ADAL', 
                'Asom Gana Parishad - AGP',
                'Hindustani Awam Morcha (Secular) - HAMS', 
				'Janasena Party - JnP', 
				'Janata Dal  (Secular) - JD(S)',
                'Lok Janshakti Party(Ram Vilas) - LJPRV', 
                'Nationalist Congress Party - NCP',
                'Rashtriya Lok Dal - RLD', 
                'Sikkim Krantikari Morcha - SKM')
order by Won desc


---Total Seats Won by I.N.D.I.A. Allianz
select SUM(case 
when 
party in('Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK')
				then [Won]
				else 0
				end) as Total_seats_won_by_INDIA_Allianz
				from partywise_results

---Seats Won by I.N.D.I.A. Allianz Parties
select Party, Won from partywise_results
where
party in('Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK')
order by Won desc

--Add new column field in table partywise_results to get the Party Allianz as NDA, I.N.D.I.A and OTHER

alter table partywise_results
add Party_Allianz varchar(150)

update partywise_results
set Party_Allianz = 'I.N.D.I.A.'
where Party in ('Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK')

update partywise_results
set Party_Allianz = 'NDA'
where Party in ('Bharatiya Janata Party - BJP', 
                'Telugu Desam - TDP', 
				'Janata Dal  (United) - JD(U)',
                'Shiv Sena - SHS', 
                'AJSU Party - AJSUP', 
                'Apna Dal (Soneylal) - ADAL', 
                'Asom Gana Parishad - AGP',
                'Hindustani Awam Morcha (Secular) - HAMS', 
				'Janasena Party - JnP', 
				'Janata Dal  (Secular) - JD(S)',
                'Lok Janshakti Party(Ram Vilas) - LJPRV', 
                'Nationalist Congress Party - NCP',
                'Rashtriya Lok Dal - RLD', 
                'Sikkim Krantikari Morcha - SKM')

update partywise_results
set Party_Allianz = 'OTHER'
where Party_Allianz is null

--Which party alliance (NDA, I.N.D.I.A, or OTHER) won the most seats across all states

select Party_Allianz, SUM(Won) as Total_seats
from partywise_results
group by Party_Allianz
order by Total_seats desc

--Winning candidate's name, their party name, total votes, and the margin of victory 
--for a specific state/constituency

select Winning_Candidate, Party, Total_Votes, Party_Allianz, Constituency_Name, statewise_results.State
from constituencywise_results
join statewise_results 
on constituencywise_results.Parliament_Constituency = statewise_results.Parliament_Constituency
join partywise_results 
on partywise_results.Party_ID = constituencywise_results.Party_ID
join states
on states.State_ID = statewise_results.State_ID
where Constituency_Name = 'Agra'

--Distribution of EVM votes versus postal votes for candidates in a specific constituency
select EVM_Votes, Postal_Votes, Candidate,Constituency_Name
from constituencywise_results
join constituencywise_details
on constituencywise_results.Constituency_ID = constituencywise_details.Constituency_ID
where Constituency_Name = 'Ajmer'





















