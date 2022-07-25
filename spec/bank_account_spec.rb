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

    it 'shows a deposit that has pennies in it' do
      io = double :io
      expect(io).to receive(:puts).with(["date || credit || debit || balance", "27/07/2022 || || 50.75 || 50.75"])
      account = BankAccount.new(io, Statement)
      account.deposit(50.75, '27/07/2022')
      account.show_statement
    end
  end

  context 'user makes multiple deposits' do
    it 'shows 2 deposits when two are made' do
      io = double :io
      expect(io).to receive(:puts).with(["date || credit || debit || balance", "24/07/2022 || || 100.00 || 150.00", "24/07/2022 || || 50.00 || 50.00"])
      account = BankAccount.new(io, Statement)
      account.deposit(50, '24/07/2022')
      account.deposit(100, '24/07/2022')
      account.show_statement
    end

    it 'shows 2 deposits with pennies that are correctly added and displayed' do
      io = double :io
      expect(io).to receive(:puts).with(["date || credit || debit || balance", "24/07/2022 || || 100.47 || 151.22", "24/07/2022 || || 50.75 || 50.75"])
      account = BankAccount.new(io, Statement)
      account.deposit(50.75, '24/07/2022')
      account.deposit(100.47, '24/07/2022')
      account.show_statement
    end

    it 'shows 2 deposits, one an integer and one with pennies, that are correctly added and displayed' do
      io = double :io
      expect(io).to receive(:puts).with(["date || credit || debit || balance", "24/07/2022 || || 100.00 || 150.75", "24/07/2022 || || 50.75 || 50.75"])
      account = BankAccount.new(io, Statement)
      account.deposit(50.75, '24/07/2022')
      account.deposit(100, '24/07/2022')
      account.show_statement
    end
  end

  context 'user makes a deposit and then a withdrawal' do
    it 'shows the deposit and withdrawal on the statement' do
      io = double :io
      expect(io).to receive(:puts).with(["date || credit || debit || balance", "24/07/2022 || 50.00 || || 50.00", "24/07/2022 || || 100.00 || 100.00"])
      account = BankAccount.new(io, Statement)
      account.deposit(100, '24/07/2022')
      account.withdraw(50, '24/07/2022')
      account.show_statement
    end

    it 'shows a different withdrawal and different balance on the statement' do
      io = double :io
      expect(io).to receive(:puts).with(["date || credit || debit || balance", "24/07/2022 || 75.00 || || 25.00", "24/07/2022 || || 100.00 || 100.00"])
      account = BankAccount.new(io, Statement)
      account.deposit(100, '24/07/2022')
      account.withdraw(75, '24/07/2022')
      account.show_statement
    end

    it 'works for withdrawals with pennies when the deposit had pennies' do
      io = double :io
      expect(io).to receive(:puts).with(["date || credit || debit || balance", "24/07/2022 || 75.52 || || 24.50", "24/07/2022 || || 100.02 || 100.02"])
      account = BankAccount.new(io, Statement)
      account.deposit(100.02, '24/07/2022')
      account.withdraw(75.52, '24/07/2022')
      account.show_statement
    end

    it 'works for withdrawals with pennies when the deposit was an integer' do
      io = double :io
      expect(io).to receive(:puts).with(["date || credit || debit || balance", "24/07/2022 || 75.52 || || 24.48", "24/07/2022 || || 100.00 || 100.00"])
      account = BankAccount.new(io, Statement)
      account.deposit(100, '24/07/2022')
      account.withdraw(75.52, '24/07/2022')
      account.show_statement
    end

    it 'shows the correct date for the withdrawal' do
      io = double :io
      expect(io).to receive(:puts).with(["date || credit || debit || balance", "26/07/2022 || 75.52 || || 24.48", "24/07/2022 || || 100.00 || 100.00"])
      account = BankAccount.new(io, Statement)
      account.deposit(100, '24/07/2022')
      account.withdraw(75.52, '26/07/2022')
      account.show_statement
    end
  end
end