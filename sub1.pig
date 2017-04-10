
dat = load '/dailydet.txt' using PigStorage(',') as(year:chararray,occupation:chararray,date:chararray,group:chararray,guestlist:chararray);
r1 = foreach dat generate occupation,date;
r2 = foreach r1 generate occupation,ToDate(date,'mm/dd/yy') as date;
r3 = filter r2 by ((date>ToDate('1/11/99','mm/dd/yy')) and (date<ToDate('6/11/99','mm/dd/yy')));
r4 = group r3 by occupation;
r5 = foreach r4 generate group,COUNT(r3) as c;
r6 = order r5 by c DESC;
r7 = limit r6 5;
dump r7;
