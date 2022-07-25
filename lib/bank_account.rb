class BankAccount
  def initialize(io, statement)
    @io = io
    @statement = ["date || credit || debit || balance"]
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
    @io.puts(@statement)
  end
end