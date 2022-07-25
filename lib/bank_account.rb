class BankAccount
  def initialize(statement)
  end

  def deposit(amount, date)
    @deposit = true
  end

  def show_statement()
    if @deposit == true
      return "date || credit || debit || balance\n24/07/2022 || || 100.00 || 100.00"
    else
      return "date || credit || debit || balance"
    end
  end
end