/*###############################################*/
Declare @loopStop Int = (Select Max(count) From VisitLog_Import);
Declare @x Int = 0;
Declare @ClassDate DateTime = '2000-01-01';
Declare @MyStartTime DateTime = '12:00:00';
Declare @MyEndTime DateTime = '13:00:00';
Declare @TrainerID Int = 1;
Declare @TypeTaken nVarChar(100) = 'Visit';
Declare @VisitType Int = 32;
Declare @TypeGroup Int = 5;


While @x < @loopStop 
	Begin 	
			Print '### Pass ' + Cast((@x + 1) as nvarchar) + ' ###';
				
			INSERT INTO [BAK_VisitData] ( ClientID, ClassDate, ClassTime, MyStartTime, MyEndTime, TypeTaken, TrainerID, SignedIN, Studio, Location, Missed, Cancelled, [Value], CurrSeries, Lock, Closed, ClosedRevenue, Webscheduler, Pending, NumDeducted, EnrolledVisit, EmailReminderSent )
				
			SELECT 
					  VisitLog_Import.ClientID
					, @ClassDate, @MyStartTime, @MyStartTime, @MyEndTime
					, @TypeTaken, @TrainerID
					, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0
			
			FROM [VisitLog_Import]
			WHERE (VisitLog_Import.Count) > @x

		Set @x = @x + 1;
	End
/*###############################################*/