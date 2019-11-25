# protection proxy

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

require 'etc'

class AccountProtectionProxy

	def initialize(real_account, owner_name)
		@subject = real_account
		@owner_name = owner_name
	end

	def deposit(amount)
		check_access
		return @subject.deposit(amount)
	end

	def withdraw(amount)
		check_access
		return @subject.withdraw(amount)
	end

	def balance
		check_access
		return @subject.balance
	end

	def check_access
		if Etc.getlogin != @owner_name
			raise "Illegal access"
		end
	end
end


bank_account = BankAccount.new(200)

account_protection_proxy = AccountProtectionProxy.new(bank_account, "ajay")
account_protection_proxy.deposit(500)
account_protection_proxy.withdraw(20)
puts(account_protection_proxy.balance)

# The advantage of using a proxy for protection is that it gives us a nice seperation of concerns. The proxy worries about who is or not allowed to do what. The only thing BankAccount object need to be concerned with is well the bank account.

# By implementing security in proxy, we cam easily swap in a different security scheme.