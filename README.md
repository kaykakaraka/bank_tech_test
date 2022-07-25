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
So that I know how much I have saved
I would like to see my bank balance

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

class Statement
  def initialize
    # 
  end

  def record(details)
    # adds the details of the deposit or withdrawal to the statement
  end

  def format
    # formats the statement into columns
  end

end

## Diagram

![](images/BankAccountDesign.png?raw=true)

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
