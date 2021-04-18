#Clear existing data and graphics
rm(list=ls())
graphics.off()
#Load Hmisc library
library(Hmisc)
#Read Data
#Read Data
setwd('~/Box/Research/covid19')
data=read.csv(Sys.glob('data/raw_exports/EFStudySurveyFormsDa_DATA_2021-04-17*.csv'))
cat(dim(data))
output_file = paste0('data/raw_exports/timepoint1_coded_', Sys.Date(), '.csv')
cat(output_file)
#Setting Labels

label(data$participant_id)="Child Participant ID"
label(data$redcap_event_name)="Event Name"
label(data$redcap_survey_identifier)="Survey Identifier"
label(data$covid_child_survey_timestamp)="Survey Timestamp"
label(data$covid_child_eng_consent)="I consent to this survey:"
label(data$covid_child_eng_age)="Your age:"
label(data$covid_child_eng_sex)="Your gender:"
label(data$covid_child_eng_date)="Date today:"
label(data$covid_child_eng_init)="Please provide your name or initials:"
label(data$covid_child_eng_zip)="Please enter your zip code:"
label(data$covid_child_eng_grade)="Your current year in school (e.g., 3rd grade, 9th grade): "
label(data$covid_child_eng_sib)="Number of siblings you have:"
label(data$covid_child_eng_1)="1. Overall, how much has the COVID-19 outbreak, and the resulting changes to daily life, affected your life in a negative way?"
label(data$covid_child_eng_2___1)="2. What event or change to daily life has been the most negative? (check up to three)  (choice=Worried about someone who has or has had the virus)"
label(data$covid_child_eng_2___2)="2. What event or change to daily life has been the most negative? (check up to three)  (choice=Having to stay at home)"
label(data$covid_child_eng_2___3)="2. What event or change to daily life has been the most negative? (check up to three)  (choice=Not seeing friends in person)"
label(data$covid_child_eng_2___4)="2. What event or change to daily life has been the most negative? (check up to three)  (choice=Thinking about how many people are dying because of the virus)"
label(data$covid_child_eng_2___5)="2. What event or change to daily life has been the most negative? (check up to three)  (choice=Not going to school)"
label(data$covid_child_eng_2___6)="2. What event or change to daily life has been the most negative? (check up to three)  (choice=Spending more time with family)"
label(data$covid_child_eng_2___7)="2. What event or change to daily life has been the most negative? (check up to three)  (choice=Increased stress or disorientation from not having a schedule)"
label(data$covid_child_eng_2___8)="2. What event or change to daily life has been the most negative? (check up to three)  (choice=Not having access to things I need (i.e., food, products))"
label(data$covid_child_eng_3)="3. Overall, how much has the COVID-19 outbreak, and the resulting changes to daily life, affected your life in a positive way?"
label(data$covid_child_eng_4___1)="4. What event or change to daily life has been the most positive? (check all that apply)  (choice=Reduced amount of schoolwork or no schoolwork)"
label(data$covid_child_eng_4___2)="4. What event or change to daily life has been the most positive? (check all that apply)  (choice=Less stress/pressure from school and activities)"
label(data$covid_child_eng_4___3)="4. What event or change to daily life has been the most positive? (check all that apply)  (choice=More time to relax)"
label(data$covid_child_eng_4___4)="4. What event or change to daily life has been the most positive? (check all that apply)  (choice=Getting to do things they dont usually have time for (i.e., art, music, writing, cooking))"
label(data$covid_child_eng_4___5)="4. What event or change to daily life has been the most positive? (check all that apply)  (choice=Getting more recreational time on the phone/computer (i.e., texting, social media))"
label(data$covid_child_eng_4___6)="4. What event or change to daily life has been the most positive? (check all that apply)  (choice=Getting to watch more TV/movies)"
label(data$covid_child_eng_4___7)="4. What event or change to daily life has been the most positive? (check all that apply)  (choice=More time to exercise or go outside)"
label(data$covid_child_eng_4___8)="4. What event or change to daily life has been the most positive? (check all that apply)  (choice=Getting more sleep)"
label(data$covid_child_eng_4___9)="4. What event or change to daily life has been the most positive? (check all that apply)  (choice=Spending more time with family)"
label(data$covid_child_eng_4___10)="4. What event or change to daily life has been the most positive? (check all that apply)  (choice=Spending more time with my pet(s))"
label(data$covid_child_eng_4___11)="4. What event or change to daily life has been the most positive? (check all that apply)  (choice=Not having to have unwanted interactions with other kids at school)"
label(data$covid_child_eng_4___12)="4. What event or change to daily life has been the most positive? (check all that apply)  (choice=Feeling like I have more control in creating my own schedule)"
label(data$covid_child_eng_5)="5. Have you been tested for COVID-19/coronavirus?"
label(data$covid_child_eng_5a)="5a. Was the COVID-19 test positive?"
label(data$covid_child_eng_5b)="5b. What date was the test? (mm/dd/yyyy)"
label(data$covid_child_eng_6)="6. Do you know anyone who has tested positive for [or had significant symptoms of] COVID-19? "
label(data$covid_child_eng_6a___1)="Please select who (check any that apply) (choice=Mother)"
label(data$covid_child_eng_6a___2)="Please select who (check any that apply) (choice=Father)"
label(data$covid_child_eng_6a___3)="Please select who (check any that apply) (choice=Sibling(s))"
label(data$covid_child_eng_6a___4)="Please select who (check any that apply) (choice=Grandparent(s))"
label(data$covid_child_eng_6a___5)="Please select who (check any that apply) (choice=Aunt/Uncle(s))"
label(data$covid_child_eng_6a___6)="Please select who (check any that apply) (choice=Cousin(s))"
label(data$covid_child_eng_6a___7)="Please select who (check any that apply) (choice=Friend/Classmate(s))"
label(data$covid_child_eng_6a___8)="Please select who (check any that apply) (choice=Neighbor)"
label(data$covid_child_eng_6a___9)="Please select who (check any that apply) (choice=Teacher)"
label(data$covid_child_eng_6a___10)="Please select who (check any that apply) (choice=Friends Family Member)"
label(data$covid_child_eng_6a___11)="Please select who (check any that apply) (choice=Other (please specify):)"
label(data$covid_child_eng_6b)=""
label(data$covid_child_eng_7)="7. Has anyone in your house or extended family (i.e., grandparent, uncle/aunt, cousin) died because they had COVID-19?"
label(data$covid_child_eng_7a___1)="Please select who (check any that apply) (choice=Mother)"
label(data$covid_child_eng_7a___2)="Please select who (check any that apply) (choice=Father)"
label(data$covid_child_eng_7a___3)="Please select who (check any that apply) (choice=Sibling(s))"
label(data$covid_child_eng_7a___4)="Please select who (check any that apply) (choice=Grandparent(s))"
label(data$covid_child_eng_7a___5)="Please select who (check any that apply) (choice=Aunt/Uncle(s))"
label(data$covid_child_eng_7a___6)="Please select who (check any that apply) (choice=Cousin(s))"
label(data$covid_child_eng_7a___7)="Please select who (check any that apply) (choice=Other (please specify):)"
label(data$covid_child_eng_7b)=""
label(data$covid_child_eng_8)="8. Have any of your friends (or their family members) had COVID-19?"
label(data$covid_child_eng_8a)="If yes, relationship (i.e., friends grandma, etc.):"
label(data$covid_child_eng_8b)="Have any of your friends (or their family members) been hospitalized because of COVID-19?"
label(data$covid_child_eng_8c)="If yes, who: "
label(data$covid_child_eng_9)="9. What school do you go to?"
label(data$covid_child_eng_9a)="9a. On what date did your school close because of the COVID-19 outbreak? Your response should be in this format: mm/dd/yyyy (or your best guess)"
label(data$covid_child_eng_10___1)="10. Following school closures, how did you continue with schoolwork? (after Spring Break)  (choice=School sent printed packets and/or recommendations)"
label(data$covid_child_eng_10___2)="10. Following school closures, how did you continue with schoolwork? (after Spring Break)  (choice=School sent on-line assignments to complete without virtual classes)"
label(data$covid_child_eng_10___3)="10. Following school closures, how did you continue with schoolwork? (after Spring Break)  (choice=School organized on-line classes)"
label(data$covid_child_eng_10___4)="10. Following school closures, how did you continue with schoolwork? (after Spring Break)  (choice=Signed-up for a different on-line academic program)"
label(data$covid_child_eng_10___5)="10. Following school closures, how did you continue with schoolwork? (after Spring Break)  (choice=There has been no school since then)"
label(data$covid_child_eng_10___6)="10. Following school closures, how did you continue with schoolwork? (after Spring Break)  (choice=Already in cyber school)"
label(data$covid_child_eng_10___7)="10. Following school closures, how did you continue with schoolwork? (after Spring Break)  (choice=Other (Please specify))"
label(data$covid_child_eng_10ex)=""
label(data$covid_child_eng_11)="11. COVID-19 presents a lot of uncertainty about the future. In the past 7 days, including today, how stressful have you found this uncertainty to be? "
label(data$covid_child_eng_12)="12. The COVID-19 outbreak has changed and disrupted many existing plans. In the past 7 days, including today, how stressful do you find these disruptions to be? "
label(data$covid_child_eng_13)="13. COVID-19 is a new virus. In the past 7 days, including today, how worried were you that someone in your household or extended family (i.e., grandparent, uncle/aunt, cousin) might become sick? "
label(data$covid_child_eng_14a)="Anxious"
label(data$covid_child_eng_14b)="Angry"
label(data$covid_child_eng_14c)="Content"
label(data$covid_child_eng_14d)="Afraid"
label(data$covid_child_eng_14e)="Happy"
label(data$covid_child_eng_14f)="Sad"
label(data$covid_child_eng_14g)="Worried"
label(data$covid_child_eng_14h)="Irritable"
label(data$covid_child_eng_14i)="Concerned"
label(data$covid_child_eng_14j)="Stressed"
label(data$covid_child_eng_14k)="Relieved"
label(data$covid_child_eng_14l)="Distressed"
label(data$covid_child_eng_14m)="Lonely"
label(data$covid_child_eng_14n)="Bored"
label(data$covid_child_eng_14o)="Hopeless"
label(data$covid_child_eng_14p)="Frustrated"
label(data$covid_child_eng_14q)="Disappointed"
label(data$covid_child_eng_14r)="Calm"
label(data$covid_child_eng_14s)="Appreciative"
label(data$covid_child_eng_15a)="Relaxed"
label(data$covid_child_eng_15b)="Hopeful"
label(data$covid_child_eng_15c)="Confident about the future"
label(data$covid_child_eng_15d)="Hopeless"
label(data$covid_child_eng_15e)="Anxious/Stressed"
label(data$covid_child_eng_15f)="Cheerful"
label(data$covid_child_eng_16___1)="16. How are you coping or dealing with stress/anxiety related to the COVID-19 outbreak? (check all that apply)    (choice=Getting a good nights sleep)"
label(data$covid_child_eng_16___2)="16. How are you coping or dealing with stress/anxiety related to the COVID-19 outbreak? (check all that apply)    (choice=Meditation and/or mindfulness practices)"
label(data$covid_child_eng_16___3)="16. How are you coping or dealing with stress/anxiety related to the COVID-19 outbreak? (check all that apply)    (choice=Prayer)"
label(data$covid_child_eng_16___4)="16. How are you coping or dealing with stress/anxiety related to the COVID-19 outbreak? (check all that apply)    (choice=Writing (e.g., poetry, journaling))"
label(data$covid_child_eng_16___5)="16. How are you coping or dealing with stress/anxiety related to the COVID-19 outbreak? (check all that apply)    (choice=Talking with friends (i.e., FaceTime, Zoom))"
label(data$covid_child_eng_16___6)="16. How are you coping or dealing with stress/anxiety related to the COVID-19 outbreak? (check all that apply)    (choice=Using text or other social media with friends)"
label(data$covid_child_eng_16___7)="16. How are you coping or dealing with stress/anxiety related to the COVID-19 outbreak? (check all that apply)    (choice=Engaging in more family activities (e.g., games, sports))"
label(data$covid_child_eng_16___8)="16. How are you coping or dealing with stress/anxiety related to the COVID-19 outbreak? (check all that apply)    (choice=Exercising)"
label(data$covid_child_eng_16___9)="16. How are you coping or dealing with stress/anxiety related to the COVID-19 outbreak? (check all that apply)    (choice=Playing an instrument)"
label(data$covid_child_eng_16___10)="16. How are you coping or dealing with stress/anxiety related to the COVID-19 outbreak? (check all that apply)    (choice=Listening to music)"
label(data$covid_child_eng_16___11)="16. How are you coping or dealing with stress/anxiety related to the COVID-19 outbreak? (check all that apply)    (choice=Watching a movie)"
label(data$covid_child_eng_16___12)="16. How are you coping or dealing with stress/anxiety related to the COVID-19 outbreak? (check all that apply)    (choice=Spending time with my dog/cat or other pet)"
label(data$covid_child_eng_16___13)="16. How are you coping or dealing with stress/anxiety related to the COVID-19 outbreak? (check all that apply)    (choice=Talking to mental health care professionals (e.g., therapists, psychologists, psychiatrists))"
label(data$covid_child_eng_16___14)="16. How are you coping or dealing with stress/anxiety related to the COVID-19 outbreak? (check all that apply)    (choice=Playing video games)"
label(data$covid_child_eng_16___15)="16. How are you coping or dealing with stress/anxiety related to the COVID-19 outbreak? (check all that apply)    (choice=Reading a book)"
label(data$covid_child_eng_16___16)="16. How are you coping or dealing with stress/anxiety related to the COVID-19 outbreak? (check all that apply)    (choice=Art or crafts)"
label(data$covid_child_eng_16___17)="16. How are you coping or dealing with stress/anxiety related to the COVID-19 outbreak? (check all that apply)    (choice=Playing board games or cards)"
label(data$covid_child_eng_16___18)="16. How are you coping or dealing with stress/anxiety related to the COVID-19 outbreak? (check all that apply)    (choice=Eating comfort foods (e.g., candy and chips))"
label(data$covid_child_eng_16___19)="16. How are you coping or dealing with stress/anxiety related to the COVID-19 outbreak? (check all that apply)    (choice=Eating healthier)"
label(data$covid_child_eng_16___20)="16. How are you coping or dealing with stress/anxiety related to the COVID-19 outbreak? (check all that apply)    (choice=Increased self-care (e.g., taking baths, giving self a facial))"
label(data$covid_child_eng_16___21)="16. How are you coping or dealing with stress/anxiety related to the COVID-19 outbreak? (check all that apply)    (choice=Taking vitamins or herbals for immune system)"
label(data$covid_child_eng_16___22)="16. How are you coping or dealing with stress/anxiety related to the COVID-19 outbreak? (check all that apply)    (choice=Drinking alcohol)"
label(data$covid_child_eng_16___23)="16. How are you coping or dealing with stress/anxiety related to the COVID-19 outbreak? (check all that apply)    (choice=Using tobacco (i.e., smoking, vaping))"
label(data$covid_child_eng_16___24)="16. How are you coping or dealing with stress/anxiety related to the COVID-19 outbreak? (check all that apply)    (choice=Using marijuana (i.e., smoking, vaping, eating))"
label(data$covid_child_eng_16___25)="16. How are you coping or dealing with stress/anxiety related to the COVID-19 outbreak? (check all that apply)    (choice=Using other recreational drugs)"
label(data$covid_child_eng_16___26)="16. How are you coping or dealing with stress/anxiety related to the COVID-19 outbreak? (check all that apply)    (choice=Not skipping their prescribed drugs)"
label(data$covid_child_eng_16___27)="16. How are you coping or dealing with stress/anxiety related to the COVID-19 outbreak? (check all that apply)    (choice=Using new prescription drugs)"
label(data$covid_child_eng_16___28)="16. How are you coping or dealing with stress/anxiety related to the COVID-19 outbreak? (check all that apply)    (choice=Helping others)"
label(data$covid_child_eng_16___29)="16. How are you coping or dealing with stress/anxiety related to the COVID-19 outbreak? (check all that apply)    (choice=None)"
label(data$covid_child_eng_16___30)="16. How are you coping or dealing with stress/anxiety related to the COVID-19 outbreak? (check all that apply)    (choice=Other (please describe):)"
label(data$covid_child_eng_16ex)=""
label(data$covid_child_eng_17a)="Thinking a lot about COVID-19"
label(data$covid_child_eng_17b)="Easily distracted"
label(data$covid_child_eng_17c)="Forgetful in daily activities"
label(data$covid_child_eng_17d)="Easily switching tasks"
label(data$covid_child_eng_17e)="More focus"
label(data$covid_child_eng_17f)="More disorganization"
label(data$covid_child_eng_17g)="Having racing thoughts"
label(data$covid_child_eng_17h)="Zoning out"
label(data$covid_child_eng_17i)="Able to sustain attention on tasks"
label(data$covid_child_eng_17j)="Able to plan activities or work"
label(data$covid_child_eng_17k)="Able to review work"
label(data$covid_child_eng_18)="18. How long do you think it will be before things go back to normal?"
label(data$covid_child_eng_19)="19. When did you begin social distancing (i.e., not seeing friends or family in person except for those in your household)?"
label(data$covid_child_eng_20)="20. Do you agree with the CURRENT restrictions (i.e., social distancing) that have been recommended or required by your local and state government?"
label(data$covid_child_eng_21___1)="21. Which activity do you miss the most? (choose up to three, and ignore those that dont apply) (choice=In-person contact with friends)"
label(data$covid_child_eng_21___2)="21. Which activity do you miss the most? (choose up to three, and ignore those that dont apply) (choice=In-person contact wiith extended family)"
label(data$covid_child_eng_21___3)="21. Which activity do you miss the most? (choose up to three, and ignore those that dont apply) (choice=Going to school)"
label(data$covid_child_eng_21___4)="21. Which activity do you miss the most? (choose up to three, and ignore those that dont apply) (choice=School work)"
label(data$covid_child_eng_21___5)="21. Which activity do you miss the most? (choose up to three, and ignore those that dont apply) (choice=Family activities in outdoor spaces (e.g., beaches, forests, national parks))"
label(data$covid_child_eng_21___6)="21. Which activity do you miss the most? (choose up to three, and ignore those that dont apply) (choice=Family activities in public spaces (e.g., museums, playgrounds, theaters))"
label(data$covid_child_eng_21___7)="21. Which activity do you miss the most? (choose up to three, and ignore those that dont apply) (choice=Joining in team sports)"
label(data$covid_child_eng_21___8)="21. Which activity do you miss the most? (choose up to three, and ignore those that dont apply) (choice=Going to restaurants or stores)"
label(data$covid_child_eng_21___9)="21. Which activity do you miss the most? (choose up to three, and ignore those that dont apply) (choice=Music, theater, art activities)"
label(data$covid_child_eng_21___10)="21. Which activity do you miss the most? (choose up to three, and ignore those that dont apply) (choice=In-person religious services)"
label(data$covid_child_eng_21___11)="21. Which activity do you miss the most? (choose up to three, and ignore those that dont apply) (choice=Having my job (if you were working or volunteering before))"
label(data$covid_child_eng_21___12)="21. Which activity do you miss the most? (choose up to three, and ignore those that dont apply) (choice=Other (please describe):)"
label(data$covid_child_eng_21ex)=""
label(data$covid_child_eng_22___1)="22. Which activity do you miss the least? (choose up to three, please ignore those that dont apply to you) (choice=In-person contact with friends)"
label(data$covid_child_eng_22___2)="22. Which activity do you miss the least? (choose up to three, please ignore those that dont apply to you) (choice=In-person contact wiith extended family)"
label(data$covid_child_eng_22___3)="22. Which activity do you miss the least? (choose up to three, please ignore those that dont apply to you) (choice=Going to school)"
label(data$covid_child_eng_22___4)="22. Which activity do you miss the least? (choose up to three, please ignore those that dont apply to you) (choice=School work)"
label(data$covid_child_eng_22___5)="22. Which activity do you miss the least? (choose up to three, please ignore those that dont apply to you) (choice=Family activities in outdoor spaces (e.g., beaches, forests, national parks))"
label(data$covid_child_eng_22___6)="22. Which activity do you miss the least? (choose up to three, please ignore those that dont apply to you) (choice=Family activities in public spaces (e.g., museums, playgrounds, theaters))"
label(data$covid_child_eng_22___7)="22. Which activity do you miss the least? (choose up to three, please ignore those that dont apply to you) (choice=Joining in team sports)"
label(data$covid_child_eng_22___8)="22. Which activity do you miss the least? (choose up to three, please ignore those that dont apply to you) (choice=Going to restaurants or stores)"
label(data$covid_child_eng_22___9)="22. Which activity do you miss the least? (choose up to three, please ignore those that dont apply to you) (choice=Music, theater, art activities)"
label(data$covid_child_eng_22___10)="22. Which activity do you miss the least? (choose up to three, please ignore those that dont apply to you) (choice=In-person religious services)"
label(data$covid_child_eng_22___11)="22. Which activity do you miss the least? (choose up to three, please ignore those that dont apply to you) (choice=Having my job (if you were working or volunteering before))"
label(data$covid_child_eng_22___12)="22. Which activity do you miss the least? (choose up to three, please ignore those that dont apply to you) (choice=Other (please describe):)"
label(data$covid_child_eng_22ex)=""
label(data$covid_child_eng_23)="23. How often are you getting outside of your house or allowed stay-at-home activities (e.g., going on a walk or a run, walking a pet, spending time in your backyard)?"
label(data$covid_child_eng_24)="24. How often have you followed the rules about the social distancing or stay-at-home restrictions put in place in your community?"
label(data$covid_child_eng_25)="25. Since your school has closed, how often do you talk/chat with friends online (including on your cell phone, on social media, or through online gaming)?"
label(data$covid_child_eng_26___1)="26. Since your school has closed, how do you stay connected with friends? (check all that apply) (choice=Texting (phone) or Messaging (on social media))"
label(data$covid_child_eng_26___2)="26. Since your school has closed, how do you stay connected with friends? (check all that apply) (choice=Voice-only phone calls)"
label(data$covid_child_eng_26___3)="26. Since your school has closed, how do you stay connected with friends? (check all that apply) (choice=Video calls (e.g., FaceTime, Google Duo, Skype, Zoom))"
label(data$covid_child_eng_26___4)="26. Since your school has closed, how do you stay connected with friends? (check all that apply) (choice=Using social media for live chats)"
label(data$covid_child_eng_26___5)="26. Since your school has closed, how do you stay connected with friends? (check all that apply) (choice=Posting on social media)"
label(data$covid_child_eng_26___6)="26. Since your school has closed, how do you stay connected with friends? (check all that apply) (choice=Using social media to support them (e.g., liking, sharing, retweeting))"
label(data$covid_child_eng_26___7)="26. Since your school has closed, how do you stay connected with friends? (check all that apply) (choice=Online gaming)"
label(data$covid_child_eng_27___1)="27. Have you experienced any sleep changes since the start of the COVID-19 pandemic? (check all that apply) (choice=Getting more sleep)"
label(data$covid_child_eng_27___2)="27. Have you experienced any sleep changes since the start of the COVID-19 pandemic? (check all that apply) (choice=Getting less sleep)"
label(data$covid_child_eng_27___3)="27. Have you experienced any sleep changes since the start of the COVID-19 pandemic? (check all that apply) (choice=More vivid dreams or more dreaming)"
label(data$covid_child_eng_27___4)="27. Have you experienced any sleep changes since the start of the COVID-19 pandemic? (check all that apply) (choice=Fewer dreams)"
label(data$covid_child_eng_27___5)="27. Have you experienced any sleep changes since the start of the COVID-19 pandemic? (check all that apply) (choice=More regular sleep hours)"
label(data$covid_child_eng_27___6)="27. Have you experienced any sleep changes since the start of the COVID-19 pandemic? (check all that apply) (choice=More interrupted sleep/difficulty staying asleep)"
label(data$covid_child_eng_27___7)="27. Have you experienced any sleep changes since the start of the COVID-19 pandemic? (check all that apply) (choice=More irregular sleep)"
label(data$covid_child_eng_27___8)="27. Have you experienced any sleep changes since the start of the COVID-19 pandemic? (check all that apply) (choice=Better quality sleep)"
label(data$covid_child_eng_27___9)="27. Have you experienced any sleep changes since the start of the COVID-19 pandemic? (check all that apply) (choice=Trouble waking up)"
label(data$covid_child_eng_27___10)="27. Have you experienced any sleep changes since the start of the COVID-19 pandemic? (check all that apply) (choice=More daytime naps)"
label(data$covid_child_eng_27___11)="27. Have you experienced any sleep changes since the start of the COVID-19 pandemic? (check all that apply) (choice=More alert during the day)"
label(data$covid_child_eng_27___12)="27. Have you experienced any sleep changes since the start of the COVID-19 pandemic? (check all that apply) (choice=Other (please describe):)"
label(data$covid_child_eng_27ex)=""
label(data$covid_child_eng_28)="28. In the past 7 days, including today, about how much time per day do you talk/chat with friends online (including on cell phone, on social media, or through online gaming)?"
label(data$covid_child_eng_29)="29. Please indicate your average daily phone/tablet screen time usage (this information can be accessed from your phone if you have one)"
label(data$covid_child_eng_30)="30. Since your school has closed, what are the most important social activities that you are no longer doing or no longer able to do?"
label(data$covid_child_eng_31)="31. What are some of the things you do to keep socially connected with your (immediate) family?"
label(data$covid_child_eng_open)="Is there anything we didnt ask about that you would like to share?"
label(data$covid_child_eng_end)="Thank You for Completing this Important Survey  We are so grateful for your help. If you would like to receive a $5 amazon e-gift card, please enter your email (or your parents email) here:  "
label(data$covid_child_survey_complete)="Complete?"
#Setting Units


