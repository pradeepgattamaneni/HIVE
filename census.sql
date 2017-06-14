Create table census(State String,District String,Persons String,Males int,Females int,Growth_1991_2001 int,Rural int,Urban int,Scheduled_Caste_population int,Percentage_SC_to_total int,Number_of_households int,Household_size_per_household int,Sex_ratio_females_per_1000_males int ,Sex_ratio_0_6_years int,Scheduled_Tribe_population int,Percentage_to_total_population_ST int,Persons_literate int,Males_Literate int,Females_Literate int,Persons_literacy_rate int,Males_Literatacy_Rate int,Females_Literacy_Rate int,Total_Educated int,Data_without_level int,Below_Primary int,Primary int,Middle int,Matric_Higher_Secondary_Diploma int,Graduate_and_Above int,X0_4_years int,X5_14_years int,X15_59_years int,X60_years_and_above_Incl_ANS int,Total_workers int,Main_workers int,Marginal_workers int,Non_workers int,SC_1_Name String,SC_1_Population int,SC_2_Name String,SC_2_Population int,SC_3_Name String,SC_3_Population int,Religeon_1_Name String,Religeon_1_Population int,Religeon_2_Name String,Religeon_2_Population int,Religeon_3_Name String,Religeon_3_Population int,ST_1_Name String,ST_1_Population int,ST_2_Name String,ST_2_Population int,ST_3_Name String,ST_3_Population int,Imp_Town_1_Name String,Imp_Town_1_Population int,Imp_Town_2_Name String,Imp_Town_2_Population int,Imp_Town_3_Name String,Imp_Town_3_Population int,Total_Inhabited_Villages int,Drinking_water_facilities int,Safe_Drinking_water int,Electricity_Power_Supply int,Electricity_domestic int,Electricity_Agriculture int,Primary_school int,Middle_schools int,Secondary_Sr_Secondary_schools int,College int,Medical_facility int,Primary_Health_Centre int,Primary_Health_Sub_Centre int,Post_telegraph_and_telephone_facility int,Bus_services int,Paved_approach_road int,Mud_approach_road int,Permanent_House int,Semi_permanent_House int,Temporary_House int) ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE;
load data local inpath '/home/hduser/Downloads/census.csv' into table census;
select * from census;

--case 1: State-Wise Population
select state,sum(persons) as total_population from census group by state order by total_population desc;

--case2: Growth Rate of Each State Between 1991-2001

select state,avg(Growth_1991_2001) as total_growth from census group by state order by total_growth desc;

--case3: Literacy Rate of Each State

select state,avg(persons_literacy_rate) as total_growth from census group by state order by total_growth desc;

--case4:  State with More Female Population

select state, (sum(Females)-sum(Males)) as fem  from census group by state order by fem desc limit 1;

--case5:  Percentage of Population in Every State

select state, (sum(persons) * 100.0) / SUM(sum(persons)) over() as percent_pop_by_state FROM census group by state order by percent_pop_by_state desc;

--case6:  Percentage of People Working in Each State

select state,sum(Total_workers)*100/sum(persons) as working from census group by state order by working desc;

/*Key points drawn from the analysis:

Uttar Pradeshhas the highest population that constitutes 16% of India’s total population
Top 5 states by population have over 50% of India’s total population
Lakshadweep and Andaman Nicobar Islands are the smallest ones
Kerala and Pondicherry have more female population than male
Nagaland has the highest growth rate of population
Mizoram has the highest number of people working
Kerala has the highest literacy rate  */









