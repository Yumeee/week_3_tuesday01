class BankAccount

  @@interest_rate = 10
  @@accounts = []

  def initialize
    @balance = 0
  end

  def balance
    return @balance
  end

  def deposit(number)
    @balance += number
  end

  def withdraw(number)
    @balance -= number
  end

  def self.create
    new_account = self.new
    @@accounts << new_account
    return new_account
  end

  def self.total_funds
    total = 0
    @@accounts.each do |account|
    return total += account.balance
    end
  end

  def self.interest_time
    @@accounts.each do |account|
      @balance += @@interest_rate
    end
  end

end


your_account = BankAccount.create
your_account.deposit(1000)

my_account = BankAccount.create
my_account.deposit(100)


puts your_account.balance
puts my_account.balance


puts BankAccount.total_funds
