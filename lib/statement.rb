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
    return format_statement
  end

  private 

  def format_statement()
    formatted_statement = @statement.dup
    formatted_statement.push('date || credit || debit || balance')
    return formatted_statement.reverse
  end
end
