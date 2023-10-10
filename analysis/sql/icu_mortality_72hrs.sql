-- Calculates ICU mortality between 24 and 72hrs and add apachescore variable (Calculated from acutePhysiologyScore)

SELECT
  patientunitstayid, apachescore,
  MAX(CASE WHEN actualICULOS BETWEEN 1 AND 3 AND actualICUMortality = 'EXPIRED' THEN 1
    ELSE 0 END) AS icu_mortality_72hrs
FROM
  `physionet-data.eicu_crd.apachepatientresult`
GROUP BY
  patientunitstayid, apachescore
