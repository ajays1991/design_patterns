class Employee
	attr_reader :name
	attr_accessor :title, :salary

	def initialize(name, title, salary)
		@name = name
		@title = title
		@salary = salary
	end
end

class Payroll
	def update(changed_employee)
		puts("Cuts a new check for #{changed_employee.name}")
		puts("His salary is now #{changed_employee.salary}")
	end
end

fred = Employee.new("Fred Flistine", "Crane Operator", 30000.0)

fred.salary = 35000.0