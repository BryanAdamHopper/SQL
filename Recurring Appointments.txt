
/*#############################################################################################
  # Setup recurring appointments from existing appointments without creating new appointments.
  #
  # This will link appointments that have simular values into a group.
  #############################################################################################*/

Print '### 01 - Generate list of keys. ###'
	SELECT	               (
				CAST(ClientID AS varchar) 
				+ CAST(TrainerID AS varchar) 
				+ CAST(VisitType AS varchar) 
				+ CAST(TypeGroup AS varchar) 
				+ CAST(SUBSTRING(CONVERT(varchar,myStartTime,8),1,2) 
				+ SUBSTRING(CONVERT(varchar,myEndTime,8),4,2) AS varchar)
			     -- + CAST(DATEPART(dw, ClassDate) AS varchar)	/*# Uncomment to include day of week in the filter. #*/
				) AS OLDApptGroupID
	INTO _ApGoID0
	FROM tblReservation --WHERE (****Criteria****)
	go



Print '### 02 - Filter out duplicates, get duplicate count. ###'
	SELECT DISTINCT OLDApptGroupID, COUNT(OLDApptGroupID) OVER (PARTITION BY OLDApptGroupID) AS Occurances
	INTO _ApGoID1
	FROM _ApGoID0
	go



Print '### 03 - Add row number to prep to become ApptGroupID. ###'
	SELECT OLDApptGroupID, ROW_NUMBER() OVER(ORDER BY OLDApptGroupID DESC) AS NEWApptGroupID
	INTO _ApGoID2 
	FROM _ApGoID1
	WHERE Occurances > 1
	go



Print '### 04 - Get Max ApptGroupID and add it to NEWApptGroupID. ###'
	UPDATE _ApGoID2
	SET 
		NEWApptGroupID = (NEWApptGroupID) + (CASE WHEN (select MAX(ApptGroupID) from tblReservation) IS NULL THEN 0 ELSE (select MAX(ApptGroupID) from tblReservation) END)
	go



Print '### 05 - Backup tblReservation. ###'
	SELECT * INTO BAK_tblReservation04162014 from tblReservation



Print '### 06 - Update appointments with appropriate recurring information. ###'
	UPDATE tblReservation
	SET
		Recurring = 1,
		ApptGroupID = [_ApGoID2].[NEWApptGroupID]
	FROM [_ApGoID2]
	INNER JOIN tblReservation ON [_ApGoID2].[OLDApptGroupID] = 
		  CAST(tblReservation.ClientID AS varchar) 
		+ CAST(tblReservation.TrainerID AS varchar) 
		+ CAST(tblReservation.VisitType AS varchar)
		+ CAST(tblReservation.TypeGroup AS varchar)
		+ CAST(SUBSTRING(CONVERT(varchar,tblReservation.myStartTime,8),1,2) 
		+ SUBSTRING(CONVERT(varchar,tblReservation.myEndTime,8),4,2) AS varchar)
     	     -- + CAST(DATEPART(dw, tblReservation.ClassDate) AS varchar)	/*Uncomment to include day of week in the filter.*/
	go



Print '### 07 - Drop temp tables. ###'
	drop table [_ApGoID0]
	go
	drop table [_ApGoID1]
	go
	drop table [_ApGoID2]
	go




/*#########################################
  # Restore from reservation backup table ######################################################
  #########################################

  Print '### 00 - Restore tblReservation from backup. ###'
  	UPDATE tblReservation 
  	SET 
		Recurring = BAK_tblReservation04162014.Recurring, 
		ApptGroupID = BAK_tblReservation04162014.ApptGroupID
  	FROM BAK_tblReservation04162014
  	INNERJOIN tblReservation ON BAK_tblReservation04162014.VisitRefNo = tblReservation.VisitRefNo

  #############################################################################################*/



