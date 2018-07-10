/* proc print */

proc print data=kostat.cars1(obs=30); 
run;

/* proc means */

/*방법1*/
PROC MEANS DATA=sashelp.cars;
	VAR MPG_City;
	CLASS Origin;
	OUTPUT OUT=kostat.output_cars; /* OUTPUT OUT = 새데이터명 */
RUN;

DATA kostat.mean_MPG_City;
	SET kostat.output_cars(WHERE=(_STAT_="MEAN"));
RUN;

/*방법2*/
PROC MEANS DATA=sashelp.cars;
	VAR MPG_City;
	CLASS Origin;
	OUTPUT OUT=kostat.mean_cars MEAN=avg MEDIAN=med STD=sd;  /* OUTPUT OUT = 새데이터명 MEAN = 새데이터셋에서의 새변수명 */
RUN;

/* proc univariate */

PROC UNIVARIATE DATA = sashelp.class;
	VAR height;
	HISTOGRAM height /NORMAL;
RUN;


/* glm */ 

proc glm data=hw5_1;
	model p08bb002=sex /solution;
run;
