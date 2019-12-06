# Global variables as singletons
# Because there is only one instance of any given global variable and because that variable is available everywhere, global variables seem like they might be a good platform for implementing singletons.
# There is no way to control the value of a global variable. While we might start off with our global pseudo-singleton carefully set to the right thing:

$logger = SimpleLogger.new

# But there is absolutely nothing to prevent some misguided code from changing it

$logger = LoggerThatDoesSomethingBad.new

# If change is the problem then maybe we should turn to ruby flavor of Ruby variable that not only has global scope but also resist change: The constant

Logger = SimpleLogger.new


# Both global variable and constant have deficiences
# 1. There is no way to delay the creation of the singleton object until you need it.
# 2. Neither of the technique does anything to prevent someone from creating a second or third instance of your singleton class.
