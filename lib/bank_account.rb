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
    @balance -= amount
    withdrawal = "#{date} || #{'%.2f' % amount} || || #{'%.2f' % @balance}"
    @statement.push(withdrawal)
  end

  def show_statement
    @statement.push("date || credit || debit || balance")
    @statement = @statement.reverse
    @io.puts(@statement)
  end
end