# Bank tech test - my work

This is a bank program that runs in REPL, following the specification shown below. 
You can:
 * deposit money, giving an amount in decimals or integers, and a date,
 * withdraw money, giving an amount in decimals or integers, and a date,
 * print your bank statement and see a history of your transactions, including dates.

 It has the following, purposeful, limitations:
 * date should be entered as a string in the format '24/04/1993'. If the month / day / year are not entered in that format, it will throw an error
 * amount can be an integer or have pennies
 * amounts with more than 2 decimal places are rounded to 2 decimal places
 * you can only withdraw the amount of money you have in the account
 * you can only enter transactions in chronological order. For example, if you deposit money on 24/05/2021, and then try to deposit money on 23/05/2021, it will throw an error

 If I had more time, I would:
 * raise errors for more incorrect inputs e.g. type errors
 * allow a variety of date formats


### Setting up this repo on your computer

* Clone the repo using `git clone`
* run `bundle install`
* Run `rpsec` for tests and coverage
* Run `ruby example.rb` for an example of usage
* Run `rubocop` for linting
* Enter the REPL using `irb` and require the files to experiment with using the code.

# Specification

### Requirements

* You should be able to interact with your code via a REPL like IRB or Node.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2023  
**And** a deposit of 2000 on 13-01-2023  
**And** a withdrawal of 500 on 14-01-2023  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2023 || || 500.00 || 2500.00
13/01/2023 || 2000.00 || || 3000.00
10/01/2023 || 1000.00 || || 1000.00
```

## My Process

I began by writing user stories, designing the outline of the classes and diagraming the classes as shown below. I originally thought I would need a Statement class and an Account class, but came to realise I also needed a DateChecker class to handle the complexity of asserting the validity of date, and in order to maintain a seperation of concerns.

The Statement class and the BankAccount class I separated as I felt that statements hold state that are separate from the actual interacting of depositing and withdrawing money. This separation should also mean that it would be easier to add more functionality - for example, if the BankAccount class were to add options to display a balance or add an interest rate.

I chose to have the BankAccount class initaliaze the DateChecker and the Statement. This is because they are not used outside of the class.

### User Stories

```
As a customer
So that I can store my money safely
I would like to open a bank account

As a customer
So that I can save money
I would like to deposit money

As a customer
So that I can spend the money I have saved
I would like to withdraw money

As a customer
So I can keep track of my finances
I would like to see what I have deposited 

As a customer
So that I can see what I have already spent
I would like to see what I have withdrawn

As a customer 
So I can see how quickly I am saving
I would like to see the date of my deposit

As a customer
So I can see how often I am dipping into savings
I would like to see the date of my withdrawal

As a customer
So that my statement is easy to read
I would like it to be formatted in columns
```

### Design

```
class BankAccount
  def initialize(statement) 
    # start with an empty account
    # pass in the statement class
  end

  def deposit(amount, date)
    # add the amount into the account
  end

  def withdraw(amount, date)
    # withdraw an amount from the account 
  end

  def print_statement()
    # displays 
  end

end 

class Statement
  def initialize
    # create an empty statement
  end

  def add_deposit(amount, date, balance)
    # log the deposit in the statement
  end

  def add_withdrawal(amount, date, balance)
    # log the withdrawal in the statement
  end

  def statement
    # return the formatted statement
  end

  private 

  def format_statement
    # add header and any formatting
  end
end

class DateChecker
  def check_date(date) # date is a string
    # calls the other methods, checks if date is valid
  end

  private 

  def valid_date?(date)
    # 
  end

  def most_recent_date?
    # determines if the date is the most recent date (which it should be)
  end

  def separate(date)
    # splits up into month / year / day
  end
end

```
## Diagram

![](images/BankAccountDesign.png?raw=true)

## Examples

### 1 - before any deposits or withdrawals
```
account = BankAccount.new(Kernel, Statement, DateChecker)
account.show_statement => date || credit || debit || balance
```
### 2 - deposits
```
account = BankAccount.new(Kernel, Statement, DateChecker)
account.deposit(100, 14/01/2023)
account.show_statement => 
```
```
date || credit || debit || balance
14/01/2023 || || 100.00 || 100.00
```

### 3 - deposits and withdrawals
```
account = BankAccount.new(Kernel, Statement, DateChecker)
account.deposit(100, 14/01/2023)
account.withdraw(50, 16/01/2023)
account.deposit(550, 20/02/2023)
account.show_statement => 
```
```
date || credit || debit || balance
20/02/2023 || || 550.00 || 600.00
16/01/2021 || 50.00 || || 50.00
14/01/2023 || || 100.00 || 100.00
```

### 4 - works with decimals
```
account = BankAccount.new(Kernel, Statement, DateChecker)
account.deposit(100.00, 14/01/2023)
account.withdraw(50.50, 16/01/2023)
account.deposit(550.75, 20/02/2023)
account.show_statement => 
```
```
date || credit || debit || balance
20/02/2023 || || 550.75 || 600.25
16/01/2021 || 50.50 || || 49.50
14/01/2023 || || 100.00 || 100.00
```

### 5 - trying to withdraw more than they have
```
account = BankAccount.new(Kernel, Statement, DateChecker)
account.withdraw(50, 20/03/2023) => throws an error
```
