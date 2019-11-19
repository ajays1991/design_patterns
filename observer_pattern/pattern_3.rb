# problem with the previous code that it was hardwired to inform payroll department. What if we need the accounting department also informed about the changes in salary
# Perhaps a better way of solving of the notification problem in general way

class Employee
	def intialize
		@name = name
		@title = title
		@salary = salary
		@observers = []
	end

	def salary=(new_salary)
		@salary = new_salary
		notify_observers
	end

	def notify_observers
		@observers.each do |observer|
			observer.update(self)
		end
	end

	def add_observer(observer)
		@observers << observer
	end

	def delete_observer(observer)
		@observers.delete(observer)
	end
end


class Payroll
	def update(changed_employee)
		puts("Cuts a new check for #{changed_employee.name}")
		puts("His salary is now #{changed_employee.salary}")
	end
end

class Accounting
	def update(changed_employee)
		puts("Audits a salary for #{changed_employee.name}")
		puts("His salary is now #{changed_employee.salary}")
	end
end

fred = Employee.new("Fred Flistine", "Crane Operator", 30000.0, payroll)

payroll = Payroll.new
accounting = Accounting.new

fred.add_observer(payroll)
fred.add_observer(accounting)

fred.salary = 40000