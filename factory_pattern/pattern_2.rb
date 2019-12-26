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

# until one dark day when we get the request to model a different denizen of the puddle: the frog

class Frog
	def initialize(name)
		@name = name
	end

	def eat
		puts("Frog #{@name} is eating")
	end

	def speak
		puts("Frog #{@name} is speaking")
	end

	def sleep
		puts("Frog #{@name} is sleeping")
	end
end	

# But duck also need a place to live so lets build a Pond class

class Pond
	def initialize(number_animals)
		@animals = []
		number_animals.times do |i|
			@animals << new_animal.new("Animal#{i}")
		end
	end

	def simulate_one_day
		@animals.each {|animal| animal.eat}
		@animals.each {|animal| animal.speak}
		@animals.each {|animal| animal.sleep}
	end
end

# Now we build two subclasses of the pond class - one for a pond full of frogs and other for the pond full of ducks

class DuckPond < Pond
	def new_animal(name)
		Duck.new(name)
	end
end

class FrogPond < Pond
	def new_animal(name)
		Frog.new(name)
	end
end

pond_frog = FrogPond.new(3)
pond_frog.simulate_one_day

# GOF called this technique of pushing the "which class" decision down on a subclass the Factory Method pattern.
# You may discover that the factory method pattern is not really a new pattern at all. At its heart, this pattern is really just the Template Method pattern applied to the problem of creating new objects.
