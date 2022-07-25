class BankAccount
  def initialize(io, statement)
    @io = io
    @statement = []
  end

  def deposit(amount, date)
    if amount.is_a? Integer
      deposit = "#{date} || || #{amount}.00 || #{amount}.00"
    else 
      deposit = "#{date} || || #{amount} || #{amount}"
    end
    @statement.push(deposit)
  end

  def show_statement
    @statement.push("date || credit || debit || balance")
    @statement = @statement.reverse
    @io.puts(@statement)
  end
end