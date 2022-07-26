require ('./lib/bank_account')

RSpec.describe BankAccount do
  context 'before any deposits or withdrawals have been made' do
    it 'prints an empty statement' do
      fake_statement_class = double(:statement, new: fake_statement = double(:statement_object, statement: ['date || credit || debit || balance']))
      fake_date_checker = double(:date_checker, new: fake_date_checker1 = double(:date_checker_object))
      io = double :io
      expect(io).to receive(:puts).with(['date || credit || debit || balance'])
      account = BankAccount.new(io, fake_statement_class, fake_date_checker)
      account.print_statement
    end
  end
end