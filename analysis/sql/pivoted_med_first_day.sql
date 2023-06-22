-- It has been filtered to obtain the information of the first 24 hours, 
 
SELECT
  patientunitstayid,
  AVG(norepinephrine) AS norepinephrine_mean,
  MAX(norepinephrine) AS norepinephrine_max,
  MIN(norepinephrine) AS norepinephrine_min,
  AVG(epinephrine) AS epinephrine_mean,
  MAX(epinephrine) AS epinephrine_max,
  MIN(epinephrine) AS epinephrine_min,
  AVG(dopamine) AS dopamine_mean,
  MAX(dopamine) AS dopamine_max,
  MIN(dopamine) AS dopamine_min,
  AVG(dobutamine) AS dobutamine_mean,
  MAX(dobutamine) AS dobutamine_max,
  MIN(dobutamine) AS dobutamine_min,
  AVG(phenylephrine) AS phenylephrine_mean,
  MAX(phenylephrine) AS phenylephrine_max,
  MIN(phenylephrine) AS phenylephrine_min,
  AVG(vasopressin) AS vasopressin_mean,
  MAX(vasopressin) AS vasopressin_max,
  MIN(vasopressin) AS vasopressin_min,
  AVG(milrinone) AS milrinone_mean,
  MAX(milrinone) AS milrinone_max,
  MIN(milrinone) AS milrinone_min,
  AVG(heparin) AS heparin_mean,
  MAX(heparin) AS heparin_max,
  MIN(heparin) AS heparin_min,
  AVG(warfarin) AS warfarin_mean,
  MAX(warfarin) AS warfarin_max,
  MIN(warfarin) AS warfarin_min
FROM `physionet-data.eicu_crd_derived.pivoted_med`
WHERE chartoffset >= 0 AND chartoffset <= 1440
GROUP BY patientunitstayid;
