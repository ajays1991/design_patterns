# The singleton module
# This singleton module does all the heavy lifting of creating the class variable and initializing it with the singleton instance, creating the class-level instance method and making new private


require 'singleton'

class SimpleLogger
	include Singleton

	# lots of code

end

# Lazy and Eager Singletons

# In previous implementation created the singleton instance as the class was being defined. As a consequence, our singleton instance is created before any client code  ever gets a chance to call SimpleLogger.instance. This is called eager instantiation.

# The singleton module, by contrast waits until someone calls instance before it actually create a singleton. This is called lazy instantiation.