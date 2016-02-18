SELECT        TOP (100) PERCENT fn_getActiveIndividuals_1.CoA, fn_getActiveIndividuals_1.CoO, COUNT(DISTINCT fn_getActiveIndividuals_1.IndividualID) AS Persons, 
                         fn_getActiveIndividuals_1.Sex, proGres.dbo.codeAgeCohortText.AgeCohortText
FROM            dbo.fn_getActiveIndividuals('31/12/2015') AS fn_getActiveIndividuals_1 INNER JOIN
                         dbo.T_SPneedswithdetails ON fn_getActiveIndividuals_1.IndividualGUID = dbo.T_SPneedswithdetails.IndividualGUID INNER JOIN
                         proGres.dbo.codeAgeCohortText ON fn_getActiveIndividuals_1.AgeGroup = proGres.dbo.codeAgeCohortText.AgeCohortCode
WHERE        (dbo.T_SPneedswithdetails.VulnerabilityActive = 1) AND (proGres.dbo.codeAgeCohortText.AgeCohortLanguageCode = N'eng') AND 
                         (fn_getActiveIndividuals_1.IndividualAge <= 18) AND (dbo.T_SPneedswithdetails.SPNeeds IN (N'SC-UC', N'CR-AF', N'CR-CC', N'CR-CL', N'CR-CS', N'CR-LO', 
                         N'CR-LW', N'LP-AF', N'LP-AN', N'LP-DA', N'LP-DO', N'LP-ND', N'LP-RR', N'SC-SC', N'SC-UC', N'SM-MI', N'SV-VA', N'SV-VF', N'SV-VO', N'TR-PI', N'SC-UM', N'LP-DN', 
                         N'LP-TR', N'DS-BD', N'DS-DF', N'DS-MM', N'DS-MS', N'DS-PM', N'DS-PS', N'DS-SD', N'SM-AD', N'SM-CC', N'SM-CI', N'SM-DP', N'SM-MI', N'SM-MN', N'SM-OT'))
GROUP BY fn_getActiveIndividuals_1.CoO, fn_getActiveIndividuals_1.CoA, fn_getActiveIndividuals_1.Sex, proGres.dbo.codeAgeCohortText.AgeCohortText