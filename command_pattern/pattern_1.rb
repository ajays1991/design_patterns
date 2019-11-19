class SlickButton

	def on_button_push
		#
		# Do something when the button is pushed
		#
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
