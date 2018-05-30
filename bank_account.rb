

class BankAccount

  @@interest_rate = 10
  @@accounts = []

  def initialize
    @balance = 0
  end

  def balance
    return @balance
  end

# writer code
  def balance=(value)
    @balance = value
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
    total += account.balance
    end
    return total
  end

  def self.interest_time
    @@accounts.each do |account|
      account.balance += @@interest_rate
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
BankAccount.interest_time
puts your_account.inspect
puts my_account.inspect
