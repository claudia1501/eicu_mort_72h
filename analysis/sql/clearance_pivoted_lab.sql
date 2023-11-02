WITH ChartoffsetStats AS (
  SELECT
    patientunitstayid,
    MIN(chartoffset) AS first_chartoffset,
    MAX(chartoffset) AS last_chartoffset
  FROM `physionet-data.eicu_crd_derived.pivoted_lab`
  WHERE chartoffset >= 0 AND chartoffset <= 2880
  GROUP BY patientunitstayid
)
SELECT
  c.patientunitstayid,
  c.first_chartoffset,
  (SELECT ARRAY_AGG(albumin)
   FROM `physionet-data.eicu_crd_derived.pivoted_lab` p1
   WHERE p1.patientunitstayid = c.patientunitstayid AND p1.chartoffset = c.first_chartoffset)[OFFSET(0)] AS albumin_first,
  c.last_chartoffset,
  (SELECT ARRAY_AGG(albumin)
   FROM `physionet-data.eicu_crd_derived.pivoted_lab` p2
   WHERE p2.patientunitstayid = c.patientunitstayid AND p2.chartoffset = c.last_chartoffset)[OFFSET(0)] AS albumin_last,
  (SELECT ARRAY_AGG(bilirubin)
   FROM `physionet-data.eicu_crd_derived.pivoted_lab` p1
   WHERE p1.patientunitstayid = c.patientunitstayid AND p1.chartoffset = c.first_chartoffset)[OFFSET(0)] AS bilirubin_first,
  (SELECT ARRAY_AGG(bilirubin)
   FROM `physionet-data.eicu_crd_derived.pivoted_lab` p2
   WHERE p2.patientunitstayid = c.patientunitstayid AND p2.chartoffset = c.last_chartoffset)[OFFSET(0)] AS bilirubin_last,
  (SELECT ARRAY_AGG(BUN)
   FROM `physionet-data.eicu_crd_derived.pivoted_lab` p1
   WHERE p1.patientunitstayid = c.patientunitstayid AND p1.chartoffset = c.first_chartoffset)[OFFSET(0)] AS BUN_first,
  (SELECT ARRAY_AGG(BUN)
   FROM `physionet-data.eicu_crd_derived.pivoted_lab` p2
   WHERE p2.patientunitstayid = c.patientunitstayid AND p2.chartoffset = c.last_chartoffset)[OFFSET(0)] AS BUN_last,
  (SELECT ARRAY_AGG(calcium)
   FROM `physionet-data.eicu_crd_derived.pivoted_lab` p1
   WHERE p1.patientunitstayid = c.patientunitstayid AND p1.chartoffset = c.first_chartoffset)[OFFSET(0)] AS calcium_first,
  (SELECT ARRAY_AGG(calcium)
   FROM `physionet-data.eicu_crd_derived.pivoted_lab` p2
   WHERE p2.patientunitstayid = c.patientunitstayid AND p2.chartoffset = c.last_chartoffset)[OFFSET(0)] AS calcium_last,
  (SELECT ARRAY_AGG(creatinine)
   FROM `physionet-data.eicu_crd_derived.pivoted_lab` p1
   WHERE p1.patientunitstayid = c.patientunitstayid AND p1.chartoffset = c.first_chartoffset)[OFFSET(0)] AS creatinine_first,
  (SELECT ARRAY_AGG(creatinine)
   FROM `physionet-data.eicu_crd_derived.pivoted_lab` p2
   WHERE p2.patientunitstayid = c.patientunitstayid AND p2.chartoffset = c.last_chartoffset)[OFFSET(0)] AS creatinine_last,
  (SELECT ARRAY_AGG(glucose)
   FROM `physionet-data.eicu_crd_derived.pivoted_lab` p1
   WHERE p1.patientunitstayid = c.patientunitstayid AND p1.chartoffset = c.first_chartoffset)[OFFSET(0)] AS glucose_first,
  (SELECT ARRAY_AGG(glucose)
   FROM `physionet-data.eicu_crd_derived.pivoted_lab` p2
   WHERE p2.patientunitstayid = c.patientunitstayid AND p2.chartoffset = c.last_chartoffset)[OFFSET(0)] AS glucose_last,
  (SELECT ARRAY_AGG(bicarbonate)
   FROM `physionet-data.eicu_crd_derived.pivoted_lab` p1
   WHERE p1.patientunitstayid = c.patientunitstayid AND p1.chartoffset = c.first_chartoffset)[OFFSET(0)] AS bicarbonate_first,
  (SELECT ARRAY_AGG(bicarbonate)
   FROM `physionet-data.eicu_crd_derived.pivoted_lab` p2
   WHERE p2.patientunitstayid = c.patientunitstayid AND p2.chartoffset = c.last_chartoffset)[OFFSET(0)] AS bicarbonate_last,
  (SELECT ARRAY_AGG(TotalCO2)
   FROM `physionet-data.eicu_crd_derived.pivoted_lab` p1
   WHERE p1.patientunitstayid = c.patientunitstayid AND p1.chartoffset = c.first_chartoffset)[OFFSET(0)] AS TotalCO2_first,
  (SELECT ARRAY_AGG(TotalCO2)
   FROM `physionet-data.eicu_crd_derived.pivoted_lab` p2
   WHERE p2.patientunitstayid = c.patientunitstayid AND p2.chartoffset = c.last_chartoffset)[OFFSET(0)] AS TotalCO2_last,
  (SELECT ARRAY_AGG(hematocrit)
   FROM `physionet-data.eicu_crd_derived.pivoted_lab` p1
   WHERE p1.patientunitstayid = c.patientunitstayid AND p1.chartoffset = c.first_chartoffset)[OFFSET(0)] AS hematocrit_first,
  (SELECT ARRAY_AGG(hematocrit)
   FROM `physionet-data.eicu_crd_derived.pivoted_lab` p2
   WHERE p2.patientunitstayid = c.patientunitstayid AND p2.chartoffset = c.last_chartoffset)[OFFSET(0)] AS hematocrit_last,
  (SELECT ARRAY_AGG(hemoglobin)
   FROM `physionet-data.eicu_crd_derived.pivoted_lab` p1
   WHERE p1.patientunitstayid = c.patientunitstayid AND p1.chartoffset = c.first_chartoffset)[OFFSET(0)] AS hemoglobin_first,
  (SELECT ARRAY_AGG(hemoglobin)
   FROM `physionet-data.eicu_crd_derived.pivoted_lab` p2
   WHERE p2.patientunitstayid = c.patientunitstayid AND p2.chartoffset = c.last_chartoffset)[OFFSET(0)] AS hemoglobin_last,
  (SELECT ARRAY_AGG(INR)
   FROM `physionet-data.eicu_crd_derived.pivoted_lab` p1
   WHERE p1.patientunitstayid = c.patientunitstayid AND p1.chartoffset = c.first_chartoffset)[OFFSET(0)] AS INR_first,
  (SELECT ARRAY_AGG(INR)
   FROM `physionet-data.eicu_crd_derived.pivoted_lab` p2
   WHERE p2.patientunitstayid = c.patientunitstayid AND p2.chartoffset = c.last_chartoffset)[OFFSET(0)] AS INR_last,
  (SELECT ARRAY_AGG(lactate)
   FROM `physionet-data.eicu_crd_derived.pivoted_lab` p2
   WHERE p2.patientunitstayid = c.patientunitstayid AND p2.chartoffset = c.first_chartoffset)[OFFSET(0)] AS lactate_first,
  (SELECT ARRAY_AGG(lactate)
   FROM `physionet-data.eicu_crd_derived.pivoted_lab` p2
   WHERE p2.patientunitstayid = c.patientunitstayid AND p2.chartoffset = c.last_chartoffset)[OFFSET(0)] AS lactate_last,
  (SELECT ARRAY_AGG(platelets)
   FROM `physionet-data.eicu_crd_derived.pivoted_lab` p2
   WHERE p2.patientunitstayid = c.patientunitstayid AND p2.chartoffset = c.first_chartoffset)[OFFSET(0)] AS platelets_first,
  (SELECT ARRAY_AGG(platelets)
   FROM `physionet-data.eicu_crd_derived.pivoted_lab` p2
   WHERE p2.patientunitstayid = c.patientunitstayid AND p2.chartoffset = c.last_chartoffset)[OFFSET(0)] AS platelets_last,
  (SELECT ARRAY_AGG(potassium)
   FROM `physionet-data.eicu_crd_derived.pivoted_lab` p2
   WHERE p2.patientunitstayid = c.patientunitstayid AND p2.chartoffset = c.first_chartoffset)[OFFSET(0)] AS potassium_first,
  (SELECT ARRAY_AGG(potassium)
   FROM `physionet-data.eicu_crd_derived.pivoted_lab` p2
   WHERE p2.patientunitstayid = c.patientunitstayid AND p2.chartoffset = c.last_chartoffset)[OFFSET(0)] AS potassium_last,
  (SELECT ARRAY_AGG(ptt)
   FROM `physionet-data.eicu_crd_derived.pivoted_lab` p2
   WHERE p2.patientunitstayid = c.patientunitstayid AND p2.chartoffset = c.first_chartoffset)[OFFSET(0)] AS ptt_first,
  (SELECT ARRAY_AGG(ptt)
   FROM `physionet-data.eicu_crd_derived.pivoted_lab` p2
   WHERE p2.patientunitstayid = c.patientunitstayid AND p2.chartoffset = c.last_chartoffset)[OFFSET(0)] AS ptt_last,
  (SELECT ARRAY_AGG(sodium)
   FROM `physionet-data.eicu_crd_derived.pivoted_lab` p2
   WHERE p2.patientunitstayid = c.patientunitstayid AND p2.chartoffset = c.first_chartoffset)[OFFSET(0)] AS sodium_first,
  (SELECT ARRAY_AGG(sodium)
   FROM `physionet-data.eicu_crd_derived.pivoted_lab` p2
   WHERE p2.patientunitstayid = c.patientunitstayid AND p2.chartoffset = c.last_chartoffset)[OFFSET(0)] AS sodium_last,
  (SELECT ARRAY_AGG(wbc)
   FROM `physionet-data.eicu_crd_derived.pivoted_lab` p2
   WHERE p2.patientunitstayid = c.patientunitstayid AND p2.chartoffset = c.first_chartoffset)[OFFSET(0)] AS wbc_first,
  (SELECT ARRAY_AGG(wbc)
   FROM `physionet-data.eicu_crd_derived.pivoted_lab` p2
   WHERE p2.patientunitstayid = c.patientunitstayid AND p2.chartoffset = c.last_chartoffset)[OFFSET(0)] AS wbc_last,
  (SELECT ARRAY_AGG(bands)
   FROM `physionet-data.eicu_crd_derived.pivoted_lab` p2
   WHERE p2.patientunitstayid = c.patientunitstayid AND p2.chartoffset = c.first_chartoffset)[OFFSET(0)] AS bands_first,
  (SELECT ARRAY_AGG(bands)
   FROM `physionet-data.eicu_crd_derived.pivoted_lab` p2
   WHERE p2.patientunitstayid = c.patientunitstayid AND p2.chartoffset = c.last_chartoffset)[OFFSET(0)] AS bands_last,
  (SELECT ARRAY_AGG(alt)
   FROM `physionet-data.eicu_crd_derived.pivoted_lab` p2
   WHERE p2.patientunitstayid = c.patientunitstayid AND p2.chartoffset = c.first_chartoffset)[OFFSET(0)] AS alt_first,
  (SELECT ARRAY_AGG(alt)
   FROM `physionet-data.eicu_crd_derived.pivoted_lab` p2
   WHERE p2.patientunitstayid = c.patientunitstayid AND p2.chartoffset = c.last_chartoffset)[OFFSET(0)] AS alt_last,
  (SELECT ARRAY_AGG(ast)
   FROM `physionet-data.eicu_crd_derived.pivoted_lab` p2
   WHERE p2.patientunitstayid = c.patientunitstayid AND p2.chartoffset = c.first_chartoffset)[OFFSET(0)] AS ast_first,
  (SELECT ARRAY_AGG(ast)
   FROM `physionet-data.eicu_crd_derived.pivoted_lab` p2
   WHERE p2.patientunitstayid = c.patientunitstayid AND p2.chartoffset = c.last_chartoffset)[OFFSET(0)] AS ast_last,
  (SELECT ARRAY_AGG(alp)
   FROM `physionet-data.eicu_crd_derived.pivoted_lab` p2
   WHERE p2.patientunitstayid = c.patientunitstayid AND p2.chartoffset = c.first_chartoffset)[OFFSET(0)] AS alp_first,
  (SELECT ARRAY_AGG(alp)
   FROM `physionet-data.eicu_crd_derived.pivoted_lab` p2
   WHERE p2.patientunitstayid = c.patientunitstayid AND p2.chartoffset = c.last_chartoffset)[OFFSET(0)] AS alp_last
FROM ChartoffsetStats c
ORDER BY c.patientunitstayid ASC;
