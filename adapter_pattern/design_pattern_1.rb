class Encrypter
	def initialize(key)
		@key = key
	end

	def encrypt(reader, writer)
		key_index = 0
		while not reader.eof?
			clear_char = reader.getc
			encrypted_char = clear_char ^ @key[key_index]
			writer.putc(encrypted_char)
			key_index = (key_index + 1) % @key.size
		end
	end
end

#######################
#######################
#######################

# Now the catch. what happens if the data we want to secure happens to come from a string instead of the file
# In that case we need an object that looks like a open file that supports same interface as ruby IO object on the outside. What we need is StringIOAdapter

class StringIOAdapter
	def initialize(string)
		@string = string
	end

	def getc
		if @position >= @string.length
			raise EOFError
		end
		ch = @string[@position]
		@position += 1
		return ch
	end

	def eof?
		return @position >= @string.length
	end
end



# Simillary if the data comes from array of string then we need ArrayIOAdapter

class StringArrayAdapter
	def initialize(array)
		@array = array
		@index = 0
	end

	def getc
		if @index >= @array.size
			raise EOFError
		end
		ch = @array[@index]
		@index += 1
		return ch
	end

	def eof?
		return @index >= @array.size
	end
end

encrypter = Encrypter.new('XXYZ')
reader = StringIOAdapter.new("we attack at dawn")
writer = File.open("out.txt", "w")
encrypter.encrypt(reader, writer)

encrypter = Encrypter.new('XXYZ')
reader = ArrayIOAdapter.new(["we attack at dawn", "Its not personal its strictly business"])
writer = File.open("out_1.txt", "w")
encrypter.encrypt(reader, writer)