#Setting Factors(will create new variable for factors)
data$redcap_event_name.factor = factor(data$redcap_event_name,levels=c("year_1_arm_1","year_2_arm_1","year_3_arm_1","year_4_arm_1","covid19_arm_1"))
data$covid_child_eng_consent.factor = factor(data$covid_child_eng_consent,levels=c("1","0"))
data$covid_child_eng_sex.factor = factor(data$covid_child_eng_sex,levels=c("1","2","3","4","5"))
data$covid_child_eng_1.factor = factor(data$covid_child_eng_1,levels=c("1","2","3","4","5"))
data$covid_child_eng_2___1.factor = factor(data$covid_child_eng_2___1,levels=c("0","1"))
data$covid_child_eng_2___2.factor = factor(data$covid_child_eng_2___2,levels=c("0","1"))
data$covid_child_eng_2___3.factor = factor(data$covid_child_eng_2___3,levels=c("0","1"))
data$covid_child_eng_2___4.factor = factor(data$covid_child_eng_2___4,levels=c("0","1"))
data$covid_child_eng_2___5.factor = factor(data$covid_child_eng_2___5,levels=c("0","1"))
data$covid_child_eng_2___6.factor = factor(data$covid_child_eng_2___6,levels=c("0","1"))
data$covid_child_eng_2___7.factor = factor(data$covid_child_eng_2___7,levels=c("0","1"))
data$covid_child_eng_2___8.factor = factor(data$covid_child_eng_2___8,levels=c("0","1"))
data$covid_child_eng_3.factor = factor(data$covid_child_eng_3,levels=c("1","2","3","4","5"))
data$covid_child_eng_4___1.factor = factor(data$covid_child_eng_4___1,levels=c("0","1"))
data$covid_child_eng_4___2.factor = factor(data$covid_child_eng_4___2,levels=c("0","1"))
data$covid_child_eng_4___3.factor = factor(data$covid_child_eng_4___3,levels=c("0","1"))
data$covid_child_eng_4___4.factor = factor(data$covid_child_eng_4___4,levels=c("0","1"))
data$covid_child_eng_4___5.factor = factor(data$covid_child_eng_4___5,levels=c("0","1"))
data$covid_child_eng_4___6.factor = factor(data$covid_child_eng_4___6,levels=c("0","1"))
data$covid_child_eng_4___7.factor = factor(data$covid_child_eng_4___7,levels=c("0","1"))
data$covid_child_eng_4___8.factor = factor(data$covid_child_eng_4___8,levels=c("0","1"))
data$covid_child_eng_4___9.factor = factor(data$covid_child_eng_4___9,levels=c("0","1"))
data$covid_child_eng_4___10.factor = factor(data$covid_child_eng_4___10,levels=c("0","1"))
data$covid_child_eng_4___11.factor = factor(data$covid_child_eng_4___11,levels=c("0","1"))
data$covid_child_eng_4___12.factor = factor(data$covid_child_eng_4___12,levels=c("0","1"))
data$covid_child_eng_5.factor = factor(data$covid_child_eng_5,levels=c("1","0"))
data$covid_child_eng_5a.factor = factor(data$covid_child_eng_5a,levels=c("1","0"))
data$covid_child_eng_6.factor = factor(data$covid_child_eng_6,levels=c("1","0"))
data$covid_child_eng_6a___1.factor = factor(data$covid_child_eng_6a___1,levels=c("0","1"))
data$covid_child_eng_6a___2.factor = factor(data$covid_child_eng_6a___2,levels=c("0","1"))
data$covid_child_eng_6a___3.factor = factor(data$covid_child_eng_6a___3,levels=c("0","1"))
data$covid_child_eng_6a___4.factor = factor(data$covid_child_eng_6a___4,levels=c("0","1"))
data$covid_child_eng_6a___5.factor = factor(data$covid_child_eng_6a___5,levels=c("0","1"))
data$covid_child_eng_6a___6.factor = factor(data$covid_child_eng_6a___6,levels=c("0","1"))
data$covid_child_eng_6a___7.factor = factor(data$covid_child_eng_6a___7,levels=c("0","1"))
data$covid_child_eng_6a___8.factor = factor(data$covid_child_eng_6a___8,levels=c("0","1"))
data$covid_child_eng_6a___9.factor = factor(data$covid_child_eng_6a___9,levels=c("0","1"))
data$covid_child_eng_6a___10.factor = factor(data$covid_child_eng_6a___10,levels=c("0","1"))
data$covid_child_eng_6a___11.factor = factor(data$covid_child_eng_6a___11,levels=c("0","1"))
data$covid_child_eng_7.factor = factor(data$covid_child_eng_7,levels=c("1","0"))
data$covid_child_eng_7a___1.factor = factor(data$covid_child_eng_7a___1,levels=c("0","1"))
data$covid_child_eng_7a___2.factor = factor(data$covid_child_eng_7a___2,levels=c("0","1"))
data$covid_child_eng_7a___3.factor = factor(data$covid_child_eng_7a___3,levels=c("0","1"))
data$covid_child_eng_7a___4.factor = factor(data$covid_child_eng_7a___4,levels=c("0","1"))
data$covid_child_eng_7a___5.factor = factor(data$covid_child_eng_7a___5,levels=c("0","1"))
data$covid_child_eng_7a___6.factor = factor(data$covid_child_eng_7a___6,levels=c("0","1"))
data$covid_child_eng_7a___7.factor = factor(data$covid_child_eng_7a___7,levels=c("0","1"))
data$covid_child_eng_8.factor = factor(data$covid_child_eng_8,levels=c("1","0"))
data$covid_child_eng_8b.factor = factor(data$covid_child_eng_8b,levels=c("1","0"))
data$covid_child_eng_10___1.factor = factor(data$covid_child_eng_10___1,levels=c("0","1"))
data$covid_child_eng_10___2.factor = factor(data$covid_child_eng_10___2,levels=c("0","1"))
data$covid_child_eng_10___3.factor = factor(data$covid_child_eng_10___3,levels=c("0","1"))
data$covid_child_eng_10___4.factor = factor(data$covid_child_eng_10___4,levels=c("0","1"))
data$covid_child_eng_10___5.factor = factor(data$covid_child_eng_10___5,levels=c("0","1"))
data$covid_child_eng_10___6.factor = factor(data$covid_child_eng_10___6,levels=c("0","1"))
data$covid_child_eng_10___7.factor = factor(data$covid_child_eng_10___7,levels=c("0","1"))
data$covid_child_eng_11.factor = factor(data$covid_child_eng_11,levels=c("1","2","3","4","5"))
data$covid_child_eng_12.factor = factor(data$covid_child_eng_12,levels=c("1","2","3","4","5"))
data$covid_child_eng_13.factor = factor(data$covid_child_eng_13,levels=c("1","2","3","4","5"))
data$covid_child_eng_14a.factor = factor(data$covid_child_eng_14a,levels=c("1","2","3","4","5"))
data$covid_child_eng_14b.factor = factor(data$covid_child_eng_14b,levels=c("1","2","3","4","5"))
data$covid_child_eng_14c.factor = factor(data$covid_child_eng_14c,levels=c("1","2","3","4","5"))
data$covid_child_eng_14d.factor = factor(data$covid_child_eng_14d,levels=c("1","2","3","4","5"))
data$covid_child_eng_14e.factor = factor(data$covid_child_eng_14e,levels=c("1","2","3","4","5"))
data$covid_child_eng_14f.factor = factor(data$covid_child_eng_14f,levels=c("1","2","3","4","5"))
data$covid_child_eng_14g.factor = factor(data$covid_child_eng_14g,levels=c("1","2","3","4","5"))
data$covid_child_eng_14h.factor = factor(data$covid_child_eng_14h,levels=c("1","2","3","4","5"))
data$covid_child_eng_14i.factor = factor(data$covid_child_eng_14i,levels=c("1","2","3","4","5"))
data$covid_child_eng_14j.factor = factor(data$covid_child_eng_14j,levels=c("1","2","3","4","5"))
data$covid_child_eng_14k.factor = factor(data$covid_child_eng_14k,levels=c("1","2","3","4","5"))
data$covid_child_eng_14l.factor = factor(data$covid_child_eng_14l,levels=c("1","2","3","4","5"))
data$covid_child_eng_14m.factor = factor(data$covid_child_eng_14m,levels=c("1","2","3","4","5"))
data$covid_child_eng_14n.factor = factor(data$covid_child_eng_14n,levels=c("1","2","3","4","5"))
data$covid_child_eng_14o.factor = factor(data$covid_child_eng_14o,levels=c("1","2","3","4","5"))
data$covid_child_eng_14p.factor = factor(data$covid_child_eng_14p,levels=c("1","2","3","4","5"))
data$covid_child_eng_14q.factor = factor(data$covid_child_eng_14q,levels=c("1","2","3","4","5"))
data$covid_child_eng_14r.factor = factor(data$covid_child_eng_14r,levels=c("1","2","3","4","5"))
data$covid_child_eng_14s.factor = factor(data$covid_child_eng_14s,levels=c("1","2","3","4","5"))
data$covid_child_eng_15a.factor = factor(data$covid_child_eng_15a,levels=c("1","2","3","4","5"))
data$covid_child_eng_15b.factor = factor(data$covid_child_eng_15b,levels=c("1","2","3","4","5"))
data$covid_child_eng_15c.factor = factor(data$covid_child_eng_15c,levels=c("1","2","3","4","5"))
data$covid_child_eng_15d.factor = factor(data$covid_child_eng_15d,levels=c("1","2","3","4","5"))
data$covid_child_eng_15e.factor = factor(data$covid_child_eng_15e,levels=c("1","2","3","4","5"))
data$covid_child_eng_15f.factor = factor(data$covid_child_eng_15f,levels=c("1","2","3","4","5"))
data$covid_child_eng_16___1.factor = factor(data$covid_child_eng_16___1,levels=c("0","1"))
data$covid_child_eng_16___2.factor = factor(data$covid_child_eng_16___2,levels=c("0","1"))
data$covid_child_eng_16___3.factor = factor(data$covid_child_eng_16___3,levels=c("0","1"))
data$covid_child_eng_16___4.factor = factor(data$covid_child_eng_16___4,levels=c("0","1"))
data$covid_child_eng_16___5.factor = factor(data$covid_child_eng_16___5,levels=c("0","1"))
data$covid_child_eng_16___6.factor = factor(data$covid_child_eng_16___6,levels=c("0","1"))
data$covid_child_eng_16___7.factor = factor(data$covid_child_eng_16___7,levels=c("0","1"))
data$covid_child_eng_16___8.factor = factor(data$covid_child_eng_16___8,levels=c("0","1"))
data$covid_child_eng_16___9.factor = factor(data$covid_child_eng_16___9,levels=c("0","1"))
data$covid_child_eng_16___10.factor = factor(data$covid_child_eng_16___10,levels=c("0","1"))
data$covid_child_eng_16___11.factor = factor(data$covid_child_eng_16___11,levels=c("0","1"))
data$covid_child_eng_16___12.factor = factor(data$covid_child_eng_16___12,levels=c("0","1"))
data$covid_child_eng_16___13.factor = factor(data$covid_child_eng_16___13,levels=c("0","1"))
data$covid_child_eng_16___14.factor = factor(data$covid_child_eng_16___14,levels=c("0","1"))
data$covid_child_eng_16___15.factor = factor(data$covid_child_eng_16___15,levels=c("0","1"))
data$covid_child_eng_16___16.factor = factor(data$covid_child_eng_16___16,levels=c("0","1"))
data$covid_child_eng_16___17.factor = factor(data$covid_child_eng_16___17,levels=c("0","1"))
data$covid_child_eng_16___18.factor = factor(data$covid_child_eng_16___18,levels=c("0","1"))
data$covid_child_eng_16___19.factor = factor(data$covid_child_eng_16___19,levels=c("0","1"))
data$covid_child_eng_16___20.factor = factor(data$covid_child_eng_16___20,levels=c("0","1"))
data$covid_child_eng_16___21.factor = factor(data$covid_child_eng_16___21,levels=c("0","1"))
data$covid_child_eng_16___22.factor = factor(data$covid_child_eng_16___22,levels=c("0","1"))
data$covid_child_eng_16___23.factor = factor(data$covid_child_eng_16___23,levels=c("0","1"))
data$covid_child_eng_16___24.factor = factor(data$covid_child_eng_16___24,levels=c("0","1"))
data$covid_child_eng_16___25.factor = factor(data$covid_child_eng_16___25,levels=c("0","1"))
data$covid_child_eng_16___26.factor = factor(data$covid_child_eng_16___26,levels=c("0","1"))
data$covid_child_eng_16___27.factor = factor(data$covid_child_eng_16___27,levels=c("0","1"))
data$covid_child_eng_16___28.factor = factor(data$covid_child_eng_16___28,levels=c("0","1"))
data$covid_child_eng_16___29.factor = factor(data$covid_child_eng_16___29,levels=c("0","1"))
data$covid_child_eng_16___30.factor = factor(data$covid_child_eng_16___30,levels=c("0","1"))
data$covid_child_eng_17a.factor = factor(data$covid_child_eng_17a,levels=c("1","2","3","4","5"))
data$covid_child_eng_17b.factor = factor(data$covid_child_eng_17b,levels=c("1","2","3","4","5"))
data$covid_child_eng_17c.factor = factor(data$covid_child_eng_17c,levels=c("1","2","3","4","5"))
data$covid_child_eng_17d.factor = factor(data$covid_child_eng_17d,levels=c("1","2","3","4","5"))
data$covid_child_eng_17e.factor = factor(data$covid_child_eng_17e,levels=c("1","2","3","4","5"))
data$covid_child_eng_17f.factor = factor(data$covid_child_eng_17f,levels=c("1","2","3","4","5"))
data$covid_child_eng_17g.factor = factor(data$covid_child_eng_17g,levels=c("1","2","3","4","5"))
data$covid_child_eng_17h.factor = factor(data$covid_child_eng_17h,levels=c("1","2","3","4","5"))
data$covid_child_eng_17i.factor = factor(data$covid_child_eng_17i,levels=c("1","2","3","4","5"))
data$covid_child_eng_17j.factor = factor(data$covid_child_eng_17j,levels=c("1","2","3","4","5"))
data$covid_child_eng_17k.factor = factor(data$covid_child_eng_17k,levels=c("1","2","3","4","5"))
data$covid_child_eng_18.factor = factor(data$covid_child_eng_18,levels=c("1","2","3","4","5","6"))
data$covid_child_eng_19.factor = factor(data$covid_child_eng_19,levels=c("1","2","3","4","5"))
data$covid_child_eng_20.factor = factor(data$covid_child_eng_20,levels=c("1","2","3"))
data$covid_child_eng_21___1.factor = factor(data$covid_child_eng_21___1,levels=c("0","1"))
data$covid_child_eng_21___2.factor = factor(data$covid_child_eng_21___2,levels=c("0","1"))
data$covid_child_eng_21___3.factor = factor(data$covid_child_eng_21___3,levels=c("0","1"))
data$covid_child_eng_21___4.factor = factor(data$covid_child_eng_21___4,levels=c("0","1"))
data$covid_child_eng_21___5.factor = factor(data$covid_child_eng_21___5,levels=c("0","1"))
data$covid_child_eng_21___6.factor = factor(data$covid_child_eng_21___6,levels=c("0","1"))
data$covid_child_eng_21___7.factor = factor(data$covid_child_eng_21___7,levels=c("0","1"))
data$covid_child_eng_21___8.factor = factor(data$covid_child_eng_21___8,levels=c("0","1"))
data$covid_child_eng_21___9.factor = factor(data$covid_child_eng_21___9,levels=c("0","1"))
data$covid_child_eng_21___10.factor = factor(data$covid_child_eng_21___10,levels=c("0","1"))
data$covid_child_eng_21___11.factor = factor(data$covid_child_eng_21___11,levels=c("0","1"))
data$covid_child_eng_21___12.factor = factor(data$covid_child_eng_21___12,levels=c("0","1"))
data$covid_child_eng_22___1.factor = factor(data$covid_child_eng_22___1,levels=c("0","1"))
data$covid_child_eng_22___2.factor = factor(data$covid_child_eng_22___2,levels=c("0","1"))
data$covid_child_eng_22___3.factor = factor(data$covid_child_eng_22___3,levels=c("0","1"))
data$covid_child_eng_22___4.factor = factor(data$covid_child_eng_22___4,levels=c("0","1"))
data$covid_child_eng_22___5.factor = factor(data$covid_child_eng_22___5,levels=c("0","1"))
data$covid_child_eng_22___6.factor = factor(data$covid_child_eng_22___6,levels=c("0","1"))
data$covid_child_eng_22___7.factor = factor(data$covid_child_eng_22___7,levels=c("0","1"))
data$covid_child_eng_22___8.factor = factor(data$covid_child_eng_22___8,levels=c("0","1"))
data$covid_child_eng_22___9.factor = factor(data$covid_child_eng_22___9,levels=c("0","1"))
data$covid_child_eng_22___10.factor = factor(data$covid_child_eng_22___10,levels=c("0","1"))
data$covid_child_eng_22___11.factor = factor(data$covid_child_eng_22___11,levels=c("0","1"))
data$covid_child_eng_22___12.factor = factor(data$covid_child_eng_22___12,levels=c("0","1"))
data$covid_child_eng_23.factor = factor(data$covid_child_eng_23,levels=c("1","2","3","4","5"))
data$covid_child_eng_24.factor = factor(data$covid_child_eng_24,levels=c("1","2","3","4","5"))
data$covid_child_eng_25.factor = factor(data$covid_child_eng_25,levels=c("1","2","3","4"))
data$covid_child_eng_26___1.factor = factor(data$covid_child_eng_26___1,levels=c("0","1"))
data$covid_child_eng_26___2.factor = factor(data$covid_child_eng_26___2,levels=c("0","1"))
data$covid_child_eng_26___3.factor = factor(data$covid_child_eng_26___3,levels=c("0","1"))
data$covid_child_eng_26___4.factor = factor(data$covid_child_eng_26___4,levels=c("0","1"))
data$covid_child_eng_26___5.factor = factor(data$covid_child_eng_26___5,levels=c("0","1"))
data$covid_child_eng_26___6.factor = factor(data$covid_child_eng_26___6,levels=c("0","1"))
data$covid_child_eng_26___7.factor = factor(data$covid_child_eng_26___7,levels=c("0","1"))
data$covid_child_eng_27___1.factor = factor(data$covid_child_eng_27___1,levels=c("0","1"))
data$covid_child_eng_27___2.factor = factor(data$covid_child_eng_27___2,levels=c("0","1"))
data$covid_child_eng_27___3.factor = factor(data$covid_child_eng_27___3,levels=c("0","1"))
data$covid_child_eng_27___4.factor = factor(data$covid_child_eng_27___4,levels=c("0","1"))
data$covid_child_eng_27___5.factor = factor(data$covid_child_eng_27___5,levels=c("0","1"))
data$covid_child_eng_27___6.factor = factor(data$covid_child_eng_27___6,levels=c("0","1"))
data$covid_child_eng_27___7.factor = factor(data$covid_child_eng_27___7,levels=c("0","1"))
data$covid_child_eng_27___8.factor = factor(data$covid_child_eng_27___8,levels=c("0","1"))
data$covid_child_eng_27___9.factor = factor(data$covid_child_eng_27___9,levels=c("0","1"))
data$covid_child_eng_27___10.factor = factor(data$covid_child_eng_27___10,levels=c("0","1"))
data$covid_child_eng_27___11.factor = factor(data$covid_child_eng_27___11,levels=c("0","1"))
data$covid_child_eng_27___12.factor = factor(data$covid_child_eng_27___12,levels=c("0","1"))
data$covid_child_eng_28.factor = factor(data$covid_child_eng_28,levels=c("1","2","3","4","5","6"))
data$covid_child_survey_complete.factor = factor(data$covid_child_survey_complete,levels=c("0","1","2"))

