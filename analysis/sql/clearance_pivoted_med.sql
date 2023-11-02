WITH ChartoffsetStats AS (
  SELECT
    patientunitstayid,
    MIN(chartoffset) AS first_chartoffset,
    MAX(chartoffset) AS last_chartoffset
  FROM `physionet-data.eicu_crd_derived.pivoted_med`
  WHERE chartoffset >= 0 AND chartoffset <= 2880
  GROUP BY patientunitstayid
)
SELECT
  c.patientunitstayid,
  c.first_chartoffset,
  (SELECT ARRAY_AGG(norepinephrine)
   FROM `physionet-data.eicu_crd_derived.pivoted_med` p1
   WHERE p1.patientunitstayid = c.patientunitstayid AND p1.chartoffset = c.first_chartoffset)[OFFSET(0)] AS norepinephrine_first,
  c.last_chartoffset,
  (SELECT ARRAY_AGG(norepinephrine)
   FROM `physionet-data.eicu_crd_derived.pivoted_med` p2
   WHERE p2.patientunitstayid = c.patientunitstayid AND p2.chartoffset = c.last_chartoffset)[OFFSET(0)] AS norepinephrine_last,
  (SELECT ARRAY_AGG(epinephrine)
   FROM `physionet-data.eicu_crd_derived.pivoted_med` p1
   WHERE p1.patientunitstayid = c.patientunitstayid AND p1.chartoffset = c.first_chartoffset)[OFFSET(0)] AS epinephrine_first,
  (SELECT ARRAY_AGG(epinephrine)
   FROM `physionet-data.eicu_crd_derived.pivoted_med` p2
   WHERE p2.patientunitstayid = c.patientunitstayid AND p2.chartoffset = c.last_chartoffset)[OFFSET(0)] AS epinephrine_last,
  (SELECT ARRAY_AGG(dopamine)
   FROM `physionet-data.eicu_crd_derived.pivoted_med` p1
   WHERE p1.patientunitstayid = c.patientunitstayid AND p1.chartoffset = c.first_chartoffset)[OFFSET(0)] AS dopamine_first,
  (SELECT ARRAY_AGG(dopamine)
   FROM `physionet-data.eicu_crd_derived.pivoted_med` p2
   WHERE p2.patientunitstayid = c.patientunitstayid AND p2.chartoffset = c.last_chartoffset)[OFFSET(0)] AS dopamine_last,
  (SELECT ARRAY_AGG(dobutamine)
   FROM `physionet-data.eicu_crd_derived.pivoted_med` p1
   WHERE p1.patientunitstayid = c.patientunitstayid AND p1.chartoffset = c.first_chartoffset)[OFFSET(0)] AS dobutamine_first,
  (SELECT ARRAY_AGG(dobutamine)
   FROM `physionet-data.eicu_crd_derived.pivoted_med` p2
   WHERE p2.patientunitstayid = c.patientunitstayid AND p2.chartoffset = c.last_chartoffset)[OFFSET(0)] AS dobutamine_last,
  (SELECT ARRAY_AGG(phenylephrine)
   FROM `physionet-data.eicu_crd_derived.pivoted_med` p1
   WHERE p1.patientunitstayid = c.patientunitstayid AND p1.chartoffset = c.first_chartoffset)[OFFSET(0)] AS phenylephrine_first,
  (SELECT ARRAY_AGG(phenylephrine)
   FROM `physionet-data.eicu_crd_derived.pivoted_med` p2
   WHERE p2.patientunitstayid = c.patientunitstayid AND p2.chartoffset = c.last_chartoffset)[OFFSET(0)] AS phenylephrine_last,
  (SELECT ARRAY_AGG(vasopressin)
   FROM `physionet-data.eicu_crd_derived.pivoted_med` p1
   WHERE p1.patientunitstayid = c.patientunitstayid AND p1.chartoffset = c.first_chartoffset)[OFFSET(0)] AS vasopressin_first,
  (SELECT ARRAY_AGG(vasopressin)
   FROM `physionet-data.eicu_crd_derived.pivoted_med` p2
   WHERE p2.patientunitstayid = c.patientunitstayid AND p2.chartoffset = c.last_chartoffset)[OFFSET(0)] AS vasopressin_last,
  (SELECT ARRAY_AGG(milrinone)
   FROM `physionet-data.eicu_crd_derived.pivoted_med` p1
   WHERE p1.patientunitstayid = c.patientunitstayid AND p1.chartoffset = c.first_chartoffset)[OFFSET(0)] AS milrinone_first,
  (SELECT ARRAY_AGG(milrinone)
   FROM `physionet-data.eicu_crd_derived.pivoted_med` p2
   WHERE p2.patientunitstayid = c.patientunitstayid AND p2.chartoffset = c.last_chartoffset)[OFFSET(0)] AS milrinone_last,
  (SELECT ARRAY_AGG(heparin)
   FROM `physionet-data.eicu_crd_derived.pivoted_med` p1
   WHERE p1.patientunitstayid = c.patientunitstayid AND p1.chartoffset = c.first_chartoffset)[OFFSET(0)] AS heparin_first,
  (SELECT ARRAY_AGG(heparin)
   FROM `physionet-data.eicu_crd_derived.pivoted_med` p2
   WHERE p2.patientunitstayid = c.patientunitstayid AND p2.chartoffset = c.last_chartoffset)[OFFSET(0)] AS heparin_last,
  (SELECT ARRAY_AGG(warfarin)
   FROM `physionet-data.eicu_crd_derived.pivoted_med` p1
   WHERE p1.patientunitstayid = c.patientunitstayid AND p1.chartoffset = c.first_chartoffset)[OFFSET(0)] AS warfarin_first,
  (SELECT ARRAY_AGG(warfarin)
   FROM `physionet-data.eicu_crd_derived.pivoted_med` p2
   WHERE p2.patientunitstayid = c.patientunitstayid AND p2.chartoffset = c.last_chartoffset)[OFFSET(0)] AS warfarin_last,
FROM ChartoffsetStats c
ORDER BY c.patientunitstayid ASC;
