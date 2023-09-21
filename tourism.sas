proc print data= tourism;
run;

DATA tourism_new;
   SET tourism;
   DROP VAR9; /* Replace 'column_name' with the name of the column you want to delete */
RUN;

PROC PRINT data=tourism_new;
RUN;

/* ANOVA (Analysis of Variance):
   - If you have more than two groups (e.g., Q1, Q2, Q3, and Q4), you can use one-way ANOVA to compare the means of spend per visit among the different quarters.
   - The null hypothesis (H0) is that there is no significant difference in the average spend per visit among the quarters.
   - The alternative hypothesis (Ha) is that there is a significant difference in the average spend per visit among the quarters.
   - If the ANOVA result indicates a significant difference, you can perform post-hoc tests (e.g., Tukey's HSD) to identify which quarters have significantly different average spend per visit.
  */
 
 /* Turn off unnecessary SAS output */
/* Turn off unnecessary SAS output */
OPTIONS NONOTES NOSTIMER NOSOURCE NOSYNTAXCHECK;


/* Perform one-way ANOVA */
PROC GLM DATA=tourism_new;
   CLASS Year;
   MODEL Visits = Year;
   MEANS Year / TUKEY;
RUN;
/* Turn off unnecessary SAS output */
OPTIONS NONOTES NOSTIMER NOSOURCE NOSYNTAXCHECK;

/* Regression */


/* Perform multiple regression */
PROC REG DATA=tourism_new;
   MODEL Visits = Spending Nights;
RUN;

/* Calculate the correlation matrix */
proc corr data=tourism_new out=CorrMatrix;
run;

/* Print the correlation matrix */
proc print data=CorrMatrix;
run;