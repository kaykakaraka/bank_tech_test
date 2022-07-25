require 'bank_account'
require 'statement'

RSpec.describe 'account integration' do
  context 'user opens an account but does not deposit or withdraw' do
    it 'shows an empty statement' do
      io = double :io
      expect(io).to receive(:puts).with(["date || credit || debit || balance"])
      account = BankAccount.new(io, Statement)
      account.show_statement
    end
  end

  context 'user makes a deposit' do
    it 'shows the deposit on the statement' do
      io = double :io
      expect(io).to receive(:puts).with(["date || credit || debit || balance", "24/07/2022 || || 100.00 || 100.00"])
      statement = Statement.new
      account = BankAccount.new(io, Statement)
      account.deposit(100, '24/07/2022')
      account.show_statement
    end

    it 'shows a different, correct deposit of 50.00 on the statement' do
      io = double :io
      expect(io).to receive(:puts).with(["date || credit || debit || balance", "24/07/2022 || || 50.00 || 50.00"])
      account = BankAccount.new(io, Statement)
      account.deposit(50, '24/07/2022')
      account.show_statement
    end

    it 'shows a deposit with a different date of 27/07/2022 on the statement' do
      io = double :io
      expect(io).to receive(:puts).with(["date || credit || debit || balance", "27/07/2022 || || 50.00 || 50.00"])
      account = BankAccount.new(io, Statement)
      account.deposit(50, '27/07/2022')
      account.show_statement
    end

    xit 'shows two deposits on the statement' do
      io = double :io
      expect(io).to receive(:puts).with(["date || credit || debit || balance", "24/07/2022 || || 100.00 || 100.00", "24/07/2022 || || 50.00 || 50.00"])
      account = BankAccount.new(io, Statement)
      account.deposit(50, '24/07/2022')
      account.deposit(100, '24/07/2022')
      account.show_statement
    end
  end

end