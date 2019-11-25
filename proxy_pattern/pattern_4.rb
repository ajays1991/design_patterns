class BankAccount
	attr_reader :balance

	def initialize(starting_balance=0)
		@balance = starting_balance
	end

	def deposit(amount)
		@balance += amount
	end

	def withdraw(amount)
		@balance -= amount
	end
end


class VirtualAccountProxy
	def initialize(&creation_block)
		@creation_block = creation_block
	end

	def subject
		@subject || (@subject = @creation_block.call)
	end

	def method_missing(name, *args)
		puts("Delegating #{name} message to subject")
		@subject.send(name, *args)
	end
end

virtual_account_proxy = VirtualAccountProxy.new({BankAccount.new(200)})

virtual_account_proxy.deposit(20)