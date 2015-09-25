# rate-calculator

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
- Amount can be requested in less/more than £100 increments.
