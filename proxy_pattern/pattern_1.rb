# proxy pattern is built around a little while lie
# when the client asks for an object, we do indeed give the client back an object. However, the object that we give back is not quite the object the client expected. What we hand to the client is an object that looks and acts like the objec the client expected, but actually is an imposter.
# Proxy has a reference to the real object subject, hidden inside. Whenever the client code calls the method on the proxy, the proxy simply forwards the request to the real object.

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

class BankAccountProxy

	def initialize(real_object)
		@real_object = real_object
	end

	def balance
		@real_object.balance
	end

	def deposit(amount)
		@real_object.deposit(amount)
	end

	def withdraw(amount)
		@real_object.withdraw(amount)
	end
end

account = BankAccount.new(100)

account.deposit(50)
account.withdraw(10)

proxy = BankAccountProxy.new(account)
proxy.deposit(50)
proxy.withdraw(10)

# Once proxy we have proxy, we have a place to stand squarely between the client and real object
# test