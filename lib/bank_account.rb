class BankAccount
  def initialize(io, statement)
    @io = io
    @statement = statement.new
  end

  def deposit(amount, date)
    @deposit = amount
    @date = date
  end

  def show_statement
    header = "date || credit || debit || balance"
    @deposit == nil ? @io.puts([header]) : @io.puts([header, "#{@date} || || #{@deposit}.00 || #{@deposit}.00"])
  end
end