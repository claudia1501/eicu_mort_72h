WITH ChartoffsetStatsHeartrate AS (
  SELECT
    patientunitstayid,
    MIN(chartoffset) AS heartrate_first_chartoffset,
    MAX(chartoffset) AS heartrate_last_chartoffset
  FROM `physionet-data.eicu_crd_derived.pivoted_vital`
  WHERE chartoffset >= 0 AND chartoffset <= 2880 AND heartrate IS NOT NULL
  GROUP BY patientunitstayid
),
ChartoffsetStatsRespiratoryrate AS (
  SELECT
    patientunitstayid,
    MIN(chartoffset) AS respiratoryrate_first_chartoffset,
    MAX(chartoffset) AS respiratoryrate_last_chartoffset
  FROM `physionet-data.eicu_crd_derived.pivoted_vital`
  WHERE chartoffset >= 0 AND chartoffset <= 2880 AND respiratoryrate IS NOT NULL
  GROUP BY patientunitstayid
),
ChartoffsetStatsSpO2 AS (
  SELECT
    patientunitstayid,
    MIN(chartoffset) AS spo2_first_chartoffset,
    MAX(chartoffset) AS spo2_last_chartoffset
  FROM `physionet-data.eicu_crd_derived.pivoted_vital`
  WHERE chartoffset >= 0 AND chartoffset <= 2880 AND spo2 IS NOT NULL
  GROUP BY patientunitstayid
),
ChartoffsetStatsNIBPSystolic AS (
  SELECT
    patientunitstayid,
    MIN(chartoffset) AS nibp_systolic_first_chartoffset,
    MAX(chartoffset) AS nibp_systolic_last_chartoffset
  FROM `physionet-data.eicu_crd_derived.pivoted_vital`
  WHERE chartoffset >= 0 AND chartoffset <= 2880 AND nibp_systolic IS NOT NULL
  GROUP BY patientunitstayid
),
ChartoffsetStatsNIBPDiastolic AS (
  SELECT
    patientunitstayid,
    MIN(chartoffset) AS nibp_diastolic_first_chartoffset,
    MAX(chartoffset) AS nibp_diastolic_last_chartoffset
  FROM `physionet-data.eicu_crd_derived.pivoted_vital`
  WHERE chartoffset >= 0 AND chartoffset <= 2880 AND nibp_diastolic IS NOT NULL
  GROUP BY patientunitstayid
),
ChartoffsetStatsNIBPMean AS (
  SELECT
    patientunitstayid,
    MIN(chartoffset) AS nibp_mean_first_chartoffset,
    MAX(chartoffset) AS nibp_mean_last_chartoffset
  FROM `physionet-data.eicu_crd_derived.pivoted_vital`
  WHERE chartoffset >= 0 AND chartoffset <= 2880 AND nibp_mean IS NOT NULL
  GROUP BY patientunitstayid
),
ChartoffsetStatsTemperature AS (
  SELECT
    patientunitstayid,
    MIN(chartoffset) AS temperature_first_chartoffset,
    MAX(chartoffset) AS temperature_last_chartoffset
  FROM `physionet-data.eicu_crd_derived.pivoted_vital`
  WHERE chartoffset >= 0 AND chartoffset <= 2880 AND temperature IS NOT NULL
  GROUP BY patientunitstayid
),
ChartoffsetStatsIBPSystolic AS (
  SELECT
    patientunitstayid,
    MIN(chartoffset) AS ibp_systolic_first_chartoffset,
    MAX(chartoffset) AS ibp_systolic_last_chartoffset
  FROM `physionet-data.eicu_crd_derived.pivoted_vital`
  WHERE chartoffset >= 0 AND chartoffset <= 2880 AND ibp_systolic IS NOT NULL
  GROUP BY patientunitstayid
),
ChartoffsetStatsIBPDiastolic AS (
  SELECT
    patientunitstayid,
    MIN(chartoffset) AS ibp_diastolic_first_chartoffset,
    MAX(chartoffset) AS ibp_diastolic_last_chartoffset
  FROM `physionet-data.eicu_crd_derived.pivoted_vital`
  WHERE chartoffset >= 0 AND chartoffset <= 2880 AND ibp_diastolic IS NOT NULL
  GROUP BY patientunitstayid
),
ChartoffsetStatsIBPMean AS (
  SELECT
    patientunitstayid,
    MIN(chartoffset) AS ibp_mean_first_chartoffset,
    MAX(chartoffset) AS ibp_mean_last_chartoffset
  FROM `physionet-data.eicu_crd_derived.pivoted_vital`
  WHERE chartoffset >= 0 AND chartoffset <= 2880 AND ibp_mean IS NOT NULL
  GROUP BY patientunitstayid
)
SELECT
  COALESCE(a.patientunitstayid, b.patientunitstayid, c.patientunitstayid, d.patientunitstayid, e.patientunitstayid, f.patientunitstayid, g.patientunitstayid, h.patientunitstayid, i.patientunitstayid, j.patientunitstayid) AS patientunitstayid,
  a.heartrate_first_chartoffset,
  (
    SELECT ARRAY_AGG(heartrate)
    FROM `physionet-data.eicu_crd_derived.pivoted_vital` p1
    WHERE p1.patientunitstayid = a.patientunitstayid AND p1.chartoffset = a.heartrate_first_chartoffset
  ) [OFFSET(0)] AS heartrate_first,
  a.heartrate_last_chartoffset,
  CASE
   WHEN a.heartrate_first_chartoffset = a.heartrate_last_chartoffset THEN NULL
  ELSE(
    SELECT ARRAY_AGG(heartrate)
    FROM `physionet-data.eicu_crd_derived.pivoted_vital` p2
    WHERE p2.patientunitstayid = a.patientunitstayid AND p2.chartoffset = a.heartrate_last_chartoffset
  ) [OFFSET(0)] END AS heartrate_last,
  b.respiratoryrate_first_chartoffset,
  (
    SELECT ARRAY_AGG(respiratoryrate)
    FROM `physionet-data.eicu_crd_derived.pivoted_vital` p3
    WHERE p3.patientunitstayid = b.patientunitstayid AND p3.chartoffset = b.respiratoryrate_first_chartoffset
  ) [OFFSET(0)] AS respiratoryrate_first,
  b.respiratoryrate_last_chartoffset,
   CASE
   WHEN b.respiratoryrate_first_chartoffset = b.respiratoryrate_last_chartoffset THEN NULL
  ELSE(
    SELECT ARRAY_AGG(respiratoryrate)
    FROM `physionet-data.eicu_crd_derived.pivoted_vital` p4
    WHERE p4.patientunitstayid = b.patientunitstayid AND p4.chartoffset = b.respiratoryrate_last_chartoffset
  ) [OFFSET(0)] END AS respiratoryrate_last,
  c.spo2_first_chartoffset,
  (
    SELECT ARRAY_AGG(spo2)
    FROM `physionet-data.eicu_crd_derived.pivoted_vital` p5
    WHERE p5.patientunitstayid = c.patientunitstayid AND p5.chartoffset = c.spo2_first_chartoffset
  ) [OFFSET(0)] AS spo2_first,
  c.spo2_last_chartoffset,
   CASE
   WHEN c.spo2_first_chartoffset = c.spo2_last_chartoffset THEN NULL
  ELSE(
    SELECT ARRAY_AGG(spo2)
    FROM `physionet-data.eicu_crd_derived.pivoted_vital` p6
    WHERE p6.patientunitstayid = c.patientunitstayid AND p6.chartoffset = c.spo2_last_chartoffset
  ) [OFFSET(0)] END AS spo2_last,
  d.nibp_systolic_first_chartoffset,
  (
    SELECT ARRAY_AGG(nibp_systolic)
    FROM `physionet-data.eicu_crd_derived.pivoted_vital` p7
    WHERE p7.patientunitstayid = d.patientunitstayid AND p7.chartoffset = d.nibp_systolic_first_chartoffset
  ) [OFFSET(0)] AS nibp_systolic_first,
  d.nibp_systolic_last_chartoffset,
   CASE
   WHEN  d.nibp_systolic_first_chartoffset = d.nibp_systolic_last_chartoffset THEN NULL
  ELSE(
    SELECT ARRAY_AGG(nibp_systolic)
    FROM `physionet-data.eicu_crd_derived.pivoted_vital` p8
    WHERE p8.patientunitstayid = d.patientunitstayid AND p8.chartoffset = d.nibp_systolic_last_chartoffset
  ) [OFFSET(0)] END AS nibp_systolic_last,
  e.nibp_diastolic_first_chartoffset,
  (
    SELECT ARRAY_AGG(nibp_diastolic)
    FROM `physionet-data.eicu_crd_derived.pivoted_vital` p9
    WHERE p9.patientunitstayid = e.patientunitstayid AND p9.chartoffset = e.nibp_diastolic_first_chartoffset
  ) [OFFSET(0)] AS nibp_diastolic_first,
  e.nibp_diastolic_last_chartoffset,
   CASE
   WHEN  e.nibp_diastolic_first_chartoffset = e.nibp_diastolic_last_chartoffset THEN NULL
  ELSE(
    SELECT ARRAY_AGG(nibp_diastolic)
    FROM `physionet-data.eicu_crd_derived.pivoted_vital` p10
    WHERE p10.patientunitstayid = e.patientunitstayid AND p10.chartoffset = e.nibp_diastolic_last_chartoffset
  ) [OFFSET(0)] END AS nibp_diastolic_last,
  f.nibp_mean_first_chartoffset,
  (
    SELECT ARRAY_AGG(nibp_mean)
    FROM `physionet-data.eicu_crd_derived.pivoted_vital` p11
    WHERE p11.patientunitstayid = f.patientunitstayid AND p11.chartoffset = f.nibp_mean_first_chartoffset
  ) [OFFSET(0)] AS nibp_mean_first,
  f.nibp_mean_last_chartoffset,
   CASE
   WHEN   f.nibp_mean_first_chartoffset = f.nibp_mean_last_chartoffset THEN NULL
  ELSE(
    SELECT ARRAY_AGG(nibp_mean)
    FROM `physionet-data.eicu_crd_derived.pivoted_vital` p12
    WHERE p12.patientunitstayid = f.patientunitstayid AND p12.chartoffset = f.nibp_mean_last_chartoffset
  ) [OFFSET(0)] END AS nibp_mean_last,
  g.temperature_first_chartoffset,
  (
    SELECT ARRAY_AGG(temperature)
    FROM `physionet-data.eicu_crd_derived.pivoted_vital` p13
    WHERE p13.patientunitstayid = g.patientunitstayid AND p13.chartoffset = g.temperature_first_chartoffset 
  ) [OFFSET(0)] AS temperature_first,
  g.temperature_last_chartoffset,
   CASE
   WHEN  g.temperature_first_chartoffset = g.temperature_last_chartoffset THEN NULL
  ELSE(
    SELECT ARRAY_AGG(temperature)
    FROM `physionet-data.eicu_crd_derived.pivoted_vital` p14
    WHERE p14.patientunitstayid = g.patientunitstayid AND p14.chartoffset = g.temperature_last_chartoffset
  )[OFFSET(0)] END AS temperaure_last,
  h.ibp_systolic_first_chartoffset,
  (
    SELECT ARRAY_AGG(ibp_systolic)
    FROM `physionet-data.eicu_crd_derived.pivoted_vital` p15
    WHERE p15.patientunitstayid = h.patientunitstayid AND p15.chartoffset = h.ibp_systolic_first_chartoffset
  )[OFFSET(0)] AS ibp_systolic_first,
  h.ibp_systolic_last_chartoffset,
   CASE
   WHEN  h.ibp_systolic_first_chartoffset = h.ibp_systolic_last_chartoffset THEN NULL
  ELSE(
    SELECT ARRAY_AGG(ibp_systolic)
    FROM `physionet-data.eicu_crd_derived.pivoted_vital` p16
    WHERE p16.patientunitstayid = h.patientunitstayid AND p16.chartoffset = h.ibp_systolic_last_chartoffset
  )[OFFSET(0)] END AS ibp_systolic_last,
  i.ibp_diastolic_first_chartoffset,
  (
    SELECT ARRAY_AGG(ibp_diastolic)
    FROM `physionet-data.eicu_crd_derived.pivoted_vital` p17
    WHERE p17.patientunitstayid = i.patientunitstayid AND p17.chartoffset = i.ibp_diastolic_first_chartoffset
  )[OFFSET(0)] AS ibp_diastolic_first,
  i.ibp_diastolic_last_chartoffset,
   CASE
   WHEN i.ibp_diastolic_first_chartoffset = i.ibp_diastolic_last_chartoffset THEN NULL
  ELSE(
    SELECT ARRAY_AGG(ibp_diastolic)
    FROM `physionet-data.eicu_crd_derived.pivoted_vital` p18
    WHERE p18.patientunitstayid = i.patientunitstayid AND p18.chartoffset = i.ibp_diastolic_last_chartoffset
  )[OFFSET(0)] END AS ibp_diastolic_last,
  j.ibp_mean_first_chartoffset,
  (
    SELECT ARRAY_AGG(ibp_mean)
    FROM `physionet-data.eicu_crd_derived.pivoted_vital` p19
    WHERE p19.patientunitstayid = j.patientunitstayid AND p19.chartoffset = j.ibp_mean_first_chartoffset
  )[OFFSET(0)] AS ibp_mean_first,
  j.ibp_mean_last_chartoffset,
   CASE
   WHEN j.ibp_mean_first_chartoffset = j.ibp_mean_last_chartoffset THEN NULL
  ELSE(
    SELECT ARRAY_AGG(ibp_mean)
    FROM `physionet-data.eicu_crd_derived.pivoted_vital` p20
    WHERE p20.patientunitstayid = j.patientunitstayid AND p20.chartoffset = j.ibp_mean_last_chartoffset
  )[OFFSET(0)] END AS ibp_mean_last
