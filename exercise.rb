require './bank_account'

scott = BankAccount.create
scott.deposit(1000)
scott.withdrawl(300)
scott.interest_time
puts BankAccount.total_funds
