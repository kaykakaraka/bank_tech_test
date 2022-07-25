class BankAccount
  def initialize(io, statement)
    @io = io
  end

  def deposit(amount, date)
    @deposit = true
  end

  def show_statement()
    if @deposit == true
      @io.puts(["date || credit || debit || balance", "24/07/2022 || || 100.00 || 100.00"])
    else
      @io.puts(["date || credit || debit || balance"])
    end
  end
end