require 'bank_account'
require 'statement'

RSpec.describe 'account integration' do
  context 'user opens an account but does not deposit or withdraw' do
    it 'shows an empty statement' do
      io = double :io
      expect(io).to receive(:puts).with(["date || credit || debit || balance"])
      statement = Statement.new
      account = BankAccount.new(io, statement)
      account.show_statement
    end
  end

  context 'user makes a deposit' do
    it 'shows the deposit on the statement' do
      io = double :io
      expect(io).to receive(:puts).with(["date || credit || debit || balance", "24/07/2022 || || 100.00 || 100.00"])
      statement = Statement.new
      account = BankAccount.new(io, statement)
      account.deposit(100, '24/07/2022')
      account.show_statement
    end

    it 'shows a different, correct deposit of 50.00 on the statement' do
      io = double :io
      expect(io).to receive(:puts).with(["date || credit || debit || balance", "24/07/2022 || || 50.00 || 50.00"])
      statement = Statement.new
      account = BankAccount.new(io, statement)
      account.deposit(50, '24/07/2022')
      account.show_statement
    end
  end

end