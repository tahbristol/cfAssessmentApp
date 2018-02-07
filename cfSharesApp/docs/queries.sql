--- Counts  for a range for specific service ---

select count(*) AS 'Total Shares', ServiceName AS 'Platform' from testsharedata..shares where shareTime between '2018-01-10' and '2018-01-16' group by ServiceName;
---- Returns the day difference between two dates ---
select DATEDIFF(day,<cfqueryparam value="#fromDate#"/>,<cfqueryparam value="#toDate#"/>) AS 'Days' from FROM dbo.shares WHERE ShareTime BETWEEN <cfqueryparam value="#fromDate#"/>
	AND <cfqueryparam value="#toDate#"/> AND ServiceName = <cfqueryparam value="#services[i]#"/> GROUP BY ServiceName, ShareTime
