require ('./lib/bank_account')

RSpec.describe BankAccount do
  context 'before any deposits or withdrawals have been made' do
    it 'prints an empty statement as received from the statement class' do
      fake_statement_class = double(:statement, new: fake_statement = double(:statement_object, statement: ['date || credit || debit || balance']))
      fake_date_checker = double(:date_checker, new: fake_date_checker1 = double(:date_checker_object))
      io = double :io
      expect(io).to receive(:puts).with(['date || credit || debit || balance'])
      account = BankAccount.new(io, fake_statement_class, fake_date_checker)
      account.print_statement
    end
  end

  context 'a deposit is added' do
    it 'passes the deposit and balance to the statement class, and the date to the date checker' do
      fake_statement_class = double(:statement, new: fake_statement = double(:statement_object)) 
      fake_date_checker = double(:date_checker, new: fake_date_checker1 = double(:date_checker_object))
      io = double :io
      expect(fake_statement).to receive(:add_deposit).with(100, '27/07/2022', 100)
      expect(fake_date_checker1).to receive("check_date").with('27/07/2022')
      account = BankAccount.new(io, fake_statement_class, fake_date_checker)
      account.deposit(100, '27/07/2022')
    end
  end

  context 'multiple deposits are made' do
    it 'passes the sum of this balance to the statement class' do
      io = double :io
      fake_statement_class = double(:statement, new: fake_statement = double(:statement_object))
      fake_date_checker = double(:date_checker, new: fake_date_checker1 = double(:date_checker_object))
      expect(fake_statement).to receive(:add_deposit).with(100, '27/07/2022', 100)
      expect(fake_statement).to receive(:add_deposit).with(50, '27/07/2022', 150)
      expect(fake_date_checker1).to receive("check_date").with('27/07/2022')
      expect(fake_date_checker1).to receive("check_date").with('27/07/2022')
      account = BankAccount.new(io, fake_statement_class, fake_date_checker)
      account.deposit(100, '27/07/2022')
      account.deposit(50, '27/07/2022')
    end
  end

  context 'a deposit and a withdrawal are made' do
    it 'passes the sum of this balance to the statement class' do
      io = double :io
      fake_statement_class = double(:statement, new: fake_statement = double(:statement_object))
      fake_date_checker = double(:date_checker, new: fake_date_checker1 = double(:date_checker_object))
      expect(fake_statement).to receive(:add_deposit).with(100, '27/07/2022', 100)
      expect(fake_statement).to receive(:add_withdrawal).with(50, '27/07/2022', 50)
      expect(fake_date_checker1).to receive("check_date").with('27/07/2022')
      expect(fake_date_checker1).to receive("check_date").with('27/07/2022')
      account = BankAccount.new(io, fake_statement_class, fake_date_checker)
      account.deposit(100, '27/07/2022')
      account.withdraw(50, '27/07/2022')
    end
  end

  context 'deposits on two different dates are made' do
    it 'passes both dates to the date checker' do
      io = double :io
      fake_statement_class = double(:statement, new: fake_statement = double(:statement_object))
      fake_date_checker = double(:date_checker, new: fake_date_checker1 = double(:date_checker_object))
      expect(fake_statement).to receive(:add_deposit).with(100, '27/07/2022', 100)
      expect(fake_statement).to receive(:add_withdrawal).with(50, '28/10/2023', 50)
      expect(fake_date_checker1).to receive("check_date").with('27/07/2022')
      expect(fake_date_checker1).to receive("check_date").with('28/10/2023')
      account = BankAccount.new(io, fake_statement_class, fake_date_checker)
      account.deposit(100, '27/07/2022')
      account.withdraw(50, '28/10/2023')
    end
  end
end
