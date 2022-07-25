class BankAccount
  def initialize(io, statement_class)
    @io = io
    @statement = statement_class.new 
    @balance = 0
  end

  def deposit(amount, date) 
    fail 'Invalid Date' if is_invalid_date?(date)
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

  def is_invalid_date?(date)
    day = date[0..1]
    day = day.to_i
    puts day
    if day > 31 then return true end
  end
end
