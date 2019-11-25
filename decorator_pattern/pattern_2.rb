class SimpleWriter
	def initialize(path)
		@file = File.open(path)
	end

	def write_line(line)
		@file.print(line)
		@file.print("\n")
	end

	def pos
		@file.pos
	end

	def rewind
		@file.rewind
	end

	def close
		@file.close
	end
end

# if you want your lines numbered insert an object between your SimpleWriter and the client, an object that adds a number to each line forwards the whole thing on to the basic simple writer


class WriterDecorator
	def initialize(real_writer)
		@real_writer = real_writer
	end

	def write_line(line)
		@real_writer.write_line(line)
	end

	def pos
		@real_writer.pos
	end

	def rewind
		@real_writer.rewind
	end

	def close
		@real_writer.close
	end
end


class NumberingWriter < WriterDecorator

	def initialize(real_writer)
		super(real_writer)
		@line_number = 1
	end

	def write_line(line)
		@real_writer.write_line("#{@line_number}: #{line}")
		@line_number += 1
	end
end

writer = NumberingWriter.new(SimpleWriter.new('final.txt'))
writer.write_line("Hello out there")


class CheckSummingWriter < WriterDecorator

	attr_accessor :check_sum

	def initialize(real_writer)
		@real_writer = real_writer
		@check_sum = 0
	end

	def write_line(line)
		line.each_byte{ |byte| @check_sum = ( @check_sum + byte ) % 256 }
		@check_sum += "\n"[0] % 256
		@real_writer.write_line(line)
	end
end



class TimeStampingWriter < WriterDecorator

	def initialize(real_writer)
		@real_writer = real_writer
	end

	def write_line(line)
		@real_writer.write_line("#{Time.now}: #{line}")
	end
end


writer = CheckSummingWriter.new(TimeStampingWriter.new(NumberingWriter.new(SimpleWriter.new('final.text'))))
writer.write_line("Hello world")






























