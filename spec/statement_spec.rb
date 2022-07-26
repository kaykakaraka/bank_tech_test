require 'statement'

RSpec.describe Statement do
  context 'when it is constructed' do
    it 'returns a statement with headers only' do
      statement = Statement.new
      expect(statement.statement).to eq ['date || credit || debit || balance']
    end
  end

  context 'when a deposit has been made' do
    it 'shows the deposit on the statement' do
      statement = Statement.new
      statement.add_deposit(100,'24/07/2022', 100)
      expect(statement.statement).to eq ['date || credit || debit || balance', '24/07/2022 || || 100.00 || 100.00']
    end

    it 'shows a deposit with a different date on the statement' do
      statement = Statement.new
      statement.add_deposit(100,'25/07/2022', 100)
      expect(statement.statement).to eq ['date || credit || debit || balance', '25/07/2022 || || 100.00 || 100.00']
    end

    it 'shows a deposit with a different amount on the statement' do
      statement = Statement.new
      statement.add_deposit(150,'25/07/2022', 150)
      expect(statement.statement).to eq ['date || credit || debit || balance', '25/07/2022 || || 150.00 || 150.00']
    end
  end

  context 'when multiple deposits are made' do
    it 'shows the deposits on the statement, in reverse order' do
      statement = Statement.new
      statement.add_deposit(150,'25/07/2022', 150)
      statement.add_deposit(100, '26/07/2022', 250)
      expect(statement.statement).to eq [
        'date || credit || debit || balance',
        '26/07/2022 || || 100.00 || 250.00',
        '25/07/2022 || || 150.00 || 150.00'
      ]
    end
  end

  context 'when a deposit and withdrawal are made' do
    it 'shows both the deposit and withdrawal on the statement' do
      statement = Statement.new
      statement.add_deposit(150,'25/07/2022', 150)
      statement.add_withdrawal(100, '26/07/2022', 50)
      expect(statement.statement).to eq [
        'date || credit || debit || balance',
        '26/07/2022 || 100.00 || || 50.00',
        '25/07/2022 || || 150.00 || 150.00'
      ]
    end

    it 'shows deposits and withdrawal with pennies' do
      statement = Statement.new
      statement.add_deposit(150.50,'25/07/2022', 150.50)
      statement.add_withdrawal(100.25, '26/07/2022', 50.25)
      expect(statement.statement).to eq [
        'date || credit || debit || balance',
        '26/07/2022 || 100.25 || || 50.25',
        '25/07/2022 || || 150.50 || 150.50'
      ]
    end
  end

  context 'when several transactions are made' do
    it 'shows all transactions' do
      statement = Statement.new
      statement.add_deposit(150,'25/07/2022', 150)
      statement.add_deposit(100,'26/07/2022', 250)
      statement.add_withdrawal(49.50, '27/07/2022', 200.50)
      statement.add_deposit(25.10, '28/07/2022', 225.60)
      statement.add_withdrawal(120, '28/07/2022', 105.60)
      expect(statement.statement).to eq [
        'date || credit || debit || balance',
        '28/07/2022 || 120.00 || || 105.60',
        '28/07/2022 || || 25.10 || 225.60',
        '27/07/2022 || 49.50 || || 200.50',
        '26/07/2022 || || 100.00 || 250.00',
        '25/07/2022 || || 150.00 || 150.00'
      ]
    end
  end
end
