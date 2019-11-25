# Virtual proxy
# we can use a proxy to delay creating expensive objects until we really need them. 
# In our banking project was to delay the creation of bank account instances as long as possible. We do not want to create the real bank account until the user is ready to do something with it, such as making a deposit
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

	def initialize(starting_balance=0)
		@starting_balance = 0
	end 

	def deposit(amount)
		s = subject
		return s.deposit(amount)
	end

	def withdraw(amount)
		s = subject
		return s.withdraw(amount)
	end

	def balance
		s = subject
		return s.balance
	end

	def subject
		@subject || (@subject = BankAccount.new(@starting_balance))
	end
end


# One drawback of the virtual account proxy implementation shown above is that the proxy is responsible for creating the bank account object. That approach tangles the proxy and subject up a little more than we might like.

class VirtualAccountProxy
	def initialize(&creation_block)
		@creation_block = creation_block
	end

	def subject
		@subject || (@subject = @creation_block.call)
	end
end

account = VirtualAccountProxy.new( { BankAccount.new(10)} )