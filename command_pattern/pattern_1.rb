class SlickButton

	#
	# Lots of button drawing and management
	# Code omitted
	#

	def on_button_push
		#
		# Do something when the button is pushed
		#
	end
end

class RadioButton
	 def on_selected

	 end
end


class SaveButton < SlickButton

	def on_button_push
		#
		# Save the current document
		#
	end
end

class NewDocumentButton < SlickButton

	def on_button_push
		#
		# Create new document
		#
	end
end



# Disadvantages of this design
# A complex gui will have hundreds of buttons so tens of thousands of  SlickButton subclasses, something like subclasses explosition
# Inheritance is so permanenet what if you want the button to do something before the user actually open the spreadsheet and something else after the spreadsheet is opened. You will have to add is_file_opened logic to subclass which is messy.
# what if you want your button to do one thing before the user has actually opened the spreadsheet and something else after the spreadsheet is open.
# If we subclass the button either we need two seperate button subclass or we need the code the "is file open?" logic into the single button class

class NewDocumentButton < SlickButton

	def on_button_push
		if file_opened?
			# one thing here
		else
			# something here
		end
	end
end



# An Easier way
# what if we bundle up the code to handle the button push or menu selected in its own object - an object that does nothing but wait to be executed and performs application specific code.
# These little packages of action are the commands of the commad pattern.

class SlickButton
	attr_accessor :command

	def initialize(command)
		@command = command
	end

	#
	# Lots of button drawing and management
	# Code omitted
	#

	def on_button_push
		@command.before_execute if @command
		@command.execute if @command
		@command.after_execute if @command
	end
end

class SaveCommand

	def execute
		#
		# save the current document
		#
		puts("Saving the current document")
	end

	def before_execute
		puts("Before saving the document")
	end

	def after_execute
		puts("After saving the document")
	end
end

save_button = SlickButton.new(SaveCommand.new)
save_button.on_button_push