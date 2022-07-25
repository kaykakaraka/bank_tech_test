require ('./lib/bank_account')
require ('./lib/statement')

account = BankAccount.new(Kernel)

account.deposit(100, "24/07/2022")

account.show_statement