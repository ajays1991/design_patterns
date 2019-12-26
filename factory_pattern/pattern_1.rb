# lets begin with the programming problem. Imagine that you are asked to build a simulation of life in a pond. In particular you need to model the comings and goings of the duck

class Duck
	def initialize(name)
		@name = name
	end

	def eat
		puts("Duck #{@name} is eating")
	end

	def speak
		puts("Duck #{@name} is speaking")
	end

	def sleep
		puts("Duck #{@name} is sleeping")
	end
end

# But duck also need a place to live so lets build a Pond class

class Pond
	def initialize(number_times)
		@ducks = []
		number_times.times do |i|
			@ducks << Duck.new("Duck#{i}")
		end
	end

	def simulate_one_day
		@ducks.each {|duck| duck.eat}
		@ducks.each {|duck| duck.speak}
		@ducks.each {|duck| duck.sleep}
	end
end

# Running the above code

pond = Pond.new(5)
pond.simulate_one_day