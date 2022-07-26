class BankAccount
  def initialize(io, statement_class, date_checker)
    @io = io
    @statement = statement_class.new 
    @balance = 0
    @date_checker = date_checker.new
  end

  def deposit(amount, date) 
    @date_checker.check_date(date)
    @balance += amount
    @statement.add_deposit(amount, date, @balance)
  end

  def withdraw(amount, date) 
    fail "Error: You do not have the funds for this withdrawal" if @balance < amount 
    @date_checker.check_date(date)
    @balance -= amount
    @statement.add_withdrawal(amount, date, @balance)
  end

  def print_statement
    @io.puts(@statement.display_statement)
  end
end
