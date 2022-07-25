# Bank tech test - my work

## User Stories

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

  def show_statement()
    # displays 
  end

end 
```
## Diagram

![](images/BankAccountDesign.png?raw=true)

## Examples

### 1 - before any deposits or withdrawals
```
statement = Statement.new()
account = BankAccount.new(statement)
account.show_statement => date || credit || debit || balance
```
### 2 - deposits
```
statement = Statement.new()
account = BankAccount.new(statement)
account.deposit(100, 14/01/2023)
account.show_statement => 
```
```
date || credit || debit || balance
14/01/2023 || || 100.00 || 100.00
```

### 3 - deposits and withdrawals
```
statement = Statement.new()
account = BankAccount.new(statement)
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
statement = Statement.new()
account = BankAccount.new(statement)
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
statement = Statement.new()
account = BankAccount.new(statement)
account.withdraw(50, 20/03/2023) => throws an error
```
# Bank tech test - the challenge 

Today, you'll practice doing a tech test.

For most tech tests, you'll essentially have unlimited time.  This practice session is about producing the best code you can when there is a minimal time pressure.

You'll get to practice your OO design and TDD skills.

You'll work alone, and you'll also review your own code so you can practice reflecting on and improving your own work.

## Specification

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
