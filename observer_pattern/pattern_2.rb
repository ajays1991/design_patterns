class Employee
	attr_reader :name
	attr_accessor :title, :salary

	def initialize(name, title, salary, payroll)
		@name = name
		@title = title
		@salary = salary
		@payroll = payroll
	end
	
	def salary=(new_salary)
		@salary =new_salary
		@payroll.update(self)
	end
end

class Payroll
	def update(changed_employee)
		puts("Cuts a new check for #{changed_employee.name}")
		puts("His salary is now #{changed_employee.salary}")
	end
end

payroll = Payroll.new
fred = Employee.new("Fred Flistine", "Crane Operator", 30000.0, payroll)
fred.salary = 35000.0

# note: since we need to inform the payroll department about changes in fred salary we cannot use attribute accessor so we defined salary= method