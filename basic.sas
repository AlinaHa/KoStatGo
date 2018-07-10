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
<<<<<<< HEAD

/* proc tabulate */

  ods trace on;

 proc tabulate data=sashelp.cars;
 	class origin;
	var mpg_city;
	table origin, mpg_city * (mean std);
	ods output table = work.new;
run;

/* keep */

data q2;
set q;
keep sex p08aa017-p08aa023 p08bb002 p08ed001;
run;

/* sort */

proc sort data=policy;
by id;
run;

/* merge */

data kostat.m_cars;
	merge kostat.cars1 kostat.cars2;	
	by make model;
run;

/* set */

data kostat.s_cars;
	set kostat.cars3 kostat.cars4;
run;
=======
>>>>>>> parent of 35fca54... basic
