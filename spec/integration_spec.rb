require 'bank_account'
require 'statement'
require 'date_checker'

RSpec.describe 'account integration' do
  before(:each) do
    @io = double :io
    @account = BankAccount.new(@io, Statement, DateChecker)
  end
  context 'user opens an account but does not deposit or withdraw' do
    it 'shows an empty statement' do
      expect(@io).to receive(:puts).with(['date || credit || debit || balance'])
      @account.show_statement
    end
  end

  context 'user makes a deposit' do
    it 'shows the deposit on the statement' do
      expect(@io).to receive(:puts).with(['date || credit || debit || balance', '24/07/2022 || || 100.00 || 100.00'])
      @account.deposit(100, '24/07/2022')
      @account.show_statement
    end

    it 'shows a different, correct deposit of 50.00 on the statement' do
      expect(@io).to receive(:puts).with(['date || credit || debit || balance', '24/07/2022 || || 50.00 || 50.00'])
      @account.deposit(50, '24/07/2022')
      @account.show_statement
    end

    it 'shows a deposit with a different date of 27/07/2022 on the statement' do
      expect(@io).to receive(:puts).with(['date || credit || debit || balance', '27/07/2022 || || 50.00 || 50.00'])
      @account.deposit(50, '27/07/2022')
      @account.show_statement
    end

    it 'shows a deposit that has pennies in it' do
      expect(@io).to receive(:puts).with(['date || credit || debit || balance', '27/07/2022 || || 50.75 || 50.75'])
      @account.deposit(50.75, '27/07/2022')
      @account.show_statement
    end
  end

  context 'user makes multiple deposits' do
    it 'shows 2 deposits when two are made' do
      expect(@io).to receive(:puts).with(
        ['date || credit || debit || balance',
         '24/07/2022 || || 100.00 || 150.00',
         '24/07/2022 || || 50.00 || 50.00']
      )
      @account.deposit(50, '24/07/2022')
      @account.deposit(100, '24/07/2022')
      @account.show_statement
    end

    fit 'shows 2 deposits with pennies that are correctly added and displayed' do
      expect(@io).to receive(:puts).with(
        ['date || credit || debit || balance',
         '24/07/2022 || || 100.47 || 151.22',
         '24/07/2022 || || 50.75 || 50.75']
      )
      @account.deposit(50.75, '24/07/2022')
      @account.deposit(100.47, '24/07/2022')
      @account.show_statement
    end

    it 'shows 2 deposits, one an integer and one with pennies, that are correctly added and displayed' do
      expect(@io).to receive(:puts).with(
        ['date || credit || debit || balance',
         '24/07/2022 || || 100.00 || 150.75',
         '24/07/2022 || || 50.75 || 50.75']
      )
      @account.deposit(50.75, '24/07/2022')
      @account.deposit(100, '24/07/2022')
      @account.show_statement
    end
  end

  context 'user makes a deposit and then a withdrawal' do
    it 'shows the deposit and withdrawal on the statement' do
      expect(@io).to receive(:puts).with(
        ['date || credit || debit || balance',
         '24/07/2022 || 50.00 || || 50.00',
         '24/07/2022 || || 100.00 || 100.00']
      )
      @account.deposit(100, '24/07/2022')
      @account.withdraw(50, '24/07/2022')
      @account.show_statement
    end

    it 'shows a different withdrawal and different balance on the statement' do
      expect(@io).to receive(:puts).with(
        ['date || credit || debit || balance',
         '24/07/2022 || 75.00 || || 25.00',
         '24/07/2022 || || 100.00 || 100.00']
      )
      @account.deposit(100, '24/07/2022')
      @account.withdraw(75, '24/07/2022')
      @account.show_statement
    end

    it 'works for withdrawals with pennies when the deposit had pennies' do
      expect(@io).to receive(:puts).with(
        ['date || credit || debit || balance',
         '24/07/2022 || 75.52 || || 24.50',
         '24/07/2022 || || 100.02 || 100.02']
      )
      @account.deposit(100.02, '24/07/2022')
      @account.withdraw(75.52, '24/07/2022')
      @account.show_statement
    end

    it 'works for withdrawals with pennies when the deposit was an integer' do
      expect(@io).to receive(:puts).with(
        ['date || credit || debit || balance',
         '24/07/2022 || 75.52 || || 24.48',
         '24/07/2022 || || 100.00 || 100.00']
      )
      @account.deposit(100, '24/07/2022')
      @account.withdraw(75.52, '24/07/2022')
      @account.show_statement
    end

    it 'shows the correct date for the withdrawal' do
      expect(@io).to receive(:puts).with(
        ['date || credit || debit || balance',
         '26/07/2022 || 75.52 || || 24.48',
         '24/07/2022 || || 100.00 || 100.00']
      )
      @account.deposit(100, '24/07/2022')
      @account.withdraw(75.52, '26/07/2022')
      @account.show_statement
    end
  end

  context 'when user enters an invalid date' do
    it 'throws an error for an invalid day of the month' do
      expect { @account.deposit(100, '35/07/2022') }.to raise_error "Invalid Date"
    end

    it 'throws an error for an invalid month' do
      expect { @account.deposit(100, '30/15/2022') }.to raise_error "Invalid Date"
    end

    it 'throws an error for an invalid year' do
      expect { @account.deposit(100, '30/12/-4') }.to raise_error "Invalid Date"
    end

    it 'throws an error for a year with only two numbers' do
      expect { @account.deposit(100, '30/12/24') }.to raise_error "Invalid Date"
    end

    it 'throws an error if the date is not later than the date of the transaction it follows' do
      @account.deposit(100, '30/12/2022')
      expect { @account.deposit(100, '12/12/2022') }.to raise_error "Invalid Date: must be later than your most recent transaction"
    end

    it 'throws an error for a different combination of dates in the wrong order' do
      @account.deposit(100, '30/12/2020')
      expect { @account.deposit(100, '30/12/2019') }.to raise_error "Invalid Date: must be later than your most recent transaction"
    end
  end

  context 'when the user tries to withdraw more money than they have' do
    it 'raises an error when no money has been deposited' do
      expect { @account.withdraw(100, '30/12/2019') }.to raise_error "Error: You do not have the funds for this withdrawal"
    end

    it 'raises an error when less money has been deposited than they wish to withdraw' do
      @account.deposit(75, '29/12/2019')
      expect { @account.withdraw(100, '30/12/2019') }.to raise_error "Error: You do not have the funds for this withdrawal"
    end
  end
end
