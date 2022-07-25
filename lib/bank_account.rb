class BankAccount
  def initialize(io)
    @io = io
    @statement = []
    @total = 0
  end

  def deposit(amount, date)
    @total += amount
    deposit = "#{date} || || #{'%.2f' % amount} || #{'%.2f' % @total}"
    @statement.push(deposit)
  end

  def show_statement
    @statement.push("date || credit || debit || balance")
    @statement = @statement.reverse
    @io.puts(@statement)
  end
end