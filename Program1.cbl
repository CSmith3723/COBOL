       identification division.
       program-id. Problem2 as "CSmithCh2pgm2".
       author. Chris Smith

      ********************************************
      * Chapter 2 Program 2
      ********************************************

       environment division.
       input-output section.
       file-control.
           select trans-file
               assign to 'C:\Data Files\Ch2_trans.dat'
               organization is line sequential.
           select sales-file
               assign to 'C:\Data Files\Ch2_SALES.rpt'
               organization is line sequential.

       data division.
       file section.
       FD trans-file.
       01 trans-rec.
         05 name-in Pic X(20).
         05 unit-price-in Pic 9(3)V99.
         05 qty-sold-in Pic 999.

       FD sales-file.
       01 sales-rec.
         05 name-out Pic x(20).
         05 filler Pic x(5).
         05 unit-price-out Pic 9(3)V99.
         05 filler Pic x(5).
         05 qty-sold-out Pic 999.
         05 filler Pic x(5).
         05 total-price-out Pic 9(6)V99.

       working-storage section.
       01 are-there-more-records Pic x(3) value 'yes'.

       procedure division.
       100-main-module.
           open input trans-file
             output sales-file.
           perform until are-there-more-records = 'no'
               read trans-file
                   at end
                       move 'no' to are-there-more-records
                   not at end
                       perform 200-calc-rtn
               end-read
           end-perform
           close trans-file
             sales-file
           stop run.

       200-calc-rtn.
           move name-in to name-out
           move unit-price-in to unit-price-out
           move qty-sold-in to qty-sold-out
           multiply unit-price-out by qty-sold-out giving 
           total-price-out
           write sales-rec.

       end program Problem2.
