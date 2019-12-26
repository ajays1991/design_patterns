# An awkward aspect of the previous implementation is that we need a seperate method for each type of object we are producing. 
# We have the new_animal method to make frogs and ducks and new_plant method to make lilies and algae. Having a seperate method for each type of object that you need to produce is not too much of a burden if you are dealing with only two types, as in our pond example.
# A different and perhaps cleaner way to go is to have a single factory method that takes a parameter, a parameter that tells the method which kind of object to create. Parameterized factory method

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

class Algae
	def initialize(name)
		@name = name
	end

	def grow
		puts("The Algae #{@name} soaks up the sun and grows")
	end
end

class WaterLily
	def initialize(name)
		@name = name
	end

	def grow
		puts("The waterlily #{@name} floats, soaks up the sun and grows")
	end
end

class Pond
	def initialize(number_animals, number_plants)
		@animals = []
		number_animals.times do |i|
			@animals << new_organism(:animal, "Animal#{i}")
		end

		@plants = []
		number_plants.times do |i|
			@plants << new_organism(:plant, "Plant#{i}")
		end
	end

	def simulate_one_day
		@plants.each {|plant| plant.grow}
		@animals.each {|animal| animal.eat}
		@animals.each {|animal| animal.speak}
		@animals.each {|animal| animal.sleep}
	end
end

class DuckWaterLilyPond < Pond
	def new_organism(type, name)
		if type == :animal
			Duck.new(name)
		elsif type == :plant
			WaterLily.new(name)
		end
	end
end

pond = DuckWaterLilyPond.new(2,4)
pond.simulate_one_day