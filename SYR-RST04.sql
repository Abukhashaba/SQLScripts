SELECT        dbo.T_AllIndividuals.CoA, dbo.T_CodeEventReasonText.EventReasonText, COUNT(dbo.T_AllIndividuals.IndividualID) AS Indv
FROM            dbo.T_AllIndividuals INNER JOIN
                         dbo.T_Events ON dbo.T_AllIndividuals.IndividualGUID = dbo.T_Events.IndividualGUID INNER JOIN
                         dbo.T_CodeEventReasonText ON dbo.T_Events.ResultReasonCode = dbo.T_CodeEventReasonText.EventReasonCode
WHERE        (dbo.T_Events.ResultID = N'rst04') AND (dbo.T_AllIndividuals.CoO = N'syr') AND (dbo.T_CodeEventReasonText.EventReasonLanguageCode = N'eng') AND 
                         (dbo.T_Events.EventLogstatus <> N'x')
GROUP BY dbo.T_AllIndividuals.CoA, dbo.T_CodeEventReasonText.EventReasonText