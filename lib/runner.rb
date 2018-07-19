require_relative "bank_account"
require_relative "transfer"
require "pry"


ryhan = BankAccount.new("Ryhan", 1000, "open")
cassandra = BankAccount.new("Cassandra", 1000, "open")

bank_transfer = Transfer.new(ryhan, cassandra, 100)

pry.start
