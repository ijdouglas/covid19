#Clear existing data and graphics
rm(list=ls())
graphics.off()
#Load Hmisc library
library(Hmisc)
#Read Data
setwd('~/Box/Research/covid19/scripts/CleaningData')
data=read.csv('../../data/raw_exports/EFStudySurveyFormsDa_DATA_2021-03-29_1556.csv')
output_file = paste0('../../data/raw_exports/coded_', Sys.Date(), '.csv')
#Setting Labels

label(data$participant_id)="Child Participant ID"
label(data$redcap_event_name)="Event Name"
label(data$redcap_survey_identifier)="Survey Identifier"
label(data$covid_child_survey_2_timestamp)="Survey Timestamp"
label(data$covid_child_eng_consent_v2)="I consent to this survey:"
label(data$covid_child_eng_age_v2)="Your age:"
label(data$covid_child_eng_date_v2)="Date today (click Today button):"
label(data$covid_child_eng_init_v2)="Please provide your name or initials:"
label(data$covid_child_eng_zip_v2)="Please enter your zip code:"
label(data$covid_child_eng_grade_v2)="Your current year in school (e.g., 3rd grade, 9th grade, or grad year): "
label(data$covid_child_eng_school_v2)="Current school (if applicable):"
label(data$covid_child_eng_school2_v2)="Current school format (e.g., in person, online, mix/hybrid, learning pod, not in school):"
label(data$covid_child_eng_1_v2)="1. Thinking of this fall/winter, how much has the COVID-19 outbreak, and the resulting changes to daily life, affected your life in a negative way?"
label(data$covid_child_eng_2_v2___1)="2. What event or change to daily life has been the most negative these past 2-3 months? (check up to three)  (choice=Worried about someone who has or has had the virus)"
label(data$covid_child_eng_2_v2___2)="2. What event or change to daily life has been the most negative these past 2-3 months? (check up to three)  (choice=Having to stay at home)"
label(data$covid_child_eng_2_v2___3)="2. What event or change to daily life has been the most negative these past 2-3 months? (check up to three)  (choice=Not seeing friends in person)"
label(data$covid_child_eng_2_v2___4)="2. What event or change to daily life has been the most negative these past 2-3 months? (check up to three)  (choice=Thinking about how many people are dying because of the virus)"
label(data$covid_child_eng_2_v2___5)="2. What event or change to daily life has been the most negative these past 2-3 months? (check up to three)  (choice=Not going to school)"
label(data$covid_child_eng_2_v2___6)="2. What event or change to daily life has been the most negative these past 2-3 months? (check up to three)  (choice=Spending more time with family)"
label(data$covid_child_eng_2_v2___7)="2. What event or change to daily life has been the most negative these past 2-3 months? (check up to three)  (choice=Increased stress or disorientation from not having a schedule)"
label(data$covid_child_eng_2_v2___8)="2. What event or change to daily life has been the most negative these past 2-3 months? (check up to three)  (choice=Not having access to things I need (i.e., food, products))"
label(data$covid_child_eng_3_v2)="3. Thinking of this fall/winter, how much has the COVID-19 outbreak, and the resulting changes to daily life, affected your life in a positive way?"
label(data$covid_child_eng_4_v2___1)="4. What event or change to daily life has been the most positive in the past 2-3 months? (check all that apply)  (choice=Reduced amount of schoolwork or no schoolwork)"
label(data$covid_child_eng_4_v2___2)="4. What event or change to daily life has been the most positive in the past 2-3 months? (check all that apply)  (choice=Less stress/pressure from school and activities)"
label(data$covid_child_eng_4_v2___3)="4. What event or change to daily life has been the most positive in the past 2-3 months? (check all that apply)  (choice=More time to relax)"
label(data$covid_child_eng_4_v2___4)="4. What event or change to daily life has been the most positive in the past 2-3 months? (check all that apply)  (choice=Getting to do things they dont usually have time for (i.e., art, music, writing, cooking))"
label(data$covid_child_eng_4_v2___5)="4. What event or change to daily life has been the most positive in the past 2-3 months? (check all that apply)  (choice=Getting more recreational time on the phone/computer (i.e., texting, social media))"
label(data$covid_child_eng_4_v2___6)="4. What event or change to daily life has been the most positive in the past 2-3 months? (check all that apply)  (choice=Getting to watch more TV/movies)"
label(data$covid_child_eng_4_v2___7)="4. What event or change to daily life has been the most positive in the past 2-3 months? (check all that apply)  (choice=More time to exercise or go outside)"
label(data$covid_child_eng_4_v2___8)="4. What event or change to daily life has been the most positive in the past 2-3 months? (check all that apply)  (choice=Getting more sleep)"
label(data$covid_child_eng_4_v2___9)="4. What event or change to daily life has been the most positive in the past 2-3 months? (check all that apply)  (choice=Spending more time with family)"
label(data$covid_child_eng_4_v2___10)="4. What event or change to daily life has been the most positive in the past 2-3 months? (check all that apply)  (choice=Spending more time with my pet(s))"
label(data$covid_child_eng_4_v2___11)="4. What event or change to daily life has been the most positive in the past 2-3 months? (check all that apply)  (choice=Not having to have unwanted interactions with other kids at school)"
label(data$covid_child_eng_4_v2___12)="4. What event or change to daily life has been the most positive in the past 2-3 months? (check all that apply)  (choice=Feeling like I have more control in creating my own schedule)"
label(data$covid_child_eng_5_v2)="5. Have you been tested for COVID-19/coronavirus?"
label(data$covid_child_eng_5a_v2)="5a. Was the COVID-19 test ever positive?"
label(data$covid_child_eng_5b_v2)="5b. What date was the test? (mm/dd/yyyy)"
label(data$covid_child_eng_6_v2)="6. Do you know anyone who has tested positive for [or had significant symptoms of] COVID-19? "
label(data$covid_child_eng_6a_v2___1)="Please select who (check any that apply) (choice=Mother)"
label(data$covid_child_eng_6a_v2___2)="Please select who (check any that apply) (choice=Father)"
label(data$covid_child_eng_6a_v2___3)="Please select who (check any that apply) (choice=Sibling(s))"
label(data$covid_child_eng_6a_v2___4)="Please select who (check any that apply) (choice=Grandparent(s))"
label(data$covid_child_eng_6a_v2___5)="Please select who (check any that apply) (choice=Aunt/Uncle(s))"
label(data$covid_child_eng_6a_v2___6)="Please select who (check any that apply) (choice=Cousin(s))"
label(data$covid_child_eng_6a_v2___7)="Please select who (check any that apply) (choice=Friend/Classmate(s))"
label(data$covid_child_eng_6a_v2___8)="Please select who (check any that apply) (choice=Neighbor)"
label(data$covid_child_eng_6a_v2___9)="Please select who (check any that apply) (choice=Teacher)"
label(data$covid_child_eng_6a_v2___10)="Please select who (check any that apply) (choice=Friends Family Member)"
label(data$covid_child_eng_6a_v2___11)="Please select who (check any that apply) (choice=Other (please specify):)"
label(data$covid_child_eng_6b_v2)=""
label(data$covid_child_eng_7_v2)="7. Has anyone in your house or extended family (i.e., grandparent, uncle/aunt, cousin) died because they had COVID-19?"
label(data$covid_child_eng_7a_v2___1)="Please select who (check any that apply) (choice=Mother)"
label(data$covid_child_eng_7a_v2___2)="Please select who (check any that apply) (choice=Father)"
label(data$covid_child_eng_7a_v2___3)="Please select who (check any that apply) (choice=Sibling(s))"
label(data$covid_child_eng_7a_v2___4)="Please select who (check any that apply) (choice=Grandparent(s))"
label(data$covid_child_eng_7a_v2___5)="Please select who (check any that apply) (choice=Aunt/Uncle(s))"
label(data$covid_child_eng_7a_v2___6)="Please select who (check any that apply) (choice=Cousin(s))"
label(data$covid_child_eng_7a_v2___7)="Please select who (check any that apply) (choice=Other (please specify):)"
label(data$covid_child_eng_7b_v2)=""
label(data$covid_child_eng_8_v2)="8. Have any of your friends (or their family members) had COVID-19?"
label(data$covid_child_eng_8a_v2)="If yes, relationship (i.e., friends grandma, etc.):"
label(data$covid_child_eng_8b_v2)="Have any of your friends (or their family members) been hospitalized because of COVID-19?"
label(data$covid_child_eng_8c_v2)="If yes, who: "
label(data$covid_child_eng_books_v2)="9. Have you been doing more or less reading (of books in any format) since the start of COVID-19?"
label(data$covid_child_eng_homework_v2)="10. If you are in school (in any format), did you had more or less school work this past fall than before COVID-19?"
label(data$covid_child_eng_grades_v2)="11. Have your grades been better or worse this past fall relative to your last pre-COVID grades?"
label(data$covid_child_eng_concern_v2)="What is your biggest concern about school (if in school), or your work now?"
label(data$covid_child_eng_excited_v2)="What are you most excited about with your school/work now?"
label(data$covid_child_eng_situation_v2)="Do you have any other comments about your school or work situation this past fall and into 2021?"
label(data$covid_child_eng_11_v2)="15. COVID-19 presents a lot of uncertainty about the future. In the past 7 days, including today, how stressful have you found this uncertainty to be? "
label(data$covid_child_eng_12_v2)="16. The COVID-19 outbreak has changed and disrupted many existing plans. In the past 7 days, including today, how stressful do you find these disruptions to be? "
label(data$covid_child_eng_13_v2)="17. COVID-19 is a new virus. In the past 7 days, including today, how worried were you that someone in your household or extended family (i.e., grandparent, uncle/aunt, cousin) might become sick? "
label(data$covid_child_eng_14a_v2)="Anxious"
label(data$covid_child_eng_14b_v2)="Angry"
label(data$covid_child_eng_14c_v2)="Content"
label(data$covid_child_eng_14d_v2)="Afraid"
label(data$covid_child_eng_14e_v2)="Happy"
label(data$covid_child_eng_14f_v2)="Sad"
label(data$covid_child_eng_14g_v2)="Worried"
label(data$covid_child_eng_14h_v2)="Irritable"
label(data$covid_child_eng_14i_v2)="Concerned"
label(data$covid_child_eng_14j_v2)="Stressed"
label(data$covid_child_eng_14k_v2)="Relieved"
label(data$covid_child_eng_14l_v2)="Distressed"
label(data$covid_child_eng_14m_v2)="Lonely"
label(data$covid_child_eng_14n_v2)="Bored"
label(data$covid_child_eng_14o_v2)="Hopeless"
label(data$covid_child_eng_14p_v2)="Frustrated"
label(data$covid_child_eng_14q_v2)="Disappointed"
label(data$covid_child_eng_14r_v2)="Calm"
label(data$covid_child_eng_14s_v2)="Appreciative"
label(data$covid_child_eng_15a_v2)="Relaxed"
label(data$covid_child_eng_15b_v2)="Hopeful"
label(data$covid_child_eng_15c_v2)="Confident about the future"
label(data$covid_child_eng_15d_v2)="Hopeless"
label(data$covid_child_eng_15e_v2)="Anxious/Stressed"
label(data$covid_child_eng_15f_v2)="Cheerful"
label(data$covid_child_eng_16_v2___1)="20. For the past 2-3 months, how have you coped or dealt with stress/anxiety related to the COVID-19 outbreak? (check all that apply)    (choice=Getting a good nights sleep)"
label(data$covid_child_eng_16_v2___2)="20. For the past 2-3 months, how have you coped or dealt with stress/anxiety related to the COVID-19 outbreak? (check all that apply)    (choice=Meditation and/or mindfulness practices)"
label(data$covid_child_eng_16_v2___3)="20. For the past 2-3 months, how have you coped or dealt with stress/anxiety related to the COVID-19 outbreak? (check all that apply)    (choice=Prayer)"
label(data$covid_child_eng_16_v2___4)="20. For the past 2-3 months, how have you coped or dealt with stress/anxiety related to the COVID-19 outbreak? (check all that apply)    (choice=Writing (e.g., poetry, journaling))"
label(data$covid_child_eng_16_v2___5)="20. For the past 2-3 months, how have you coped or dealt with stress/anxiety related to the COVID-19 outbreak? (check all that apply)    (choice=Talking with friends (i.e., FaceTime, Zoom))"
label(data$covid_child_eng_16_v2___6)="20. For the past 2-3 months, how have you coped or dealt with stress/anxiety related to the COVID-19 outbreak? (check all that apply)    (choice=Using text or other social media with friends)"
label(data$covid_child_eng_16_v2___7)="20. For the past 2-3 months, how have you coped or dealt with stress/anxiety related to the COVID-19 outbreak? (check all that apply)    (choice=Engaging in more family activities (e.g., games, sports))"
label(data$covid_child_eng_16_v2___8)="20. For the past 2-3 months, how have you coped or dealt with stress/anxiety related to the COVID-19 outbreak? (check all that apply)    (choice=Exercising)"
label(data$covid_child_eng_16_v2___9)="20. For the past 2-3 months, how have you coped or dealt with stress/anxiety related to the COVID-19 outbreak? (check all that apply)    (choice=Playing an instrument)"
label(data$covid_child_eng_16_v2___10)="20. For the past 2-3 months, how have you coped or dealt with stress/anxiety related to the COVID-19 outbreak? (check all that apply)    (choice=Listening to music)"
label(data$covid_child_eng_16_v2___11)="20. For the past 2-3 months, how have you coped or dealt with stress/anxiety related to the COVID-19 outbreak? (check all that apply)    (choice=Watching a movie)"
label(data$covid_child_eng_16_v2___12)="20. For the past 2-3 months, how have you coped or dealt with stress/anxiety related to the COVID-19 outbreak? (check all that apply)    (choice=Spending time with my dog/cat or other pet)"
label(data$covid_child_eng_16_v2___13)="20. For the past 2-3 months, how have you coped or dealt with stress/anxiety related to the COVID-19 outbreak? (check all that apply)    (choice=Talking to mental health care professionals (e.g., therapists, psychologists, psychiatrists))"
label(data$covid_child_eng_16_v2___14)="20. For the past 2-3 months, how have you coped or dealt with stress/anxiety related to the COVID-19 outbreak? (check all that apply)    (choice=Playing video games)"
label(data$covid_child_eng_16_v2___15)="20. For the past 2-3 months, how have you coped or dealt with stress/anxiety related to the COVID-19 outbreak? (check all that apply)    (choice=Reading a book)"
label(data$covid_child_eng_16_v2___16)="20. For the past 2-3 months, how have you coped or dealt with stress/anxiety related to the COVID-19 outbreak? (check all that apply)    (choice=Art or crafts)"
label(data$covid_child_eng_16_v2___17)="20. For the past 2-3 months, how have you coped or dealt with stress/anxiety related to the COVID-19 outbreak? (check all that apply)    (choice=Playing board games or cards)"
label(data$covid_child_eng_16_v2___18)="20. For the past 2-3 months, how have you coped or dealt with stress/anxiety related to the COVID-19 outbreak? (check all that apply)    (choice=Eating comfort foods (e.g., candy and chips))"
label(data$covid_child_eng_16_v2___19)="20. For the past 2-3 months, how have you coped or dealt with stress/anxiety related to the COVID-19 outbreak? (check all that apply)    (choice=Eating healthier)"
label(data$covid_child_eng_16_v2___20)="20. For the past 2-3 months, how have you coped or dealt with stress/anxiety related to the COVID-19 outbreak? (check all that apply)    (choice=Increased self-care (e.g., taking baths, giving self a facial))"
label(data$covid_child_eng_16_v2___21)="20. For the past 2-3 months, how have you coped or dealt with stress/anxiety related to the COVID-19 outbreak? (check all that apply)    (choice=Taking vitamins or herbals for immune system)"
label(data$covid_child_eng_16_v2___22)="20. For the past 2-3 months, how have you coped or dealt with stress/anxiety related to the COVID-19 outbreak? (check all that apply)    (choice=Drinking alcohol)"
label(data$covid_child_eng_16_v2___23)="20. For the past 2-3 months, how have you coped or dealt with stress/anxiety related to the COVID-19 outbreak? (check all that apply)    (choice=Using tobacco (i.e., smoking, vaping))"
label(data$covid_child_eng_16_v2___24)="20. For the past 2-3 months, how have you coped or dealt with stress/anxiety related to the COVID-19 outbreak? (check all that apply)    (choice=Using marijuana (i.e., smoking, vaping, eating))"
label(data$covid_child_eng_16_v2___25)="20. For the past 2-3 months, how have you coped or dealt with stress/anxiety related to the COVID-19 outbreak? (check all that apply)    (choice=Using other recreational drugs)"
label(data$covid_child_eng_16_v2___26)="20. For the past 2-3 months, how have you coped or dealt with stress/anxiety related to the COVID-19 outbreak? (check all that apply)    (choice=Not skipping their prescribed drugs)"
label(data$covid_child_eng_16_v2___27)="20. For the past 2-3 months, how have you coped or dealt with stress/anxiety related to the COVID-19 outbreak? (check all that apply)    (choice=Using new prescription drugs)"
label(data$covid_child_eng_16_v2___28)="20. For the past 2-3 months, how have you coped or dealt with stress/anxiety related to the COVID-19 outbreak? (check all that apply)    (choice=Helping others)"
label(data$covid_child_eng_16_v2___29)="20. For the past 2-3 months, how have you coped or dealt with stress/anxiety related to the COVID-19 outbreak? (check all that apply)    (choice=None)"
label(data$covid_child_eng_16_v2___30)="20. For the past 2-3 months, how have you coped or dealt with stress/anxiety related to the COVID-19 outbreak? (check all that apply)    (choice=Other (please describe):)"
label(data$covid_child_eng_16ex_v2)=""
label(data$covid_child_eng_17a_v2)="Thinking a lot about COVID-19"
label(data$covid_child_eng_17b_v2)="Easily distracted"
label(data$covid_child_eng_17c_v2)="Forgetful in daily activities"
label(data$covid_child_eng_17d_v2)="Easily switching tasks"
label(data$covid_child_eng_17e_v2)="More focus"
label(data$covid_child_eng_17f_v2)="More disorganized"
label(data$covid_child_eng_17g_v2)="Having racing thoughts"
label(data$covid_child_eng_17h_v2)="Zoning out"
label(data$covid_child_eng_17i_v2)="Able to sustain attention on tasks"
label(data$covid_child_eng_17j_v2)="Able to plan activities or work"
label(data$covid_child_eng_17k_v2)="Able to review work"
label(data$covid_child_eng_18_v2)="22. How long do you think it will be before things go back to normal?"
label(data$covid_child_eng_19_v2)="23. When did you begin social distancing (i.e., not seeing friends or family in person except for those in your household)?"
label(data$covid_child_eng_20_v2)="24. Do you agree with the CURRENT restrictions (i.e., social distancing) that have been recommended or required by your local and state government?"
label(data$covid_child_eng_21_v2___1)="25. Which activity do you miss the most? (choose up to three, and ignore those that dont apply) (choice=In-person contact with friends)"
label(data$covid_child_eng_21_v2___2)="25. Which activity do you miss the most? (choose up to three, and ignore those that dont apply) (choice=In-person contact wiith extended family)"
label(data$covid_child_eng_21_v2___3)="25. Which activity do you miss the most? (choose up to three, and ignore those that dont apply) (choice=Going to school)"
label(data$covid_child_eng_21_v2___4)="25. Which activity do you miss the most? (choose up to three, and ignore those that dont apply) (choice=School work)"
label(data$covid_child_eng_21_v2___5)="25. Which activity do you miss the most? (choose up to three, and ignore those that dont apply) (choice=Family activities in outdoor spaces (e.g., beaches, forests, national parks))"
label(data$covid_child_eng_21_v2___6)="25. Which activity do you miss the most? (choose up to three, and ignore those that dont apply) (choice=Family activities in public spaces (e.g., museums, playgrounds, theaters))"
label(data$covid_child_eng_21_v2___7)="25. Which activity do you miss the most? (choose up to three, and ignore those that dont apply) (choice=Joining in team sports)"
label(data$covid_child_eng_21_v2___8)="25. Which activity do you miss the most? (choose up to three, and ignore those that dont apply) (choice=Going to restaurants or stores)"
label(data$covid_child_eng_21_v2___9)="25. Which activity do you miss the most? (choose up to three, and ignore those that dont apply) (choice=Music, theater, art activities)"
label(data$covid_child_eng_21_v2___10)="25. Which activity do you miss the most? (choose up to three, and ignore those that dont apply) (choice=In-person religious services)"
label(data$covid_child_eng_21_v2___11)="25. Which activity do you miss the most? (choose up to three, and ignore those that dont apply) (choice=Having my job (if you were working or volunteering before))"
label(data$covid_child_eng_21_v2___12)="25. Which activity do you miss the most? (choose up to three, and ignore those that dont apply) (choice=Other (please describe):)"
label(data$covid_child_eng_21ex_v2)=""
label(data$covid_child_eng_22_v2___1)="26. Which activity do you miss the least? (choose up to three, please ignore those that dont apply to you) (choice=In-person contact with friends)"
label(data$covid_child_eng_22_v2___2)="26. Which activity do you miss the least? (choose up to three, please ignore those that dont apply to you) (choice=In-person contact wiith extended family)"
label(data$covid_child_eng_22_v2___3)="26. Which activity do you miss the least? (choose up to three, please ignore those that dont apply to you) (choice=Going to school)"
label(data$covid_child_eng_22_v2___4)="26. Which activity do you miss the least? (choose up to three, please ignore those that dont apply to you) (choice=School work)"
label(data$covid_child_eng_22_v2___5)="26. Which activity do you miss the least? (choose up to three, please ignore those that dont apply to you) (choice=Family activities in outdoor spaces (e.g., beaches, forests, national parks))"
label(data$covid_child_eng_22_v2___6)="26. Which activity do you miss the least? (choose up to three, please ignore those that dont apply to you) (choice=Family activities in public spaces (e.g., museums, playgrounds, theaters))"
label(data$covid_child_eng_22_v2___7)="26. Which activity do you miss the least? (choose up to three, please ignore those that dont apply to you) (choice=Joining in team sports)"
label(data$covid_child_eng_22_v2___8)="26. Which activity do you miss the least? (choose up to three, please ignore those that dont apply to you) (choice=Going to restaurants or stores)"
label(data$covid_child_eng_22_v2___9)="26. Which activity do you miss the least? (choose up to three, please ignore those that dont apply to you) (choice=Music, theater, art activities)"
label(data$covid_child_eng_22_v2___10)="26. Which activity do you miss the least? (choose up to three, please ignore those that dont apply to you) (choice=In-person religious services)"
label(data$covid_child_eng_22_v2___11)="26. Which activity do you miss the least? (choose up to three, please ignore those that dont apply to you) (choice=Having my job (if you were working or volunteering before))"
label(data$covid_child_eng_22_v2___12)="26. Which activity do you miss the least? (choose up to three, please ignore those that dont apply to you) (choice=Other (please describe):)"
label(data$covid_child_eng_22ex_v2)=""
label(data$covid_child_eng_23_v2)="27. How often are you getting outside of your house for allowed stay-at-home activities (e.g., going on a walk or a run, walking a pet, spending time in your backyard)?"
label(data$covid_child_eng_24_v2)="28. How often have you followed the rules about the social distancing or stay-at-home restrictions put in place in your community?"
label(data$covid_child_eng_25_v2)="29. Since September, how often do you talk/chat with friends online (including on your cell phone, on social media, or through online gaming)?"
label(data$covid_child_eng_26_v2___1)="30. Since September, how do you stay connected with friends? (check all that apply) (choice=Texting (phone) or Messaging (on social media))"
label(data$covid_child_eng_26_v2___2)="30. Since September, how do you stay connected with friends? (check all that apply) (choice=Voice-only phone calls)"
label(data$covid_child_eng_26_v2___3)="30. Since September, how do you stay connected with friends? (check all that apply) (choice=Video calls (e.g., FaceTime, Google Duo, Skype, Zoom))"
label(data$covid_child_eng_26_v2___4)="30. Since September, how do you stay connected with friends? (check all that apply) (choice=Using social media for live chats)"
label(data$covid_child_eng_26_v2___5)="30. Since September, how do you stay connected with friends? (check all that apply) (choice=Posting on social media)"
label(data$covid_child_eng_26_v2___6)="30. Since September, how do you stay connected with friends? (check all that apply) (choice=Using social media to support them (e.g., liking, sharing, retweeting))"
label(data$covid_child_eng_26_v2___7)="30. Since September, how do you stay connected with friends? (check all that apply) (choice=Online gaming)"
label(data$covid_child_eng_27_v2___1)="31. Have you experienced any sleep changes in the past 2-3 months? (check all that apply) (choice=Getting more sleep)"
label(data$covid_child_eng_27_v2___2)="31. Have you experienced any sleep changes in the past 2-3 months? (check all that apply) (choice=Getting less sleep)"
label(data$covid_child_eng_27_v2___3)="31. Have you experienced any sleep changes in the past 2-3 months? (check all that apply) (choice=More vivid dreams or more dreaming)"
label(data$covid_child_eng_27_v2___4)="31. Have you experienced any sleep changes in the past 2-3 months? (check all that apply) (choice=Fewer dreams)"
label(data$covid_child_eng_27_v2___5)="31. Have you experienced any sleep changes in the past 2-3 months? (check all that apply) (choice=More regular sleep hours)"
label(data$covid_child_eng_27_v2___6)="31. Have you experienced any sleep changes in the past 2-3 months? (check all that apply) (choice=More interrupted sleep/difficulty staying asleep)"
label(data$covid_child_eng_27_v2___7)="31. Have you experienced any sleep changes in the past 2-3 months? (check all that apply) (choice=More irregular sleep)"
label(data$covid_child_eng_27_v2___8)="31. Have you experienced any sleep changes in the past 2-3 months? (check all that apply) (choice=Better quality sleep)"
label(data$covid_child_eng_27_v2___9)="31. Have you experienced any sleep changes in the past 2-3 months? (check all that apply) (choice=Trouble waking up)"
label(data$covid_child_eng_27_v2___10)="31. Have you experienced any sleep changes in the past 2-3 months? (check all that apply) (choice=More daytime naps)"
label(data$covid_child_eng_27_v2___11)="31. Have you experienced any sleep changes in the past 2-3 months? (check all that apply) (choice=More alert during the day)"
label(data$covid_child_eng_27_v2___12)="31. Have you experienced any sleep changes in the past 2-3 months? (check all that apply) (choice=Other (please describe):)"
label(data$covid_child_eng_27ex_v2)=""
label(data$covid_child_eng_28_v2)="32. In the past 7 days, including today, about how much time per day do you talk/chat with friends online (including on cell phone, on social media, or through online gaming)?"
label(data$covid_child_eng_29_v2)="33. Please indicate your average daily phone/tablet screen time usage (this information can be accessed from your phone if you have one)"
label(data$covid_child_eng_30_v2)="34. Since COVID-19 started, what are the most important social activities that you are no longer doing or no longer able to do?"
label(data$covid_child_eng_31_v2)="35. What are some of the things you do to keep socially connected with your friends and family?"
label(data$covid_child_eng_worry_v2)="36. What is your biggest worry about the future?"
label(data$covid_child_eng_future_v2)="37. What do you most look forward to about the future?"
label(data$covid_child_eng_day_v2)="38. How has your average day this past fall changed relative to last fall (pre-COVID) (how have you spent your time differently)?"
label(data$covid_child_eng_winter_v2)="39. Did you have to alter your holiday plans this winter? If so, how?"
label(data$covid_child_eng_open_v2)="Is there anything we didnt ask about that you would like to share?"
label(data$covid_child_eng_end_v2)="Thank You for Completing this Important Survey  We are so grateful for your help. If you would like to receive a $5 amazon e-gift card, please enter your email (or your parents email) here:  "
label(data$covid_child_survey_2_complete)="Complete?"
#Setting Units


