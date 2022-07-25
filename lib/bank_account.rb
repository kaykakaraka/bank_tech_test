class BankAccount
  def initialize(io, statement_class)
    @io = io
    @statement = statement_class.new 
    @balance = 0
  end

  def deposit(amount, date) 
    fail 'Invalid Date' unless is_valid_date?(date)
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

  def is_valid_date?(date)
    if date.include?('-') then return false end
    day = date[0..1].to_i
    month = date[3..4].to_i
    year = date[6..9]
    if year.length != 4 then return false end
    year = year.to_i
    Date.valid_date?(year, month, day)
  end
end
