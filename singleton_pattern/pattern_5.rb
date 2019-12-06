# Classes as singletons
# We can define methods and variables on the class object.
# Our original singleton implementation used class methods and variables to manage the singleton instance. But given that we can have methods and variables on a class. why not just use the class itself as a container for the singleton functionality. Each class is unique and there can be only one SimpleLogger class loaded at any one time

class ClassBasedLogger
	ERROR = 1
	WARNING = 2
	INFO = 3

	@@log = File.open('log.txt', 'w')
	@@level = WARNING

	def self.error(msg)
		@@log.puts(msg)
		@@log.flush
	end

	def self.warning(msg)
		@@log.puts(msg) if @@level >= WARNING
		@@log.flush
	end

	def self.info(msg)
		@@log.puts(msg) if @@level >= INFO
		@@log.flush
	end

	def self.level=(level)
		@@level = level
	end

	def self.level
		@@level
	end
end

ClassBasedLogger.level = ClassBasedLogger::INFO

ClassBasedLogger.info('Computer wins the chess game')
ClassBasedLogger.warning('AE-35 hardware failure predicted')
ClassBasedLogger.error('HAL-9000 malfunction')

# You are sure that no one will create a second instance of your singleton.
# Disadvantages
# Lazy initialization remains a problem with this technique. However your class is initialized when its gets loaded(when someone requires the file). less controll over timing of initialization

