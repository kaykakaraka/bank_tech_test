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
end