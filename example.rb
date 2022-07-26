require ('./lib/bank_account')
require ('./lib/statement')
require ('./lib/date_checker')

account = BankAccount.new(Kernel, Statement, DateChecker)

account.deposit(1000, "10/01/2023")
account.deposit(2000, "13/01/2023")
account.withdraw(500, "14/01/2023")

account.print_statement
