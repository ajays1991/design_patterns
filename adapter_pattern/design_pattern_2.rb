# The near misses, interface you have almost everything and but not quite

class Renderer
	def render(text_object)
		text = text_object.text
		size = text_object.size_inches
		color = text_object.color
		puts(text)
		puts(size)
		puts(color)
	end
end

# Renderer is looking to render objects thats looks like the following the object

class TextObject
	attr_reader :text, :size_inches, :color

	def initialize(text, size_inches, color)
		@text = text
		@size_inches = size_inches
		@color = color
	end
end

# unfortunately we have a class that looks something like follows

class BritishTextObject
	attr_reader :string, :size_mm, :colour

	def initialize(string, size_mm, colour)
		@string = string
		@size_mm = size_mm
		@colour = colour
	end
end

class BritishTextObjectAdapter < TextObject

	def initialize(bto)
		@bto = bto
	end

	def text
		return @bto.string
	end

	def size_inches
		return @bto.size_mm / 25.4
	end

	def color
		return @bto.colour
	end
end


## running the code

british_text_object = BritishTextObject.new("this is great britain", 1000, "blue")
british_text_object_adapter = BritishTextObjectAdapter.new(british_text_object)

Renderer.new.render(british_text_object_adapter)



