class BankAccount
  def initialize(io)
    @io = io
    @statement = []
    @total = 0
  end

  def deposit(amount, date)
    @total += amount
    if amount.is_a? Integer
      deposit = "#{date} || || #{amount}.00 || #{@total}.00"
    else 
      deposit = "#{date} || || #{amount} || #{@total}"
    end
    @statement.push(deposit)
  end

  def show_statement
    @statement.push("date || credit || debit || balance")
    @statement = @statement.reverse
    @io.puts(@statement)
  end
end