levels(data$redcap_event_name.factor)=c("Year 1","Year 2","Year 3","Year 4","COVID-19")
levels(data$covid_child_eng_consent.factor)=c("Yes","No")
levels(data$covid_child_eng_sex.factor)=c("Female","Male","Non-binary","Other","Prefer not to say")
levels(data$covid_child_eng_1.factor)=c("Not at All","A little","Somewhat","A lot","A great deal")
levels(data$covid_child_eng_2___1.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_2___2.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_2___3.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_2___4.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_2___5.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_2___6.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_2___7.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_2___8.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_3.factor)=c("Not at All","A little","Somewhat","A lot","A great deal")
levels(data$covid_child_eng_4___1.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_4___2.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_4___3.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_4___4.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_4___5.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_4___6.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_4___7.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_4___8.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_4___9.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_4___10.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_4___11.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_4___12.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_5.factor)=c("Yes","No")
levels(data$covid_child_eng_5a.factor)=c("Yes","No")
levels(data$covid_child_eng_6.factor)=c("Yes","No")
levels(data$covid_child_eng_6a___1.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_6a___2.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_6a___3.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_6a___4.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_6a___5.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_6a___6.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_6a___7.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_6a___8.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_6a___9.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_6a___10.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_6a___11.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_7.factor)=c("Yes","No")
levels(data$covid_child_eng_7a___1.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_7a___2.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_7a___3.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_7a___4.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_7a___5.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_7a___6.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_7a___7.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_8.factor)=c("Yes","No")
levels(data$covid_child_eng_8b.factor)=c("Yes","No")
levels(data$covid_child_eng_10___1.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_10___2.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_10___3.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_10___4.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_10___5.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_10___6.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_10___7.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_11.factor)=c("Very Slightly or Not at all","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_12.factor)=c("Very Slightly or Not at all","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_13.factor)=c("Very Slightly or Not at all","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_14a.factor)=c("Very Slightly or Not at all","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_14b.factor)=c("Very Slightly or Not at all","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_14c.factor)=c("Very Slightly or Not at all","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_14d.factor)=c("Very Slightly or Not at all","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_14e.factor)=c("Very Slightly or Not at all","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_14f.factor)=c("Very Slightly or Not at all","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_14g.factor)=c("Very Slightly or Not at all","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_14h.factor)=c("Very Slightly or Not at all","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_14i.factor)=c("Very Slightly or Not at all","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_14j.factor)=c("Very Slightly or Not at all","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_14k.factor)=c("Very Slightly or Not at all","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_14l.factor)=c("Very Slightly or Not at all","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_14m.factor)=c("Very Slightly or Not at all","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_14n.factor)=c("Very Slightly or Not at all","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_14o.factor)=c("Very Slightly or Not at all","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_14p.factor)=c("Very Slightly or Not at all","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_14q.factor)=c("Very Slightly or Not at all","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_14r.factor)=c("Very Slightly or Not at all","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_14s.factor)=c("Very Slightly or Not at all","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_15a.factor)=c("Not at All","A Little","Some","Quite a Bit","A Great Deal")
levels(data$covid_child_eng_15b.factor)=c("Not at All","A Little","Some","Quite a Bit","A Great Deal")
levels(data$covid_child_eng_15c.factor)=c("Not at All","A Little","Some","Quite a Bit","A Great Deal")
levels(data$covid_child_eng_15d.factor)=c("Not at All","A Little","Some","Quite a Bit","A Great Deal")
levels(data$covid_child_eng_15e.factor)=c("Not at All","A Little","Some","Quite a Bit","A Great Deal")
levels(data$covid_child_eng_15f.factor)=c("Not at All","A Little","Some","Quite a Bit","A Great Deal")
levels(data$covid_child_eng_16___1.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_16___2.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_16___3.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_16___4.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_16___5.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_16___6.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_16___7.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_16___8.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_16___9.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_16___10.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_16___11.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_16___12.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_16___13.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_16___14.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_16___15.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_16___16.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_16___17.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_16___18.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_16___19.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_16___20.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_16___21.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_16___22.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_16___23.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_16___24.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_16___25.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_16___26.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_16___27.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_16___28.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_16___29.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_16___30.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_17a.factor)=c("Very Slightly or Not at All","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_17b.factor)=c("Very Slightly or Not at All","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_17c.factor)=c("Very Slightly or Not at All","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_17d.factor)=c("Very Slightly or Not at All","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_17e.factor)=c("Very Slightly or Not at All","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_17f.factor)=c("Very Slightly or Not at All","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_17g.factor)=c("Very Slightly or Not at All","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_17h.factor)=c("Very Slightly or Not at All","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_17i.factor)=c("Very Slightly or Not at All","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_17j.factor)=c("Very Slightly or Not at All","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_17k.factor)=c("Very Slightly or Not at All","Slightly","Moderately","Quite a Bit","Extremely")
levels(data$covid_child_eng_18.factor)=c("Less than 1 month","2-3 months","3-6 months","6-12 months","12 months +","Never")
levels(data$covid_child_eng_19.factor)=c("Before school closures","On the same day as school closures","After school closures","On the same day as the Stay-at-home order by your local government","Do not practice social distancing")
levels(data$covid_child_eng_20.factor)=c("I think the restrictions are not strict enough","I think the restrictions are too strict","I think the restrictions are good")
levels(data$covid_child_eng_21___1.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_21___2.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_21___3.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_21___4.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_21___5.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_21___6.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_21___7.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_21___8.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_21___9.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_21___10.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_21___11.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_21___12.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_22___1.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_22___2.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_22___3.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_22___4.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_22___5.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_22___6.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_22___7.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_22___8.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_22___9.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_22___10.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_22___11.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_22___12.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_23.factor)=c("Multiple times a day","Once a day","Every couple days","Once a week","Less than once a week")
levels(data$covid_child_eng_24.factor)=c("Never","Seldom","Sometimes","Often","Always")
levels(data$covid_child_eng_25.factor)=c("Every day or almost every day","Several times a week","About once a week","Less often")
levels(data$covid_child_eng_26___1.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_26___2.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_26___3.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_26___4.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_26___5.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_26___6.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_26___7.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_27___1.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_27___2.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_27___3.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_27___4.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_27___5.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_27___6.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_27___7.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_27___8.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_27___9.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_27___10.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_27___11.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_27___12.factor)=c("Unchecked","Checked")
levels(data$covid_child_eng_28.factor)=c("< 30 minutes per day","30 min - 1 hour","1-2 hours","2-4 hours","4-6 hours",">6 hours")
levels(data$covid_child_survey_complete.factor)=c("Incomplete","Unverified","Complete")
# Write out the result
cat('debug: ', dim(data))
write.csv(data, output_file, row.names = !is.null(rownames(data)))