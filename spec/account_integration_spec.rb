require 'bank_account'
require 'statement'

RSpec.describe 'account integration' do
  context 'user opens an account but does not deposit or withdraw' do
    it 'shows an empty statement' do
      statement = Statement.new
      account = BankAccount.new(statement)
      expect(account.show_statement).to eq "date || credit || debit || balance"
    end
  end

  context 'user makes a deposit' do
    it 'shows the deposit on the statement' do
      statement = Statement.new
      account = BankAccount.new(statement)
      account.deposit(100, '24/07/2022')
      expect(account.show_statement).to eq "date || credit || debit || balance\n24/07/2022 || || 100.00 || 100.00"
    end
  end
end