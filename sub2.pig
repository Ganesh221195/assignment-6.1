dat2 = load '/dailydet.txt' using PigStorage(',') AS (year:chararray,occupation:chararray,date:chararray,grop:chararray,guestlist:chararray);
	
de1 = foreach dat2 generate occupation,grop;
	 
de2 = group de1 by grop;
	
de3 = foreach de2 generate group,COUNT(de1) as c;
	
de4 = order de3 by c DESC;
	
dump de4;
