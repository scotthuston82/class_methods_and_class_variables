class BankAccount
  @@interest_rate = 0.05
  @@accounts = []

  def initialize
    @balance = 0.00
  end
  def deposit(amount)
    @balance = @balance + amount
  end
  def withdrawl(amount)
    @balance = @balance - amount
  end
  def balance
    return @balance
  end

  def balance=(new_balance)
      @balance = new_balance
  end
  def self.create
    my_account = BankAccount.new
    @@accounts << my_account
    return my_account
  end
  def self.total_funds
    total = 0
    @@accounts.each do |bank_account|
      total = total + bank_account.balance
    end
    return total
  end
  def interest_time
     @@accounts.each do |bank_account|
       interest = bank_account.balance * @@interest_rate
       bank_account.balance = bank_account.balance + interest
    end
  end
end
