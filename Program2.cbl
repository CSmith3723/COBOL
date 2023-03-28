       identification division.
       program-id. Program16subroutine as 'INFLATION'.

       environment division.
       configuration section.

       data division.
       LINKAGE section.

       01 DATA-CALC.
         05 NEW-COST       Pic 999v99.
         05 YEAR-IN        Pic 99.
         05 INFLATE        Pic 99.
         

       procedure division using DATA-CALC.

       100-MAIN-MODULE.

           IF YEAR-IN <= 5
               compute NEW-COST rounded
                 = NEW-COST * 1.05
               move 5 to INFLATE
           ELSE
               compute NEW-COST rounded
                 = NEW-COST * 1.10
               move 10 to INFLATE
           END-IF

       EXIT program.
