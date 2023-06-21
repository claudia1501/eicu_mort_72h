--Apache has been removed as a new severity score will be created 
SELECT  
        patientunitstayid, 
        age,
        gender,
        hosp_mortality,
        icu_los_hours
FROM `physionet-data.eicu_crd_derived.basic_demographics`
