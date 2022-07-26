require 'statement'

RSpec.describe Statement do
  context 'when it is constructed' do
    it 'returns a statement with headers only' do
      statement = Statement.new
      expect(statement.statement).to eq ['date || credit || debit || balance']
    end
  end

  context 'when a deposit has been made' do
    xit 'returns the deposit on the statement' do
      statement = Statement.new
      statement.add_deposit(100,'24/07/2022', 100)
      expect(statement.statement).to eq ['date || credit || debit || balance', '24/07/2022 || || 100.00 || 100.00']
    end
  end
end
