
DECLARE @Sun nvarchar( 10); SET @Sun = 'Sunday';
DECLARE @Mon nvarchar( 10); SET @Mon = 'Monday';
DECLARE @Tue nvarchar( 10); SET @Tue = 'Tuesday';
DECLARE @Wed nvarchar( 10); SET @Wed = 'Wednesday';
DECLARE @Thu nvarchar( 10); SET @Thu = 'Thursday';
DECLARE @Fri nvarchar( 10); SET @Fri = 'Friday';
DECLARE @Sat nvarchar( 10); SET @Sat = 'Saturday';

(SELECT DISTINCT TrainerID ,
               (select MIN(B .ClassDate) from tblReservation B where B.TrainerID = A.TrainerID AND datename(dw ,ClassDate) = @Sun) AS MinDate ,
               (select MAX(B .ClassDate) from tblReservation B where B.TrainerID = A.TrainerID AND datename(dw ,ClassDate) = @Sun) AS MaxDate ,
               (select MIN(B .MyStartTime) from tblReservation B where B.TrainerID = A.TrainerID AND datename(dw ,ClassDate) = @Sun) AS MinTime ,
               (select MAX(B .MyEndTime) from tblReservation B where B.TrainerID = A.TrainerID AND datename(dw ,ClassDate) = @Sun) AS MaxTime ,
               (select datename(dw ,MIN( ClassDate)) from tblReservation B where B.TrainerID = A.TrainerID AND datename(dw ,ClassDate) = @Sun) AS WeakDay
FROM tblReservation A) UNION ALL

(SELECT DISTINCT TrainerID ,
               (select MIN(B .ClassDate) from tblReservation B where B.TrainerID = A.TrainerID AND datename(dw ,ClassDate) = @Mon) AS MinDate ,
               (select MAX(B .ClassDate) from tblReservation B where B.TrainerID = A.TrainerID AND datename(dw ,ClassDate) = @Mon) AS MaxDate ,
               (select MIN(B .MyStartTime) from tblReservation B where B.TrainerID = A.TrainerID AND datename(dw ,ClassDate) = @Mon) AS MinTime ,
               (select MAX(B .MyEndTime) from tblReservation B where B.TrainerID = A.TrainerID AND datename(dw ,ClassDate) = @Mon) AS MaxTime ,
               (select datename(dw ,MIN( ClassDate)) from tblReservation B where B.TrainerID = A.TrainerID AND datename(dw ,ClassDate) = @Mon) AS WeakDay
FROM tblReservation A) UNION ALL

(SELECT DISTINCT TrainerID ,
               (select MIN(B .ClassDate) from tblReservation B where B.TrainerID = A.TrainerID AND datename(dw ,ClassDate) = @Tue) AS MinDate ,
               (select MAX(B .ClassDate) from tblReservation B where B.TrainerID = A.TrainerID AND datename(dw ,ClassDate) = @Tue) AS MaxDate ,
               (select MIN(B .MyStartTime) from tblReservation B where B.TrainerID = A.TrainerID AND datename(dw ,ClassDate) = @Tue) AS MinTime ,
               (select MAX(B .MyEndTime) from tblReservation B where B.TrainerID = A.TrainerID AND datename(dw ,ClassDate) = @Tue) AS MaxTime ,
               (select datename(dw ,MIN( ClassDate)) from tblReservation B where B.TrainerID = A.TrainerID AND datename(dw ,ClassDate) = @Tue) AS WeakDay
FROM tblReservation A) UNION ALL

(SELECT DISTINCT TrainerID ,
               (select MIN(B .ClassDate) from tblReservation B where B.TrainerID = A.TrainerID AND datename(dw ,ClassDate) = @Wed) AS MinDate ,
               (select MAX(B .ClassDate) from tblReservation B where B.TrainerID = A.TrainerID AND datename(dw ,ClassDate) = @Wed) AS MaxDate ,
               (select MIN(B .MyStartTime) from tblReservation B where B.TrainerID = A.TrainerID AND datename(dw ,ClassDate) = @Wed) AS MinTime ,
               (select MAX(B .MyEndTime) from tblReservation B where B.TrainerID = A.TrainerID AND datename(dw ,ClassDate) = @Wed) AS MaxTime ,
               (select datename(dw ,MIN( ClassDate)) from tblReservation B where B.TrainerID = A.TrainerID AND datename(dw ,ClassDate) = @Wed) AS WeakDay
FROM tblReservation A) UNION ALL

(SELECT DISTINCT TrainerID ,
               (select MIN(B .ClassDate) from tblReservation B where B.TrainerID = A.TrainerID AND datename(dw ,ClassDate) = @Thu) AS MinDate ,
               (select MAX(B .ClassDate) from tblReservation B where B.TrainerID = A.TrainerID AND datename(dw ,ClassDate) = @Thu) AS MaxDate ,
               (select MIN(B .MyStartTime) from tblReservation B where B.TrainerID = A.TrainerID AND datename(dw ,ClassDate) = @Thu) AS MinTime ,
               (select MAX(B .MyEndTime) from tblReservation B where B.TrainerID = A.TrainerID AND datename(dw ,ClassDate) = @Thu) AS MaxTime ,
               (select datename(dw ,MIN( ClassDate)) from tblReservation B where B.TrainerID = A.TrainerID AND datename(dw ,ClassDate) = @Thu) AS WeakDay
FROM tblReservation A) UNION ALL

(SELECT DISTINCT TrainerID ,
               (select MIN(B .ClassDate) from tblReservation B where B.TrainerID = A.TrainerID AND datename(dw ,ClassDate) = @Fri) AS MinDate ,
               (select MAX(B .ClassDate) from tblReservation B where B.TrainerID = A.TrainerID AND datename(dw ,ClassDate) = @Fri) AS MaxDate ,
               (select MIN(B .MyStartTime) from tblReservation B where B.TrainerID = A.TrainerID AND datename(dw ,ClassDate) = @Fri) AS MinTime ,
               (select MAX(B .MyEndTime) from tblReservation B where B.TrainerID = A.TrainerID AND datename(dw ,ClassDate) = @Fri) AS MaxTime ,
               (select datename(dw ,MIN( ClassDate)) from tblReservation B where B.TrainerID = A.TrainerID AND datename(dw ,ClassDate) = @Fri) AS WeakDay
FROM tblReservation A) UNION ALL

(SELECT DISTINCT TrainerID ,
               (select MIN(B .ClassDate) from tblReservation B where B.TrainerID = A.TrainerID AND datename(dw ,ClassDate) = @Sat) AS MinDate ,
               (select MAX(B .ClassDate) from tblReservation B where B.TrainerID = A.TrainerID AND datename(dw ,ClassDate) = @Sat) AS MaxDate ,
               (select MIN(B .MyStartTime) from tblReservation B where B.TrainerID = A.TrainerID AND datename(dw ,ClassDate) = @Sat) AS MinTime ,
               (select MAX(B .MyEndTime) from tblReservation B where B.TrainerID = A.TrainerID AND datename(dw ,ClassDate) = @Sat) AS MaxTime ,
               (select datename(dw ,MIN( ClassDate)) from tblReservation B where B.TrainerID = A.TrainerID AND datename(dw ,ClassDate) = @Sat) AS WeakDay
FROM tblReservation A)

Order By TrainerID
  








