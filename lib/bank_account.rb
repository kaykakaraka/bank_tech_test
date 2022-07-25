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
    if @deposit == nil 
      @io.puts([header]) 
    elsif @deposit.is_a? Integer
      @io.puts([header, "#{@date} || || #{@deposit}.00 || #{@deposit}.00"])
    else
      @io.puts([header, "#{@date} || || #{@deposit} || #{@deposit}"])
    end
  end
end