require ('./lib/bank_account')
require ('./lib/statement')

statement = Statement.new
account = BankAccount.new(Kernel, statement)

account.deposit(100, "24/07/2022")

account.show_statement