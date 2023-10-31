WITH ChartoffsetStats AS (
  SELECT
    patientunitstayid,
    MIN(chartoffset) AS first_chartoffset,
    MAX(chartoffset) AS last_chartoffset
  FROM `physionet-data.eicu_crd_derived.pivoted_vital`
  WHERE chartoffset >= 0 AND chartoffset <= 2880
  GROUP BY patientunitstayid
)
SELECT
  c.patientunitstayid,
  c.first_chartoffset,
  (SELECT ARRAY_AGG(heartrate)
   FROM `physionet-data.eicu_crd_derived.pivoted_vital` p1
   WHERE p1.patientunitstayid = c.patientunitstayid AND p1.chartoffset = c.first_chartoffset)[OFFSET(0)] AS heartrate_first,
  c.last_chartoffset,
  (SELECT ARRAY_AGG(heartrate)
   FROM `physionet-data.eicu_crd_derived.pivoted_vital` p2
   WHERE p2.patientunitstayid = c.patientunitstayid AND p2.chartoffset = c.last_chartoffset)[OFFSET(0)] AS heartrate_last,
  (SELECT ARRAY_AGG(respiratoryrate)
   FROM `physionet-data.eicu_crd_derived.pivoted_vital` p1
   WHERE p1.patientunitstayid = c.patientunitstayid AND p1.chartoffset = c.first_chartoffset)[OFFSET(0)] AS respiratoryrate_first,
  (SELECT ARRAY_AGG(respiratoryrate)
   FROM `physionet-data.eicu_crd_derived.pivoted_vital` p2
   WHERE p2.patientunitstayid = c.patientunitstayid AND p2.chartoffset = c.last_chartoffset)[OFFSET(0)] AS respiratoryrate_last,
  (SELECT ARRAY_AGG(spo2)
   FROM `physionet-data.eicu_crd_derived.pivoted_vital` p1
   WHERE p1.patientunitstayid = c.patientunitstayid AND p1.chartoffset = c.first_chartoffset)[OFFSET(0)] AS spo2_first,
  (SELECT ARRAY_AGG(spo2)
   FROM `physionet-data.eicu_crd_derived.pivoted_vital` p2
   WHERE p2.patientunitstayid = c.patientunitstayid AND p2.chartoffset = c.last_chartoffset)[OFFSET(0)] AS spo2_last,
  (SELECT ARRAY_AGG(nibp_systolic)
   FROM `physionet-data.eicu_crd_derived.pivoted_vital` p1
   WHERE p1.patientunitstayid = c.patientunitstayid AND p1.chartoffset = c.first_chartoffset)[OFFSET(0)] AS nibp_systolic_first,
  (SELECT ARRAY_AGG(nibp_systolic)
   FROM `physionet-data.eicu_crd_derived.pivoted_vital` p2
   WHERE p2.patientunitstayid = c.patientunitstayid AND p2.chartoffset = c.last_chartoffset)[OFFSET(0)] AS nibp_systolic_last,
  (SELECT ARRAY_AGG(nibp_diastolic)
   FROM `physionet-data.eicu_crd_derived.pivoted_vital` p1
   WHERE p1.patientunitstayid = c.patientunitstayid AND p1.chartoffset = c.first_chartoffset)[OFFSET(0)] AS nibp_diastolic_first,
  (SELECT ARRAY_AGG(nibp_diastolic)
   FROM `physionet-data.eicu_crd_derived.pivoted_vital` p2
   WHERE p2.patientunitstayid = c.patientunitstayid AND p2.chartoffset = c.last_chartoffset)[OFFSET(0)] AS nibp_diastolic_last,
  (SELECT ARRAY_AGG(nibp_mean)
   FROM `physionet-data.eicu_crd_derived.pivoted_vital` p1
   WHERE p1.patientunitstayid = c.patientunitstayid AND p1.chartoffset = c.first_chartoffset)[OFFSET(0)] AS nibp_mean_first,
  (SELECT ARRAY_AGG(nibp_mean)
   FROM `physionet-data.eicu_crd_derived.pivoted_vital` p2
   WHERE p2.patientunitstayid = c.patientunitstayid AND p2.chartoffset = c.last_chartoffset)[OFFSET(0)] AS nibp_mean_last,
  (SELECT ARRAY_AGG(temperature)
   FROM `physionet-data.eicu_crd_derived.pivoted_vital` p1
   WHERE p1.patientunitstayid = c.patientunitstayid AND p1.chartoffset = c.first_chartoffset)[OFFSET(0)] AS temperature_first,
FROM ChartoffsetStats c
ORDER BY c.patientunitstayid ASC;
