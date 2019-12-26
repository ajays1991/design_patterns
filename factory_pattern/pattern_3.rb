# Parameterized factory methods
# one problem with successfull programs is that they tend to attract an ever-increasing pile of requirements.
# Suppose your pond simulation is so popular that your users starts asking you to simulate plants as well as animals.

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

# You also modify the pond class to deal with plants

class Pond
	def initialize(number_animals, number_plants)
		@animals = []
		number_animals.times.each do |i|
			@animals << new_animal("Animal#{i}")
		end

		@plants = []
		number_plants.times.each do |i|
			@plants << new_plant("Plant#{i}")
		end
	end

	def simulate_one_day
		@plants.each {|plant| plant.grow}
		@animals.each {|animal| animal.eat}
		@animals.each {|animal| animal.speak}
		@animals.each {|animal| animal.sleep}
	end
end

# You will also have to modify the subclasses to create some flora

class DuckWaterLilyPond < Pond
	def new_animal(name)
		Duck.new(name)
	end

	def new_plant(name)
		WaterLily.new(name)
	end
end

class FrogAlgaePond < Pond
	def new_animal(name)
		Frog.new(name)
	end

	def new_plant(name)
		Algae.new(name)
	end
end


pond = DuckWaterLilyPond.new(3,4)
pond.simulate_one_day