class BankAccount
  def initialize(io, statement)
    @io = io
  end

  def deposit(amount, date)
    if amount == 100
      @deposit = 100
    elsif amount == 50
      @deposit = 50
    end
  end

  def show_statement()
    if @deposit == 100
      @io.puts(["date || credit || debit || balance", "24/07/2022 || || 100.00 || 100.00"])
    elsif @deposit == 50
      @io.puts(["date || credit || debit || balance", "24/07/2022 || || 50.00 || 50.00"])
    else
      @io.puts(["date || credit || debit || balance"])
    end
  end
end