# One object, global access
# Programs frequently have single configuration file.
# GUI applications frequently have one main window and they typically take input from exactly one keyboard.
# Many applications need to talk to exactly one database.
# If you have one instance of a class and a lot of code that needs access to that instance, it seems silly to pass the object from one method to another.
# In this kind of situation its suggested to build a singleton - a class that can have only one instance and that provide global access.


class SimpleLogger
	attr_accessor :level

	ERROR = 1
	WARNING = 2
	INFO = 3

	def initialize
		@log = File.open("log.txt", "w")
		@level = WARNING
	end

	def error(msg)
		@log.puts(msg)
		@log.flush
	end

	def warning(msg)
		@log.puts(msg) if @level >= WARNING
		@log.flush
	end

	def info(msg)
		@log.puts(msg) if @level >= INFO
		@log.flush
	end
end

logger = SimpleLogger.new
logger.level = SimpleLogger::INFO

logger.info('Doing the first thing')

# some code

logger.info('Doing the second thing')

# some code