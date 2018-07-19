class Transfer
  # your code here
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount, status = "pending")
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def sender
    return @sender
  end

  def receiver
    return @receiver
  end

  def status
    return @status
  end

  def amount
    return @amount
  end

  def valid?
    return sender.valid? == true && receiver.valid? == true && (sender.balance - self.amount) > 0
  end

  # describe '#execute_transaction' do
  #   it "can execute a successful transaction between two accounts" do
  #     transfer.execute_transaction
  #     expect(amanda.balance).to eq(950)
  #     expect(avi.balance).to eq(1050)
  #     expect(transfer.status).to eq("complete")
  #   end

  def execute_transaction
    if self.valid? == true && status != "complete"
      self.receiver.balance += self.amount
      self.sender.balance -= self.amount
      self.status = "complete"
    else
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end


  def reverse_transfer
    if self.status == "complete"
      self.receiver.balance -= self.amount
      self.sender.balance += self.amount
      self.status = "reversed"
    end

  end
  # describe '#reverse_transfer' do
  #   it "can reverse a transfer between two accounts" do
  #     transfer.execute_transaction
  #     expect(amanda.balance).to eq(950)
  #     expect(avi.balance).to eq(1050)
  #     transfer.reverse_transfer
  #     expect(avi.balance).to eq(1000)
  #     expect(amanda.balance).to eq(1000)
  #     expect(transfer.status).to eq("reversed")
  #   end
  #
  #   it "it can only reverse executed transfers" do
  #     transfer.reverse_transfer
  #     expect(amanda.balance).to eq(1000)
  #     expect(avi.balance).to eq(1000)
  #   end

end
