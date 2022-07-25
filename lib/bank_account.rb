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
    if @deposit == nil
      @io.puts(["date || credit || debit || balance"])
    else
      header = "date || credit || debit || balance"
      @io.puts([header, "#{@date} || || #{@deposit}.00 || #{@deposit}.00"])
    end
  end
end