FROM ChartoffsetStatsHeartrate a
LEFT JOIN ChartoffsetStatsRespiratoryrate b ON a.patientunitstayid = b.patientunitstayid
LEFT JOIN ChartoffsetStatsSpO2 c ON a.patientunitstayid = c.patientunitstayid
LEFT JOIN ChartoffsetStatsNIBPSystolic d ON a.patientunitstayid = d.patientunitstayid
LEFT JOIN ChartoffsetStatsNIBPDiastolic e ON a.patientunitstayid = e.patientunitstayid
LEFT JOIN ChartoffsetStatsNIBPMean f ON a.patientunitstayid = f.patientunitstayid
LEFT JOIN ChartoffsetStatsTemperature g ON a.patientunitstayid = g.patientunitstayid
LEFT JOIN ChartoffsetStatsIBPSystolic h ON a.patientunitstayid = h.patientunitstayid
LEFT JOIN ChartoffsetStatsIBPDiastolic i ON a.patientunitstayid = i.patientunitstayid
LEFT JOIN ChartoffsetStatsIBPMean j ON a.patientunitstayid = j.patientunitstayid
ORDER BY COALESCE (a.patientunitstayid, b.patientunitstayid, c.patientunitstayid, d.patientunitstayid, e.patientunitstayid, f.patientunitstayid, g.patientunitstayid, h.patientunitstayid, i.patientunitstayid, j.patientunitstayid);