#Setting Factors(will create new variable for factors)
data$redcap_event_name.factor = factor(data$redcap_event_name,levels=c("year_1_arm_1","year_2_arm_1","year_3_arm_1","year_4_arm_1","covid19_arm_1"))
data$covid_child_eng_consent_v2.factor = factor(data$covid_child_eng_consent_v2,levels=c("1","0"))
data$covid_child_eng_1_v2.factor = factor(data$covid_child_eng_1_v2,levels=c("1","2","3","4","5"))
data$covid_child_eng_2_v2___1.factor = factor(data$covid_child_eng_2_v2___1,levels=c("0","1"))
data$covid_child_eng_2_v2___2.factor = factor(data$covid_child_eng_2_v2___2,levels=c("0","1"))
data$covid_child_eng_2_v2___3.factor = factor(data$covid_child_eng_2_v2___3,levels=c("0","1"))
data$covid_child_eng_2_v2___4.factor = factor(data$covid_child_eng_2_v2___4,levels=c("0","1"))
data$covid_child_eng_2_v2___5.factor = factor(data$covid_child_eng_2_v2___5,levels=c("0","1"))
data$covid_child_eng_2_v2___6.factor = factor(data$covid_child_eng_2_v2___6,levels=c("0","1"))
data$covid_child_eng_2_v2___7.factor = factor(data$covid_child_eng_2_v2___7,levels=c("0","1"))
data$covid_child_eng_2_v2___8.factor = factor(data$covid_child_eng_2_v2___8,levels=c("0","1"))
data$covid_child_eng_3_v2.factor = factor(data$covid_child_eng_3_v2,levels=c("1","2","3","4","5"))
data$covid_child_eng_4_v2___1.factor = factor(data$covid_child_eng_4_v2___1,levels=c("0","1"))
data$covid_child_eng_4_v2___2.factor = factor(data$covid_child_eng_4_v2___2,levels=c("0","1"))
data$covid_child_eng_4_v2___3.factor = factor(data$covid_child_eng_4_v2___3,levels=c("0","1"))
data$covid_child_eng_4_v2___4.factor = factor(data$covid_child_eng_4_v2___4,levels=c("0","1"))
data$covid_child_eng_4_v2___5.factor = factor(data$covid_child_eng_4_v2___5,levels=c("0","1"))
data$covid_child_eng_4_v2___6.factor = factor(data$covid_child_eng_4_v2___6,levels=c("0","1"))
data$covid_child_eng_4_v2___7.factor = factor(data$covid_child_eng_4_v2___7,levels=c("0","1"))
data$covid_child_eng_4_v2___8.factor = factor(data$covid_child_eng_4_v2___8,levels=c("0","1"))
data$covid_child_eng_4_v2___9.factor = factor(data$covid_child_eng_4_v2___9,levels=c("0","1"))
data$covid_child_eng_4_v2___10.factor = factor(data$covid_child_eng_4_v2___10,levels=c("0","1"))
data$covid_child_eng_4_v2___11.factor = factor(data$covid_child_eng_4_v2___11,levels=c("0","1"))
data$covid_child_eng_4_v2___12.factor = factor(data$covid_child_eng_4_v2___12,levels=c("0","1"))
data$covid_child_eng_5_v2.factor = factor(data$covid_child_eng_5_v2,levels=c("1","2","3"))
data$covid_child_eng_5a_v2.factor = factor(data$covid_child_eng_5a_v2,levels=c("1","0"))
data$covid_child_eng_6_v2.factor = factor(data$covid_child_eng_6_v2,levels=c("1","0"))
data$covid_child_eng_6a_v2___1.factor = factor(data$covid_child_eng_6a_v2___1,levels=c("0","1"))
data$covid_child_eng_6a_v2___2.factor = factor(data$covid_child_eng_6a_v2___2,levels=c("0","1"))
data$covid_child_eng_6a_v2___3.factor = factor(data$covid_child_eng_6a_v2___3,levels=c("0","1"))
data$covid_child_eng_6a_v2___4.factor = factor(data$covid_child_eng_6a_v2___4,levels=c("0","1"))
data$covid_child_eng_6a_v2___5.factor = factor(data$covid_child_eng_6a_v2___5,levels=c("0","1"))
data$covid_child_eng_6a_v2___6.factor = factor(data$covid_child_eng_6a_v2___6,levels=c("0","1"))
data$covid_child_eng_6a_v2___7.factor = factor(data$covid_child_eng_6a_v2___7,levels=c("0","1"))
data$covid_child_eng_6a_v2___8.factor = factor(data$covid_child_eng_6a_v2___8,levels=c("0","1"))
data$covid_child_eng_6a_v2___9.factor = factor(data$covid_child_eng_6a_v2___9,levels=c("0","1"))
data$covid_child_eng_6a_v2___10.factor = factor(data$covid_child_eng_6a_v2___10,levels=c("0","1"))
data$covid_child_eng_6a_v2___11.factor = factor(data$covid_child_eng_6a_v2___11,levels=c("0","1"))
data$covid_child_eng_7_v2.factor = factor(data$covid_child_eng_7_v2,levels=c("1","0"))
data$covid_child_eng_7a_v2___1.factor = factor(data$covid_child_eng_7a_v2___1,levels=c("0","1"))
data$covid_child_eng_7a_v2___2.factor = factor(data$covid_child_eng_7a_v2___2,levels=c("0","1"))
data$covid_child_eng_7a_v2___3.factor = factor(data$covid_child_eng_7a_v2___3,levels=c("0","1"))
data$covid_child_eng_7a_v2___4.factor = factor(data$covid_child_eng_7a_v2___4,levels=c("0","1"))
data$covid_child_eng_7a_v2___5.factor = factor(data$covid_child_eng_7a_v2___5,levels=c("0","1"))
data$covid_child_eng_7a_v2___6.factor = factor(data$covid_child_eng_7a_v2___6,levels=c("0","1"))
data$covid_child_eng_7a_v2___7.factor = factor(data$covid_child_eng_7a_v2___7,levels=c("0","1"))
data$covid_child_eng_8_v2.factor = factor(data$covid_child_eng_8_v2,levels=c("1","0"))
data$covid_child_eng_8b_v2.factor = factor(data$covid_child_eng_8b_v2,levels=c("1","0"))
data$covid_child_eng_books_v2.factor = factor(data$covid_child_eng_books_v2,levels=c("1","2","3","4"))
data$covid_child_eng_homework_v2.factor = factor(data$covid_child_eng_homework_v2,levels=c("1","2","3","4"))
data$covid_child_eng_grades_v2.factor = factor(data$covid_child_eng_grades_v2,levels=c("1","2","3","4"))
data$covid_child_eng_11_v2.factor = factor(data$covid_child_eng_11_v2,levels=c("1","2","3","4","5"))
data$covid_child_eng_12_v2.factor = factor(data$covid_child_eng_12_v2,levels=c("1","2","3","4","5"))
data$covid_child_eng_13_v2.factor = factor(data$covid_child_eng_13_v2,levels=c("1","2","3","4","5"))
data$covid_child_eng_14a_v2.factor = factor(data$covid_child_eng_14a_v2,levels=c("1","2","3","4","5"))
data$covid_child_eng_14b_v2.factor = factor(data$covid_child_eng_14b_v2,levels=c("1","2","3","4","5"))
data$covid_child_eng_14c_v2.factor = factor(data$covid_child_eng_14c_v2,levels=c("1","2","3","4","5"))
data$covid_child_eng_14d_v2.factor = factor(data$covid_child_eng_14d_v2,levels=c("1","2","3","4","5"))
data$covid_child_eng_14e_v2.factor = factor(data$covid_child_eng_14e_v2,levels=c("1","2","3","4","5"))
data$covid_child_eng_14f_v2.factor = factor(data$covid_child_eng_14f_v2,levels=c("1","2","3","4","5"))
data$covid_child_eng_14g_v2.factor = factor(data$covid_child_eng_14g_v2,levels=c("1","2","3","4","5"))
data$covid_child_eng_14h_v2.factor = factor(data$covid_child_eng_14h_v2,levels=c("1","2","3","4","5"))
data$covid_child_eng_14i_v2.factor = factor(data$covid_child_eng_14i_v2,levels=c("1","2","3","4","5"))
data$covid_child_eng_14j_v2.factor = factor(data$covid_child_eng_14j_v2,levels=c("1","2","3","4","5"))
data$covid_child_eng_14k_v2.factor = factor(data$covid_child_eng_14k_v2,levels=c("1","2","3","4","5"))
data$covid_child_eng_14l_v2.factor = factor(data$covid_child_eng_14l_v2,levels=c("1","2","3","4","5"))
data$covid_child_eng_14m_v2.factor = factor(data$covid_child_eng_14m_v2,levels=c("1","2","3","4","5"))
data$covid_child_eng_14n_v2.factor = factor(data$covid_child_eng_14n_v2,levels=c("1","2","3","4","5"))
data$covid_child_eng_14o_v2.factor = factor(data$covid_child_eng_14o_v2,levels=c("1","2","3","4","5"))
data$covid_child_eng_14p_v2.factor = factor(data$covid_child_eng_14p_v2,levels=c("1","2","3","4","5"))
data$covid_child_eng_14q_v2.factor = factor(data$covid_child_eng_14q_v2,levels=c("1","2","3","4","5"))
data$covid_child_eng_14r_v2.factor = factor(data$covid_child_eng_14r_v2,levels=c("1","2","3","4","5"))
data$covid_child_eng_14s_v2.factor = factor(data$covid_child_eng_14s_v2,levels=c("1","2","3","4","5"))
data$covid_child_eng_15a_v2.factor = factor(data$covid_child_eng_15a_v2,levels=c("1","2","3","4","5"))
data$covid_child_eng_15b_v2.factor = factor(data$covid_child_eng_15b_v2,levels=c("1","2","3","4","5"))
data$covid_child_eng_15c_v2.factor = factor(data$covid_child_eng_15c_v2,levels=c("1","2","3","4","5"))
data$covid_child_eng_15d_v2.factor = factor(data$covid_child_eng_15d_v2,levels=c("1","2","3","4","5"))
data$covid_child_eng_15e_v2.factor = factor(data$covid_child_eng_15e_v2,levels=c("1","2","3","4","5"))
data$covid_child_eng_15f_v2.factor = factor(data$covid_child_eng_15f_v2,levels=c("1","2","3","4","5"))
data$covid_child_eng_16_v2___1.factor = factor(data$covid_child_eng_16_v2___1,levels=c("0","1"))
data$covid_child_eng_16_v2___2.factor = factor(data$covid_child_eng_16_v2___2,levels=c("0","1"))
data$covid_child_eng_16_v2___3.factor = factor(data$covid_child_eng_16_v2___3,levels=c("0","1"))
data$covid_child_eng_16_v2___4.factor = factor(data$covid_child_eng_16_v2___4,levels=c("0","1"))
data$covid_child_eng_16_v2___5.factor = factor(data$covid_child_eng_16_v2___5,levels=c("0","1"))
data$covid_child_eng_16_v2___6.factor = factor(data$covid_child_eng_16_v2___6,levels=c("0","1"))
data$covid_child_eng_16_v2___7.factor = factor(data$covid_child_eng_16_v2___7,levels=c("0","1"))
data$covid_child_eng_16_v2___8.factor = factor(data$covid_child_eng_16_v2___8,levels=c("0","1"))
data$covid_child_eng_16_v2___9.factor = factor(data$covid_child_eng_16_v2___9,levels=c("0","1"))
data$covid_child_eng_16_v2___10.factor = factor(data$covid_child_eng_16_v2___10,levels=c("0","1"))
data$covid_child_eng_16_v2___11.factor = factor(data$covid_child_eng_16_v2___11,levels=c("0","1"))
data$covid_child_eng_16_v2___12.factor = factor(data$covid_child_eng_16_v2___12,levels=c("0","1"))
data$covid_child_eng_16_v2___13.factor = factor(data$covid_child_eng_16_v2___13,levels=c("0","1"))
data$covid_child_eng_16_v2___14.factor = factor(data$covid_child_eng_16_v2___14,levels=c("0","1"))
data$covid_child_eng_16_v2___15.factor = factor(data$covid_child_eng_16_v2___15,levels=c("0","1"))
data$covid_child_eng_16_v2___16.factor = factor(data$covid_child_eng_16_v2___16,levels=c("0","1"))
data$covid_child_eng_16_v2___17.factor = factor(data$covid_child_eng_16_v2___17,levels=c("0","1"))
data$covid_child_eng_16_v2___18.factor = factor(data$covid_child_eng_16_v2___18,levels=c("0","1"))
data$covid_child_eng_16_v2___19.factor = factor(data$covid_child_eng_16_v2___19,levels=c("0","1"))
data$covid_child_eng_16_v2___20.factor = factor(data$covid_child_eng_16_v2___20,levels=c("0","1"))
data$covid_child_eng_16_v2___21.factor = factor(data$covid_child_eng_16_v2___21,levels=c("0","1"))
data$covid_child_eng_16_v2___22.factor = factor(data$covid_child_eng_16_v2___22,levels=c("0","1"))
data$covid_child_eng_16_v2___23.factor = factor(data$covid_child_eng_16_v2___23,levels=c("0","1"))
data$covid_child_eng_16_v2___24.factor = factor(data$covid_child_eng_16_v2___24,levels=c("0","1"))
data$covid_child_eng_16_v2___25.factor = factor(data$covid_child_eng_16_v2___25,levels=c("0","1"))
data$covid_child_eng_16_v2___26.factor = factor(data$covid_child_eng_16_v2___26,levels=c("0","1"))
data$covid_child_eng_16_v2___27.factor = factor(data$covid_child_eng_16_v2___27,levels=c("0","1"))
data$covid_child_eng_16_v2___28.factor = factor(data$covid_child_eng_16_v2___28,levels=c("0","1"))
data$covid_child_eng_16_v2___29.factor = factor(data$covid_child_eng_16_v2___29,levels=c("0","1"))
data$covid_child_eng_16_v2___30.factor = factor(data$covid_child_eng_16_v2___30,levels=c("0","1"))
data$covid_child_eng_17a_v2.factor = factor(data$covid_child_eng_17a_v2,levels=c("1","2","3","4","5"))
data$covid_child_eng_17b_v2.factor = factor(data$covid_child_eng_17b_v2,levels=c("1","2","3","4","5"))
data$covid_child_eng_17c_v2.factor = factor(data$covid_child_eng_17c_v2,levels=c("1","2","3","4","5"))
data$covid_child_eng_17d_v2.factor = factor(data$covid_child_eng_17d_v2,levels=c("1","2","3","4","5"))
data$covid_child_eng_17e_v2.factor = factor(data$covid_child_eng_17e_v2,levels=c("1","2","3","4","5"))
data$covid_child_eng_17f_v2.factor = factor(data$covid_child_eng_17f_v2,levels=c("1","2","3","4","5"))
data$covid_child_eng_17g_v2.factor = factor(data$covid_child_eng_17g_v2,levels=c("1","2","3","4","5"))
data$covid_child_eng_17h_v2.factor = factor(data$covid_child_eng_17h_v2,levels=c("1","2","3","4","5"))
data$covid_child_eng_17i_v2.factor = factor(data$covid_child_eng_17i_v2,levels=c("1","2","3","4","5"))
data$covid_child_eng_17j_v2.factor = factor(data$covid_child_eng_17j_v2,levels=c("1","2","3","4","5"))
data$covid_child_eng_17k_v2.factor = factor(data$covid_child_eng_17k_v2,levels=c("1","2","3","4","5"))
data$covid_child_eng_18_v2.factor = factor(data$covid_child_eng_18_v2,levels=c("1","2","3","4","5","6"))
data$covid_child_eng_19_v2.factor = factor(data$covid_child_eng_19_v2,levels=c("1","2","3","4","5","6"))
data$covid_child_eng_20_v2.factor = factor(data$covid_child_eng_20_v2,levels=c("1","2","3"))
data$covid_child_eng_21_v2___1.factor = factor(data$covid_child_eng_21_v2___1,levels=c("0","1"))
data$covid_child_eng_21_v2___2.factor = factor(data$covid_child_eng_21_v2___2,levels=c("0","1"))
data$covid_child_eng_21_v2___3.factor = factor(data$covid_child_eng_21_v2___3,levels=c("0","1"))
data$covid_child_eng_21_v2___4.factor = factor(data$covid_child_eng_21_v2___4,levels=c("0","1"))
data$covid_child_eng_21_v2___5.factor = factor(data$covid_child_eng_21_v2___5,levels=c("0","1"))
data$covid_child_eng_21_v2___6.factor = factor(data$covid_child_eng_21_v2___6,levels=c("0","1"))
data$covid_child_eng_21_v2___7.factor = factor(data$covid_child_eng_21_v2___7,levels=c("0","1"))
data$covid_child_eng_21_v2___8.factor = factor(data$covid_child_eng_21_v2___8,levels=c("0","1"))
data$covid_child_eng_21_v2___9.factor = factor(data$covid_child_eng_21_v2___9,levels=c("0","1"))
data$covid_child_eng_21_v2___10.factor = factor(data$covid_child_eng_21_v2___10,levels=c("0","1"))
data$covid_child_eng_21_v2___11.factor = factor(data$covid_child_eng_21_v2___11,levels=c("0","1"))
data$covid_child_eng_21_v2___12.factor = factor(data$covid_child_eng_21_v2___12,levels=c("0","1"))
data$covid_child_eng_22_v2___1.factor = factor(data$covid_child_eng_22_v2___1,levels=c("0","1"))
data$covid_child_eng_22_v2___2.factor = factor(data$covid_child_eng_22_v2___2,levels=c("0","1"))
data$covid_child_eng_22_v2___3.factor = factor(data$covid_child_eng_22_v2___3,levels=c("0","1"))
data$covid_child_eng_22_v2___4.factor = factor(data$covid_child_eng_22_v2___4,levels=c("0","1"))
data$covid_child_eng_22_v2___5.factor = factor(data$covid_child_eng_22_v2___5,levels=c("0","1"))
data$covid_child_eng_22_v2___6.factor = factor(data$covid_child_eng_22_v2___6,levels=c("0","1"))
data$covid_child_eng_22_v2___7.factor = factor(data$covid_child_eng_22_v2___7,levels=c("0","1"))
data$covid_child_eng_22_v2___8.factor = factor(data$covid_child_eng_22_v2___8,levels=c("0","1"))
data$covid_child_eng_22_v2___9.factor = factor(data$covid_child_eng_22_v2___9,levels=c("0","1"))
data$covid_child_eng_22_v2___10.factor = factor(data$covid_child_eng_22_v2___10,levels=c("0","1"))
data$covid_child_eng_22_v2___11.factor = factor(data$covid_child_eng_22_v2___11,levels=c("0","1"))
data$covid_child_eng_22_v2___12.factor = factor(data$covid_child_eng_22_v2___12,levels=c("0","1"))
data$covid_child_eng_23_v2.factor = factor(data$covid_child_eng_23_v2,levels=c("1","2","3","4","5"))
data$covid_child_eng_24_v2.factor = factor(data$covid_child_eng_24_v2,levels=c("1","2","3","4","5"))
data$covid_child_eng_25_v2.factor = factor(data$covid_child_eng_25_v2,levels=c("1","2","3","4"))
data$covid_child_eng_26_v2___1.factor = factor(data$covid_child_eng_26_v2___1,levels=c("0","1"))
data$covid_child_eng_26_v2___2.factor = factor(data$covid_child_eng_26_v2___2,levels=c("0","1"))
data$covid_child_eng_26_v2___3.factor = factor(data$covid_child_eng_26_v2___3,levels=c("0","1"))
data$covid_child_eng_26_v2___4.factor = factor(data$covid_child_eng_26_v2___4,levels=c("0","1"))
data$covid_child_eng_26_v2___5.factor = factor(data$covid_child_eng_26_v2___5,levels=c("0","1"))
data$covid_child_eng_26_v2___6.factor = factor(data$covid_child_eng_26_v2___6,levels=c("0","1"))
data$covid_child_eng_26_v2___7.factor = factor(data$covid_child_eng_26_v2___7,levels=c("0","1"))
data$covid_child_eng_27_v2___1.factor = factor(data$covid_child_eng_27_v2___1,levels=c("0","1"))
data$covid_child_eng_27_v2___2.factor = factor(data$covid_child_eng_27_v2___2,levels=c("0","1"))
data$covid_child_eng_27_v2___3.factor = factor(data$covid_child_eng_27_v2___3,levels=c("0","1"))
data$covid_child_eng_27_v2___4.factor = factor(data$covid_child_eng_27_v2___4,levels=c("0","1"))
data$covid_child_eng_27_v2___5.factor = factor(data$covid_child_eng_27_v2___5,levels=c("0","1"))
data$covid_child_eng_27_v2___6.factor = factor(data$covid_child_eng_27_v2___6,levels=c("0","1"))
data$covid_child_eng_27_v2___7.factor = factor(data$covid_child_eng_27_v2___7,levels=c("0","1"))
data$covid_child_eng_27_v2___8.factor = factor(data$covid_child_eng_27_v2___8,levels=c("0","1"))
data$covid_child_eng_27_v2___9.factor = factor(data$covid_child_eng_27_v2___9,levels=c("0","1"))
data$covid_child_eng_27_v2___10.factor = factor(data$covid_child_eng_27_v2___10,levels=c("0","1"))
data$covid_child_eng_27_v2___11.factor = factor(data$covid_child_eng_27_v2___11,levels=c("0","1"))
data$covid_child_eng_27_v2___12.factor = factor(data$covid_child_eng_27_v2___12,levels=c("0","1"))
data$covid_child_eng_28_v2.factor = factor(data$covid_child_eng_28_v2,levels=c("1","2","3","4","5","6"))
data$covid_child_survey_2_complete.factor = factor(data$covid_child_survey_2_complete,levels=c("0","1","2"))

