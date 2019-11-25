# It incorportate a lot of delegation. We can see this in the WriterDecorator class, which consists almost entirely of boilerplate methods that do nothing except delegate to the next writer down the line

# We could eliminate all of this boring code with a variation on the method_missing technique. The forwardable module is probably a better fit.

require 'forwardable'

class WriterDecorator

	def delegators :@real_writer, :write_line, :rewind, :pos, :close

	def initialize(real_writer)
		@real_writer = real_writer
	end
end