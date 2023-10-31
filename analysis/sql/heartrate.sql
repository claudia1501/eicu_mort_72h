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
  (SELECT heartrate
   FROM `physionet-data.eicu_crd_derived.pivoted_vital` p1
   WHERE p1.patientunitstayid = c.patientunitstayid AND p1.chartoffset = c.first_chartoffset) AS heartrate_first,
  c.last_chartoffset,
  (SELECT heartrate
   FROM `physionet-data.eicu_crd_derived.pivoted_vital` p2
   WHERE p2.patientunitstayid = c.patientunitstayid AND p2.chartoffset = c.last_chartoffset) AS heartrate_last
FROM ChartoffsetStats c;
