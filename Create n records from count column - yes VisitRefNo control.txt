/*###############################################*/
Declare @loopStop Int = (Select Max(count) From VisitLog_Import);
Declare @x Int = 0;
Declare @VisitRefNo Int = 1000;
Declare @ClassDate DateTime = '2000-01-01';
Declare @MyStartTime DateTime = '12:00:00';
Declare @MyEndTime DateTime = '13:00:00';
Declare @TrainerID Int = 1;
Declare @TypeTaken nVarChar(100) = 'Visit';
Declare @VisitType Int = 32;
Declare @TypeGroup Int = 5;

Set IDENTITY_INSERT [BAK_VisitData] ON

While @x < @loopStop 
	Begin 	
			Print '### Pass ' + Cast((@x + 1) as nvarchar) + ' ###';
				
			INSERT INTO [BAK_VisitData] ( VisitRefNo, ClientID, ClassDate, ClassTime, MyStartTime, MyEndTime, TypeTaken, TrainerID, SignedIN, Studio, Location, Missed, Cancelled, [Value], CurrSeries, Lock, Closed, ClosedRevenue, Webscheduler, Pending, NumDeducted, EnrolledVisit, EmailReminderSent )
				
			SELECT 
					(Row_Number() OVER (Order By Count)) + @VisitRefNo
					, VisitLog_Import.ClientID
					, @ClassDate, @MyStartTime, @MyStartTime, @MyEndTime
					, @TypeTaken, @TrainerID
					, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0
			
			FROM [VisitLog_Import]
			WHERE (VisitLog_Import.Count) > @x

		Set @x = @x + 1;
		Set @VisitRefNo = @VisitRefNo + 1;
	End
Set IDENTITY_INSERT [BAK_VisitData] OFF
/*###############################################*/