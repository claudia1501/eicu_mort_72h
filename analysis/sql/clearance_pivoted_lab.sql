WITH ChartoffsetStatsAlbumin AS (
  SELECT
    patientunitstayid,
    MIN(chartoffset) AS albumin_first_chartoffset,
    MAX(chartoffset) AS albumin_last_chartoffset
  FROM `physionet-data.eicu_crd_derived.pivoted_lab`
  WHERE chartoffset >= 0 AND chartoffset <= 2880 AND albumin IS NOT NULL
  GROUP BY patientunitstayid
),
ChartoffsetStatsBilirubin AS (
  SELECT
    patientunitstayid,
    MIN(chartoffset) AS bilirubin_first_chartoffset,
    MAX(chartoffset) AS bilirubin_last_chartoffset
  FROM `physionet-data.eicu_crd_derived.pivoted_lab`
  WHERE chartoffset >= 0 AND chartoffset <= 2880 AND bilirubin IS NOT NULL
  GROUP BY patientunitstayid
),
ChartoffsetStatsBUN AS (
  SELECT
    patientunitstayid,
    MIN(chartoffset) AS BUN_first_chartoffset,
    MAX(chartoffset) AS BUN_last_chartoffset
  FROM `physionet-data.eicu_crd_derived.pivoted_lab`
  WHERE chartoffset >= 0 AND chartoffset <= 2880 AND BUN IS NOT NULL
  GROUP BY patientunitstayid
),
ChartoffsetStatsCalcium AS (
  SELECT
    patientunitstayid,
    MIN(chartoffset) AS calcium_first_chartoffset,
    MAX(chartoffset) AS calcium_last_chartoffset
  FROM `physionet-data.eicu_crd_derived.pivoted_lab`
  WHERE chartoffset >= 0 AND chartoffset <= 2880 AND calcium IS NOT NULL
  GROUP BY patientunitstayid
),
ChartoffsetStatsCreatinine AS (
  SELECT
    patientunitstayid,
    MIN(chartoffset) AS creatinine_first_chartoffset,
    MAX(chartoffset) AS creatinine_last_chartoffset
  FROM `physionet-data.eicu_crd_derived.pivoted_lab`
  WHERE chartoffset >= 0 AND chartoffset <= 2880 AND creatinine IS NOT NULL
  GROUP BY patientunitstayid
),
ChartoffsetStatsGlucose AS (
  SELECT
    patientunitstayid,
    MIN(chartoffset) AS glucose_first_chartoffset,
    MAX(chartoffset) AS glucose_last_chartoffset
  FROM `physionet-data.eicu_crd_derived.pivoted_lab`
  WHERE chartoffset >= 0 AND chartoffset <= 2880 AND glucose IS NOT NULL
  GROUP BY patientunitstayid
),
ChartoffsetStatsBicarbonate AS (
  SELECT
    patientunitstayid,
    MIN(chartoffset) AS bicarbonate_first_chartoffset,
    MAX(chartoffset) AS bicarbonate_last_chartoffset
  FROM `physionet-data.eicu_crd_derived.pivoted_lab`
  WHERE chartoffset >= 0 AND chartoffset <= 2880 AND bicarbonate IS NOT NULL
  GROUP BY patientunitstayid
),
ChartoffsetStatsTotalCO2 AS (
  SELECT
    patientunitstayid,
    MIN(chartoffset) AS TotalCO2_first_chartoffset,
    MAX(chartoffset) AS TotalCO2_last_chartoffset
  FROM `physionet-data.eicu_crd_derived.pivoted_lab`
  WHERE chartoffset >= 0 AND chartoffset <= 2880 AND TotalCO2 IS NOT NULL
  GROUP BY patientunitstayid
),
ChartoffsetStatsHematocrit AS (
  SELECT
    patientunitstayid,
    MIN(chartoffset) AS hematocrit_first_chartoffset,
    MAX(chartoffset) AS hematocrit_last_chartoffset
  FROM `physionet-data.eicu_crd_derived.pivoted_lab`
  WHERE chartoffset >= 0 AND chartoffset <= 2880 AND hematocrit IS NOT NULL
  GROUP BY patientunitstayid
),
ChartoffsetStatsHemoglobin AS (
  SELECT
    patientunitstayid,
    MIN(chartoffset) AS hemoglobin_first_chartoffset,
    MAX(chartoffset) AS hemoglobin_last_chartoffset
  FROM `physionet-data.eicu_crd_derived.pivoted_lab`
  WHERE chartoffset >= 0 AND chartoffset <= 2880 AND hemoglobin IS NOT NULL
  GROUP BY patientunitstayid
),
ChartoffsetStatsINR AS (
  SELECT
    patientunitstayid,
    MIN(chartoffset) AS INR_first_chartoffset,
    MAX(chartoffset) AS INR_last_chartoffset
  FROM `physionet-data.eicu_crd_derived.pivoted_lab`
  WHERE chartoffset >= 0 AND chartoffset <= 2880 AND INR IS NOT NULL
  GROUP BY patientunitstayid
),
ChartoffsetStatsLactate AS (
  SELECT
    patientunitstayid,
    MIN(chartoffset) AS lactate_first_chartoffset,
    MAX(chartoffset) AS lactate_last_chartoffset
  FROM `physionet-data.eicu_crd_derived.pivoted_lab`
  WHERE chartoffset >= 0 AND chartoffset <= 2880 AND lactate IS NOT NULL
  GROUP BY patientunitstayid
),
ChartoffsetStatsPlatelets AS (
  SELECT
    patientunitstayid,
    MIN(chartoffset) AS platelets_first_chartoffset,
    MAX(chartoffset) AS platelets_last_chartoffset
  FROM `physionet-data.eicu_crd_derived.pivoted_lab`
  WHERE chartoffset >= 0 AND chartoffset <= 2880 AND platelets IS NOT NULL
  GROUP BY patientunitstayid
),
ChartoffsetStatsPotassium AS (
  SELECT
    patientunitstayid,
    MIN(chartoffset) AS potassium_first_chartoffset,
    MAX(chartoffset) AS potassium_last_chartoffset
  FROM `physionet-data.eicu_crd_derived.pivoted_lab`
  WHERE chartoffset >= 0 AND chartoffset <= 2880 AND potassium IS NOT NULL
  GROUP BY patientunitstayid
),
ChartoffsetStatsPtt AS (
  SELECT
    patientunitstayid,
    MIN(chartoffset) AS ptt_first_chartoffset,
    MAX(chartoffset) AS ptt_last_chartoffset
  FROM `physionet-data.eicu_crd_derived.pivoted_lab`
  WHERE chartoffset >= 0 AND chartoffset <= 2880 AND ptt IS NOT NULL
  GROUP BY patientunitstayid
),
ChartoffsetStatsSodium AS (
  SELECT
    patientunitstayid,
    MIN(chartoffset) AS sodium_first_chartoffset,
    MAX(chartoffset) AS sodium_last_chartoffset
  FROM `physionet-data.eicu_crd_derived.pivoted_lab`
  WHERE chartoffset >= 0 AND chartoffset <= 2880 AND sodium IS NOT NULL
  GROUP BY patientunitstayid
),
ChartoffsetStatsWbc AS (
  SELECT
    patientunitstayid,
    MIN(chartoffset) AS wbc_first_chartoffset,
    MAX(chartoffset) AS wbc_last_chartoffset
  FROM `physionet-data.eicu_crd_derived.pivoted_lab`
  WHERE chartoffset >= 0 AND chartoffset <= 2880 AND wbc IS NOT NULL
  GROUP BY patientunitstayid
),
ChartoffsetStatsBands AS (
  SELECT
    patientunitstayid,
    MIN(chartoffset) AS bands_first_chartoffset,
    MAX(chartoffset) AS bands_last_chartoffset
  FROM `physionet-data.eicu_crd_derived.pivoted_lab`
  WHERE chartoffset >= 0 AND chartoffset <= 2880 AND bands IS NOT NULL
  GROUP BY patientunitstayid
),
ChartoffsetStatsAlt AS (
  SELECT
    patientunitstayid,
    MIN(chartoffset) AS alt_first_chartoffset,
    MAX(chartoffset) AS alt_last_chartoffset
  FROM `physionet-data.eicu_crd_derived.pivoted_lab`
  WHERE chartoffset >= 0 AND chartoffset <= 2880 AND alt IS NOT NULL
  GROUP BY patientunitstayid
),
ChartoffsetStatsAst AS (
  SELECT
    patientunitstayid,
    MIN(chartoffset) AS ast_first_chartoffset,
    MAX(chartoffset) AS ast_last_chartoffset
  FROM `physionet-data.eicu_crd_derived.pivoted_lab`
  WHERE chartoffset >= 0 AND chartoffset <= 2880 AND ast IS NOT NULL
  GROUP BY patientunitstayid
),
ChartoffsetStatsAlp AS (
  SELECT
    patientunitstayid,
    MIN(chartoffset) AS alp_first_chartoffset,
    MAX(chartoffset) AS alp_last_chartoffset
  FROM `physionet-data.eicu_crd_derived.pivoted_lab`
  WHERE chartoffset >= 0 AND chartoffset <= 2880 AND alp IS NOT NULL
  GROUP BY patientunitstayid
)
SELECT
  COALESCE(a.patientunitstayid, b.patientunitstayid, c.patientunitstayid, d.patientunitstayid, e.patientunitstayid, f.patientunitstayid, g.patientunitstayid, h.patientunitstayid, i.patientunitstayid, j.patientunitstayid, k.patientunitstayid, l.patientunitstayid, m.patientunitstayid,o.patientunitstayid,p.patientunitstayid,q.patientunitstayid,r.patientunitstayid,s.patientunitstayid,t.patientunitstayid) AS patientunitstayid,
  a.albumin_first_chartoffset,
  (
    SELECT ARRAY_AGG(albumin)
    FROM `physionet-data.eicu_crd_derived.pivoted_lab` p1
    WHERE p1.patientunitstayid = a.patientunitstayid AND p1.chartoffset = a.albumin_first_chartoffset
  ) [OFFSET(0)] AS albumin_first,
  a.albumin_last_chartoffset,
  (
    SELECT ARRAY_AGG(albumin)
    FROM `physionet-data.eicu_crd_derived.pivoted_lab` p2
    WHERE p2.patientunitstayid = a.patientunitstayid AND p2.chartoffset = a.albumin_last_chartoffset
  ) [OFFSET(0)] AS albumin_last,
  b.bilirubin_first_chartoffset,
  (
    SELECT ARRAY_AGG(bilirubin)
    FROM `physionet-data.eicu_crd_derived.pivoted_lab` p3
    WHERE p3.patientunitstayid = b.patientunitstayid AND p3.chartoffset = b.bilirubin_first_chartoffset
  ) [OFFSET(0)] AS bilirubin_first,
  b.bilirubin_last_chartoffset,
  (
    SELECT ARRAY_AGG(bilirubin)
    FROM `physionet-data.eicu_crd_derived.pivoted_lab` p4
    WHERE p4.patientunitstayid = b.patientunitstayid AND p4.chartoffset = b.bilirubin_last_chartoffset
  ) [OFFSET(0)] AS bilirubin_last,
  c.BUN_first_chartoffset,
  (
    SELECT ARRAY_AGG(BUN)
    FROM `physionet-data.eicu_crd_derived.pivoted_lab` p5
    WHERE p5.patientunitstayid = c.patientunitstayid AND p5.chartoffset = c.BUN_first_chartoffset
  ) [OFFSET(0)] AS BUN_first,
  c.BUN_last_chartoffset,
  (
    SELECT ARRAY_AGG(BUN)
    FROM `physionet-data.eicu_crd_derived.pivoted_lab` p6
    WHERE p6.patientunitstayid = c.patientunitstayid AND p6.chartoffset = c.BUN_last_chartoffset
  ) [OFFSET(0)] AS BUN_last,
  d.calcium_first_chartoffset,
  (
    SELECT ARRAY_AGG(calcium)
    FROM `physionet-data.eicu_crd_derived.pivoted_lab` p7
    WHERE p7.patientunitstayid = d.patientunitstayid AND p7.chartoffset = d.calcium_first_chartoffset
  ) [OFFSET(0)] AS calcium_first,
  d.calcium_last_chartoffset,
  (
    SELECT ARRAY_AGG(calcium)
    FROM `physionet-data.eicu_crd_derived.pivoted_lab` p8
    WHERE p8.patientunitstayid = d.patientunitstayid AND p8.chartoffset = d.calcium_last_chartoffset
  ) [OFFSET(0)] AS calcium_last,
  e.creatinine_first_chartoffset,
  (
     SELECT ARRAY_AGG(creatinine)
    FROM `physionet-data.eicu_crd_derived.pivoted_lab` p9
    WHERE p9.patientunitstayid = e.patientunitstayid AND p9.chartoffset = e.creatinine_first_chartoffset
  ) [OFFSET(0)] AS creatinine_first,
  e.creatinine_last_chartoffset,
  (
    SELECT ARRAY_AGG(creatinine)
    FROM `physionet-data.eicu_crd_derived.pivoted_lab` p10
    WHERE p10.patientunitstayid = e.patientunitstayid AND p10.chartoffset = e.creatinine_last_chartoffset
  ) [OFFSET(0)] AS creatinine_last,
  f.glucose_first_chartoffset,
  (
    SELECT ARRAY_AGG(glucose)
    FROM `physionet-data.eicu_crd_derived.pivoted_lab` p11
    WHERE p11.patientunitstayid = f.patientunitstayid AND p11.chartoffset = f.glucose_first_chartoffset
  ) [OFFSET(0)] AS glucose_first,
  f.glucose_last_chartoffset,
  (
    SELECT ARRAY_AGG(glucose)
    FROM `physionet-data.eicu_crd_derived.pivoted_lab` p12
    WHERE p12.patientunitstayid = f.patientunitstayid AND p12.chartoffset = f.glucose_last_chartoffset
  ) [OFFSET(0)] AS glucose_last,
  g.bicarbonate_first_chartoffset,
  (
    SELECT ARRAY_AGG(bicarbonate)
    FROM `physionet-data.eicu_crd_derived.pivoted_lab` p13
    WHERE p13.patientunitstayid = g.patientunitstayid AND p13.chartoffset = g.bicarbonate_first_chartoffset
  ) [OFFSET(0)] AS bicarbonate_first,
  g.bicarbonate_last_chartoffset,
  (
    SELECT ARRAY_AGG(bicarbonate)
    FROM `physionet-data.eicu_crd_derived.pivoted_lab` p14
    WHERE p14.patientunitstayid = g.patientunitstayid AND p14.chartoffset = g.bicarbonate_last_chartoffset
  )[OFFSET(0)] AS bicarbonate_last,
  h.TotalCO2_first_chartoffset,
  (
    SELECT ARRAY_AGG(TotalCO2)
    FROM `physionet-data.eicu_crd_derived.pivoted_lab` p15
    WHERE p15.patientunitstayid = h.patientunitstayid AND p15.chartoffset = h.TotalCO2_first_chartoffset
  )[OFFSET(0)] AS TotalCO2_first,
  h.TotalCO2_last_chartoffset,
  (
    SELECT ARRAY_AGG(TotalCO2)
    FROM `physionet-data.eicu_crd_derived.pivoted_lab` p16
    WHERE p16.patientunitstayid = h.patientunitstayid AND p16.chartoffset = h.TotalCO2_last_chartoffset
  )[OFFSET(0)] AS TotalCO2_last,
  i.hematocrit_first_chartoffset,
  (
    SELECT ARRAY_AGG(hematocrit)
    FROM `physionet-data.eicu_crd_derived.pivoted_lab` p17
    WHERE p17.patientunitstayid = i.patientunitstayid AND p17.chartoffset = i.hematocrit_first_chartoffset
  )[OFFSET(0)] AS hematocrit_first,
  i.hematocrit_last_chartoffset,
  (
    SELECT ARRAY_AGG(hematocrit)
    FROM `physionet-data.eicu_crd_derived.pivoted_lab` p18
    WHERE p18.patientunitstayid = i.patientunitstayid AND p18.chartoffset = i.hematocrit_last_chartoffset
  )[OFFSET(0)] AS hematocrit_last,
  j.hemoglobin_first_chartoffset,
  (
    SELECT ARRAY_AGG(hemoglobin)
    FROM `physionet-data.eicu_crd_derived.pivoted_lab` p19
    WHERE p19.patientunitstayid = j.patientunitstayid AND p19.chartoffset = j.hemoglobin_first_chartoffset
  )[OFFSET(0)] AS hemoglobin_first,
  j.hemoglobin_last_chartoffset,
  (
    SELECT ARRAY_AGG(hemoglobin)
    FROM `physionet-data.eicu_crd_derived.pivoted_lab` p20
    WHERE p20.patientunitstayid = j.patientunitstayid AND p20.chartoffset = j.hemoglobin_last_chartoffset
  )[OFFSET(0)] AS hemoglobin_last,
  k.INR_first_chartoffset,
  (
    SELECT ARRAY_AGG(INR)
    FROM `physionet-data.eicu_crd_derived.pivoted_lab` p21
    WHERE p21.patientunitstayid = k.patientunitstayid AND p21.chartoffset = k.INR_first_chartoffset
  )[OFFSET(0)] AS INR_first,
  k.INR_last_chartoffset,
  (
    SELECT ARRAY_AGG(INR)
    FROM `physionet-data.eicu_crd_derived.pivoted_lab` p22
    WHERE p22.patientunitstayid = k.patientunitstayid AND p22.chartoffset = k.INR_last_chartoffset    
  )[OFFSET(0)] AS INR_last,
  l.lactate_first_chartoffset,
  (
    SELECT ARRAY_AGG(lactate)
    FROM `physionet-data.eicu_crd_derived.pivoted_lab` p23
    WHERE p23.patientunitstayid = l.patientunitstayid AND p23.chartoffset = l.lactate_first_chartoffset
  )[OFFSET(0)] AS lactate_first,
  l.lactate_last_chartoffset,
  (
    SELECT ARRAY_AGG(lactate)
    FROM `physionet-data.eicu_crd_derived.pivoted_lab` p24
    WHERE p24.patientunitstayid = l.patientunitstayid AND p24.chartoffset = l.lactate_last_chartoffset
  )[OFFSET(0)] AS lactate_last,
  m.platelets_first_chartoffset,
  (
    SELECT ARRAY_AGG(platelets)
    FROM `physionet-data.eicu_crd_derived.pivoted_lab` p25
    WHERE p25.patientunitstayid = m.patientunitstayid  AND p25.chartoffset = m.platelets_first_chartoffset
  )[OFFSET(0)] AS platelets_first,
  m.platelets_last_chartoffset,
  (
    SELECT ARRAY_AGG(platelets)
    FROM `physionet-data.eicu_crd_derived.pivoted_lab` p26
    WHERE p26.patientunitstayid = m.patientunitstayid  AND p26.chartoffset = m.platelets_last_chartoffset
  )[OFFSET(0)] AS platelets_last,
  n.potassium_first_chartoffset,
  (
    SELECT ARRAY_AGG(potassium)
    FROM `physionet-data.eicu_crd_derived.pivoted_lab` p27
    WHERE p27.patientunitstayid = m.patientunitstayid  AND p27.chartoffset = n.potassium_first_chartoffset
  )[OFFSET(0)] AS potassium_first,
  n.potassium_last_chartoffset,
  (
    SELECT ARRAY_AGG(potassium)
    FROM `physionet-data.eicu_crd_derived.pivoted_lab` p28
    WHERE p28.patientunitstayid = m.patientunitstayid  AND p28.chartoffset = n.potassium_last_chartoffset
  )[OFFSET(0)] AS potassium_last,
  o.ptt_first_chartoffset,
  (
    SELECT ARRAY_AGG(ptt)
    FROM `physionet-data.eicu_crd_derived.pivoted_lab` p29
    WHERE p29.patientunitstayid = m.patientunitstayid  AND p29.chartoffset = o.ptt_first_chartoffset
  )[OFFSET(0)] AS ptt_first, 
  o.ptt_last_chartoffset,
  (
    SELECT ARRAY_AGG(ptt)
    FROM `physionet-data.eicu_crd_derived.pivoted_lab` p30
    WHERE p30.patientunitstayid = o.patientunitstayid AND p30.chartoffset = o.ptt_last_chartoffset
  )[OFFSET(0)] AS ptt_last,
  p.sodium_first_chartoffset,
  (
    SELECT ARRAY_AGG(sodium)
    FROM `physionet-data.eicu_crd_derived.pivoted_lab` p31
    WHERE p31.patientunitstayid = p.patientunitstayid AND p31.chartoffset = p.sodium_first_chartoffset
  )[OFFSET(0)] AS sodium_first,
  p.sodium_last_chartoffset,
  (
    SELECT ARRAY_AGG(sodium)
    FROM `physionet-data.eicu_crd_derived.pivoted_lab` p32
    WHERE p32.patientunitstayid = p.patientunitstayid AND p32.chartoffset = p.sodium_last_chartoffset
  )[OFFSET(0)] AS sodium_last,
  q.wbc_first_chartoffset,
  (
    SELECT ARRAY_AGG(wbc)
    FROM `physionet-data.eicu_crd_derived.pivoted_lab` p33
    WHERE p33.patientunitstayid = q.patientunitstayid AND p33.chartoffset = q.wbc_first_chartoffset
  )[OFFSET(0)] AS wbc_first,
  q.wbc_last_chartoffset,
  (
    SELECT ARRAY_AGG(wbc)
    FROM `physionet-data.eicu_crd_derived.pivoted_lab` p34
    WHERE p34.patientunitstayid = q.patientunitstayid AND p34.chartoffset = q.wbc_last_chartoffset
  )[OFFSET(0)] AS wbc_last,
  r.bands_first_chartoffset,
  (
    SELECT ARRAY_AGG(bands)
    FROM `physionet-data.eicu_crd_derived.pivoted_lab` p35
    WHERE p35.patientunitstayid = r.patientunitstayid AND p35.chartoffset = r.bands_first_chartoffset
  )[OFFSET(0)] AS bands_first,
  r.bands_last_chartoffset,
  (
    SELECT ARRAY_AGG(bands)
    FROM `physionet-data.eicu_crd_derived.pivoted_lab` p36
    WHERE p36.patientunitstayid = r.patientunitstayid AND p36.chartoffset = r.bands_last_chartoffset
  )[OFFSET(0)] AS bands_last,
  s.alt_first_chartoffset,
  (
    SELECT ARRAY_AGG(alt)
    FROM `physionet-data.eicu_crd_derived.pivoted_lab` p37
    WHERE p37.patientunitstayid = s.patientunitstayid AND p37.chartoffset = s.alt_first_chartoffset
  )[OFFSET(0)] AS alt_first,
  s.alt_last_chartoffset,
  (
    SELECT ARRAY_AGG(alt)
    FROM `physionet-data.eicu_crd_derived.pivoted_lab` p38
    WHERE p38.patientunitstayid = s.patientunitstayid AND p38.chartoffset = s.alt_last_chartoffset
  )[OFFSET(0)] AS alt_last,
  t.ast_first_chartoffset,
  (
    SELECT ARRAY_AGG(ast)
    FROM `physionet-data.eicu_crd_derived.pivoted_lab` p39
    WHERE p39.patientunitstayid = t.patientunitstayid AND p39.chartoffset = t.ast_first_chartoffset
  )[OFFSET(0)] AS ast_first,
  t.ast_last_chartoffset,
  (
    SELECT ARRAY_AGG(ast)
    FROM `physionet-data.eicu_crd_derived.pivoted_lab` p40
    WHERE p40.patientunitstayid = t.patientunitstayid AND p40.chartoffset = t.ast_last_chartoffset
  )[OFFSET(0)] AS ast_last,
  u.alp_first_chartoffset,
  (
    SELECT ARRAY_AGG(alp)
    FROM `physionet-data.eicu_crd_derived.pivoted_lab` p41
    WHERE p41.patientunitstayid = u.patientunitstayid AND p41.chartoffset = u.alp_first_chartoffset
  )[OFFSET(0)] AS alp_first,
  u.alp_first_chartoffset,
  (
    SELECT ARRAY_AGG(alp)
    FROM `physionet-data.eicu_crd_derived.pivoted_lab` p42
    WHERE p42.patientunitstayid = u.patientunitstayid AND p42.chartoffset = u.alp_last_chartoffset
  )[OFFSET(0)] AS alp_last
