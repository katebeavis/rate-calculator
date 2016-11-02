# rate-calculator

A command line rate calculation system allowing prospective borrowers to obtain a quote from a pool of lenders for 36 month loans.



A CSV file provides the offers available from lenders (rates and amount available to lend), and the rate calculator provides as low a rate to the borrower as is possible from those. It also provides the borrower with the details of the monthly repayment amount and the total repayment amount.

Borrowers are able to request a loan of any £100 increment between £1000 and £15000 and if the market does not have sufficient offers from lenders to satisfy the loan, the system informs the borrower that it is not possible to provide a quote at this time.

###To Run
```
$ git clone https://github.com/katebeavis/rate-calculator.git
$ cd rate-calculator
$ bundle install
$ ruby lib/controller.rb market.csv 1000
```
Or change 1000 to whatever amount you want to borrow

###To Run Tests

Comment out lines 10 and lines 102 (Rspec won't run with the csv file required)

```
$ rspec
```

Points for improvement
- Doesn't calculate quotes from multiple lenders - will only find the lowest rate and provide a quote based on that lender. For that reason, if you enter a value more than the amount being offered by the lender with the lowest interest rate, you will only be offered the maximum amount that they are offering.
- Need to reduce dependencies.
