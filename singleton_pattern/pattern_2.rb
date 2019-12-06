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

	@@instance = SimpleLogger.new

	def self.instance
		return @@instance
	end

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



logger1 = SimpleLogger.instance
logger2 = SimpleLogger.instance

SimpleLogger.instance.info("Computer wins chess game")
SimpleLogger.instance.warning("AE-35 hardware failuer predicted")
SimpleLogger.instance.error("HAL-9000 malfunction, take action")


# Make Sure there is only one
# One requirement of the singleton is to ensure that the one and only singleton is the sole instance of the singleton class

class SimpleLogger

	@@instance = SimpleLogger.new

	def self.instance
		return @@instance
	end

	private_class_method :new
end