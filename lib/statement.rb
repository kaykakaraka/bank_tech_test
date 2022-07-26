class Statement
  def initialize
    @statement = []
  end

  def add_deposit(amount, date, balance)
    deposit = "#{date} || || #{'%.2f' % amount} || #{'%.2f' % balance}"
    @statement.push(deposit)
  end

  def add_withdrawal(amount, date, balance)
    withdrawal = "#{date} || #{'%.2f' % amount} || || #{'%.2f' % balance}"
    @statement.push(withdrawal)
  end

  def statement
    format_statement
    return @statement
  end

  private 

  def format_statement
    @statement.push('date || credit || debit || balance')
    @statement = @statement.reverse
  end
end
