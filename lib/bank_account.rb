class BankAccount
  def initialize(io, statement_class, date_checker)
    @io = io
    @statement = statement_class.new 
    @balance = 0
    @date_checker = date_checker.new
  end

  def deposit(amount, date) 
    fail 'Invalid Date: must be later than your most recent transaction' unless @date_checker.is_most_recent_date?(date)
    fail 'Invalid Date' unless @date_checker.is_valid_date?(date)
    @balance += amount
    @statement.add_deposit(amount, date, @balance)
  end

  def withdraw(amount, date) 
    @balance -= amount
    @statement.add_withdrawal(amount, date, @balance)
  end

  def show_statement
    @io.puts(@statement.display_statement)
  end

 
end
