class BankAccount
  def initialize(io, statement_class)
    @io = io
    @statement = statement_class.new 
    @balance = 0
  end

  def deposit(amount, date) 
    @balance += amount
    @statement.addDeposit(amount, date, @balance)
  end

  def withdraw(amount, date) 
    @balance -= amount
    @statement.addWithdrawal(amount, date, @balance)
  end

  def show_statement
    @io.puts(@statement.displayStatement)
  end
end