FROM ChartoffsetStatsAlbumin a
LEFT JOIN ChartoffsetStatsBilirubin b ON a.patientunitstayid = b.patientunitstayid
LEFT JOIN ChartoffsetStatsBUN c ON a.patientunitstayid = c.patientunitstayid
LEFT JOIN ChartoffsetStatsCalcium d ON a.patientunitstayid = d.patientunitstayid
LEFT JOIN ChartoffsetStatsCreatinine e ON a.patientunitstayid = e.patientunitstayid
LEFT JOIN ChartoffsetStatsGlucose f ON a.patientunitstayid = f.patientunitstayid
LEFT JOIN ChartoffsetStatsBicarbonate g ON a.patientunitstayid = g.patientunitstayid
LEFT JOIN ChartoffsetStatsTotalCO2 h ON a.patientunitstayid = h.patientunitstayid
LEFT JOIN ChartoffsetStatsHematocrit i ON a.patientunitstayid = i.patientunitstayid
LEFT JOIN ChartoffsetStatsHemoglobin j ON a.patientunitstayid = j.patientunitstayid
LEFT JOIN ChartoffsetStatsINR k ON a.patientunitstayid = k.patientunitstayid
LEFT JOIN ChartoffsetStatsLactate l ON a.patientunitstayid = l.patientunitstayid
LEFT JOIN ChartoffsetStatsPlatelets m ON a.patientunitstayid = m.patientunitstayid
LEFT JOIN ChartoffsetStatsPotassium n ON a.patientunitstayid = n.patientunitstayid
LEFT JOIN ChartoffsetStatsPtt o ON a.patientunitstayid = o.patientunitstayid
LEFT JOIN ChartoffsetStatsSodium p ON a.patientunitstayid = p.patientunitstayid
LEFT JOIN ChartoffsetStatsWbc q ON a.patientunitstayid = q.patientunitstayid
LEFT JOIN ChartoffsetStatsBands r ON a.patientunitstayid = r.patientunitstayid
LEFT JOIN ChartoffsetStatsAlt s ON a.patientunitstayid = s.patientunitstayid
LEFT JOIN ChartoffsetStatsAst t ON a.patientunitstayid = t.patientunitstayid
LEFT JOIN ChartoffsetStatsAlp u ON a.patientunitstayid = u.patientunitstayid
ORDER BY COALESCE(a.patientunitstayid, b.patientunitstayid, c.patientunitstayid, d.patientunitstayid,e.patientunitstayid,f.patientunitstayid, g.patientunitstayid,h.patientunitstayid, i.patientunitstayid, j.patientunitstayid, k.patientunitstayid, l.patientunitstayid, m.patientunitstayid, n.patientunitstayid,o.patientunitstayid,p.patientunitstayid,q.patientunitstayid,r.patientunitstayid,s.patientunitstayid,t.patientunitstayid, u.patientunitstayid);
