class Subject
  def initialize
    @observers = []
  end

  def add_observer(observer)
    @observers << observer
  end

  def delete_observer(observer)
    @observers.delete(observer)
  end

  def notifiy_observers
    @observers.each do |observer|
      observer.update(self)
    end
  end
end

class Employee < Subject

  attr_reader :name, :title, :salary

  def initialize(name, title, salary)
    super()
    @name = name
    @title = title
    @salary = salary
  end

  def salary=(new_salary)
    @salary = new_salary
    notifiy_observers
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

fred = Employee.new("Fred Flistine", "Crane Operator", 30000.0)

payroll = Payroll.new
accounting = Accounting.new

fred.add_observer(payroll)
fred.add_observer(accounting)

fred.salary = 40000







#Drawbacks
#This shuts out the possibility of having anything else as a base class. Ruby allows each class to have exactly one superclass.
#Employee object maybe a subclass of OrganizationUnit

module Subject
	def initialize
		@observers = []
	end

	def add_observer(observer)
		@observers << observer
	end

	def delete_observer(observer)
		@observers.delete(observer)
	end

	def notifiy_observers
		@observers.each do |observer|
			observer.update(self)
		end
	end
end


# Ruby standard library comes with a fine prebuilt Observable module that provides all the support you need to make your object

require 'observer'
class Employee
  include Observable
  attr_reader :name, :title, :salary

  def initialize(name, title, salary)
    super()
    @name = name
    @title = title
    @salary = salary
  end

  def salary=(new_salary)
    @salary = new_salary
    notifiy_observers
  end
end
