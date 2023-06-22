-- Calculates ICU mortality between 24 and 72hrs

SELECT
  patientunitstayid,
  MAX(CASE WHEN actualICULOS BETWEEN 1 AND 3 AND actualICUMortality = '1' THEN 1
    ELSE 0 END) AS icu_mortality_72hrs
FROM
  `physionet-data.eicu_crd.apachepatientresult`
GROUP BY
  patientunitstayid
