class BankAccount

  attr_reader :name, :status
  attr_writer :balance

  def initialize(name, balance=1000, status="open")
    @name = name
    @balance = balance
    @status = status
  end

  def name
    return @name
  end

  def balance
    return @balance
  end

  def balance=(money)
    @balance = money
  end

  def status
    return @status
  end

  def status=(new_value)
    @status = new_value
  end

  def deposit(num)
    self.balance+= num
    return @balance
  end

  def display_balance
    return "Your balance is $#{self.balance}."
  end

  # describe '#valid?' do
  #   it "is valid with an open status and a balance greater than 0" do
  #     @broke = BankAccount.new("Kat Dennings")
  #     @broke.balance = 0
  #     @closed = BankAccount.new("Beth Behrs")
  #     @closed.status = "closed"
  #     expect(avi.valid?).to eq(true)
  #     expect(@broke.valid?).to eq(false)
  #     expect(@closed.valid?).to eq(false)
  #   end
  # end

  def valid?
    return self.status == "open" && self.balance > 0
  end

  def close_account #change the status from open to close
    self.status = "closed"
    return self.status
  end
end
