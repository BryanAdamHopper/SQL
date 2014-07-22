--################################################################################
--# Book clients into rooms based on their booked appointment.
--# Only if the room reservation does not already exist.
--################################################################################
--# Today's Date: 04282014
--# Room: BioSignature 1
--# Appointment Name: LIKE '%Bio%'
--################################################################################
SELECT * INTO BAK_tblResourceSchedules04282014 from [tblResourceSchedules]
GO
SET IDENTITY_INSERT [tblResourceSchedules] ON
GO
INSERT INTO [tblResourceSchedules]
          (ResourceScheduleID, ResourceID, RefScheduleType, RefScheduleID, DisplayName
                , StartTime , EndTime , StartDate , EndDate
                , DaySunday , DayMonday , DayTuesday , DayWednesday , DayThursday , DayFriday, DaySaturday, WholeDay
                , RefClass , RefAppt , RefVisit , RefClient )

SELECT    
        (ROW_NUMBER() OVER ( ORDER BY ClassDate, ClassTime) + (select MAX(ResourceScheduleID ) from [tblResourceSchedules])) --AS ResourceScheduleID
        ,(select ResourceID from tblResources where ResourceName = 'BioSignature 1') --AS ResourceID
        , ( 'appt') --AS RefScheduleType --(no change)
        , (NULL) --AS RefScheduleID
        , ( 'Client Appointment') --AS DisplayName --(no change)
        , ( MyStartTime) --AS StartTime
        , ( MyEndTime) --AS EndTime
        , ( ClassDate) --AS StartDate
        , ( ClassDate) --AS EndDate
        , ( CASE When DateName( dw,ClassDate ) = 'Sunday' THEN 1 ELSE 0 END) --AS DaySunday
        , ( CASE When DateName( dw,ClassDate ) = 'Monday' THEN 1 ELSE 0 END) --AS DayMonday
        , ( CASE When DateName( dw,ClassDate ) = 'Tuesday' THEN 1 ELSE 0 END) --AS DayTuesday
        , ( CASE When DateName( dw,ClassDate ) = 'Wednesday' THEN 1 ELSE 0 END) --AS DayWednesday
        , ( CASE When DateName( dw,ClassDate ) = 'Thursday' THEN 1 ELSE 0 END) --AS DayThursday
        , ( CASE When DateName( dw,ClassDate ) = 'Friday' THEN 1 ELSE 0 END) --AS DayFriday
        , ( CASE When DateName( dw,ClassDate ) = 'Saturday' THEN 1 ELSE 0 END) --AS DaySaturday
        , ( 0) --AS WholeDay
        , (NULL) --AS RefClass
        , ( VisitRefNo) --AS RefAppt
        , (NULL) --AS RefVisit
        , (NULL) --AS RefClient

FROM [tblReservation]
WHERE (VisitRefNo NOT IN(select RefAppt from [tblResourceSchedules])) AND (TypeTaken LIKE '%Bio%' ) AND (ClassDate > GetDate())
GO
SET IDENTITY_INSERT [tblResourceSchedules] OFF
GO
--################################################################################


