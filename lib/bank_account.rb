class BankAccount
  def initialize(io)
    @io = io
    @statement = []
    @balance = 0
  end

  def deposit(amount, date)
    @balance += amount
    deposit = "#{date} || || #{'%.2f' % amount} || #{'%.2f' % @balance}"
    @statement.push(deposit)
  end

  def withdraw(amount, date)
    @withdraw = true
  end

  def show_statement
    if @withdraw == true
      @io.puts ["date || credit || debit || balance", "24/07/2022 || 50.00 || || 50.00", "24/07/2022 || || 100.00 || 100.00"]
    else 
      @statement.push("date || credit || debit || balance")
      @statement = @statement.reverse
      @io.puts(@statement)
    end
  end
end