levels(data$redcap_event_name.factor)=c("Year 1","Year 2","Year 3","Year 4","COVID-19")
levels(data$covid_child_eng_consent_v2.factor)=c("Yes","No")
levels(data$covid_child_eng_1_v2.factor)=c("Not at All","A little","Somewhat","A lot","A great deal")
levels(data$covid_child_eng_2_v2___1.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_2_v2___2.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_2_v2___3.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_2_v2___4.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_2_v2___5.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_2_v2___6.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_2_v2___7.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_2_v2___8.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_3_v2.factor)=c("Not at All","A little","Somewhat","A lot","A great deal")
levels(data$covid_child_eng_4_v2___1.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_4_v2___2.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_4_v2___3.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_4_v2___4.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_4_v2___5.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_4_v2___6.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_4_v2___7.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_4_v2___8.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_4_v2___9.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_4_v2___10.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_4_v2___11.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_4_v2___12.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_5_v2.factor)=c("Yes, once","Yes, multiple times","No")
levels(data$covid_child_eng_5a_v2.factor)=c("Yes","No")
levels(data$covid_child_eng_6_v2.factor)=c("Yes","No")
levels(data$covid_child_eng_6a_v2___1.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_6a_v2___2.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_6a_v2___3.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_6a_v2___4.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_6a_v2___5.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_6a_v2___6.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_6a_v2___7.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_6a_v2___8.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_6a_v2___9.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_6a_v2___10.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_6a_v2___11.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_7_v2.factor)=c("Yes","No")
levels(data$covid_child_eng_7a_v2___1.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_7a_v2___2.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_7a_v2___3.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_7a_v2___4.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_7a_v2___5.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_7a_v2___6.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_7a_v2___7.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_8_v2.factor)=c("Yes","No")
levels(data$covid_child_eng_8b_v2.factor)=c("Yes","No")
levels(data$covid_child_eng_books_v2.factor)=c("More","Less","Same as pre-COVID","Not sure/N/A")
levels(data$covid_child_eng_homework_v2.factor)=c("More","Less","Same","Not sure/N/A")
levels(data$covid_child_eng_grades_v2.factor)=c("Better","Worse","Same as pre-COVID","Not sure/N/A")
levels(data$covid_child_eng_11_v2.factor)=c("Very Slightly or Not at all","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_12_v2.factor)=c("Very Slightly or Not at all","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_13_v2.factor)=c("Very Slightly or Not at all","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_14a_v2.factor)=c("Very Slightly or Not at all","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_14b_v2.factor)=c("Very Slightly or Not at all","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_14c_v2.factor)=c("Very Slightly or Not at all","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_14d_v2.factor)=c("Very Slightly or Not at all","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_14e_v2.factor)=c("Very Slightly or Not at all","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_14f_v2.factor)=c("Very Slightly or Not at all","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_14g_v2.factor)=c("Very Slightly or Not at all","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_14h_v2.factor)=c("Very Slightly or Not at all","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_14i_v2.factor)=c("Very Slightly or Not at all","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_14j_v2.factor)=c("Very Slightly or Not at all","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_14k_v2.factor)=c("Very Slightly or Not at all","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_14l_v2.factor)=c("Very Slightly or Not at all","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_14m_v2.factor)=c("Very Slightly or Not at all","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_14n_v2.factor)=c("Very Slightly or Not at all","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_14o_v2.factor)=c("Very Slightly or Not at all","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_14p_v2.factor)=c("Very Slightly or Not at all","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_14q_v2.factor)=c("Very Slightly or Not at all","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_14r_v2.factor)=c("Very Slightly or Not at all","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_14s_v2.factor)=c("Very Slightly or Not at all","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_15a_v2.factor)=c("Not at All","A Little","Some","Quite a Bit","A Great Deal")
levels(data$covid_child_eng_15b_v2.factor)=c("Not at All","A Little","Some","Quite a Bit","A Great Deal")
levels(data$covid_child_eng_15c_v2.factor)=c("Not at All","A Little","Some","Quite a Bit","A Great Deal")
levels(data$covid_child_eng_15d_v2.factor)=c("Not at All","A Little","Some","Quite a Bit","A Great Deal")
levels(data$covid_child_eng_15e_v2.factor)=c("Not at All","A Little","Some","Quite a Bit","A Great Deal")
levels(data$covid_child_eng_15f_v2.factor)=c("Not at All","A Little","Some","Quite a Bit","A Great Deal")
levels(data$covid_child_eng_16_v2___1.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_16_v2___2.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_16_v2___3.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_16_v2___4.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_16_v2___5.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_16_v2___6.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_16_v2___7.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_16_v2___8.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_16_v2___9.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_16_v2___10.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_16_v2___11.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_16_v2___12.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_16_v2___13.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_16_v2___14.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_16_v2___15.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_16_v2___16.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_16_v2___17.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_16_v2___18.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_16_v2___19.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_16_v2___20.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_16_v2___21.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_16_v2___22.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_16_v2___23.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_16_v2___24.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_16_v2___25.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_16_v2___26.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_16_v2___27.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_16_v2___28.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_16_v2___29.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_16_v2___30.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_17a_v2.factor)=c("Very Slightly or Not at All","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_17b_v2.factor)=c("Very Slightly or Not at All","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_17c_v2.factor)=c("Very Slightly or Not at All","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_17d_v2.factor)=c("Very Slightly or Not at All","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_17e_v2.factor)=c("Very Slightly or Not at All","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_17f_v2.factor)=c("Very Slightly or Not at All","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_17g_v2.factor)=c("Very Slightly or Not at All","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_17h_v2.factor)=c("Very Slightly or Not at All","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_17i_v2.factor)=c("Very Slightly or Not at All","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_17j_v2.factor)=c("Very Slightly or Not at All","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_17k_v2.factor)=c("Very Slightly or Not at All","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_18_v2.factor)=c("Less than 1 month","2-3 months","3-6 months","6-12 months","12 months +","Never")
levels(data$covid_child_eng_19_v2.factor)=c("Before school closures this spring","When school closed","This summer","This fall","Used to social distance but do not practice social distancing currently","Have not practiced social distancing")
levels(data$covid_child_eng_20_v2.factor)=c("I think the restrictions are not strict enough","I think the restrictions are too strict","I think the restrictions are good")
levels(data$covid_child_eng_21_v2___1.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_21_v2___2.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_21_v2___3.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_21_v2___4.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_21_v2___5.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_21_v2___6.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_21_v2___7.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_21_v2___8.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_21_v2___9.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_21_v2___10.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_21_v2___11.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_21_v2___12.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_22_v2___1.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_22_v2___2.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_22_v2___3.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_22_v2___4.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_22_v2___5.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_22_v2___6.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_22_v2___7.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_22_v2___8.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_22_v2___9.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_22_v2___10.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_22_v2___11.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_22_v2___12.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_23_v2.factor)=c("Multiple times a day","Once a day","Every couple days","Once a week","Less than once a week")
levels(data$covid_child_eng_24_v2.factor)=c("Never","Seldom","Sometimes","Often","Always")
levels(data$covid_child_eng_25_v2.factor)=c("Every day or almost every day","Several times a week","About once a week","Less often")
levels(data$covid_child_eng_26_v2___1.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_26_v2___2.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_26_v2___3.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_26_v2___4.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_26_v2___5.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_26_v2___6.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_26_v2___7.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_27_v2___1.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_27_v2___2.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_27_v2___3.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_27_v2___4.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_27_v2___5.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_27_v2___6.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_27_v2___7.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_27_v2___8.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_27_v2___9.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_27_v2___10.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_27_v2___11.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_27_v2___12.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_28_v2.factor)=c("< 30 minutes per day","30 min - 1 hour","1-2 hours","2-4 hours","4-6 hours",">6 hours")
levels(data$covid_child_survey_2_complete.factor)=c("Incomplete","Unverified","Complete")
# Write out the result
write.csv(data, output_file, row.names = !is.null(rownames(data)))