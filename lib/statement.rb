class Statement
  def initialize 
    @statement = []
  end

  def addDeposit(amount, date, balance)
    deposit = "#{date} || || #{'%.2f' % amount} || #{'%.2f' % balance}"
    @statement.push(deposit)
  end

  def addWithdrawal(amount, date, balance)
    withdrawal = "#{date} || #{'%.2f' % amount} || || #{'%.2f' % balance}"
    @statement.push(withdrawal)
  end

  def displayStatement
    format_statement
    @statement
  end

  def format_statement
    @statement.push("date || credit || debit || balance")
    @statement = @statement.reverse
  end

end
