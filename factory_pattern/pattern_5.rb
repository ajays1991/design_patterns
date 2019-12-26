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
	def initialize(number_animals, animal_class, number_plants, plant_class)
		@animal_class = animal_class
		@plant_class = plant_class
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

	def new_organism(type, name)
		if type == :animal
			@animal_class.new(name)
		elsif type == :plant
			@plant_class.new(name)
		end
	end
end

pond = Pond.new(2, Frog, 3, WaterLily)
pond.simulate_one_day
