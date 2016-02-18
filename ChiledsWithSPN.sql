SELECT         fn_getActiveIndividuals_1.CoA, fn_getActiveIndividuals_1.CoO, 
                         (CASE WHEN proGres.dbo.codeVulnerabilityDetailsText.VulnerabilityDetailsText = '-' THEN 'N/A' ELSE proGres.dbo.codeVulnerabilityDetailsText.VulnerabilityDetailsText
                          END) AS VulnerabilityDetailsText, COUNT(fn_getActiveIndividuals_1.IndividualID) AS Persons, fn_getActiveIndividuals_1.Sex, 
                         dbo.T_CodeVulnerability.VulnerabilityText, (CASE WHEN dbo.T_SPneedswithdetails.SPNeeds IN ('SC-UC', 'CR-AF', 'CR-CC', 'CR-CL', 'CR-CS', 'CR-LO', 'CR-LW', 
                         'LP-AF', 'LP-AN', 'LP-DA', 'LP-DO', 'LP-ND', 'LP-RR', 'SC-SC', 'SC-UC', 'SM-MI', 'SV-VA', 'SV-VF', 'SV-VO', 'TR-PI', 'SC-UM', 'LP-DN', 'LP-TR',
						 'DS-BD',
'DS-DF',
'DS-MM',
'DS-MS',
'DS-PM',
'DS-PS',
'DS-SD',
'SM-AD',
'SM-CC',
'SM-CI',
'SM-DP',
'SM-MI',
'SM-MN',
'SM-OT'

						 ) 
                         THEN 'Major' ELSE 'Mainor' END) AS Category, proGres.dbo.codeAgeCohortText.AgeCohortText
FROM            dbo.fn_getActiveIndividuals('31/12/2015') AS fn_getActiveIndividuals_1 INNER JOIN
                         dbo.T_SPneedswithdetails ON fn_getActiveIndividuals_1.IndividualGUID = dbo.T_SPneedswithdetails.IndividualGUID INNER JOIN
                         dbo.T_CodeVulnerability ON dbo.T_SPneedswithdetails.VulnerabilityCode = dbo.T_CodeVulnerability.VulnerabilityCode INNER JOIN
                         proGres.dbo.codeVulnerabilityDetailsText ON dbo.T_SPneedswithdetails.SPNeeds = proGres.dbo.codeVulnerabilityDetailsText.VulnerabilityDetailsCode INNER JOIN
                         proGres.dbo.codeAgeCohortText ON fn_getActiveIndividuals_1.AgeGroup = proGres.dbo.codeAgeCohortText.AgeCohortCode
WHERE        (fn_getActiveIndividuals_1.IndividualAge <= 18) AND (dbo.T_SPneedswithdetails.VulnerabilityActive = 1) AND 
                         (proGres.dbo.codeVulnerabilityDetailsText.VulnerabilityDetailsLanguageCode = N'eng') AND (proGres.dbo.codeAgeCohortText.AgeCohortLanguageCode = N'eng')
GROUP BY fn_getActiveIndividuals_1.CoO, fn_getActiveIndividuals_1.CoA, fn_getActiveIndividuals_1.Sex, dbo.T_CodeVulnerability.VulnerabilityText, 
                         proGres.dbo.codeVulnerabilityDetailsText.VulnerabilityDetailsText, dbo.T_SPneedswithdetails.SPNeeds, proGres.dbo.codeAgeCohortText.AgeCohortText
ORDER BY dbo.T_SPneedswithdetails.SPNeeds
