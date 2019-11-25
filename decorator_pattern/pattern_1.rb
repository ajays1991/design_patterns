class EnchancedWriter
	attr_reader :check_sum

	def initialize(path)
		@file = File.open(path)
		@check_sum = 0
		@line_number = 1
	end

	def write_line(line)
		@file.print(line)
		@file.print("\n")
	end

	def checksumming_write_line(data)
		data.each_byte{ |byte| @check_sum = ( @check_sum + byte ) % 256 }
		@check_sum += "\n"[0] % 256
		write_line(data)
	end

	def timestamping_write_line(data)
		write_line("#{Time.new}: #{data}")
	end

	def numbering_write_line(data)
		write_line("%#{@line_number}: #{data}")
	end

	def close
		@file.close
	end
end

writer = EnchancedWriter.new('out.txt')
writer.write_line("A plain line")

writer.checksumming_write_line("A line with checksum")
puts("checksum is #{writer.check_sum}")

writer.timestamping_write_line("A line with timestamp")

write.numbering_write_line("A line with numbering")




# Drawbacks
# The client needs to know whether it is writing out numbered, checksummed or timestamped text. And the client do not need to know this just once, perhaps to set things first, but continously, with every line of data that they write out. If a client gets things wrong once for example if it uses timestamping_write_line when it meant to use checksumming_write_line.
# Everything is thrown together in one class.
# you might be able to seperate out all these text writing concerns by creating base class and subclass, in other words our old fashioned inheritance.
# But what if you want to checksum your numbered output? Number of classes will go out of hand. 
